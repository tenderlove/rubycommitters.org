require 'spec_helper'

describe AccountsController, 'locale' do
  render_views

  it 'defaults to :en' do
    get :index

    rendered_locale.should == :en
  end

  it 'can be set via query parameter' do
    get :index, :locale => 'ja'

    rendered_locale.should == :ja
  end

  it 'can be set via HTTP_ACCEPT_LANGUAGE' do
    request.env['HTTP_ACCEPT_LANGUAGE'] = 'ja'

    get :index

    rendered_locale.should == :ja
  end

  it 'uses the highest quality value in HTTP_ACCEPT_LANGUAGE' do
    request.env['HTTP_ACCEPT_LANGUAGE'] = 'ja, en;q=1.1'

    get :index

    rendered_locale.should == :en
  end

  it 'is restored after rendering' do
    get :index, :locale => 'ja'

    I18n.locale.should == :en
  end

  private

  def rendered_locale
    response.body.match(/<html lang="([^"]+)">/)[1].to_sym
  end
end
