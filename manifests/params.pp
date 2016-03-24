# == Class: foreman_reports::params
class foreman_reports::params {
  $max_days_all       = '90'
  $max_days_noactions = '21'
  $cron_ensure        = 'present'
  $cron_dot           = 'daily'
}
