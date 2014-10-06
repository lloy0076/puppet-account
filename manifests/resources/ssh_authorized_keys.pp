# == Class: account::ssh_authorized_keys.
#
# Sets up SSH authorized keys.
#
# === Authors
#
# David Lloyd <david.lloyd@agix.com.au>.
#
# === Copyright
#
# Copyright 2014 Agix Pty Ltd. All Rights Reserved.
#
define account::resources::ssh_authorized_keys (
  $ensure = present,
  $user   = $name,
  $type   = 'ssh-rsa',
  $key    = $name,
) {
  $the_md5   = str2md5($ssh_key)
  $full_name = "${username}-${the_md5}"

  ssh_authorized_key { $full_name:
    user => $username,
    type => $ssh_key_type,
    key  => $ssh_key,
  }
}
