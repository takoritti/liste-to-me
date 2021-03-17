# テーブル設計
## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
### アソシエーション
has_many :musics
has_many :comments
## musics テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| genre_id    | integer    | null: false       |
| information | string     | null: false       |
| user        | references | foreign_key: true |
### アソシエーション
belongs_to :user
has_many :comments
has_many :music_tag
has_many :tags, through: :music_tug
## tags テーブル
| Column   | Type   | Options     |
| -------- | -------| ------------|
| tag_name | string | null: false |
### アソシエーション
has_many :music_tag
has_many :musics, through: :music_tug
## music_tug テーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| music  | references | foreign_key: true |
| tug    | references | foreign_key: true |
### アソシエーション
belongs_to :music
belongs_to :tug
## comments テーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | integer    | null: false       |
| user   | references | foreign_key: true |
| music  | references | foreign_key: true |
### アソシエーション
belongs_to :user
belongs_to :music