require "aws-sdk-s3"

module DirectUpload
  class Client
    def self.connection
      @connection = ::Aws::S3::Resource.new()
    end

    def self.delete_folder(folder_name)
      objects = connection.bucket(DirectUpload.config.aws_bucket_name).objects(prefix: folder_name)
      objects.batch_delete!
    end
  end
end
