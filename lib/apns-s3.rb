require "version"
require "aws-sdk"
require "apns"

module ApnsS3
  # Set PEM file to APNS module
  #
  # @param [String] region
  #   One of
  #     us-east-1, us-east-2, us-west-1, us-west-2, ca-central-1, eu-west-1,
  #     eu-central-1, eu-west-2, ap-northeast-1, ap-northeast-2, ap-southeast-1,
  #     ap-southeast-2, ap-south-1 and sa-east-1
  #
  #   All regions are listed here: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html
  #
  # @param [String] aws_access_key_id
  # @param [String] aws_secret_access_key
  # @param [String] bucketname
  # @param [String] filename PEM filename
  def self.set_pemfile(
    region: nil,
    aws_access_key_id: nil,
    aws_secret_access_key: nil,
    bucketname: nil,
    filename: nil
  )
    unless pemfile_exist? filename
      credentials = Aws::Credentials.new(
        aws_access_key_id, aws_secret_access_key
      )
      Aws.config.update region: region, credentials: credentials
      s3 = Aws::S3::Client.new
      s3.get_object response_target: filename, bucket: bucketname, key: filename
    end
    APNS.pem = filename
  end

  def self.pemfile_exist? filename
    File.exist? filename
  end
end
