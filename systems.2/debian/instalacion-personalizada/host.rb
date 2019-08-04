
group 'HOST configurations' do

  target "Ensure SSH port is open on #{gett(:host1_ip)}"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

  hostname = "#{get(:lastname)}#{get(:number)}d1.#{get(:domain)}"
  set(:host1_hostname, hostname)

  target "Update hostname with #{gett(:host1_hostname)}"
  goto  :host1, :exec => "hostname -f"
  expect result.equal?(get(:host1_hostname))

  unique "hostname", result.value
end

group 'Network configuration' do

  target "Network gateway configuration working"
  goto  :host1, :exec => "ping 8.8.4.4 -c 1"
  expect result.find("64 bytes from 8.8.4.4").count.eq(1)

  target "Network DNS configuration working"
  goto  :host1, :exec => "host www.nba.com"
  expect result.find("has address").count.gt(0)
end
