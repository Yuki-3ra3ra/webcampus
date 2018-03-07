#datebase_structure

## users table

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false,|
|user_type|integer|null: false,|

### Association
- has_one  :profile
- has_many :matched-users, :class_name => 'Matching', :foreign_key => 'matcheduser_id'
- has_many :matched-plans, :through => :matched-user, :source => 'plan'
- has_many :plans
- has_many :messages
- has_many :reviews

* user.plan  ...あるユーザーが作成したプラン
* user.matchings  ...あるユーザーが作成したプラン


## plans table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|plantype_id|integer|null: false, foreign_key: true|
|title|string|null: false,length: { maximum: 30 }|
|body|text|null: false,|
|image|text|null: false,|
|fee|string|null: false,|
|hours|string|null: false,|

### Association
- has_many    :matchings
- has_many    :matched-users,through: :matchings
- has_many    :messages
- has_many    :reviews
- belongs_to  :plantype
- belongs_to  :user


## matchingsテーブル

|Column|Type|Options|
|------|----|-------|
|matcheduser_id|integer|null: false, foreign_key: true|
|plan_id|integer|null: false, foreign_key: true|
|approve|string||

### Association
- belongs_to :matched-user :class_name => 'User'
- belongs_to :plan


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|plan_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :plan


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|plan_id|integer|null: false, foreign_key: true|
|reviews|text|null: false|
|rate|integer|null: false|


### Association
- belongs_to :user
- belongs_to :plan


## profiles table

|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|kanafirst|string|null: false|
|kanalast|string|null: false|
|image|string|null: false|
|gender|string|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|university_id|integer|null: false, foreign_key: true|
|faculty_id|interger|null: false, foreign_key: true|
|admission-type_id|interger|null: false, foreign_key: true|
|club|text||
|introduction|text||
|region_id|interger|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :university
- belongs_to :faculity
- belongs_to :asmmision-type
- belongs_to :region


## universities table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|


### Association
- has_many  :profiles


## faculities table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|


### Association
- has_many  :profiles


## addmission-type table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|


### Association
- has_many  :profiles


## regions table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|


### Association
- has_many  :profiles



