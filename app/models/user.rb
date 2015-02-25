class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def role?(base_role)
    role == base_role.to_s
  end

  mount_uploader :avatar, AvatarUploader

  def favorited(post)
    #My implementation--todo: question: why did they not use self here?
    #self.favorites.find_by_post_id(post.id)
    # Bloc.io implementation
    favorites.where(post_id: post.id).first
  end
end
