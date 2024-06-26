require "singleton"
require "aws-sdk-s3"

module DirectUpload
  class Configuration
    ATTRIBUTES = %i[aws_bucket_name].freeze
    include Singleton

    attr_accessor(*ATTRIBUTES)

    def self.defaults
      @defaults ||= {aws_bucket_name: nil}
    end

    def initialize
      self.class.defaults.each_pair {|k, v| send("#{k}=", v) }
    end

    ATTRIBUTES.each do |attribute|
      attribute = attribute.to_s
      define_method attribute do
        raise Error::Configuration, "DirectUpload missing: #{attribute}" if instance_variable_get("@#{attribute}").nil?
        instance_variable_get("@#{attribute}")
      end
    end
  end
end
