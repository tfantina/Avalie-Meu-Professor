if Rails.env.production?
  captcha_public = '6LchmAoUAAAAANN8d3Bv0h0FszLZ5IoSrJRQ6GKp'
  captcha_private = '6LchmAoUAAAAAO4rzV7Eo4xVS31kcxGzHFi5qcH5'
else
  captcha_public = '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI'
  captcha_private = '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe'
end


Recaptcha.configure do |config|
  config.site_key = captcha_public
  config.secret_key = captcha_private
end
