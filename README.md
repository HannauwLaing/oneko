oneko (Wayland-Friendly Fork)
=====

This is a workaround for a bug on [glreno's original oneko](https://github.com/glreno/oneko). When using wayland the program cant always get the mouse position due to security reasons.

In this fork, the cat no longer follows the mouse directly. Instead it moves to **random position** and then sleeps for **random durations** between movements

A `Makefile` is also included for easier compilation and execution.

---

Commands
=====

### Compile
From inside the `oneko` directory:
```bash
make compile
```
### Run
From inside the `oneko` directory:
```bash
make run
```

### Run and disown cat:
```bash
make run-disown
```
```bash
make -C ~/path/to/oneko/ all 0<&- >/dev/null 2>&1 & disown;
```
### Kill all disowned cats:
```bash
make purge
```
```bash
pkill -f "java -cp bin NekoMain"; echo "Cats have been purged";
```

links
=====

[original] https://github.com/glreno/oneko
