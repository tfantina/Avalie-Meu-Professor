class CaptchaController < ApplicationController
  def index
  end

  def create
    if verify_recaptcha
      render text: 'Yes'
    else
      render text: 'No'
    end
  end
end
