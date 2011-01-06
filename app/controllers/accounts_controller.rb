class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all
  end
  
  def show
    @account = Account.find(params[:id])
  end
end
