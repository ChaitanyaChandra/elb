output "elb_dns" {
  value       = aws_lb.application_elb.dns_name
  description = "elb domain"
}