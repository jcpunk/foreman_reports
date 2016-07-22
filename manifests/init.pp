# == Class: foreman_reports
class foreman_reports (
  $max_days_all       = $foreman_reports::params::max_days_all,
  $max_days_noactions = $foreman_reports::params::max_days_noactions,
  $max_days_task_log  = $foreman_reports::params::max_days_task_log,
  $cron_ensure        = $foreman_reports::params::cron_ensure,
  $cron_dot           = $foreman_reports::params::cron_dot,
) inherits foreman_reports::params{

  file { "/etc/cron.${cron_dot}/foreman_reports":
    ensure  => $cron_ensure,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => "#!/bin/bash
foreman-rake reports:expire days=${max_days_noactions} status=0 2>&1 | logger
foreman-rake reports:expire days=${max_days_all} 2>&1 | logger
foreman-rake foreman_tasks:cleanup AFTER=${max_days_task_log} 2>&1 | logger
exit 0
"
  }

}
