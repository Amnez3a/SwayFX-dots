# My SwayFX dots

# Screenshots

<table style="border-collapse: collapse; border: none; border-spacing: 10px; margin-top: 10px; width: 100%;">
  <tr style="border: none;">
    <td style="border: none; padding: 5px; width: 50%;">
      <img src="images/screenshot1.png" alt="Screenshot 1" style="width: 100%; border-radius: 4px; display: block;">
    </td>
    <td style="border: none; padding: 5px; width: 50%;">
      <img src="images/screenshot2.png" alt="Screenshot 2" style="width: 100%; border-radius: 4px; display: block;">
    </td>
  </tr>
  <tr style="border: none;">
    <td style="border: none; padding: 5px; width: 50%;">
      <img src="images/screenshot3.png" alt="Screenshot 3" style="width: 100%; border-radius: 4px; display: block;">
    </td>
    <td style="border: none; padding: 5px; width: 50%;">
      <img src="images/screenshot5.png" alt="Screenshot 5" style="width: 100%; border-radius: 4px; display: block;">
    </td>
  </tr>
</table>


## My tools

**Term:** foot

**Shell:** Zsh

**Editor:** Neovim + Neovide ( cfg Neovim - LazyVim )

**Bar:** Noctalia shell V5
## Themes
**Catpuccin Mocha Mauve** ( [Palette](https://catppuccin.com/palette/) )

**powerlevel10k** - shell
#### Utility Themes
the color scheme for utilities is determined by the Noctalia template ( M3 Content ). they dont have a dot theme
![screenshot4](images/screenshot4.png)
## Fonts
**Inter Variable Black** ( GTK & QT )

**Iosevka Heavy Extended Oblique** ( Term & Neovide )
```nix
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    pkgs.inter
    pkgs.iosevka
  ];
}
```
