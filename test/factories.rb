FactoryGirl.define do
  factory :user do
    name                "PN User"
    nickname            "PN User"
    email               "user@example.com"
    notify_comment_made true
  end

  factory :puzzle do
    name              "Puzzle"
    sequence(:slug)   { |n| "puzzle-#{n}" }
    short_description "Test Puzzle"
    description       "This is a test puzzle.  It doesn't actually do anything."
    tag_list          "Game, Graphics"
    file              Tempfile.new("test_tempfile")
    released_on       DateTime.yesterday
    published         true
  end
end
