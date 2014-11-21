module UpgradeHelper
  def link_to_function(name, function, args={})
    Rails.logger.warn "Don't be too lazy. Replace link_to_function calls please"
    link_to name, "javascript:void(0);", args.merge(onclick: function)
  end
end
