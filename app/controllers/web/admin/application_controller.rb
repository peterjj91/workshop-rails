class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :authenticate_user!
  before_action :example

  def example
    puts "admin"
  end
end
