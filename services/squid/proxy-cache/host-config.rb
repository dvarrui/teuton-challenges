
group "Host configuration" do

  target "IP 192.168.3.XX"
  run "ip a"
  expect result.find("inet").find("192.168.3").count.eq(1)

  target "DNS OK"
  run "nslookup www.github.com"
  expect result.find("Name:").find("github.com").count.ge(1)
end
