resource "aws_key_pair" "web-key" {
  key_name   = "web-key"
  public_key = file("demo-key.pub")
}

resource "aws_instance" "barista-cafe" {
  ami                    = var.ec2-amis["us-east-1"]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.PublicB.id
  key_name               = aws_key_pair.web-key.key_name
  vpc_security_group_ids = [aws_default_security_group.demo-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "barista-cafe"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.usr
    private_key = file("demo-key")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "cafe-ebs" {
  availability_zone = var.zone1
  size              = 3
  tags = {
    Name = "volume-4-ebs"
  }
}

resource "aws_volume_attachment" "atch_volume-cafe" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.barista-cafe.id
  volume_id   = aws_ebs_volume.cafe-ebs.id
}


output "PublicIP" {
  value = aws_instance.barista-cafe.public_ip
}