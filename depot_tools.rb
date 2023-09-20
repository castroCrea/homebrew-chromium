class DepotTools < Formula
  desc "Collection of tools for dealing with Chromium development"
  homepage "https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools.html"
  url "https://chromium.googlesource.com/chromium/tools/depot_tools.git",
    :branch => "main",
    :revision => "HEAD"
  version "main"

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
    To use depot_tools, add the following line to your shell profile (e.g., ~/.bashrc or ~/.zshrc):

      export PATH="#{opt_prefix}:$PATH"

    Installed tools:
    #{Dir["#{opt_prefix}/*"].map { |f| File.basename(f) }.join(", ")}
    EOS
  end

  test do
    system "#{bin}/gclient", "--version"
  end
end
