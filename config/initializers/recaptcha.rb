if Rails.env.production?
  captcha_public = '6Lc0PAkUAAAAACv3FDd8zxm6U2qhDkzQd2DGsKhx'
  captcha_private = '6Lc0PAkUAAAAANxofNFnsIs4eOeBRTYiD1ajz-pr'
else
  captcha_public = '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI'
  captcha_private = '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe'
end


Recaptcha.configure do |config|
  config.public_key = captcha_public
  config.private_key = captcha_private
end
