require "handy_feature_helpers/main_helpers"
require "handy_feature_helpers/flash_helpers"

module HandyFeatureHelpers
  module AllHelpers
    include FlashHelpers
    include MainHelpers
  end
end