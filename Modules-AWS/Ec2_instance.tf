# Key pair 

resource "aws_key_pair" "my_key" {
  key_name   = "${var.Env}-project-Key"
  public_key = file("C:\\Users\\dell\\OneDrive\\Desktop\\project\\Terra-Project\\Terra_Key.pub")
  tags = {
      Environment = var.Env
  }
}


# Custom VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.Env}-vpc"
  }
}


# public subnet 

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.Env}-public-subnet"
  } 
}



# Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.Env}-igw"
  }
}

# Route Table 

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

    tags = {
      Name = "${var.Env}-rt"
    }
  }


# Route Table Association 
resource "aws_route_table_association" "my_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

# Security Group 
resource "aws_security_group" "my_sg" {
  name        = "${var.Env}-project-sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "Security Group for my ec2"


  # inbound-Rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # outboun-rule 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.Env}-project-sg"
  }
}


# EC2-instance

resource "aws_instance" "my-ec2" {

  count = var.Instance_count

  ami           = var.ami_id
  instance_type = var.Instance_type
  key_name = aws_key_pair.my_key.key_name


  vpc_security_group_ids = [ aws_security_group.my_sg.id ]
  associate_public_ip_address = true

  subnet_id = aws_subnet.public_subnet.id  

  depends_on = [aws_security_group.my_sg, aws_key_pair.my_key]


  root_block_device {
    volume_size = var.Env =="prod" ? 30 : 10
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.Env}-project-ec2"
    Environment = var.Env
  }

}
