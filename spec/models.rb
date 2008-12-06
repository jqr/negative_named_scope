class Post < ActiveRecord::Base
  named_scope :only_10, :limit => 10

  named_scope :approved, :conditions => { :approved => true }
  named_scope :published, :conditions => { :published => true }, :negative => :unpublished

  named_scope :negative_scope_suppressed, :conditions => { :something => true }, :negative => false

  def self.not_highly_rated
    'not_highly_rated'
  end
  named_scope :highly_rated, { :conditions => 'rating > 10' }


  named_scope :created_after, lambda { |value| { :conditions => ['created_after > ?', value] } }
  named_scope :meaningless, { :conditions => 'rating = 0' }, :negative => :meaningful

end