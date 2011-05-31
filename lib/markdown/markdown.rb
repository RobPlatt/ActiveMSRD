require 'kramdown'

module Markdown
  # This is a (very) thin wrapper to Kramdown, a ruby-only implementation of wiki Markdown
  # Most markdown implementations have similar APIs, so it should be easy to replace and/or
  # wrap other implementations here.
  include Kramdown
end