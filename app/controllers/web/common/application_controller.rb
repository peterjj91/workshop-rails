class Web::Common::ApplicationController < Web::ApplicationController
  layout 'web/common/layouts/common'

  before_action :example

  def example
    puts "common"
  end
end
