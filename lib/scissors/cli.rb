require 'thor'
require 'scissors'
require 'chef'
require 'chef/knife'

USERNAME = 'ubuntu'
CLOUD_KEY = '~/.ssh/teambox.pem'

module Scissors
  class CLI < Thor
    desc "ssh SEARCH", "send..."
    def ssh(name, *arg)
      search = case name
      when /all/
        '*:*'
      when /\:/
        name
      else
        "name:#{name}"
      end
      if arg.empty?
        system("ssh #{USERNAME}@#{public_hostname_by_name(name)}")
      else
        ssh_run(search, *arg)
      end
    end

    desc "node list", "return the list of nodes"
    def list
      status.each do |node|
        pp "Public hostname #{node[:cloud][:public_hostname]}"
        pp "Public public ipv4 #{node[:cloud][:public_ipv4]}"
      end
    end

    protected
    def ssh_run(search, command)
      Chef::Knife.run ['ssh', search, command, '-a', 'cloud.public_hostname', '-x', USERNAME, '-i', CLOUD_KEY]
    end

    def status
      @status ||= Chef::Knife.run ['status']
    end

    def public_hostname_by_name(name)
      node = status.detect {|node| node.name == name}
      node['cloud']['public_hostname']
    end

    
  end
end

