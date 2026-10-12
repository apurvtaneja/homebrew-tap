cask "dictator" do
  version "2.2.0"
  sha256 "631f3b51b100f7249f6b7bcee662938605b1a844499c9352bf9a74f00c1dd72f"

  url "https://github.com/apurvtaneja/dictator/releases/download/v#{version}/Dictator-#{version}.zip"
  name "Dictator"
  desc "Dictate anywhere with OpenRouter speech-to-text and grammar cleanup"
  homepage "https://github.com/apurvtaneja/dictator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Dictator.app"

  uninstall quit: "io.github.apurvtaneja.dictator"

  zap trash: "~/.config/dictator"

  caveats <<~EOS
    Dictator isn't notarized by Apple yet. On first launch macOS will block it:
    open System Settings → Privacy & Security and click "Open Anyway" (once).

    Then add your OpenRouter API key in the Settings window that opens,
    and press ⌥D anywhere to dictate.
  EOS
end
