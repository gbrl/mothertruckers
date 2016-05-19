require 'rspec'

# Include debugging tools by default so that you don't have to add them.
require 'pry'
require 'byebug'

# Tool for safely requiring files that might not exist yet.
def safe_require(file)
  require file
rescue LoadError
  # ignore
end

# Safely require the files that are expected to be created.
safe_require 'robot'
safe_require 'address'
safe_require 'favourite'
safe_require 'note'
safe_require 'rating'
safe_require 'stop'
safe_require 'truck'
safe_require 'user'