require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.AWS_SECRET_ACCESS_KEY,
    aws_secret_access_key: Rails.application.secrets.AWS_ACCESS_KEY_ID,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'mercari60d'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari60d'
end