class Web::Common::Articles::ApplicationController < Web::Common::ApplicationController
  before_action :authenticate_user!
end
