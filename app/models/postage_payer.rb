class PostagePayer < ActiveHash::Base
  self.data = [
      {id: 1, postage_payer: '出品者'}, {id: 2, postage_payer: '着払い'}
  ]
end