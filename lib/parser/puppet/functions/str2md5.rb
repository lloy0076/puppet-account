#
# str2md5.rb
#

module Puppet::Parser::Functions
  newfunction(:str2md5, :type => :rvalue, :doc => <<-EOS
This converts a string to a MD5 hash. Given any simple string, you will get a
hex version of the MD5 hash.
    EOS
  ) do |arguments|
    require 'digest/md5'

    raise(Puppet::ParseError, "str2md5(): Wrong number of arguments " +
      "passed (#{arguments.size} but we require 1)") if arguments.size != 1

    password = arguments[0]

    unless password.is_a?(String)
      raise(Puppet::ParseError, 'str2md5(): Requires a ' +
        "String argument, you passed: #{password.class}")
    end

    md5hash = Digest::MD5.digest(password)
    md5hash.unpack('H*')[0]
  end
end

# vim: set ts=2 sw=2 et :
