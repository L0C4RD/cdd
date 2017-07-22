# cdd.sh - "Chatty" dd

## A short shell script that'll `dd` your data, and tell you how it's getting on the whole time.

Tested on Linux, but should run fine on Mac OS, BSD, and Cygwin too.

### How do I use this?

 - It's very easy. Start by grabbing a copy of the repo:

```
git@github.com:L0C4RD/cdd.git
```

 - Then navigate to the directory you've cloned the repo into.
 - Once you've done that, you can kick it off like so:

```
cdd.sh 0.5 if=/my/input/file of=/my/output/file
```

 - The command is pretty much the same as regular old `dd`, but with a first argument which tells the script how often you'd like it to give you a progress report (in seconds.)

### Why did you make this?

One of the most common questions I get asked is "how long is that `dd` going to take?" I wrote this script so that I'd be able to answer that question. It's not going to change the world, but it's kind of helpful.

Doing big convert-and-copy operations can take a long time. It can also be quite frustrating staring at an unchanging `dd` line in a terminal for hours on end, without any idea of its progress, so hopefully this will make someone's day a bit less rubbish.

### Could you make this run on $OPERATING_SYSTEM ?

Probably. If you want to use it somewhere else, it should be pretty easy to tweak - and if not, just leave a message, and we'll do what we can.

### Thanks, this is kind of handy!

Glad it helped you! Drop in and say hi - my Twitter handle is [@L0C4RD](https://twitter.com/l0c4rd). Be well!
