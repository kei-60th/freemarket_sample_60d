class UsersController < ApplicationController
  layout 'registration'
  def new
  end

  ENV['API_KEY']
  ENV['API_SECRET']

end
