CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIA3JXOKGOKENGTSYHO',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_public = true
  case Rails.env
    when 'production'
      config.fog_directory = 'thalia2018-production'


    when 'development'
      config.fog_directory = 'thalia2018'


    when 'test'
      config.fog_directory = 'thalia2018'

  end

  config.cache_storage = :fog
end
