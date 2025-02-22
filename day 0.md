# Understanding File Permissions in Linux

In Linux, every file and directory has a set of **permissions** that control who can **read**, **write**, or **execute** it. These permissions are divided into three categories:

- **Owner (u):** The user who owns the file.
- **Group (g):** A group of users assigned to the file.
- **Others (o):** Everyone else who isn’t the owner or part of the group.

## How Permissions Are Represented

Permissions are displayed in two formats:

### 1. Symbolic

Uses letters and dashes:

- `r` = read
- `w` = write
- `x` = execute
- `-` = no permission

**Example:** `rwxr-xr--` means:

- Owner: `rwx` (read, write, execute)
- Group: `r-x` (read, execute)
- Others: `r--` (read only)

### 2. Numeric (Octal)

A three-digit number where:

- Read (`r`) = 4
- Write (`w`) = 2
- Execute (`x`) = 1
- No permission = 0

Add the values for each category.  
**Example:** `755` = `rwxr-xr-x`

- Owner: 7 (4+2+1 = read, write, execute)
- Group: 5 (4+1 = read, execute)
- Others: 5 (4+1 = read, execute)

To view permissions, run `ls -l` in a terminal. Example output:

- -rwxr-xr-- 1 user group 4096 Feb 22 12:00 script.sh

## `chmod`: Changing File Permissions

The `chmod` command modifies file permissions. It works in two modes: **symbolic** or **numeric**.

### Symbolic Mode

**Syntax:** `chmod [who][operator][permissions] file`

- **Who:** `u` (owner), `g` (group), `o` (others), `a` (all)
- **Operator:** `+` (add), `-` (remove), `=` (set exactly)
- **Permissions:** `r`, `w`, `x`

**Examples:**

- `chmod u+x script.sh`  
  Adds execute permission for the owner.
- `chmod go-r script.sh`  
  Removes read permission for group and others.
- `chmod a=rw file.txt`  
  Sets read and write permissions for everyone (no execute).

### Numeric Mode

**Syntax:** `chmod [number] file`  
Uses octal values (0-7) for owner, group, and others.

**Examples:**

- `chmod 755 script.sh`  
  Owner: `rwx` (7), Group/Others: `r-x` (5).
- `chmod 644 file.txt`  
  Owner: `rw-` (6), Group/Others: `r--` (4).
- `chmod 700 secret.sh`  
  Owner: `rwx` (7), Group/Others: none (0).

## `chown`: Changing File Ownership

The `chown` command updates the owner and/or group of a file.

**Syntax:** `chown [user][:group] file`

- **User:** The new owner’s username.
- **Group:** The new group (optional, preceded by `:`).

**Examples:**

- `chown alice file.txt`  
  Changes owner to `alice`.
- `chown alice:developers file.txt`  
  Changes owner to `alice` and group to `developers`.
- `chown :developers file.txt`  
  Changes only the group to `developers`.

For directories (recursive change):

- `chown -R alice:developers /path/to/dir`  
  Applies to the directory and all its contents.

## Practice Commands

Try these hands-on exercises in a Linux terminal:

### 1. Create a Test File

```bash
touch testfile.txt
ls -l testfile.txt  # Check default permissions (likely rw-r--r--)
```

### 2. Play with chmod (Symboli)

```bash
chmod u+x testfile.txt
ls -l  # Should show rwxr--r--
chmod go+w testfile.txt
ls -l  # Should show rwxrw-rw-
chmod a=r testfile.txt
ls -l  # Should show r--r--r--
```

### 3. Play with chmod (Numeric)

```bash
chmod u+x testfile.txt
ls -l  # Should show rwxr--r--
chmod go+w testfile.txt
ls -l  # Should show rwxrw-rw-
chmod a=r testfile.txt
ls -l  # Should show r--r--r--
```

### 4. Play with chown
```bash
sudo chown root testfile.txt
ls -l  # Owner should now be root
sudo chown :users testfile.txt
ls -l  # Group should now be users
sudo chown $USER testfile.txt  # Change back to yourself
```

### 5. Test on a Directory
```bash
mkdir testdir
chmod 700 testdir
ls -ld testdir  # Should show drwx------
```

### Tips
```
Tips
Use man chmod or man chown in the terminal for more details.
Be cautious with permissions on system files—practice in a safe directory like ~/practice.
Common permission patterns:
Scripts: 755 (executable by all, writable only by owner)
Private files: 600 (only owner can read/write)
Directories: 755 (owner has full access, others can enter/list)
```