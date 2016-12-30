require 'test/unit'
require 'test/unit/rr'
require 'apns-s3'

class TestApnsS3 < Test::Unit::TestCase
  setup do
    @pem_filename = 'dummy.pem'
  end

  test "pemfile exists" do
    stub(File).exists?(@pem_filename) { true }
    mock(APNS).pem=(@pem_filename)
    ApnsS3.set_pemfile filename: @pem_filename
  end

  test "pemfile DOES NOT exist" do
    stub(File).exists?(@pem_filename) { false }
    credentials_stub = Object.new
    stub(Aws::Credentials).new { credentials_stub }
    region = 'dummy-region-name'
    stub(Aws.config).update(region: region, credentials: credentials_stub)
    client_stub = Object.new
    stub(Aws::S3::Client).new { client_stub }
    stub(client_stub).get_object
    mock(APNS).pem=(@pem_filename)
    ApnsS3.set_pemfile region: region, filename: @pem_filename
  end
end
