RubyCommitters.controllers :heroes do
  get :index, :map => '/' do
    @heroes = Hero.all
    @attrs = %w{names nicks sites services books portraits}
    response['Cache-Control'] = 'public, max-age=300'
    render 'heroes/index'
  end
end