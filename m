Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3967BC4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 10:56:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083F2207FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 10:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lohxnAVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083F2207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAOcdsZLfWn+o9F6vlPBKNI9RFtzUhf5VR6GAlBW+6k=; b=lohxnAVoGHHi39
	PK+qfMiRgkOOoVCW1H/svIMQ/hFG0Rk6sea0xoEP8sjJpgJMba9BThPTXNqzuMmupcOAEPMZs1x7i
	V0cORZw+lBlxdNWhaARvMJWPWVZPMY3wBHTqf0/e/JcFudpegJuAXmF0FzInR4S3/vVceePTZRzHA
	djQS2SERPD4oc8o7l4UJ/piXWWPJ8Ko16vCZ7CwXhdR0OP/tNimvR1w0x3bdTEk6hbSozz0s7hdRW
	wjMtG9mt0JVaFXMHqFVbYfOGOGGFX5TtH0jnnnxXMIXdSWwAK3mXyFf2ZnuKFY4sr5mjm5nmF/tGx
	n8ryjUq4IbpRQeg6SdpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJy1G-0000uJ-I5; Mon, 14 Oct 2019 10:56:06 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJy0M-0007Ij-80; Mon, 14 Oct 2019 10:55:12 +0000
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 14 Oct 2019
 18:55:04 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for
 Meson-A series SoCs
Date: Mon, 14 Oct 2019 18:54:50 +0800
Message-ID: <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_035510_327709_C6AA993A 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson A1 Soc share the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config register
in A1. The main difference is that registers before A1 are grouped by
function while those of A1 are by bank. The new register layout is as
below:

/* first bank */	      /* addr */
- P_PADCTRL_GPIOP_I         base + 0x00 << 2
- P_PADCTRL_GPIOP_O         base + 0x01 << 2
- P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
- P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
- P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
- P_PADCTRL_GPIOP_DS        base + 0x05 << 2

/* second bank */
- P_PADCTRL_GPIOB_I         base + 0x10 << 2
- P_PADCTRL_GPIOB_O         base + 0x11 << 2
- P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
- P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
- P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
- P_PADCTRL_GPIOB_DS        base + 0x15 << 2

Each bank contains at least 6 registers to be configured, if one bank
has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
,0x25 according to above register layout. For previous chips, registers
are grouped according to their functions while registers of A1 are
according to bank.

Current Meson pinctrl driver can cover such change by using base address
of GPIO as that of drive-strength.While simply giving reg_ds = reg_pullen
make wrong value to reg_ds for Socs that do not support drive-strength
like AXG.To make things simple, add an extra dt parser function for
a1 or later chip and remain the old dt parser function for old Socs.

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 16 +++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h |  7 +++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 8bba9d053d9f..e8f6298fc96a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 	return 0;
 }
 
+int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
+				 struct device_node *node)
+{
+	int ret;
+
+	ret = meson_pinctrl_parse_dt(pc, node);
+	pc->reg_ds = pc->reg_pullen;
+
+	return ret;
+}
+
 int meson_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -708,7 +719,10 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->dev = dev;
 	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
 
-	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
+	if (pc->data->parse_dt)
+		ret = pc->data->parse_dt(pc, dev->of_node);
+	else
+		ret = meson_pinctrl_parse_dt(pc, dev->of_node);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index c696f3241a36..0cd6a869cae3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -11,6 +11,8 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+struct meson_pinctrl;
+
 /**
  * struct meson_pmx_group - a pinmux group
  *
@@ -114,6 +116,7 @@ struct meson_pinctrl_data {
 	unsigned int num_banks;
 	const struct pinmux_ops *pmx_ops;
 	void *pmx_data;
+	int (*parse_dt)(struct meson_pinctrl *pc, struct device_node *node);
 };
 
 struct meson_pinctrl {
@@ -171,3 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
 
 /* Common probe function */
 int meson_pinctrl_probe(struct platform_device *pdev);
+
+/* Extra dt parse function for register layout grouped by bank */
+int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
+				 struct device_node *node);
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
