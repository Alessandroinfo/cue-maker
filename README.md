CueMaker
========

CueMaker is a simple shell script designed to generate `.cue` files for `.bin`, `.iso`, and `.img` files in a specified directory. This is particularly useful for systems that require `.cue` files alongside game or media files but lack them. The script supports recursive directory searching and can overwrite existing `.cue` files based on user preference.

Installation in Onion OS
-------------------
Copy the App/ files into CueMaker folder in App/
or
Run inside the terminal `cd /mnt/SDCARD/App && wget -O cue-maker-main.zip https://github.com/Alessandroinfo/cue-maker/archive/refs/heads/main.zip && mkdir CueMaker && unzip cue-maker-main.zip && mv cue-maker-main/App/* CueMaker && rm -r -f cue-maker-main.zip cue-maker-main`

Using with Onion OS
-------------------

To use CueMaker on Onion OS, simply download all the contents of this project and place them in the directory `App/CueMaker` on your device. This will allow you to run the script within the Onion OS environment for convenient cue file management.

Features
--------

-   Automatically generates `.cue` files for `.bin`, `.iso`, and `.img` files.
-   Supports recursive directory traversal.
-   Option to overwrite existing `.cue` files.

Requirements
------------

CueMaker is a shell script (`sh`) and should work on any Unix-like system with basic shell utilities. Ensure that you have `find`, `dirname`, and `grep` installed, as they are commonly available on Unix systems.

Usage
-----

Run the script with the following command format:

bash

Copia codice

`./cue_maker.sh [path] [recursive] [overwrite]`

-   **path**: (Optional) The root directory to scan. Defaults to `roms`.
-   **recursive**: (Optional) Whether to search directories recursively. Acceptable values:
    -   `Y`, `Yes`, `T`, `True` (case insensitive) --- enables recursive search.
    -   `N`, `No`, `F`, `False` --- disables recursive search.
    -   Default: `Y` (recursive).
-   **overwrite**: (Optional) Whether to overwrite existing `.cue` files. Acceptable values:
    -   `Y`, `Yes`, `T`, `True` (case insensitive) --- enables overwriting.
    -   `N`, `No`, `F`, `False` --- skips existing `.cue` files.
    -   Default: `N` (do not overwrite).

### Examples

1.  **Scan default directory** (`roms`), **recursively** with **overwrite enabled**:

    bash

    Copia codice

    `./cue_maker.sh roms Y Y`

2.  **Specify a custom directory** (`/path/to/files`), **non-recursive** without overwriting:

    bash

    Copia codice

    `./cue_maker.sh /path/to/files N N`

3.  **Specify a custom directory** (`/path/to/files`), **recursive** without overwriting:

    bash

    Copia codice

    `./cue_maker.sh /path/to/files Y N`

Script Logic
------------

CueMaker uses a template `.cue` file format, which is applied to each media file found in the directory. If a `.cue` file for a specific file doesn't exist (or if overwrite is enabled), the script creates it in the same directory.

The `.cue` template:

plaintext

Copia codice

`FILE "%FILENAME%" BINARY
TRACK 01 MODE1/2352
INDEX 01 00:00:00`

The `%FILENAME%` placeholder is replaced with the actual media file's name, ensuring compatibility with most systems.

License
-------

This project is licensed under the MIT License. See the LICENSE file for details.

* * * * *

Enjoy using CueMaker!
