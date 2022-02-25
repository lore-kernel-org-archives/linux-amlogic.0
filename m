Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B583FC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhSyfAam4uEgXTeO1gQl9LbpGQv+rLKSdOG9yYoAsoM=; b=HSWuTMjwZq0ucG
	2zbEWQAEZbGxOr8vRtMFw6C9dZvcT5Naq+/4hbflqWfLbNiZksEbjQobkSGhwfx9hUdI3lKieAIIB
	U9NsMXecmUpmy1M7M2cw/iAyLJzGKzwKXxE34lY2W9uvPqEoTg/vMfi06G27GDX10eMY8DirnGY+C
	VxcXPaQ6MoQptrUcudyLmH6C4xq40JveWitJLJKuO4FobrBZH3xQoyErM9dYg52z/miOi7f8G15lk
	0iejjyTWSisL/LlLhIPYoIefQ6OituiuRv5Akx0nuWSAxPx0G0fNm5IpVIe8r7XF/ERfXuMTwzRmr
	o2B7r54ytiyRrhF186/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNUMD-003WA1-0N; Fri, 25 Feb 2022 06:45:37 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNULk-003Vxo-AK; Fri, 25 Feb 2022 06:45:09 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 25 Feb 2022
 14:45:05 +0800
From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <narmstrong@baylibre.com>, <khilman@baylibre.com>, <jbrunet@baylibre.com>, 
 <martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>,
 <shunzhou.jiang@amlogic.com>
Subject: [PATCH V4 2/2] soc: s4: Add support for power domains controller
Date: Fri, 25 Feb 2022 14:44:55 +0800
Message-ID: <20220225064455.1369197-3-shunzhou.jiang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225064455.1369197-1-shunzhou.jiang@amlogic.com>
References: <20220225064455.1369197-1-shunzhou.jiang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_224508_374749_81A86532 
X-CRM114-Status: GOOD (  10.34  )
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

Add support s4 Power controller. In s4, power control
registers are in secure domain, and should be accessed by smc.

Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index 59bd195fa9c9..a10a417a87db 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <dt-bindings/power/meson-a1-power.h>
+#include <dt-bindings/power/meson-s4-power.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -119,6 +120,18 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(RSA,	0),
 };
 
+static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
+	SEC_PD(S4_DOS_HEVC,	0),
+	SEC_PD(S4_DOS_VDEC,	0),
+	SEC_PD(S4_VPU_HDMI,	0),
+	SEC_PD(S4_USB_COMB,	0),
+	SEC_PD(S4_GE2D,		0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(S4_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S4_DEMOD,	0),
+	SEC_PD(S4_AUDIO,	0),
+};
+
 static int meson_secure_pwrc_probe(struct platform_device *pdev)
 {
 	int i;
@@ -187,11 +200,20 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
 	.count = ARRAY_SIZE(a1_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
+	.domains = s4_pwrc_domains,
+	.count = ARRAY_SIZE(s4_pwrc_domains),
+};
+
 static const struct of_device_id meson_secure_pwrc_match_table[] = {
 	{
 		.compatible = "amlogic,meson-a1-pwrc",
 		.data = &meson_secure_a1_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,meson-s4-pwrc",
+		.data = &meson_secure_s4_pwrc_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
