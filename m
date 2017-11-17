From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 23:35:42 +0100
Subject: [RFC v1 7/8] Bluetooth: hci_serdev: remove the HCI_UART_INIT_PENDING
 check
In-Reply-To: <20171117223543.32429-1-martin.blumenstingl@googlemail.com>
References: <20171117223543.32429-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117223543.32429-8-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The three-wire (H5) protocol is the only protocol which uses
HCI_UART_INIT_PENDING.
Unfortunately the protocol implementation never receives data with this
check still in place. For the H5 protocol this means that the
initialization never completes and thus the firmware download never
starts. Even if the initialization would succeed later on the drivers
would call hci_uart_init_ready() which schedules the registration which
is currently not implemented by hci_serdev.c.

Removing the HCI_UART_INIT_PENDING check makes the code easier to read
and also fixes the initalization of devices (implemented with the serdev
library) which use the H5 protocol.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/bluetooth/hci_serdev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index e0e6461b9200..fe67eb6d4278 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -333,9 +333,6 @@ int hci_uart_register_device(struct hci_uart *hu,
 	else
 		hdev->dev_type = HCI_PRIMARY;
 
-	if (test_bit(HCI_UART_INIT_PENDING, &hu->hdev_flags))
-		return 0;
-
 	if (hci_register_dev(hdev) < 0) {
 		BT_ERR("Can't register HCI device");
 		err = -ENODEV;
-- 
2.15.0
