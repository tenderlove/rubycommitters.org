class AccountsController < ApplicationController
  def index
    @accounts = Account.import File.open File.join(Rails.root, 'ruby-committers.yml')
  end
end
