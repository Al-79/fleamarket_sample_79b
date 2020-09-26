class Condition < ActiveHash::Base
  self.data = [
      {id: 1, condition: '良い'}, {id: 2, condition: '悪い'}
  ]
end