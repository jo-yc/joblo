s3 = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['ANDCHECK_AWS_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['ANDCHECK_AWS_SECRET_KEY'],
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = s3['bucket']

  config.asset_host = s3['protocol'] + "://" + s3['host']
  config.fog_public = true
  # config.fog_authenticated_url_expiration = 60 * 10
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:print:]]/
