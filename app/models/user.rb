class User < ApplicationRecord
  has_one_attached :avatar
  has_many :incomes
  has_many :spendings

  def income?
    true
  end

  # validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
  #   message: "有効なフォーマットではありません" },
  #   size: { less_than: 5.megabytes, message: " 5MBを超える画像はアップロードできません" }

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :age
    belongs_to :family

  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
  with_options numericality: { other_than: 1 ,message: 'を選択してください' } do
    validates :age_id
    validates :family_id
  end
end
