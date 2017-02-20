# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
  def randpara(para)
    ## set rand +-30%
    (para*rand(0.7 .. 1.3)).round
  end
