#oneko (Wayland-Friendly Fork)
=====

This is a workaround for a bug on[glreno's original oneko](https://github.com/glreno/oneko).


In this fork, the cat no longer follows the mouse directly. Instead, it:
- Moves to **random screen positions**
- Pauses for **random durations** between movements

A `Makefile` is also included for easier compilation and execution.

---

##Commands
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
make -C ~/path/to/oneko/ all 0<&- >/dev/null 2>&1 & disown ;
```
### Kill all disowned cats:
```bash
pkill -f \"^java -cp bin NekoMain$\";clear; echo \"Cats have been purged\
```

links
=====

[original] https://github.com/glreno/oneko
