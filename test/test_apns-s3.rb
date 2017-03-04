require 'test_helper'
require 'fakefs/safe'
require 'apns-s3'

class TestApnsS3 < Test::Unit::TestCase
  setup do
    @pem_filename = 'dummy.pem'
  end

  test "pemfile exists" do
    # FakeFS do
    #   FileUtils.touch @pem_filename
    #   mock(APNS).pem=(@pem_filename)
    #   ApnsS3.set_pemfile filename: @pem_filename
    # end
    #
    # # NOTE: this code makes a warning below:
    # # .../vendor/bundle/ruby/2.4.0/gems/fakefs-0.10.2/lib/fakefs/base.rb:21:warning: instance variable @activated not initialized

    FakeFS.activate!
    FileUtils.touch @pem_filename
    mock(APNS).pem=(@pem_filename)
    ApnsS3.set_pemfile filename: @pem_filename
    FakeFS.deactivate!
  end

  test "pemfile DOES NOT exist" do
    assert !File.exist?(@pem_filename)

    client_stub = Object.new
    stub(Aws::S3::Client).new { client_stub }
    stub(client_stub).get_object
    mock(APNS).pem=(@pem_filename)
    ApnsS3.set_pemfile region: 'fake-region', filename: @pem_filename
  end
end
