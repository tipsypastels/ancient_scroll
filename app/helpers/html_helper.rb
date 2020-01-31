module HtmlHelper
  def fa(icon, group: :fas, fw: true, **opts)
    klass = "icon #{group} fa-#{icon} #{'fa-fw' if fw} #{opts.delete(:class)}"
    tag.i class: klass, **opts
  end

  def divider
    tag.div class: 'divider'
  end
end