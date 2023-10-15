# iTem2 config

## Restore

```
cp com.googlecode.iterm2.plist.xml com.googlecode.iterm2.plist
plutil -convert binary1 com.googlecode.iterm2.plist
mv com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Install iTerm

* Make the `Dark Blue` color readable in iTerm with black/dark background.

    ```
    iTerm --> Preferences --> Profiles --> Default --> Colors --> ANSI Colors --> Blue[Normal] --> click and change to a better color.
    ```

* Enable alternate screen

    ```
    iTerm --> Preferences --> Profiles --> Terminal --> uncheck Save lines to scrollback in alternate screen mode and Disable save/restore alternate screen
    ```

