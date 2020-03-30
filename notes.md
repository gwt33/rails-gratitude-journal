# Gratitude Journal

## Gratitude *join table joining categories & users

belongs_to :user
has_many :comments
has_many :users, through :comments
belongs_to :category
title
content

## User (use devise and Omniauth with google)

has_many :gratitudes
has_many :comments
has_many :commented_gratitudes, through :comments
has_many :categories, through: :gratitudes
username
email

## Comment * join table joining users and gratitudes
belongs_to :user
belongs_to :gratitude
content

## Nested Routes - new, show or index

/users/:id/gratitudes
/users/:id/comments
/gratitudes/:id/comments


<!--## Categories

name
has_many :posts
has_many :users, through: :posts -->