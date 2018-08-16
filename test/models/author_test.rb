require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "author name" do
        author = Author.new
        assert_not author.save
        assert_raises(NameError) do
            a
        end
        assert true
    end
end
