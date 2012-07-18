# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber', :change_format => 'pretty', keep_failed: false, all_after_pass: false do #, all_on_start: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/*#{m[1]}*.feature")] || 'features' }

  user_features = Dir[File.join("features/signing*.feature")]
  watch(%r{^features/step_definitions/user_steps.rb$})  { user_features }
  watch(%r{^app\/(model|controller)s\/.*user.*\.rb$})   { user_features }
end
