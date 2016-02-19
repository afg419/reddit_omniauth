FactoryGirl.define do
  factory :cach, class: 'Cache' do
    top "MyString"
    new "MyString"
    rising "MyString"
    controversial "MyString"
    hot "MyString"
    gilded "MyString"
  end
  factory :user do
    token "MyString"
    username "MyString"
    refresh_token "MyString"
  end
end