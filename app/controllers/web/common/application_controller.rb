class Web::Common::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
