# SuperGPT Chromium Wrapper

A portable, standalone macOS app wrapper for running [ChatGPT](https://chatgpt.com/) in a secure Chromium window with a custom (not mine!!) extension.

---

## Chromium Download & Setup

**Note:**  
Due to GitHub’s file size limits, `Chromium.app` is **not included** in this repository.  
You must download or build Chromium yourself and place it in the project directory before bundling with the injection script.

### Where to Download

We recommend the [Woolyss Chromium download page](https://chromium.woolyss.com/#mac) for up-to-date, official, and unmodified builds:

- [https://chromium.woolyss.com/#mac](https://chromium.woolyss.com/#mac)

Choose the latest stable **"standard" Chromium** build (not “ungoogled” unless you want advanced privacy and understand the limitations).

### Setup

1. **Download and extract** `Chromium.app` to the root of this project directory (so it’s next to your `SuperGPT.app` and `site-script.sh`).
2. **Run** `inject-resources.sh` as described below to copy it into the standalone app bundle.

The directory structure should look like:

```
SuperGPT.app/
Chromium.app/
Superpower-ChatGPT/
site-script.sh
inject-resources.sh
```

If you update Chromium, just replace the `Chromium.app` in the project root and re-run `inject-resources.sh`.

---

## Features

- Runs ChatGPT as a standalone desktop app on macOS.
- Loads [Superpower ChatGPT](https://github.com/saeedezzati/superpower-chatgpt) (Planned: other Chrome extensions).
- **Fully standalone version:** all required files are bundled inside the app’s `Contents/Resources` folder.
- All paths are relative—portable and folder-agnostic.

Planned/WIP:
- Blocks new windows/tabs and disables background tasks.
- Suppresses local network permission prompts.
- Chromium auto-quits when the last window is closed.

---

## How It Works

**SuperGPT** is designed to be a truly portable, self-contained macOS app for running Chromium with your favorite ChatGPT extension.

**Key implementation points:**
- **Automator “Application” wrapper:**  
  Automator is used to create a Mac `.app` that runs a shell script. This lets the app show up in Finder/Spotlight and double-click to launch.
- **Relative resource injection:**  
  All necessary files (`Chromium.app`, `site-script.sh`, `Superpower-ChatGPT`) are injected into `SuperGPT.app/Contents/Resources/`, so you can move or rename the app and it still works.
- **Smart shell scripting:**  
  The shell script dynamically finds its own Resources folder, ensuring all launches are self-contained and do not pollute or depend on global system paths.
- **No installation or root permissions needed:**  
  You just run the injection script after updating the app, and all dependencies are bundled inside.
- **macOS Gatekeeper compatibility:**  
  The setup uses `xattr` to remove macOS’s quarantine attributes, allowing unsigned Chromium to launch safely.

**Why this approach?**
- No Homebrew, no system-wide changes, and no risk to your main Chrome or user profile.
- You can easily update the app or extension by reinjecting resources.
- Honestly, I wanted to explore scripting, chromium, and ChatGPT

---

## Setup

1. **Download or clone this repository** and place it in your preferred location.

2. **(First run only) Bypass macOS Gatekeeper** for Chromium and the app bundle (required since Chromium is not code-signed):

```sh
xattr -dr com.apple.quarantine SuperGPT.app/Contents/Resources/Chromium.app
xattr -dr com.apple.quarantine SuperGPT.app
```
> If your app is named differently, or located elsewhere, update the paths accordingly.

3. **(Optional)** Ensure the launcher script is executable:
```sh
chmod +x site-script.sh
```

---

## Injecting Resources: Keeping the App Standalone

Whenever you **update, replace, or re-create your Automator app bundle (`SuperGPT.app`)**, you’ll need to re-inject the required resources (Chromium, extension, launcher script) into its Resources folder.

Use the included injection script:

```sh
./inject-resources.sh
```

- Place `inject-resources.sh` in the same folder as your `SuperGPT.app`
- Place `Chromium.app`, `site-script.sh`, and `Superpower-ChatGPT` **one directory above**
- Run the script after every modification or regeneration of your Automator app

This ensures your standalone app always contains all necessary files!

Example structure after injection:

```
SuperGPT.app/
└── Contents/
    └── Resources/
        ├── Chromium.app/
        ├── Superpower-ChatGPT/
        └── site-script.sh
```

---

## Usage

- Double-click the Automator `.app` (`SuperGPT.app`) to launch.
- Chromium will launch in app mode, load all privacy flags, and your chosen extensions.
- **When you close the last window, Chromium will automatically quit.**

---

## Troubleshooting

- **Chromium won’t open?**
    - Double-check that you’ve run the Gatekeeper override command above.
- **Permissions issues?**
    - Make sure `site-script.sh` is executable (`chmod +x site-script.sh`).
- **Resource files missing?**
    - Re-run `inject-resources.sh` after updating or replacing the `.app` bundle.

---

## Credits

- [Superpower ChatGPT Extension](https://github.com/saeedezzati/superpower-chatgpt)
- [Chromium Project](https://www.chromium.org/)
- Wrapper script and automation by [anmokhta](https://github.com/anmokhta) + ChatGPT

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---
