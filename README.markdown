# EnviiLock Hyprlock Theme

![EnviiLock Lockscreen Design](screenshot/envii-lock.png)

The **EnviiLock**  is a pre-configured,  lockscreen for [Hyprlock](https://github.com/hyprwm/hyprlock), designed for the Hyprland Wayland compositor. Featuring user avatar, password input, music progress bar with artist/title display, and system information (date, time, username, hostname, uptime, and battery status), it offers a modern, vibrant aesthetic. Developed on **Fedora 42 Workstation**, this theme is ready to use on most Linux distributions with minimal setup.

## Features
- **Password Input**: Centered input field with placeholder text and error handling.
- **Music Integration**: Shows currently playing song (artist and title) and a progress bar via `playerctl`.
- **System Info**: Displays day of the week, date, time, username, hostname, uptime, and battery status.
- **Custom Fonts**: Uses Metropolis, SF Pro Display, and Stange for a sleek, modern look.

## Compatibility
The **EnviiLock** theme is compatible with most Linux distributions, including **Fedora 42 Workstation**, Arch, Ubuntu, and others, provided dependencies are met. Tested on Fedora 42 Workstation, it leverages standard paths for user avatars and battery status, with Wayland support for Hyprland. Considerations:
- **User Avatar**: The path `/var/lib/AccountsService/icons/$USER` is standard on Fedora and Arch but may vary (e.g., Ubuntu may use different paths).
- **Battery Status**: Requires `/sys/class/power_supply/BAT*`, typical on laptops. Remove this section for desktops.
- **Package Availability**: Dependencies like `hyprlock` and `playerctl` may require third-party repositories or manual installation on some distributions.

## Dependencies
Ensure the following are installed:
- **Hyprland**: Wayland compositor (required for `hyprlock`).
- **Hyprlock**: Lockscreen utility for Hyprland.
- **playerctl**: For music metadata and control (used in `music-progress.sh` and music label).
- **bash**: For running `music-progress.sh`.
- **zsh**: For executing commands in `hyprlock.conf` (e.g., date, uptime).
- **Core utilities**:
  - `sed`: For text processing.
  - `date`: For date and time display.
  - `uptime`: For system uptime.
  - `cat`: For battery status.
  - `uname`: For hostname.
- **fontconfig**: For font management (`fc-cache`).
- **Fonts**:
  - Metropolis (Medium)
  - SF Pro Display
  - Stange
  
## File Structure
- `hyprlock.conf`: Main configuration file for the EnviiLock theme.
- `music-progress.sh`: Script for music progress bar and time.
- `fonts/`: Directory with three subfolders containing Metropolis, SF Pro Display, and Stange fonts.

`

2. **Set Up Configuration Files**:
   
   Copy the configuration files:
   ```bash
   cp hyprlock.conf ~/.config/hypr/
   cp music-progress.sh ~/.config/hypr/
   chmod +x ~/.config/hypr/music-progress.sh
   ```

3. **Install Fonts**:
   Copy the fonts to a system or user font directory:
   ```bash
   # System-wide (requires root)
   sudo cp -r fonts/* /usr/share/fonts/
   sudo fc-cache -fv
   # OR User-specific
   cp -r fonts/* ~/.local/share/fonts/
   fc-cache -fv
   ```

4. **Test the Lockscreen**:
   Run `hyprlock` to verify:
   ```bash
   hyprlock
   ```
   Confirm the blurred background, avatar, password field, music info, and system details display correctly.

## Usage
- Trigger the lockscreen manually:
  ```bash
  hyprlock
  ```
- Configure Hyprland to launch `hyprlock` on idle or suspend (see [Hyprland documentation](https://wiki.hyprland.org)).
- Enter your password to unlock.

## Customization
Modify `~/.config/hypr/hyprlock.conf` to adjust:
- **Background**: Set `path` to a custom image (e.g., `/path/to/image.png`) instead of `screenshot`.
- **Avatar**: Change `path` to a custom image if not using `/var/lib/AccountsService/icons/$USER`.
- **Positions**: Adjust `position` (x, y coordinates) for elements.
- **Colors**: Update `rgba` values (e.g., `outer_color`, `font_color`).
- **Fonts**: Replace `font_family` values for different fonts.

For the music progress bar:
- Edit `~/.config/hypr/music-progress.sh` to change the `player` variable (e.g., `vlc`, `mpd`) or adjust `bar_length`.

## Troubleshooting
- **Music not displaying**: Ensure `playerctl` is installed and the music player (e.g., Spotify) is running.
- **Fonts not rendering**: Verify fonts are installed and `fc-cache -fv` was run.
- **Blank screen**: Replace `path = screenshot` with a valid image path if screenshots fail.
- **Script errors**: Confirm `music-progress.sh` is executable and dependencies are installed.
- **Battery status missing**: Remove the battery label section if `/sys/class/power_supply/BAT*` is unavailable (e.g., desktops).
- **Fedora-specific**: If `hyprlock` fails to start, ensure Hyprland is correctly installed via COPR or source.

## Notes
- Tested on **Fedora 42 Workstation** with standard paths for user avatars and battery status.
- Music features require a `playerctl`-compatible player (e.g., Spotify, VLC).
- Battery status is laptop-specific; remove the relevant label section for desktops.

## Contributing
Open issues or pull requests for improvements or bug fixes. Ensure changes are compatible with Fedora 42 Workstation and other distributions.


