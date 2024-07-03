Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C448C2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xbLAVUBqhTzH6cT/AlwVSz5c94lLhWn74rL5xyLprss=; b=ri5RKBuMTZGKeS
	g9wg9DZODHVmgyFPj4/O9MI6uT1DWclr46ERxEzKzfFHwWRTffDPf+b6zan/SVXVqaeGWUr3SG7nu
	1yRf5mbX5jD8snu5TJduqbpKN+hjdQVa8xrnvZ8TDzjDL/KVPTB03ZP3AeolUWapyznvLfeDTS6lC
	D6PFAC94Jci0m02HF/ZfcCSPzpk19RyonNVbYP7TUFQ+h512hR5Kfd8Vo4tkYhjXcO1/26oqKqiRD
	egdI4gJHmT+Gh2R3Z3TDPYFoExDXu+VpnZJiZ971AKUsFHDD/1v2xxiNqVEFf5WK5YiHbyiEkAa2m
	m19NpcWy7Nb7rpVAXSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwSJ-00000009aMN-3Yab;
	Wed, 03 Jul 2024 09:39:15 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwSG-00000009aL4-3d4T;
	Wed, 03 Jul 2024 09:39:13 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 3 Jul 2024
 17:39:00 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH] media: rc: meson-ir: support PM suspend/resume
Date: Wed, 3 Jul 2024 17:38:58 +0800
Message-ID: <20240703093858.12655-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_023912_928830_44D00FE8 
X-CRM114-Status: GOOD (  10.66  )
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

IR Controller could be used and updated by other processor
while kernel has been suspended.
Reinitialize IR Controller just in case while kernel is resuming.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 5303e6da5809..9cdb45821ecc 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,6 +567,32 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
+static __maybe_unused int meson_ir_resume(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+
+	if (ir->param->support_hw_decoder)
+		meson_ir_hw_decoder_init(ir->rc, &ir->rc->enabled_protocols);
+	else
+		meson_ir_sw_decoder_init(ir->rc);
+
+	return 0;
+}
+
+static __maybe_unused int meson_ir_suspend(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ir->lock, flags);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	spin_unlock_irqrestore(&ir->lock, flags);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
 	.max_register = IR_DEC_REG1,
@@ -607,6 +633,7 @@ static struct platform_driver meson_ir_driver = {
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_ir_match,
+		.pm = pm_ptr(&meson_ir_pm_ops),
 	},
 };
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
