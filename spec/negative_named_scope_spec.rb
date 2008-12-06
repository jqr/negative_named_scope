require File.join(File.dirname(__FILE__), 'spec_helper')


describe "NegativeNamedScopes" do
  describe "making a named_scope without conditions" do
    it "should not make a negative named_scope" do
      Post.scopes.include?(:not_only_10).should be_false
    end
  end
  
  describe "making a named_scope with conditions" do
    it "should make a named_scope with not prepended" do
      Post.scopes.include?(:not_approved).should be_true
    end

    it "should make a named_scope of specified name" do
      Post.scopes.include?(:unpublished).should be_true
    end

    it "should not make a named_scope when :negative is false" do
      Post.scopes.include?(:not_negative_scope_suppressed).should be_false
    end

    it "should set the conditions to NOT (original conditions)" do
      Post.unpublished.proxy_options[:conditions].should == %Q{NOT ("posts"."published" = 't')}
    end
    
    it "should not overwrite a existing method" do
      Post.not_highly_rated.should == 'not_highly_rated'
    end

  end

  describe "making a named_scope with a lambda" do
    it "should make a negative named_scope" do
      Post.respond_to?(:not_created_after).should be_true
    end

    it "should set the conditions to NOT (original conditions)" do
      Post.not_created_after(1).proxy_options[:conditions].should == %Q{NOT (created_after > 1)}
    end

    it "should make a named_scope of specified name" do
      Post.scopes.include?(:meaningful).should be_true
    end

  end
  
  describe "test with data" do
  end
end
