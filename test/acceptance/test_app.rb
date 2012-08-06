require 'helper'
require 'open4'

#
# End-to-end application test
#
class TestEnumerableStatsApp < MiniTest::Unit::TestCase
  include EnumStatsTest
  APP_SCRIPT = 'ruby bin/stats'
  ALL_STATS = %w[count mean variance standard_deviation sum min max]

  def test_no_options
    assert_app
  end

  def test_mean
    assert_app_include('mean')
    assert_app_exclude('mean')
  end

  def test_two
    assert_app_include(['min', 'standard_deviation'])
    assert_app_exclude(['max', 'variance', 'sum'])
  end

  private

  def assert_app
    status = Open4::popen4("cat #{fixture_name('example.data')} | #{APP_SCRIPT}") do |pid, stdin, stdout, stderr|
      lines = stdout.read.lines
      assert_equal(ALL_STATS.count, lines.count, "expect to see these stats printed: #{ALL_STATS}. Instead, got: #{lines.inspect}")

      lines.each do |line|
        assert_match(/^(.*): (.*)$/, line)
      end

      assert_empty(stderr.read)
    end

    assert_equal(0, status)
  end

  #
  # Tests the app called to print nothing but those stats that are explicitely included
  #
  # e.g.
  # # set --mean to only display mean
  # assert_app_include('mean')
  #
  def assert_app_include(args)
    args = Array(args)
    argstr = args.collect{|a| "--#{a}"}.join(' ')
    status = Open4::popen4("cat #{fixture_name('example.data')} | #{APP_SCRIPT} #{argstr}") do |pid, stdin, stdout, stderr|
      lines = stdout.read.lines
      assert_equal(args.count, lines.count, "expect to see only those printed: #{args}. Instead, got: #{lines.inspect}")

      lines.each do |line|
        if 1 == args.count
          assert_match(/^\d*\.\d*$/, line)
        else
          assert_match(/^(.*): (.*)$/, line)
        end
      end

      assert_empty(stderr.read)
    end

    assert_equal(0, status)
  end

  #
  # Tests the app called to print all except those stats that are explicitely excluded
  #
  # e.g.
  # # set --no-mean to display all except mean
  # assert_app_exclude('mean')
  #
  def assert_app_exclude(args)
    expected = ALL_STATS - Array(args)
    argstr = Array(args).collect{|a| "--no-#{a}"}.join(' ')
    status = Open4::popen4("cat #{fixture_name('example.data')} | #{APP_SCRIPT} #{argstr}") do |pid, stdin, stdout, stderr|
      lines = stdout.read.lines
      assert_equal(expected.count, lines.count, "expect to see only those printed: #{expected}. Instead, got: #{lines.inspect}")

      lines.each do |line|
        assert_match(/^(.*): (.*)$/, line)
      end

      assert_empty(stderr.read)
    end

    assert_equal(0, status)
  end
end
