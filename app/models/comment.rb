class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save do
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
