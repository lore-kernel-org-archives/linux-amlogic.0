From: linux@armlinux.org.uk (Russell King - ARM Linux)
Date: Thu, 6 Jul 2017 14:38:41 +0100
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
In-Reply-To: <20170706115643.GA24728@n2100.armlinux.org.uk>
References: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
 <20170706110553.GJ4902@n2100.armlinux.org.uk>
 <185aa90b-a1b2-d899-40bb-7d333f584bb5@baylibre.com>
 <20170706114555.GK4902@n2100.armlinux.org.uk>
 <20170706115643.GA24728@n2100.armlinux.org.uk>
Message-ID: <20170706133841.GA28170@n2100.armlinux.org.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 06, 2017 at 12:56:43PM +0100, Russell King - ARM Linux wrote:
> On Thu, Jul 06, 2017 at 12:45:55PM +0100, Russell King - ARM Linux wrote:
> > Well, from what I can see in 4.12, the cec-notifier stuff is rather
> > broken (tda998x has stopped working as its stuck with a physical
> > address of f.f.f.f) so I think the whole thing is rather moot right
> > now.  I don't yet know what's going on with that, other than the
> > notifier stuff seems to not be working, despite being enabled in
> > the .config.
> 
> The problem there appears to be the changes that were made with the
> way the config works - which IMHO are totally broken.
> 
> Let's take this scenario:
> 
> - You have a HDMI bridge, and you build that into the kernel, because you
>   want the display to come up early.
> - You have a CEC driver, which you build as a module.
> 
> If the HDMI bridge driver selects CEC_NOTIFIER and the CEC driver selects
> both CEC_NOTIFIER and CEC_CORE, you end up with CEC_NOTIFIER=y and
> CEC_CORE=m.
> 
> We now come to this:
> 
> #if IS_REACHABLE(CONFIG_CEC_CORE) && IS_ENABLED(CONFIG_CEC_NOTIFIER)
> 
> The definition of IS_REACHABLE() is that it is false if the config symbol
> is selected as a module.  So, in this case, we end up compiling out all
> the CEC notifier functions from the HDMI bridge, and building them into
> the CEC driver.
> 
> The CEC notifier also gets built as a module, meaning that there's no way
> for the built-in HDMI bridge could ever call the notifier.
> 
> The overall result of this is that such a configuration completely breaks
> such a setup - a setup that worked fine before the CEC Kconfig changes.
> 
> This isn't limited to tda998x - I'd expect the same to be true of dw-hdmi.

Fixing this so cec-notifier is built-in isn't sufficient, because we
also need the cec-edid parsing code as well, which is currently part
of cec-core, and that function gets stubbed out if cec-core is not
built-in...

The patch below works for me.

 drivers/media/Makefile       | 2 +-
 drivers/media/cec/Makefile   | 6 +++---
 drivers/media/cec/cec-core.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 044503aa8801..0c02fbe4b9c7 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_DVB_CORE)  += dvb-core/
 # There are both core and drivers at RC subtree - merge before drivers
 obj-y += rc/
 
-obj-$(CONFIG_CEC_CORE) += cec/
+obj-y += cec/
 
 #
 # Finally, merge the drivers that require the core
diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
index eaf408e64669..58394b77a328 100644
--- a/drivers/media/cec/Makefile
+++ b/drivers/media/cec/Makefile
@@ -1,7 +1,7 @@
 cec-objs := cec-core.o cec-adap.o cec-api.o cec-edid.o
 
-ifeq ($(CONFIG_CEC_NOTIFIER),y)
-  cec-objs += cec-notifier.o
-endif
+obj-$(CONFIG_CEC_NOTIFIER) += cec-notifier.o cec-edid.o
+# Remove cec-edid from cec-core if the notifier is enabled
+cec-objs := $(filter-out $(obj-y) $(obj-m), $(cec-objs))
 
 obj-$(CONFIG_CEC_CORE) += cec.o
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index 2f87748ba4fc..bce26b94c348 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -187,7 +187,7 @@ static void cec_devnode_unregister(struct cec_devnode *devnode)
 	put_device(&devnode->dev);
 }
 
-#ifdef CONFIG_CEC_NOTIFIER
+#if IS_ENABLED(CONFIG_CEC_NOTIFIER)
 static void cec_cec_notify(struct cec_adapter *adap, u16 pa)
 {
 	cec_s_phys_addr(adap, pa, false);


-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
