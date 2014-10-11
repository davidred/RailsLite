require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      filepath = "views/#{self.class.to_s.underscore}/#{template_name}.html.erb"
      contents = File.read(filepath)
      template = ERB.new(contents)
      rendered_html = template.result(binding)
      
      render_content(rendered_html, "text/html")
    end
  end
end
