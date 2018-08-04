class Web::Common::ApplicationController < Web::ApplicationController
  protect_from_forgery with: :exception

  before_action :example

  def example
    puts "common"
  end
end
