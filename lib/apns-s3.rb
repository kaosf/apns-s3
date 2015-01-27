require "version"
require "aws-sdk"
require "apns"

module ApnsS3
  # Set PEM file to APNS module
  #
  # @param [String] aws_access_key_id
  # @param [String] aws_secret_access_key
  # @param [String] bucket_name
  # @param [String] filename PEM filename
  def self.set_pemfile(
    aws_access_key_id: nil,
    aws_secret_access_key: nil,
    bucket_name: nil,
    filename: nil
  )
    unless File.exists? filename
      s3 = AWS::S3.new(
        access_key_id: aws_access_key_id,
        secret_access_key: aws_secret_access_key
      )
      bucket = s3.buckets[bucket_name]
      object = bucket.objects[filename]
      File.open filename, 'wb' do |file|
        object.read do |chunk|
          file.write(chunk)
        end
      end
    end
    APNS.pem = filename
  end
end
