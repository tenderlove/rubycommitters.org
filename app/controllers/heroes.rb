RubyCommitters.controllers :heroes do
  get :index, :map => '/' do
    @heroes = Hero.all
    @attrs = %w{names nicks sites services books portraits}
    
    cache_control :public, :max_age => 300
    render 'heroes/index'
  end
end