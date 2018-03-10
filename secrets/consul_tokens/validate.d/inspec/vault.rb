describe http("http://localhost:8200/v1/sys/health") do
  its('status') { should cmp 200 }
end

