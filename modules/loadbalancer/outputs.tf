output "target_group_arn_vote" {
  value = aws_lb_target_group.vote.arn
}

output "target_group_arn_result" {
  value = aws_lb_target_group.result.arn
}

output "dns_name" {
  value = aws_lb.app.dns_name
}

output "alb_arn" {
  value = aws_lb.app.arn
}
