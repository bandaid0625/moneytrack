class Family < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1人暮らし' },
    { id: 3, name: '夫婦2人暮らし' },
    { id: 4, name: '家族（子供あり）' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :users
end
