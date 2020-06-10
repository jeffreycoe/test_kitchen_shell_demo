# Inspec Test

test_dir = '/tmp/test_deploy'
test_file = ::File.join(test_dir, 'test_config.yml')

describe directory(test_dir) do
  it { should be_directory }
end

describe file(test_file) do
  it { should be_file }
  it { should exist }
end
