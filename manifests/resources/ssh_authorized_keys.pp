# == Class: account::ssh_authorized_keys.
#
# Sets up SSH authorized keys.
#
# === Authors
#
# David S. Lloyd <lloy006@adam.com.au>
#
# === Copyright & License
#
# Copyright (c) 2014, David S. Lloyd All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
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
