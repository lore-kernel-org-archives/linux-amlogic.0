From: sean@mess.org (Sean Young)
Date: Sun,  8 Apr 2018 22:19:41 +0100
Subject: [PATCH v2 6/7] media: rc: mce_kbd decoder: fix stuck keys
In-Reply-To: <cover.1523221902.git.sean@mess.org>
References: <cover.1523221902.git.sean@mess.org>
Message-ID: <6e04a64c9be3f571f4927f0ffada67be5071db88.1523221902.git.sean@mess.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The MCE Remote sends a 0 scancode when keys are released. If this is not
received or decoded, then keys can get "stuck"; the keyup event is not
sent since the input_sync() is missing from the timeout handler.

Cc: stable at vger.kernel.org
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-mce_kbd-decoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index dcdba83290d2..a6adf54461e9 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -130,6 +130,8 @@ static void mce_kbd_rx_timeout(struct timer_list *t)
 
 	for (i = 0; i < MCIR2_MASK_KEYS_START; i++)
 		input_report_key(raw->mce_kbd.idev, kbd_keycodes[i], 0);
+
+	input_sync(raw->mce_kbd.idev);
 }
 
 static enum mce_kbd_mode mce_kbd_mode(struct mce_kbd_dec *data)
-- 
2.14.3
