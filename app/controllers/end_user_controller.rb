class EndUserController < ApplicationController
  before_filter :authenticate_user!
end
