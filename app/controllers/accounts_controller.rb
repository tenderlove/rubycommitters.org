class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all
  end
end
