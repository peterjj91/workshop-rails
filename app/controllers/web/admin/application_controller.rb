class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :third
  before_action :authenticate_user!
  layout 'web/admin/layouts/admin'

  def third
    puts "3"
  end
end
