Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF9EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 00:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ue23ImT/X0G88sVym72YxaXCiqtw/+iye8Moep2e7pQ=; b=i9kGF/A6h54rqq
	7CGGLSvScEUY79QUSUwiv5dt5X0F4qVo5eGuWI9qYYsE7dApLm6947yXjqCzQplPcON5gtZU4HLQ3
	v+6L3ZuZgoctfh77C+hum3UiE5y7fkP9i7kv5ozwx9egc63btReEiWz7qafsGs8xdLT3rOOMpkIq/
	7bUh9fjL7lbEGAHF1Fnd10BE54jxTVCeyXNLxi10Hi9XRzMo3XsPxS/QKOfEnBaj90FChibRuSZb4
	B9XgiUEOy6T3GYgrRayXhhhsqTGRUgQmw3V7FrF7rtIoT6PapBM0NrT+gUMA6h6O6+j5oednpk/8R
	CAQY1M6iwaFJk6K+sPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTU-0034Lf-2i;
	Fri, 07 Jul 2023 00:37:28 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTP-0034GF-2L;
	Fri, 07 Jul 2023 00:37:24 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 7 Jul 2023
 08:37:09 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 3/4] soc: c3: Add support for power domains controller
Date: Fri, 7 Jul 2023 08:37:09 +0800
Message-ID: <20230707003710.2667989-4-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_173723_767269_EDBC371F 
X-CRM114-Status: UNSURE (   9.84  )
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

Add support for C3 Power controller. C3 power control
registers are in secure domain, and should be accessed by SMC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V1 -> V2: Fixed some formatting.
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index c11d65a3e3d9..a1ffebf70de3 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <dt-bindings/power/meson-a1-power.h>
+#include <dt-bindings/power/amlogic,c3-pwrc.h>
 #include <dt-bindings/power/meson-s4-power.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
@@ -120,6 +121,22 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(RSA,	0),
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
 static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_DOS_HEVC,	0),
 	SEC_PD(S4_DOS_VDEC,	0),
@@ -202,6 +219,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
 	.count = ARRAY_SIZE(a1_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
+	.domains = c3_pwrc_domains,
+	.count = ARRAY_SIZE(c3_pwrc_domains),
+};
+
 static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
 	.domains = s4_pwrc_domains,
 	.count = ARRAY_SIZE(s4_pwrc_domains),
@@ -212,6 +234,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-a1-pwrc",
 		.data = &meson_secure_a1_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,c3-pwrc",
+		.data = &amlogic_secure_c3_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,meson-s4-pwrc",
 		.data = &meson_secure_s4_pwrc_data,
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
