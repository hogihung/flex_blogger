class AddSearchIndexToPosts < ActiveRecord::Migration
  def change
    execute "create index posts_title on posts using gin(to_tsvector('english', title))"
    execute "create index posts_body on posts using gin(to_tsvector('english', body))"
  end
end
