class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ポップス' },
    { id: 3, name: 'ロック' },
    { id: 4, name: 'メタル' },
    { id: 5, name: 'ジャズ' },
    { id: 6, name: 'ボサノバ' },
    { id: 7, name: 'アンビエント' },
    { id: 8, name: 'エレクトロ' },
    { id: 9, name: 'アコースティック' },
    { id: 10, name: 'カントリー' },
    { id: 11, name: 'クラシック'},
    { id: 12, name: 'エスニック'},
    { id: 13, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :articles
  end