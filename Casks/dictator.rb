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
    First launch (one time only):

    1. Open Dictator from Applications. macOS blocks it because it isn't
       notarized by Apple yet: click "Done" (not "Move to Trash").
    2. Open System Settings → Privacy & Security, scroll down to Security
       and click "Open Anyway" next to "Dictator" was blocked. The button
       only appears after step 1, for about an hour. Confirm, then click Open.
    3. Paste your OpenRouter API key (openrouter.ai/keys) in the Settings
       window, click Check, then Save.
    4. Allow the Microphone when asked.
    5. To have text typed for you, turn Dictator on in System Settings →
       Privacy & Security → Accessibility. Without it, text is copied and
       you press ⌘V.

    Then press ⌥D anywhere to dictate. Upgrades keep these permissions.
  EOS
end
