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
# === Parameters
#
# [*ensure*]
#   Whether the key should be present or not.
# Defaults to present.
#
# [*user*]
#   The user associated with the key.
# This is set to the class name. 
#
# [*type*]
#   The key type; one of 'ssh-rsa' or 'ssh-dsa'.
# Defeaults to 'ssh-rsa'. 
#
# [*key*]
#   The key.
#
define account::resources::ssh_authorized_keys (
  $ensure = present,
  $user   = $name,
  $type   = 'ssh-rsa',
  $key    = $name,
) {
  $the_md5   = str2md5($key)
  $full_name = "${user}-${the_md5}"

  ssh_authorized_key { $full_name:
    user => $user,
    type => $type,
    key  => $key,
  }
}
