RubyCommitters.controllers :heroes do
  get :index, :map => '/' do
    @site_name = RubyCommitters.site_name
    @heroes    = Hero.all
    @attrs     = {
      'names'    => 'names',
      'nicks'    => 'a.k.a.',
      'sites'    => 'sites',
      'services' => 'social',
    }

    cache_control :public, :max_age => 300
    render 'heroes/index'
  end
end