Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22C8C7EE23
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yybQg3mKjCFRBTGu9JsKIB3Vm3Db/6QXgDna+NH2kac=; b=gcbDoZuNPHr/yq
	cb+hdcet/+OB6FInIGWBqaghiFXeM+rs7xpjJNuzd1kJ4nkqIzLc1fgVRbMRXVf3EfOp8Ce7nuCwd
	HHjP/zxGJlV3jvGEImdpeY9RDfWxfwZ2KSzBUb9t/jFYAapKLj1jvoPvui4mnmLgvlvl6SYP8RoWC
	hPP4e5o5IAypbqblcJmhpAKvZXxURluYiMfJVb1impxHfozpQlpgZjYH9qc0LsUlvVRqsWZC1eu3L
	3C4uN9Gx2SgDeW7DfEaExI6sawmHmsq92b+hyAczsr+fhNYfGrxMZKPemJj9JLXrTlmFjOvazy5/Z
	39r3RIDfD4j19Rth6w9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtF-003J0x-00;
	Thu, 01 Jun 2023 11:54:49 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtC-003Iyj-1J
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Jun 2023 11:54:47 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 1 Jun 2023
 19:53:58 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v3 1/3] media: rc: meson-ir: sort Meson IR Controller register macros
Date: Thu, 1 Jun 2023 19:54:31 +0800
Message-ID: <20230601115433.21809-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601115433.21809-1-zelong.dong@amlogic.com>
References: <20230601115433.21809-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_045446_440568_7B1C8ED8 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

There are more registers to come in the next Meson IR Controller.
For defining clearly, sort register macros and let address and bit
macros as a set.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 49aa309d1a8c..6d77a8c33dc1 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -19,44 +19,35 @@
 
 #define DRIVER_NAME		"meson-ir"
 
-/* valid on all Meson platforms */
 #define IR_DEC_LDR_ACTIVE	0x00
 #define IR_DEC_LDR_IDLE		0x04
 #define IR_DEC_LDR_REPEAT	0x08
 #define IR_DEC_BIT_0		0x0c
 #define IR_DEC_REG0		0x10
+#define REG0_RATE_MASK		GENMASK(11, 0)
 #define IR_DEC_FRAME		0x14
 #define IR_DEC_STATUS		0x18
+#define STATUS_IR_DEC_IN	BIT(8)
 #define IR_DEC_REG1		0x1c
-/* only available on Meson 8b and newer */
-#define IR_DEC_REG2		0x20
-
-#define REG0_RATE_MASK		GENMASK(11, 0)
-
-#define DECODE_MODE_NEC		0x0
-#define DECODE_MODE_RAW		0x2
-
-/* Meson 6b uses REG1 to configure the mode */
+#define REG1_TIME_IV_MASK	GENMASK(28, 16)
+#define REG1_ENABLE		BIT(15)
 #define REG1_MODE_MASK		GENMASK(8, 7)
 #define REG1_MODE_SHIFT		7
-
-/* Meson 8b / GXBB use REG2 to configure the mode */
+#define REG1_IRQSEL_MASK	GENMASK(3, 2)
+#define REG1_RESET		BIT(0)
+/* The following regs are only available on Meson 8b and newer */
+#define IR_DEC_REG2		0x20
 #define REG2_MODE_MASK		GENMASK(3, 0)
 #define REG2_MODE_SHIFT		0
 
-#define REG1_TIME_IV_MASK	GENMASK(28, 16)
+#define DECODE_MODE_NEC		0x0
+#define DECODE_MODE_RAW		0x2
 
-#define REG1_IRQSEL_MASK	GENMASK(3, 2)
 #define REG1_IRQSEL_NEC_MODE	0
 #define REG1_IRQSEL_RISE_FALL	1
 #define REG1_IRQSEL_FALL	2
 #define REG1_IRQSEL_RISE	3
 
-#define REG1_RESET		BIT(0)
-#define REG1_ENABLE		BIT(15)
-
-#define STATUS_IR_DEC_IN	BIT(8)
-
 #define MESON_TRATE		10	/* us */
 
 struct meson_ir {
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
