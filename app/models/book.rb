class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user, :optional => true

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image
  end
end
