
group "learn-06-readme" do
  readme "This is our example 06."
  readme "And here we'll see how to use readme keyword"

  target "Create user <david>"
  readme "Help: you can use 'useradd' command to create users."
  run "id david"
  expect "david"
end

play do
  show
  export
end
