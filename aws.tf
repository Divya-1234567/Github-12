provider "aws" {
    region ="us-east-1"
    access_key = "AKIAXCGSSMC3JK5Q4NGP"
    secret_key = "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"
}


resource  "aws_instance"  "web-server" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type ="t2.micro"
    user_data = <<-EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<html><h1 align="center"> welcome to aws...</center> </h1></html>" >>/var/www/html/index.html
    EOF
    
    tags = {
        Name = "web_instance"

    }
}