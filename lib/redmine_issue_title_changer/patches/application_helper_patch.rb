module RedmineIssueTitleChanger
  module Patches
    module ApplicationHelperPatch
      def self.included(base)
        base.send :include, InstanceMethods
        base.class_eval do
          alias_method :html_title_without_changer, :html_title
          alias_method :html_title, :html_title_with_changer
        end
      end

      module InstanceMethods
        def html_title_with_changer(*args)
          title = html_title_without_changer(*args)

          if !args.empty? and title[-1].kind_of? String
            # remove issue tracker name & issue id
            match = title[-1].match(/.+#.+:\s(.+)/)
            if match
              title[-1] = match[1]
            end
          end

          return title
        end
      end

    end
  end
end

base = ApplicationHelper
patch = RedmineIssueTitleChanger::Patches::ApplicationHelperPatch
base.send(:include, patch) unless base.included_modules.include?(patch)
