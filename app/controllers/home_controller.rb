class HomeController < ApplicationController
  before_action :set_suggestions
  before_action :set_feeds
  def index
  end


  private
  def set_feeds
    @feeds = Post.where(user: [current_user, current_user.followings].flatten).order(created_at: :desc)
  end

  def set_suggestions
    @suggestions = [current_user.followers]
    [current_user.followers, current_user.followings].flatten.uniq.each do |f|
      @suggestions.append([f.followers, f.followings])
    end
    @suggestions = [@suggestions, User.all.sample(10)].flatten.uniq - [current_user.followings, current_user].flatten 
    @suggestions = @suggestions.sample(5)
  end
end
