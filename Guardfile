# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :shell do
  watch(%r{^(.+\.(rb|feature|erb))$})                   { |m| `notify-send #{m[0]} modified` }
end

group :features do
  guard 'cucumber', :change_format => 'pretty', keep_failed: false, all_after_pass: false, all_on_start: false do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})                      { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
      step_features = Dir[File.join("**/*#{m[1]}*.feature")]
      if m[1] =~ /state/
        step_features + Dir[File.join("**/*comment*.feature")]
      elsif m[1] =~ /app_email/
        Dir[File.join("**/*gmail*.feature")] + Dir[File.join("**/*notification*.feature")]
      else
        unless step_features.empty?
          step_features
        else
          'features'
        end
      end
    end

    watch(%r{^app/models/(?:(?:\w+/)*)(\w+)\.rb$})        { |m| Dir[File.join("**/*#{m[1]}*.feature")] }
    watch(%r{^app/views/(?:(?:\w+/)*)(\w+)/.*\.erb$})     { |m| Dir[File.join("**/*#{m[1][0..-2]}*.feature")] }
    watch(%r{^app/controllers/(?:(?:\w+/)*)(\w+)_controller\.rb$}) { |m| Dir[File.join("**/*#{m[1][0..-2]}*.feature")] }
    watch(%r{^app/helpers/(?:(?:\w+/)*)(\w+)_helper\.rb$})         { |m| Dir[File.join("**/*#{m[1][0..-2]}*.feature")] }


    user_features = Dir[File.join("features/signing*.feature")] +
                    Dir[File.join("features/hidden*.feature")] +
                    Dir[File.join("features/*user*.feature")]
    watch(%r{^features/step_definitions/user_steps.rb$})  { user_features }
    watch(%r{^app/(model|controller)s/.*user.*\.rb$})     { user_features }
  end
end

group :specs do
  guard 'rspec', keep_failed: false, all_after_pass: false, all_on_start: false do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }

    # Rails example
    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
      [
        "spec/routing/#{m[1]}_routing_spec.rb",
        "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
        "spec/acceptance/#{m[1]}_spec.rb"
      ]
    end
    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
    watch('config/routes.rb')                           { "spec/controllers" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }
    watch(%r{^app/controllers/api/(\w+)/(?:(?:\w+/)*)(\w+)_(controller)\.rb$}) do |m|
      api_specs = Dir[File.join("spec/api/#{m[1]}/*#{m[2][0..-2]}*_spec.rb")]
      unless api_specs.empty?
        api_specs
      else
        "spec/api/#{m[1]}"
      end
    end

    # # Capybara request specs
    # watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

    # # Turnip features and steps
    # watch(%r{^spec/acceptance/(.+)\.feature$})
    # watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
  end
end
