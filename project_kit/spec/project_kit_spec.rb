# frozen_string_literal: true

require 'open3'
ABS_PATH = File.expand_path("../../", File.dirname(__FILE__))

RSpec.describe ProjectKit do

  describe '#setup' do 
    it "initial setup of a gem project" do 
      project = 'test'
      Open3.popen3("bundle exec exe/project_kit setup gem") do |stdin, stdout, stderr, wait_thr| 
        stdin.write("#{project}\n")
        puts stdout.read
        stdin.close
        stdout.close
        stderr.close
        wait_thr.join
      end 
      expect(File.exist?("#{ABS_PATH}/#{project}")).to be true
      if File.exist?("#{ABS_PATH}/#{project}")
        system("rm -r #{ABS_PATH}/#{project}")
      end
    end
  end

end
