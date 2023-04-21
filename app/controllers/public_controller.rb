class PublicController < ApplicationController
  def main
  @properties=Property.all
  @users=User.all
  @agents=Agent.all
  end
end
