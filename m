From: linux@armlinux.org.uk (Russell King - ARM Linux)
Date: Thu, 6 Jul 2017 12:56:43 +0100
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
In-Reply-To: <20170706114555.GK4902@n2100.armlinux.org.uk>
References: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
 <20170706110553.GJ4902@n2100.armlinux.org.uk>
 <185aa90b-a1b2-d899-40bb-7d333f584bb5@baylibre.com>
 <20170706114555.GK4902@n2100.armlinux.org.uk>
Message-ID: <20170706115643.GA24728@n2100.armlinux.org.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 06, 2017 at 12:45:55PM +0100, Russell King - ARM Linux wrote:
> Well, from what I can see in 4.12, the cec-notifier stuff is rather
> broken (tda998x has stopped working as its stuck with a physical
> address of f.f.f.f) so I think the whole thing is rather moot right
> now.  I don't yet know what's going on with that, other than the
> notifier stuff seems to not be working, despite being enabled in
> the .config.

The problem there appears to be the changes that were made with the
way the config works - which IMHO are totally broken.

Let's take this scenario:

- You have a HDMI bridge, and you build that into the kernel, because you
  want the display to come up early.
- You have a CEC driver, which you build as a module.

If the HDMI bridge driver selects CEC_NOTIFIER and the CEC driver selects
both CEC_NOTIFIER and CEC_CORE, you end up with CEC_NOTIFIER=y and
CEC_CORE=m.

We now come to this:

#if IS_REACHABLE(CONFIG_CEC_CORE) && IS_ENABLED(CONFIG_CEC_NOTIFIER)

The definition of IS_REACHABLE() is that it is false if the config symbol
is selected as a module.  So, in this case, we end up compiling out all
the CEC notifier functions from the HDMI bridge, and building them into
the CEC driver.

The CEC notifier also gets built as a module, meaning that there's no way
for the built-in HDMI bridge could ever call the notifier.

The overall result of this is that such a configuration completely breaks
such a setup - a setup that worked fine before the CEC Kconfig changes.

This isn't limited to tda998x - I'd expect the same to be true of dw-hdmi.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
