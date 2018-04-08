From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  8 Apr 2018 23:27:41 +0200
Subject: [PATCH usb v5 4/6] usb: core: phy: make it a no-op if
 CONFIG_GENERIC_PHY is disabled
In-Reply-To: <20180408212743.22934-1-martin.blumenstingl@googlemail.com>
References: <20180408212743.22934-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180408212743.22934-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

If the generic PHY support is disabled the stub of devm_of_phy_get_by_index
returns ENOSYS. This corner case isn't handled properly by
usb_phy_roothub_add_phy and at least breaks USB support on Raspberry Pi
(bcm2835_defconfig):

    dwc2 20980000.usb: dwc2_hcd_init() FAILED, returning -38
    dwc2: probe of 20980000.usb failed with error -38

Let usb_phy_roothub_alloc() return in case CONFIG_GENERIC_PHY is
disabled to fix this issue (compilers might even be smart enough to
optimize away most of the code within usb_phy_roothub_alloc and
usb_phy_roothub_add_phy if CONFIG_GENERIC_PHY is disabled). All
existing usb_phy_roothub_* functions are already NULL-safe, so no
special handling is required there.

Fixes: 07dbff0ddbd8 ("usb: core: add a wrapper for the USB PHYs on the HCD")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/core/phy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index a39d9bb26a4f..9879767452a2 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -50,6 +50,9 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 	struct usb_phy_roothub *phy_roothub;
 	int i, num_phys, err;
 
+	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
+		return NULL;
+
 	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
 					      "#phy-cells");
 	if (num_phys <= 0)
-- 
2.17.0
