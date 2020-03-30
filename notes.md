# Gratitude Journal

## Gratitude *can be join table

belongs_to :user
has_many :comments
has_many :users, through :comments
title
content (should be gratitude_one, gratitude_two, gratitude_three)

## User (use devise and Omniauth with google)

has_many :gratitudes
has_many :comments
has_many :commented_gratitudes, through :comments
has_many :categories, through: :gratitudes
username
email

## Comment * can be join table joining users and gratitudes
belongs_to :user
belongs_to :gratitude
content

## Nested Routes - new, show or index

/users/:id/gratitudes
/users/:id/comments
/gratitudes/:id/comments