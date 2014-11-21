ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require_relative 'support/integration'
require_relative 'support/mini_contest'

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  extend MiniContest
  include FactoryGirl::Syntax::Methods

  ActiveRecord::Migration.check_pending!

  # Depreciated test helper method
  #
  def build_puzzle
    Rails.logger.warn "DEPRECATION WARNING: build_puzzle will be removed. Use create(:puzzle) instead"
    test_tempfile = Tempfile.new("puzzle_sample")
    test_tempfile << "Sample Text"
    test_tempfile.rewind

    FactoryGirl.create(:puzzle, :file => test_tempfile)
  end

  # Depreciated test helper method
  #
  def create_submission(puzzle, user, correct)
    Rails.logger.warn "DEPRECATION WARNING: create_submission will be removed. Use create(:submission) instead"
    Submission.create(
      :user   => user,
      :puzzle => puzzle,
      :file   => Tempfile.new('solution')
    ).update_attribute(:correct, correct)
  end

  # Depreciated test helper method
  #
  def cleanup_attachment(attachment)
    Rails.logger.warn "DEPRECATION WARNING: cleanup_attachment will be removed. Use FileUtils directly to remove the file"
    FileUtils.rm_rf(attachment.file.path)
  end

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

class Capybara::Rails::TestCase
  include Support::Integration

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = {
      'provider'  => "github",
      'uid'       => '12345',
      'user_info' => { 'nickname' => 'PN User' }
    }
  end
  teardown { Capybara.reset_sessions! }
end
