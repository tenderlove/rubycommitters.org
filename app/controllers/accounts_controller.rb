class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all
  end
  
  def show
    @account = Account.find(params[:id])
    respond_to do |format|
      format.js { render :layout => false }
      format.html
    end
  end
end
