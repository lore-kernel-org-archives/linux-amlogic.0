From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 23:35:37 +0100
Subject: [RFC v1 2/8] Bluetooth: btrtl: add MODULE_FIRMWARE declarations
In-Reply-To: <20171117223543.32429-1-martin.blumenstingl@googlemail.com>
References: <20171117223543.32429-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117223543.32429-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This makes the firmware names show up in modinfo.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/bluetooth/btrtl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 6e2ad748abba..3e5296287808 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -477,3 +477,12 @@ MODULE_AUTHOR("Daniel Drake <drake@endlessm.com>");
 MODULE_DESCRIPTION("Bluetooth support for Realtek devices ver " VERSION);
 MODULE_VERSION(VERSION);
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("rtl_bt/rtl8723a_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8723b_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8723b_config.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8761a_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8761a_config.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8821a_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8821a_config.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8822b_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8822b_config.bin");
-- 
2.15.0
