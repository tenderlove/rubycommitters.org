class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all
  end
  
  def show
    @account = Account.find(params[:id])
  end
  
  def filter
    accounts = Account.select('id, username').where ['username like ?', '%'+params[:query]+'%']
    render :json => accounts
  end
end
