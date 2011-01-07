module ApplicationHelper
  def avatar_url(avatar)
    avatar.try(:url) || 'missing-avatar.png'
  end
end
