# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber', :change_format => 'pretty', keep_failed: false do #, all_on_start: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/*#{m[1]}*.feature")] || 'features' }
  watch(%r{^features/step_definitions/user_steps.rb$})  { 'features/signing_up.feature' }
end
