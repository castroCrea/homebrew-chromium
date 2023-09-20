# homebrew-chromium

## Install

```bash
brew tap castroCrea/chromium && brew install depot_tools
```

## To untap

```bash
brew untap castroCrea/chromium
```

## Permission issue

Open a terminal.

Navigate to the directory where gclient is installed. By default, Homebrew installs packages in /usr/local/bin, so you can use the following command to go to that directory:

```bash
cd /usr/local/bin
```
Check the permissions of the gclient script by running the ls -l command:

```bash
ls -l gclient
```

This will show you the current permissions of the file. It should look something like this:

```css
-rw-r--r-- 1 username staff 12345 Sep 20 12:34 gclient
```

The -rw-r--r-- part represents the permissions. If it's not executable, you'll see -rw-r--r-- instead of -rwxr-xr-x, which indicates that it's not executable.

To make the gclient script executable, use the chmod command:

```bash
chmod +x gclient
```
This command adds the execute permission to the gclient script.

After running the chmod command, you can now try running gclient again:

```bash
gclient
```

It should work without the "permission denied" error.

By making the gclient script executable, you should be able to use it without encountering permission issues.