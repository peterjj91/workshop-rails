class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :first

  def first
    puts "1"
  end
end
