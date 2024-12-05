require 'erb'
prefix        = 'TAILOR_VAR_'
template_file = 'main.tf.erb'
output_file   = 'main.tf'
local_binding = binding.clone
ENV.each do |k,v|
  if k.start_with?(prefix)
    var = k.gsub(/^#{prefix}/, "")
    local_binding.local_variable_set(var.to_sym, v)
  end
end
template = ERB.new(File.read(template_file))
File.open(output_file, 'w') { |file|
  file.write(template.result(local_binding))
}
