#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../test_helper'

class TestLogEmptyMessage < Test::Unit::TestCase
  def setup
    set_file_paths
  end
  
  def test_repo_with_empty_commit_message
     @git = Git.init(Dir.mktmpdir)
     opts = {}
     opts[:allow_empty] = true
     @git.commit("test", opts)
     opts[:allow_empty_message] = true
     @git.commit("", opts)
     assert_equal(2, @git.log.to_a.size)     
  end
end
