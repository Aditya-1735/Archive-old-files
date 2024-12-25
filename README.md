# File Archiver Script

This is a simple Bash script designed to help you archive large files from a specified directory by compressing them into `.gz` files. The script filters files based on their size (greater than a user-defined threshold) and moves the compressed files into an `archive` directory within the specified path.

## Features

- Prompts the user for a directory path where the archive should be stored.
- Validates if the directory exists and creates an `archive` folder if it doesn't exist.
- Allows the user to specify a minimum file size (in MB) for files to be archived.
- Finds and compresses files greater than the specified size using `gzip`.
- Moves the compressed `.gz` files into the `archive` directory.

## How to Use

1. Clone this repository (or download the script file):
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
2. Make the script executable:
   ```bash
   chmod +x archive.sh
3. Run the script:
   ```bash
   ./archive.sh
4. Follow the prompts:
- Enter path/directory to store archive: Provide the directory where the archived files should be moved.
- Enter the minimum file size to archive (in MB): Specify the minimum file size (in MB) for files to be archived.

5. The script will:
- Compress files that are larger than the specified size into `.gz` format.
- Move the compressed files to an `archive` directory inside the specified path.


  Example:
  ```bash
  
  $ ./archive.sh
  Enter path/directory to store archive: /home/user/Documents
  You entered path: '/home/user/Documents'
  Enter the minimum file size to archive (in MB): 10
  You entered size: '10 MB'
  Archiving /home/user/Documents/file1.pdf --> /home/user/Documents/archive
  Archiving /home/user/Documents/file2.mp4 --> /home/user/Documents/archive
  Archiving completed.

## Requirements:
- A Unix-like environment (Linux, macOS, or WSL for Windows).
- `gzip` must be installed and available in the system's PATH.

## Troubleshooting:
- If you encounter a "command not found" error for `gzip`, ensure that `gzip` is installed on your system.
- If the script fails to find the specified directory, verify that the path you provided is correct.
