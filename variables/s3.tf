#explecit dependency we have to use depends_on,and s3 should create after route table association
resource "aws_s3_bucket" "terra-practice-123789" {
  bucket = "terra-practice-123789"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [ aws_route_table_association.public ]
}

#nested depenvency,once first bucket created,with first bucket name next bucket will create,see below
resource "aws_s3_bucket" "terra1-practice-1234567789" {
  bucket = "terra1-practice-1234567789"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [ aws_s3_bucket.terra-practice-123789 ]
}