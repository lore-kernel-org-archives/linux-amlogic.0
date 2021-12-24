Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579BBC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rxncOgwJn48zZYbqFXEvg7AqYf5102HZgGkA/D/s0GQ=; b=fd8KwQPY7KoQK7
	7qomDm1SiZ4VKuqls9AyIpU2luYjq1QhMPbb2mFY5bMVMkAPobixWxKPSMDi6R0/mgDhfvjt5ZPRZ
	ncy2Yk5BxQxc82XRvvUpABc4iCbw3j0P8FwLeUeMpnM99cyU3EMOZiZ4WDPGud4XSoQHvI24+RrrM
	hD+TvraawhbmP/zLGZ+OByPN9JqemsYNewmB/AFESmV+X2jfJ1Icb2u2a7NFHX2xVIad7aVZkbha2
	Xx5qGJLnp+20VN7U6Qc7N5pW0TRLCd82A5IMvbvfqxvoAcQh3F+HkQomxbpdndkY9i2TomVQWdHRz
	MgUpSBO7kapNWlu/VWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0euF-00DqLv-Dj; Fri, 24 Dec 2021 07:22:23 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0eu4-00DqKf-HU; Fri, 24 Dec 2021 07:22:13 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 24 Dec 2021
 15:22:09 +0800
From: Shunzhou.Jiang <shunzhou.jiang@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <narmstrong@baylibre.com>, <khilman@baylibre.com>, <jbrunet@baylibre.com>, 
 <martin.blumenstingl@googlemail.com>, <shunzhou.jiang@amlogic.com>
Subject: [PATCH] soc: s4: Add support for power domains controller
Date: Fri, 24 Dec 2021 15:22:07 +0800
Message-ID: <20211224072207.2521367-1-shunzhou.jiang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_232212_604803_E5D2AE71 
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

Add support s4 Power controller. In s4, power control
registers are in secure domain, and should be accessed by smc.

Signed-off-by: Shunzhou.Jiang <shunzhou.jiang@amlogic.com>
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index 59bd195fa9c9..8fee01aabab6 100644
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
@@ -119,6 +120,17 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(RSA,	0),
 };
 
+static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
+	SEC_PD(S4_DOS_HEVC,	0),
+	SEC_PD(S4_DOS_VDEC,	0),
+	SEC_PD(S4_VPU_HDMI,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S4_USB_COMB,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S4_GE2D,		0),
+	SEC_PD(S4_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S4_DEMOD,	0),
+	SEC_PD(S4_AUDIO,	0),
+};
+
 static int meson_secure_pwrc_probe(struct platform_device *pdev)
 {
 	int i;
@@ -187,11 +199,20 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
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
