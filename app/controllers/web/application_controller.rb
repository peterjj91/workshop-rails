class Web::ApplicationController < ApplicationController
  before_action :second

  def second
    puts "2"
  end
end
