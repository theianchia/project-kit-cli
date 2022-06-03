# frozen_string_literal: true

require 'open3'
ABS_PATH = File.expand_path("../../", File.dirname(__FILE__))

RSpec.describe ProjectKit do
  before(:all) do
    @project = 'test'
  end

  after(:all) do 
    if File.exist?("#{ABS_PATH}/#{@project}")
      system("rm -r #{ABS_PATH}/#{@project}")
    end
  end

  describe '.setup' do 
    it "setup a gem project" do 
      Open3.popen3("bundle exec exe/project_kit setup gem") do |stdin, stdout, stderr, wait_thr| 
        stdin.write("#{@project}\n")
        puts stdout.read
        stdin.close
        stdout.close
        stderr.close
      end 
      expect(File.exist?("#{ABS_PATH}/#{@project}")).to be true
    end
  end

  describe '.sync' do 
    it "sync gem templates" do 
      system("bundle exec exe/project_kit sync gem -t ../test")
      expect(File.exist?("#{ABS_PATH}/#{@project}")).to be true
    end
  end
end
