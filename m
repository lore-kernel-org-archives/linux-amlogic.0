Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5121EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1+OeVrmgEo7XvZs3eXapHAE3CWp6zTdbwmCCGVPRiQ=; b=uLL2K6LpZVdqBx
	cM7HlWrfy2xqVckIkDKZ7spiXwAwyTN1JMfAEzeb1E7/CVReQ04/hm6x+VDFdoU9GLYcC0t9+0XXS
	yqRfW1b2bi4faDcwC0/uDPK2Af4ZRSMdXE3308bLrGX14A9ejZc37aNZwwG5qaEVgvBWZNEXy5pcF
	fJRlaQGjpsqYe8i/r6PQthjEK1rG5ILcHcvygrMCbRaskpb6UWj3v+6A6FfNlrIuaXkNhHkDDTJrl
	Ah2iYRu3iwrN86XY+mfNVCcid2RBd9M6s3oxFQHZtnCQxBdhMah0NiJWx2b/37LLKnRixNMKi9aZG
	S3pFr9TETvkHwNZqHnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFui-009wW0-0C;
	Mon, 03 Jul 2023 09:32:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFue-009wSH-23;
	Mon, 03 Jul 2023 09:32:05 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 3 Jul 2023
 17:32:01 +0800
From: =Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 2/3] soc: c3: Add support for power domains controller
Date: Mon, 3 Jul 2023 17:31:41 +0800
Message-ID: <20230703093142.2028500-3-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_023204_675634_62F43B7F 
X-CRM114-Status: GOOD (  13.25  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add support for C3 Power controller. C3 power control
registers are in secure domain, and should be accessed by SMC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 28 ++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index 25b4b71df9b8..39ccc8f2e630 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -12,6 +12,7 @@
 #include <linux/pm_domain.h>
 #include <dt-bindings/power/meson-a1-power.h>
 #include <dt-bindings/power/meson-s4-power.h>
+#include <dt-bindings/power/amlogic-c3-power.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -132,6 +133,22 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_AUDIO,	0),
 };
 
+static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
+	SEC_PD(C3_NNA,	0),
+	SEC_PD(C3_AUDIO,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_SDIOA,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_EMMC,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_USB_COMB, GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_SDCARD,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_ETH,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_GE2D,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_CVE,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_GDC_WRAP,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_ISP_TOP,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_MIPI_ISP_WRAP, GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(C3_VCODEC,	0),
+};
+
 static int meson_secure_pwrc_probe(struct platform_device *pdev)
 {
 	int i;
@@ -179,7 +196,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 	for (i = 0 ; i < match->count ; ++i) {
 		struct meson_secure_pwrc_domain *dom = &pwrc->domains[i];
 
-		if (!match->domains[i].index)
+		if (!match->domains[i].name)
 			continue;
 
 		dom->pwrc = pwrc;
@@ -207,6 +224,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
 	.count = ARRAY_SIZE(s4_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
+	.domains = c3_pwrc_domains,
+	.count = ARRAY_SIZE(c3_pwrc_domains),
+};
+
 static const struct of_device_id meson_secure_pwrc_match_table[] = {
 	{
 		.compatible = "amlogic,meson-a1-pwrc",
@@ -216,6 +238,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-s4-pwrc",
 		.data = &meson_secure_s4_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,c3-pwrc",
+		.data = &amlogic_secure_c3_pwrc_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
