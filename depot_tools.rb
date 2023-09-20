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
    (bin/tool).write <<-EOS.indent
      #!/bin/bash
      TOOL=#{prefix}/#{tool}
      export DEPOT_TOOLS_UPDATE=1
      export PATH="$PATH:#{prefix}"
      exec "#{Formula["python"].bin}/python3" "$TOOL" "$@"
    EOS
  end

  test do
    system "#{bin}/gclient", "--version"
  end
end
