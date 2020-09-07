class Admins::GroupsController < ApplicationController
  def index
  	@groups = Group.all
  end
end
