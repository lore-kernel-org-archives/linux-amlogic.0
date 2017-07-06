From: linux@armlinux.org.uk (Russell King - ARM Linux)
Date: Thu, 6 Jul 2017 13:50:25 +0100
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
In-Reply-To: <dc03b967-9d59-48c2-3365-0dc54ba4a891@baylibre.com>
References: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
 <20170706110553.GJ4902@n2100.armlinux.org.uk>
 <185aa90b-a1b2-d899-40bb-7d333f584bb5@baylibre.com>
 <20170706114555.GK4902@n2100.armlinux.org.uk>
 <dc03b967-9d59-48c2-3365-0dc54ba4a891@baylibre.com>
Message-ID: <20170706125025.GL4902@n2100.armlinux.org.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 06, 2017 at 01:55:58PM +0200, Neil Armstrong wrote:
> On 07/06/2017 01:45 PM, Russell King - ARM Linux wrote:
> > Well, from what I can see in 4.12, the cec-notifier stuff is rather
> > broken (tda998x has stopped working as its stuck with a physical
> > address of f.f.f.f) so I think the whole thing is rather moot right
> > now.  I don't yet know what's going on with that, other than the
> > notifier stuff seems to not be working, despite being enabled in
> > the .config.
> > 
> 
> Indeed, I missed some parts of the thread, sorry for the confusion.
> 
> Anyway, is it a showstopper to have this patch merged separately ?

It shouldn't be provided it makes _this_ merge window or the -rc
following, but it doesn't really comprise a "fix" in that the feature
never worked in the previous kernel (and we are supposed to have the
rule that features are merged prior to the merge window.)

It's up to the maintainers to decide what to do at this point.

> If you prefer re-posting a serie with this patch inside, no problem,
> but the Amlogic platform still needs this patch to have CEC working.

I suspect (because I've not seen what has been queued to be merged yet)
that even the dw-hdmi "native" side will be similarly broken - unless
Hans merged some other changes to make it work.

So, I suggest we all sit tight and wait until what was merged appears
in Linus' tree.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
