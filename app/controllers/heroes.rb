RubyCommitters.controllers :heroes do
  get :index, :map => '/' do
    @heroes = Hero.all
    @attrs = %w{names nicks sites services books portraits}
    render 'heroes/index'
  end
end