require_relative 'spec_helper'

describe user('vagrant') do
    it { should have_login_shell '/usr/local/bin/fish' }
end

describe file('/home/vagrant/.config/fish/config.fish') do
  it { should be_file }
  it { should be_owned_by 'vagrant' }
  it { should be_mode 644 }
  it { should contain 'path to your oh-my-fish dir' }
end

describe file('/home/vagrant/.oh-my-fish') do
  it { should be_directory }
  it { should be_owned_by 'vagrant' }
  it { should be_mode 755 }
end

describe user('one', 'two') do
    it { should have_login_shell '/usr/local/bin/fish' }
end
