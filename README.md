# superGPT-chrome-extension-mac-wrapper
# SuperGPT Chromium Wrapper

A portable macOS app wrapper for running [ChatGPT](https://chatgpt.com/) in a secure Chromium window with custom extensions and enhanced privacy. Prevents extra windows/tabs, disables local network prompts, and auto-quits when the window is closed.

---

## Features

- Runs ChatGPT as a standalone desktop app on macOS.
- Loads [Superpower ChatGPT](https://github.com/saeedezzati/superpower-chatgpt) and other Chrome extensions.
- Blocks new windows/tabs and disables background tasks.
- Suppresses local network permission prompts.
- Chromium auto-quits when the last window is closed.
- All paths are relative—portable and folder-agnostic.

---

## Setup

1. **Download or clone this repository** and place it in your preferred location.

2. **Bypass macOS Gatekeeper** for Chromium (required since Chromium is not code-signed):

    ```sh
    xattr -dr com.apple.quarantine /Applications/SuperGPT/Chromium.app
    ```
    > If you placed it elsewhere, replace `/Applications/SuperGPT/Chromium.app` with your own path.

3. **(Optional)** Ensure the launcher script is executable:
    ```sh
    chmod +x site-script.sh
    ```

---

## Usage

- Double-click the Automator `.app` in this directory, or run `site-script.sh` directly from Terminal.
- Chromium will launch in app mode, load all privacy flags, and your chosen extensions.
- **When you close the last window, Chromium will automatically quit.**

---

## Troubleshooting

- **Chromium won’t open?**
    - Double-check that you’ve run the Gatekeeper override command above.
- **Permissions issues?**
    - Make sure `site-script.sh` is executable (`chmod +x site-script.sh`).

---

## Credits

- [Superpower ChatGPT Extension](https://github.com/saeedezzati/superpower-chatgpt)
- [Chromium Project](https://www.chromium.org/)
- Wrapper script and automation by me+ChatGPT

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

~+ TODO: README~
- TODO: Disable windows/tabs (new extensinon)
  - https://chromewebstore.google.com/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck
- TODO: Quit chromium after window closes
- TODO: Get all in one working (put everything in resources)
- TODO: replace automater icon and chromium icon