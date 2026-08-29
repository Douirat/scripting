# Bash Scripting — Learning by Doing

A practical roadmap for learning Bash scripting on Linux.

The goal is not to memorize Bash syntax. The goal is to understand how the shell works and become able to write scripts that automate real Linux tasks.

---

## 1. Prerequisites

Before starting, be comfortable with basic Linux commands:

```bash
pwd
ls
cd
mkdir
touch
cp
mv
rm
cat
less
head
tail
grep
find
chmod
```

You should also understand:

* Files and directories
* Absolute vs relative paths
* Linux permissions
* Processes
* Basic networking
* Environment variables

Check your shell:

```bash
echo "$SHELL"
```

Check Bash:

```bash
bash --version
```

---

# 2. What Is Bash?

Bash is a **shell**.

A shell is a program that reads commands and executes them.

For example:

```bash
ls
```

The shell receives the command and asks the operating system to execute it.

Bash can also execute a sequence of commands stored in a file:

```bash
./script.sh
```

That file is called a **shell script**.

---

# 3. Your First Script

Create a file:

```bash
touch hello.sh
```

Put this inside:

```bash
#!/usr/bin/env bash

echo "Hello, World!"
```

Make it executable:

```bash
chmod +x hello.sh
```

Run it:

```bash
./hello.sh
```

The first line:

```bash
#!/usr/bin/env bash
```

is called the **shebang**.

It tells the system which interpreter should execute the script.

---

# 4. Variables

Create variables:

```bash
name="Luffy"
age=19
```

Use them:

```bash
echo "$name"
echo "$age"
```

Important:

```bash
name="Luffy"
```

Correct.

```bash
name = "Luffy"
```

Incorrect.

Bash does not allow spaces around `=` when assigning variables.

---

## 4.1 Command substitution

You can store the output of a command:

```bash
current_directory=$(pwd)

echo "$current_directory"
```

Another example:

```bash
kernel=$(uname -r)

echo "Kernel: $kernel"
```

---

# 5. Important Special Variables

Learn these:

```bash
$0
$1
$2
$#
$@
$?
$$
```

### `$0`

Name of the script:

```bash
echo "$0"
```

### `$1`, `$2`, ...

Arguments passed to the script.

If:

```bash
./script.sh luffy 19
```

Then:

```bash
$1
```

is:

```text
luffy
```

and:

```bash
$2
```

is:

```text
19
```

### `$#`

Number of arguments:

```bash
echo "$#"
```

### `$@`

All arguments:

```bash
for arg in "$@"
do
    echo "$arg"
done
```

### `$?`

Exit status of the previous command:

```bash
ls /tmp

echo "$?"
```

Usually:

```text
0
```

means success.

A non-zero value generally means failure.

---

# 6. Quoting

Learn the difference between:

```bash
echo "$name"
```

and:

```bash
echo '$name'
```

Double quotes allow variable expansion.

Single quotes prevent it.

Example:

```bash
name="Luffy"

echo "$name"
```

Output:

```text
Luffy
```

But:

```bash
echo '$name'
```

Output:

```text
$name
```

As a general rule, quote variables:

```bash
echo "$name"
```

instead of:

```bash
echo $name
```

---

# 7. Conditions

Basic structure:

```bash
if condition
then
    command
fi
```

Example:

```bash
if [ "$name" = "Luffy" ]
then
    echo "Found Luffy"
fi
```

With `else`:

```bash
if [ "$name" = "Luffy" ]
then
    echo "Luffy"
else
    echo "Someone else"
fi
```

With `elif`:

```bash
if [ "$age" -lt 18 ]
then
    echo "Minor"
elif [ "$age" -eq 18 ]
then
    echo "Exactly 18"
else
    echo "Adult"
fi
```

---

# 8. Test Expressions

These are important.

## Files

```bash
[ -f file ]
```

Does the file exist and is it a regular file?

```bash
[ -d directory ]
```

Does the directory exist?

```bash
[ -r file ]
```

Is the file readable?

```bash
[ -w file ]
```

Is the file writable?

```bash
[ -x file ]
```

Is the file executable?

Example:

```bash
if [ -f "$file" ]
then
    echo "File exists"
fi
```

---

## Numbers

```bash
[ "$a" -eq "$b" ]
[ "$a" -ne "$b" ]
[ "$a" -lt "$b" ]
[ "$a" -le "$b" ]
[ "$a" -gt "$b" ]
[ "$a" -ge "$b" ]
```

Meaning:

```text
-eq    equal
-ne    not equal
-lt    less than
-le    less than or equal
-gt    greater than
-ge    greater than or equal
```

Example:

```bash
if [ "$age" -ge 18 ]
then
    echo "Adult"
fi
```

---

## Strings

```bash
[ "$a" = "$b" ]
[ "$a" != "$b" ]
```

Example:

```bash
if [ "$name" = "Luffy" ]
then
    echo "Correct"
fi
```

---

# 9. Logical Operators

AND:

```bash
[ "$age" -ge 18 ] && echo "Adult"
```

OR:

```bash
[ "$user" = "root" ] || echo "Not root"
```

Inside conditions:

```bash
if [ "$age" -ge 18 ] && [ "$country" = "Morocco" ]
then
    echo "Condition satisfied"
fi
```

You can also use:

```bash
[[ ... ]]
```

for Bash-specific tests.

---

# 10. Loops

## for loop

```bash
for user in luffy zoro sanji
do
    echo "$user"
done
```

Output:

```text
luffy
zoro
sanji
```

---

## Loop over files

```bash
for file in *
do
    echo "$file"
done
```

---

## while loop

```bash
count=0

while [ "$count" -lt 5 ]
do
    echo "$count"
    count=$((count + 1))
done
```

---

# 11. Arithmetic

Bash supports arithmetic:

```bash
a=10
b=5

result=$((a + b))

echo "$result"
```

Operators:

```text
+
-
*
/
%
```

Example:

```bash
count=$((count + 1))
```

---

# 12. Functions

Define a function:

```bash
hello() {
    echo "Hello"
}
```

Call it:

```bash
hello
```

Functions can receive arguments:

```bash
greet() {
    echo "Hello $1"
}

greet "Luffy"
```

Output:

```text
Hello Luffy
```

Functions are useful when a script starts becoming larger.

---

# 13. Reading User Input

Use `read`:

```bash
echo "Enter your name:"
read name

echo "Hello $name"
```

A cleaner version:

```bash
read -p "Enter your name: " name

echo "Hello $name"
```

---

# 14. Command-Line Arguments

Create:

```bash
args.sh
```

Put:

```bash
#!/usr/bin/env bash

echo "Script: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Arguments: $#"
```

Run:

```bash
./args.sh hello world
```

---

# 15. `case`

`case` is useful when creating command-line programs.

```bash
case "$1" in
    start)
        echo "Starting"
        ;;
    stop)
        echo "Stopping"
        ;;
    restart)
        echo "Restarting"
        ;;
    *)
        echo "Unknown command"
        ;;
esac
```

Run:

```bash
./service.sh start
```

---

# 16. Exit Status

Every command returns an exit status.

Example:

```bash
ls /tmp

echo "$?"
```

Success:

```text
0
```

Failure:

```text
non-zero
```

You can explicitly exit:

```bash
exit 0
```

or:

```bash
exit 1
```

Example:

```bash
if [ ! -f "$1" ]
then
    echo "File does not exist"
    exit 1
fi
```

---

# 17. Pipes

A pipe sends the output of one command to another command.

```bash
ls | grep ".txt"
```

Conceptually:

```text
ls
 |
 v
grep
```

Another example:

```bash
ps aux | grep ssh
```

---

# 18. Redirection

Output to a file:

```bash
echo "Hello" > file.txt
```

Append:

```bash
echo "Another line" >> file.txt
```

Input:

```bash
command < file.txt
```

Error output:

```bash
command 2> error.log
```

Both standard output and errors:

```bash
command > output.log 2>&1
```

---

# 19. `/dev/null`

`/dev/null` discards output.

Example:

```bash
command > /dev/null
```

Discard output and errors:

```bash
command > /dev/null 2>&1
```

Example:

```bash
ping -c 1 192.168.1.1 > /dev/null 2>&1
```

Then check:

```bash
echo "$?"
```

---

# 20. Text Processing

These commands are essential for Linux scripting.

Learn:

```bash
grep
sed
awk
cut
sort
uniq
tr
head
tail
wc
xargs
```

Do not try to memorize every option.

Understand what each tool is for.

---

## grep

Search text:

```bash
grep "ssh" /etc/services
```

Search recursively:

```bash
grep -r "hello" .
```

---

## cut

Example:

```bash
cat /etc/passwd | cut -d: -f1
```

This extracts usernames.

---

## sort

```bash
cat names.txt | sort
```

---

## uniq

```bash
sort names.txt | uniq
```

---

## wc

```bash
wc -l file.txt
```

Counts lines.

---

# 21. Finding Files

Learn:

```bash
find
```

Example:

```bash
find . -name "*.txt"
```

Files:

```bash
find . -type f
```

Directories:

```bash
find . -type d
```

You can combine it with commands:

```bash
find . -type f -name "*.log"
```

---

# 22. Permissions

Understand:

```bash
chmod
chown
chgrp
```

Example:

```bash
chmod +x script.sh
```

Check:

```bash
ls -l script.sh
```

Understand:

```text
r = read
w = write
x = execute
```

and:

```text
user
group
others
```

---

# 23. Processes

Learn:

```bash
ps
top
pgrep
kill
jobs
bg
fg
```

Example:

```bash
ps aux
```

Find a process:

```bash
pgrep ssh
```

Kill a process:

```bash
kill PID
```

---

# 24. Systemd

Since Bash is often used for Linux administration, learn:

```bash
systemctl
journalctl
```

Check a service:

```bash
systemctl status ssh
```

Check whether it is running:

```bash
systemctl is-active ssh
```

Example script:

```bash
if systemctl is-active --quiet ssh
then
    echo "SSH is running"
else
    echo "SSH is not running"
fi
```

---

# 25. Networking

Learn how to use these commands from scripts:

```bash
ip
ss
ping
curl
ssh
scp
```

Example:

```bash
if ping -c 1 192.168.1.1 > /dev/null 2>&1
then
    echo "Gateway reachable"
else
    echo "Gateway unreachable"
fi
```

Check listening ports:

```bash
ss -tulpn
```

---

# 26. Environment Variables

Check:

```bash
echo "$PATH"
echo "$HOME"
echo "$USER"
```

List environment variables:

```bash
env
```

Set one:

```bash
export APP_ENV="development"
```

Then:

```bash
echo "$APP_ENV"
```

Understand why `export` matters.

---

# 27. Shell Scripts and PATH

You can execute a script directly:

```bash
./script.sh
```

Or with Bash:

```bash
bash script.sh
```

They are not exactly the same.

If the script is executable and has a valid shebang:

```bash
./script.sh
```

uses the interpreter specified by the shebang.

---

# 28. Debugging

Run a script with tracing:

```bash
bash -x script.sh
```

You can also use:

```bash
set -x
```

inside the script.

Stop tracing:

```bash
set +x
```

Always investigate errors instead of blindly changing the script.

---

# 29. Safer Bash Scripts

Eventually learn:

```bash
set -euo pipefail
```

These options change how Bash handles:

```text
-e    errors
-u    unset variables
-o pipefail    pipeline failures
```

Do not use this blindly.

Understand each option before adding it to every script.

---

# 30. Script Structure

A reasonable Bash script can look like:

```bash
#!/usr/bin/env bash

set -euo pipefail

function_name() {
    # code
}

main() {
    # program logic
}

main "$@"
```

A `main` function is **not required** in Bash.

This is perfectly valid:

```bash
#!/usr/bin/env bash

echo "Hello"
```

A `main` function becomes useful when the script gets larger and you want to separate definitions from execution.

---

# 31. Learning by Doing

Do not study all of the syntax first.

For every topic:

```text
Learn the concept
      ↓
Write a tiny script
      ↓
Break the script
      ↓
Read the error
      ↓
Fix it
      ↓
Build something larger
```

---

# 32. Exercises

## Level 1 — Basics

### Exercise 1

Write a script that prints:

```text
Hello, <name>
```

where `<name>` is stored in a variable.

---

### Exercise 2

Take a username as an argument:

```bash
./hello.sh luffy
```

Output:

```text
Hello luffy
```

---

### Exercise 3

Write a script that checks whether a file exists.

Usage:

```bash
./check_file.sh file.txt
```

---

### Exercise 4

Write a script that checks whether an argument is a directory.

---

### Exercise 5

Write a script that compares two numbers.

Usage:

```bash
./compare.sh 10 20
```

Output:

```text
20 is greater
```

---

# 33. Level 2 — Loops

### Exercise 6

Print numbers:

```text
1
2
3
4
5
```

using a loop.

---

### Exercise 7

Print every `.txt` file in the current directory.

---

### Exercise 8

Count the number of files in the current directory.

---

### Exercise 9

Loop through every username in `/etc/passwd`.

---

# 34. Level 3 — Linux Administration

### Exercise 10 — System Information

Create:

```bash
system_info.sh
```

It should display:

```text
Hostname:
Kernel:
Uptime:
Current user:
IP address:
Disk usage:
Memory usage:
```

Use Linux commands to obtain the information.

---

### Exercise 11 — Service Checker

Create:

```bash
service_check.sh ssh
```

The script should determine whether SSH is running.

---

### Exercise 12 — Port Checker

Create:

```bash
port_check.sh 22
```

The script should determine whether the specified port is listening.

---

### Exercise 13 — User Checker

Create:

```bash
user_check.sh luffy
```

The script should tell you whether the user exists.

If it exists, display:

```text
Username
UID
Groups
Home
Shell
```

---

# 35. Level 4 — Real Automation

## Project 1 — Server Health Check

Create:

```bash
health_check.sh
```

Check:

* hostname
* uptime
* disk usage
* memory usage
* CPU load
* IP address
* SSH status
* listening ports

Example output:

```text
===== SERVER HEALTH =====

Hostname: server01
Uptime: 2 days
Disk: 42%
Memory: 51%
SSH: active
Network: OK
```

---

## Project 2 — SSH Audit

Create:

```bash
ssh_audit.sh
```

Check:

* Is SSH running?
* Which port is SSH using?
* Is root login permitted?
* Is password authentication enabled?
* Does the SSH configuration file exist?

Do not modify anything initially.

The first version should only **report**.

---

## Project 3 — Backup Script

Create:

```bash
backup.sh
```

It should:

1. Receive a directory as an argument.
2. Verify that it exists.
3. Create a backup directory.
4. Archive the directory.
5. Add a timestamp.
6. Report success/failure.

For example:

```bash
./backup.sh /home/user/Documents
```

---

## Project 4 — Log Analyzer

Create:

```bash
log_analyzer.sh
```

Given a log file, display:

```text
Total lines:
Errors:
Warnings:
Unique IP addresses:
```

Use:

```bash
grep
awk
sort
uniq
wc
```

---

# 36. Recommended Learning Platform

For interactive learning:

### Exercism

https://exercism.org/tracks/bash

Use it to solve actual Bash exercises.

### LearnShell

https://www.learnshell.org/

Use it for interactive Bash lessons.

### shell.trainer

https://shelltrainer.com/

Use it for Linux shell practice in a browser.

---

# 37. Recommended Order

Follow this order:

```text
01. Linux commands
02. Shell vs Bash
03. Shebang
04. Variables
05. Quoting
06. Command substitution
07. Arguments
08. Conditions
09. File tests
10. Numeric tests
11. String tests
12. Loops
13. Arithmetic
14. Functions
15. case
16. Exit codes
17. Pipes
18. Redirection
19. grep
20. find
21. sed
22. awk
23. Permissions
24. Processes
25. systemd
26. Networking
27. Environment variables
28. Debugging
29. Error handling
30. Automation
31. Real projects
```

---

# 38. What You Do NOT Need to Memorize

Do not try to memorize:

* Every Bash option
* Every `grep` flag
* Every `sed` command
* Every `awk` feature
* Every `find` option
* Every system command

Instead, learn:

```text
What does this command do?
When should I use it?
How do I find its documentation?
How do I combine it with other commands?
```

Use:

```bash
man command
```

and:

```bash
command --help
```

For example:

```bash
man grep
```

---

# 39. Final Goal

You should eventually be able to see a task such as:

> "Check whether SSH is running, verify that port 22 is listening, and report the result."

and independently think:

```text
systemctl → check service
ss        → check port
if        → make decision
echo      → report result
```

Then turn that into a script.

That is the point of learning Bash scripting.
