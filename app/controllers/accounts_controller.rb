class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all, :include => [:portraits, :books, :nicks, :sites, :services]
  end
end
