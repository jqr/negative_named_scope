module ActiveRecord
  module NamedScope
    module ClassMethods
      def named_scope_with_negative_named_scope(method, *args, &block)
        options = args.extract_options!
        lambda = args.first

        args_for_original = lambda || options.except(:negative)
        
        named_scope_without_negative_named_scope(method, args_for_original, &block)

        if options[:negative] != false
          negative_name = options.delete(:negative) || "not_#{method}"
        
          unless respond_to?(negative_name)
            if !lambda
              if options.include?(:conditions)
                named_scope_without_negative_named_scope(negative_name, lambda { { :conditions => "NOT (#{ sanitize_sql_for_conditions(options[:conditions]) })" } }, &block)
              end
            else
              named_scope_without_negative_named_scope(negative_name, lambda { |*args| 
                lambda_options = lambda.call(*args)
                lambda_options[:conditions] = "NOT (#{ sanitize_sql_for_conditions(lambda_options[:conditions]) })"
                lambda_options
              }, &block)
            end
          end
        end
      end
      alias_method_chain :named_scope, :negative_named_scope
      
    end
  end
end