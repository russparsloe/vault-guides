
describe http("http://localhost:8500/v1/status/leader") do
  its('status') { should cmp 200 }
end

describe http("http://localhost:8500/v1/status/peers") do
  its('status') { should cmp 200 }
end
