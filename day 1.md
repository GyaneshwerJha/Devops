# Linux Process Management Commands

## 1. `top`
**Example:** `top -o %MEM` (Sorts processes by memory usage)
**Use Case:**
- Displays real-time system statistics and running processes.
- Helps monitor CPU and memory usage.
- Allows sorting and filtering of processes.

## 2. `nice`
**Example:** `nice -n 10 ./script.sh` (Runs script.sh with lower priority)
**Use Case:**
- Adjusts the priority of a process before it starts.
- Helps manage system resource allocation by assigning different priority levels.

## 3. `renice`
**Example:** `renice -5 1234` (Changes priority of process with PID 1234)
**Use Case:**
- Changes the priority of an already running process.
- Useful for optimizing performance by giving higher/lower priority to processes.

## 4. `kill`
**Use Case:**
- Sends signals to processes to terminate or restart them.
- Commonly used signals:
  - `kill -9 <PID>` (Forcefully terminates a process)
  - `kill -15 <PID>` (Gracefully stops a process)

## 5. `pkill`
**Use Case:**
- Kills processes by name rather than by PID.
- Example: `pkill firefox` terminates all Firefox instances.

## 6. `ps`
**Example:** `ps -ef | grep apache` (Finds all Apache-related processes)
**Use Case:**
- Provides a snapshot of currently running processes.
- Used for monitoring and debugging process-related issues.

## 7. `ps aux`
**Example:** `ps aux --sort=-%cpu` (Sorts processes by CPU usage)
**Use Case:**
- Displays all running processes along with detailed information.
- Useful for system administrators to track memory and CPU usage.

## 8. `cron`
**Example:** `crontab -l` (Lists all scheduled cron jobs)
**Use Case:**
- Schedules recurring tasks (cron jobs) at specific intervals.
- Used for automating scripts, backups, and maintenance tasks.

## 9. `at`
**Use Case:**
- Schedules one-time execution of commands at a specified time.
- Example: `echo "shutdown -h now" | at 23:00` schedules a system shutdown at 11 PM.

## 10. `jobs`
**Example:** `jobs -l` (Lists all background jobs with process IDs)
**Use Case:**
- Lists background jobs in the current shell session.
- Helps manage processes running in the background.

## 11. `fg`
**Use Case:**
- Brings a background job to the foreground.
- Example: `fg %1` resumes the first job in the foreground.

## 12. `bg`
**Use Case:**
- Resumes a suspended process in the background.
- Example: `bg %2` resumes job number 2 in the background.

## 13. `nohup`
**Use Case:**
- Runs a command immune to hang-ups (keeps running after logout).
- Example: `nohup python script.py &` runs the script even after the user logs out.

## 14. `watch`
**Use Case:**
- Repeats a command at a set interval.
- Example: `watch -n 5 df -h` checks disk usage every 5 seconds.

## 15. `uptime`
**Use Case:**
- Shows system uptime and load average.
- Useful for checking system health and stability.

## 16. `htop`
**Example:** `htop -u user` (Shows processes owned by 'user')
**Use Case:**
- An interactive process viewer with an improved UI over `top`.
- Allows sorting, filtering, and managing processes efficiently.

## 17. `pidof`
**Use Case:**
- Finds the PID of a running program.
- Example: `pidof nginx` returns the process ID of the Nginx service.

## 18. `systemctl`
**Use Case:**
- Manages system services on systemd-based distributions.
- Example: `systemctl restart apache2` restarts the Apache server.

## 19. `service`
**Use Case:**
- Controls system services (alternative to `systemctl`).
- Example: `service nginx status` checks the status of the Nginx server.

## 20. `strace`
**Example:** `strace -c ls` (Shows system calls made by 'ls' with a summary)
**Use Case:**
- Traces system calls made by a process.
- Useful for debugging process execution issues.

## 21. `lsof`
**Use Case:**
- Lists open files associated with running processes.
- Example: `lsof -i :80` finds processes using port 80.

## 22. `timeout`
**Example:** `timeout 5s sleep 10` (Terminates 'sleep 10' after 5 seconds)
**Use Case:**
- Runs a command with a time limit, terminating it if it exceeds the specified duration.
- Example: `timeout 10s ping google.com` stops the ping command after 10 seconds.

These commands are essential for managing and monitoring Linux processes efficiently.
