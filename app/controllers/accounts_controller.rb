class AccountsController < ApplicationController
  def index
    @accounts = Account.all(:include => [:names, :portraits, :services])
  end
end
