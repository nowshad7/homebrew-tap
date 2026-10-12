class NginxVhost < Formula
  desc "Point any local domain at a reverse proxy, static site or PHP app"
  homepage "https://github.com/nowshad7/nginx-vhost"
  url "https://github.com/nowshad7/nginx-vhost/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "d8570354449fee5c67fa846a9d53c47e94b0210b0d58a3505c3e345c8933f6e0"
  license "MIT"

  def install
    bin.install "nginx-vhost"
  end

  def caveats
    <<~EOS
      Homebrew's nginx reads #{HOMEBREW_PREFIX}/etc/nginx/servers/, not
      /etc/nginx/sites-enabled/. Add this to your shell profile:
        export NGINX_VHOST_AVAILABLE="#{HOMEBREW_PREFIX}/etc/nginx/sites-available"
        export NGINX_VHOST_ENABLED="#{HOMEBREW_PREFIX}/etc/nginx/servers"
        export NGINX_VHOST_LOG_DIR="#{HOMEBREW_PREFIX}/var/log/nginx"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nginx-vhost version")
  end
end
