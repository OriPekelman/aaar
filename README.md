# [NOT MAINTAINED] Which is real funny :)


#Aaar!
## Adoption Agency for Abandoned Repos

TL;DR

* Put a badge on a github page saying if the repo is maintained or not. 
* If there is a maintained fork and the original fork is no longer active give a link to the maintained fork.
* Help maintainers be better ones, with less pressure, allow maintainers to suggest they want someone to take  over.
* Poneys, Squirrels, Pirates, Babies and very cute cats.

##Rational

This is basically around creating a "foundation style" governenship model for smaller projects, but without the hassle and the politics. Put it in a box, as a service, lightweight, fun, only around decision making and transparency, not the discussions, they will happen somewhere else. Going AAAR is taking a pledge either to maintain or to do whatever is possible to help others maintain a project.

This is both for the casual OS contributor, that released a thing, but finds it hard to get into the move. The company that sponsors a project, then changes priorities. Or for Yehuda Katz and Steve Klabnik that simple have too much on their plate. Transferring maintainership can simply be the proof of the susccess of a project. It can now live on.  So this is about adoption, but also about parent counselling. 

But most importantly this is about the end-user, the developer, that wants to know how well a project is maintained, this takes out some of the steam from the last serious FUD elements againts OS. Just tell me. I might still use it if it is not maintained. I might even choose to maintain it myself. But tell me.

## Thoughts 

* Take the shame/pressure out - it is always a good thing to contribute, but we are not angels, our time is not infinite
* We start with github support only - but you should be able to abandon towards somewhere else
 * We will need to talk to the github guys about API usage limits. If ever this takes off we might easily explode the quota.
* Remember, some (important) repos on github are just mirrors
* Some people have just so much Karma, that if you decide to go AAAR you also accept they can take over your project, for a time, forever. You can always "opt-out" by just removing the badge. Again this is about a strong signal to the larger community.
* Forks (real ones) and Merges (real ones) are an important thing. It is time we had again clear semantics on this: this is a fork, that is going to be maintained as such. Might get merged back, or not.
* Make this a bit Tamagochi

##Getting started

Basically nothing to see yet. But you can:

First install MongoDB

```git clone git@github.com:OriPekelman/aaar.git```

```cd aaar ```

```bundle install ```

```cp config/devise.example.rb config/devise.rb ```

Create a github application, edit config/devise.rb  and put in your credentials

```rails s``` 

and visit http://localhost:3000


##Specs / Todo
1. Prioritize (Now, what is the MVP for this thing? what are the minimal metrics + minimal action items + Do I start with a Rails thing and refactor to async workers, or from the get go decouple everything, it will make it easier to conribute custom metrics etc..)
1. Operationnal model / Licensing for AAAR itself (so on MVP we need at least a self referncing badge !) - I would probably want this GPL without copyright assignement
1. Privacy, privacy, privacy
1. Security, security, security
1. UX, UX, UX
1. Design

##Web site:
1. Design a logo - Baby pirates on poneys or something like that
1. oAuth connect to github account
1. Configure notifications
  1. frequency (don't be spammy, but give a nice weekly/monthly recap)
  1. reward type (random, cat, squirrel, poney, Babies etc...). 
1. See charts / metrics:
  1. Redzone - project is used, maintainrship down. Propose actions:
    1. Explain low scores
    1. Propose action items
      1. Close issues / respond / accept or refuse pull request / write a TODO, add a LICENSE
      1. Offer to abandon - and seek new maintainer
        1. With confirmation / Without (vote of co-maintainers etc.. )
        1. Explain that passing maintainership is more then click. Is there a google group? A website? You need to give everything. (we need to give kudos for those that abandon and who have found a new maintainer)
      1. Seek co-maintainer
      1. Aaar clear and simple
      1. Promise to get better - We should follow up on this, like for probation for new maintainers
      1. Cry for help (email notify / twitter ping people that have already contributed? you need help)
  1. Greenzone - poneys!
    1. The children have grown up, time for them to move on.
  1. Gray zone (project is widely used, not a lot of issues humm drumm)
1. We can also tweet from an official account and give kudos to people doing a great job. This should probably also be on the non-logged in home page.
1. Be able to express on a new project how much of a long-term thing you think this is going to be.

##Workers
1. recuperate all user repos
  1. sort to origins and forks
  1. mark forks with push rights to origin
  1. mark forks with accepted pull requests

1. Extract simple metrics
  1. stars, followers, commits, issues

1. Extract extra metrics
  1. Wiki 1/0
  1. Wiki Activity (number of commits? Delta +/- lines)
  1. Get activity from NPM, from Rubygems ...
  1. Get scores from travis, codeclimate, CVEs?
  1. New mainainters are on probation - specific badges, honours, maintainership can default back to original.
  1. Is there a LICENSE file
  1. Is there a CONTRIBUTE file (does it talk about copyright assignement?)
  1. Is there a ROADMAP /TODO file?
  1. Is there a CHANGELOG
  1. Is it using Semver?


##Visitor Workers

1. Create time series for every data point: `data_point:[{date=>date, value=>value}]`
2. Create score for different dimensions: Activity / Maintainership
3. Create notification

##Badge

Two types of badges, codeclimate/travis style + badgy badges (coderwall)

1. Generate images - activity level / maintainership level - We can have multiple badges, generate a single image
1. Generate link(s) 
  1. to AbandonBadge (This project is no longer maintained, and is seeking a new maintainer / This repo is maintained by a god expect reaction times in the ms domain for pull requests.... etc / This repo needs more co-maintainers, there so much work... )
  1. to "maintained" repo (the author of the project has transferred maintainership to..  click here for maintained fork)

##API

Basically all of the data is going to come from somewhere else; It would be cool to keep hypermedia links to the original authority of the data.

We need only expose the specifics here: Decisions users made on maintainership.

<div id="disqus_thread"></div><script type="text/javascript">var disqus_shortname = 'aaaar'; (function() {var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);})();</script><noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript><a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
