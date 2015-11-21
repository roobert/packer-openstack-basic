$real_fqdn = regsubst($fqdn, '(.*).novalocal', '\1')

file { '/etc/hostname':
  content => $real_fqdn,
}

file { '/etc/hosts':
  content => template('/var/lib/firstboot/hosts.erb'),
}

exec { 'cloud_init_manage_etc_hosts_false':
  command => "/bin/sed -i 's/manage_etc_hosts: true/manage_etc_hosts: false/' /etc/cloud/cloud.cfg",
}
