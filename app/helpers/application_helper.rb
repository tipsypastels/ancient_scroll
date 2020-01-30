module ApplicationHelper
  def body_variables
    {
      primary_color: Wiki.config.primary_color,
      primary_color_dark: Wiki.config.primary_color.paint.darken(20),
      primary_color_light: Wiki.config.primary_color.paint.brighten(30),
    }.map { |k, v| ["--#{k.to_s.dasherize}", v].join(':') }
     .join(';')
  end
end
