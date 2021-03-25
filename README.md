# Split.spoon

I work on a laptop monitor a lot, and even at my nice setup at my desk I try to keep my main monitor on a single app. One app, one task, single focus.

There is one use case where I'll commonly have two windows open… one to work on, the other for reference. Sometimes it's [Dash.app](https://kapeli.com/dash), some other reference material, or a ticket.

The process usually goes like this.

1. Be me, full screened on my work.
2. Realize I need some reference material.
3. Go find that material, open it up full screen.
4. Flip back and forth (efficiently using [hyper.lua](/articles/2020/06/08/hammerspoon-a-better-better-hyper-key/)!) a few times before realizing that I need them both at the same time.
5. Switch to my work, enter move mode, move it to the left. (`HYPER+m, h`)
6. Switch to my reference, enter move mode, move it to the right. (`HYPER+m, l`)

Realizing just how common this particular use case is, and inspired by how easy it is to split a screen in vim using [fzf.vim](https://github.com/junegunn/fzf.vim), I wrote a function to make my life easier.

Here's what it looks like in action.

<figure>
  <video src="http://evantravers.com/images/articles/2020/06/split.mov"
         controls=controls
         poster="http://evantravers.com/images/articles/2020/06/split.png"></video>
  <figcaption>
    <p>Hitting <code>HYPER+m</code> allows me to enter my window movement modal. It is sort of a leader key... I then hit `v` to enter my split window chooser, then I choose the window I want alongside my "work" window and everything is ready to go!</p>
    <p>It even maintains the focus on my work. I can just keep typing.</p>
  </figcaption>
</figure>

[Original Post](http://evantravers.com/articles/2020/06/12/hammerspoon-handling-windows-and-layouts/#split-screen-easily)
