# frozen_string_literal: true

require 'open3'

RSpec.describe ProjectKit do

  describe '#touch' do
    it "creates a new empty file" do
      new_file = 'new_touch.txt'
      system("bundle exec exe/proj_kit touch #{new_file}")
      expect(File.exist?(new_file)).to be true
      if File.exist?(new_file)
        system("rm #{new_file}")
      end
    end
  end

  describe '#output' do 
    it "writes file contents to a new file" do
      new_file = 'new_output.txt'
      system("bundle exec exe/proj_kit output test.txt --new_file #{new_file}")
      expect(File.exist?(new_file)).to be true
      expect(File.read(new_file)).to eq('Hello World!')
      if File.exist?(new_file)
        system("rm #{new_file}")
      end
    end
  end

  describe '#setup' do 
    it "setup a gem project" do 
      project = 'test'
      Open3.popen3("bundle exec exe/proj_kit setup hanami") do |stdin, stdout, stderr, wait_thr| 
        stdin.write("#{project}\n")
        puts stdout.read
        stdin.close
        stdout.close
        stderr.close
        wait_thr.join
      end 
      expect(File.exist?(project)).to be true
      if File.exist?(project)
        system("rm -r #{project}")
      end
    end
  end

end