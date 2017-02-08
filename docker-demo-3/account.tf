# app

data "template_file" "account-task-definition-template" {
  template               = "${file("templates/account.json.tpl")}"
  vars {
    REPOSITORY_URL = "${replace("${aws_ecr_repository.account.repository_url}", "https://", "")}"
    APP_VERSION = "${var.ACCOUNT_VERSION}"
    ACCOUNT_DB_HOST = "${var.ACCOUNT_DB_HOST}"
    ACCOUNT_DB_NAME = "${var.ACCOUNT_DB_NAME}"
    ACCOUNT_DB_USER = "${var.ACCOUNT_DB_USER}"
    ACCOUNT_DB_PASSWORD = "${var.ACCOUNT_DB_PASSWORD}"
    ACCOUNT_REDIS_HOST = "${var.ACCOUNT_REDIS_HOST}"
  }
}

resource "aws_ecs_task_definition" "account-task-definition" {
  family                = "account"
  container_definitions = "${data.template_file.account-task-definition-template.rendered}"
}

resource "aws_ecs_service" "account-service" {
  count = "${var.ACCOUNT_SERVICE_ENABLE}"
  name = "account"
  cluster = "${aws_ecs_cluster.example-cluster.id}"
  task_definition = "${aws_ecs_task_definition.account-task-definition.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.ecs-service-attach1"]

  load_balancer {
    elb_name = "${aws_elb.myapp-elb.name}"
    container_name = "account"
    container_port = 9001
  }
  lifecycle { ignore_changes = ["task_definition"] }
}
