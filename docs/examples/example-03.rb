
=begin
  Test several targets for every case into diferent hosts:
  * target : Describe the target
  * goto   : Move to localhost and execute the command
  * expect : Check if the result is equal to the expected value
  * get    : Get the value for every case from the configuration YAML file.
=end

task "Configure hostname and DNS server" do

  target "Hostname is <"+get(:host1_hostname)+">"
  goto   :host1, :exec => "hostname -f"
  expect result.equal(get(:host1_hostname))

  target "DNS Server OK"
  goto   :host1, :exec => "host www.google.es"
  expect result.find("has address").count.greater(0)

end

task "Create user with your name" do

  target "Exist user <"+get(:username)+">"
  goto   :host1, :exec => "id #{get(:username)}"
  expect result.count.eq 1

end

start do
  show
  export
end
