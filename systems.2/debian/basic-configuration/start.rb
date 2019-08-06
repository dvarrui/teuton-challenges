
require_relative 'ssh'
require_relative 'user'
require_relative 'host'

start do
	show :resume
	export :format => :colored_text
	send :copy_to => :host1
end


=begin
---
:global:
  :host1_username: root
  :dominio: curso1819
:cases:
- :tt_members: david
  :number: '42'
  :host1_ip: 172.18.42.31
  :host1_password: profesor
  :firstname: david
  :lastname1: vargas
  :lastname2: ruiz
=end
