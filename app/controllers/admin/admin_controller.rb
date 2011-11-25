class Admin::AdminController < ApplicationController
  before_filter :authorize, :admin_authorize
end
