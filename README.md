#Rails Polymorphic Comments

## Easily pluggable comments module

*Plymorphic* name itself implies that can be plugged with any type of resource.
using this plugin one can observe how easy are using comments in rails.

You can use polymorphic comments to any type of resource.
resources types can be **blog post, review, ideas, etc.**

##Installation
    ./script/plugin install git://github.com/sandipransing/rails_polymorphic_comments.git

    ./script/generate rails_polymorphic_comments_migration

    rake db:migrate

## Usage
    # Wherever you wanted to use comments to be shown up in that view
    # add following line
    <%= render :partial => :comments %>

##Example
TODO:

any sugestions? [**san2821 at gmail.com**](http://funonrails.com) or [**sandip at joshsoftware.com**](http://joshsoftware.com) released under the MIT license
