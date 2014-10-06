# == Class: account::rsa_keys.
#
# Sets up an RSA key; uses the 'username + sha' of the RSA as the key name.
#
# === Authors
#
# David Lloyd <david.lloyd@agix.com.au>.
#
# === Copyright
#
# Copyright 2014 Agix Pty Ltd. All Rights Reserved.
#
define account::resources::rsa_keys (
  $ensure         = present,
  $username       = $name,
  $ssh_key_type   = 'ssh-rsa',
  $ssh_key        = $name,
) {
  $the_md5   = str2md5($ssh_key)
  $full_name = "${username}-${the_md5}"

  ssh_authorized_key { $full_name:
    user => $username,
    type => $ssh_key_type,
    key  => $ssh_key,
  }
}
