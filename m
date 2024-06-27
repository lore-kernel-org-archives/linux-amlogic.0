Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7185FC2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9b9p2//OrMinwQH0W1TpZy7hPJqgOSpHlkUY8Osmn18=; b=2GgnHe0Kt3wPPa
	Pndq1oftEkOzYI4/muV4mKW22DsLjPHsTke+nhR4W8TWXWk6E2Rm4xXBue0GS0znTBv08jnKxZZf4
	WVA6jvTN7SQKmkTLsEDJ2rn+MWSJBhZqIbYCFE/4oPROhK18QZdc/slXSONv+GFsW0sBhY7Owzta4
	/8osBpHNkuPxz1EUCEpqrsNEoB1Pzyr6aey2jFbZhF0O+rtvMKoSEDo0K2vNlRufqqJw7gMzJgW0y
	zU63NhY523eH5V8ZDZmvj4Mhg3Uc2BkR9Mda5TEr89NbflNzDalyxGf01HhEzozfd3pW/uC02LR1z
	Sa9SJ/Yj6AB2I370aXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMncF-0000000ADE0-1cxi;
	Thu, 27 Jun 2024 11:48:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnba-0000000AD24-12Hr;
	Thu, 27 Jun 2024 11:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CE43CE2E47;
	Thu, 27 Jun 2024 11:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33546C32786;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719488875;
	bh=lpXzYkzUB9eFRCkMDQeOFIvUniE98WzHWrrhrNYqR4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IdtOQfOuJhAvYLJcKkItpR2JNUMnu8FvdlDaqtG+BmnlDs85bh0jDHBIjeh/qk/IH
	 ugMPXtt3jccb6nsSBr9pcAh+vVc3OnfTY0MGNA0/yoIOZxTs2bDSSLFwgAdWuxHaKk
	 3rclwG+s9QSMAZgZDeiMX4k8Cyr7WzOIsIG/R8gUKrQU0by1riqPBlFMo6WJZ7T06W
	 9Cvu8W8A0PxigiyVYldkFNHsbC/AKcZU7zdx4RCLiOOCXNCNrNkswyD4e251NsZuI0
	 Gj6JN7jrg9H9IybEGEshUZKoGZTX7QOp57YEzq7YeJdU+OUvIj947b1ZDgL/izGWZM
	 AYBMtjvo5kHUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216DEC30659;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Jun 2024 19:47:52 +0800
Subject: [PATCH 2/3] pmdomain: amlogic: Add support for A5 power domains
 controller
MIME-Version: 1.0
Message-Id: <20240627-a5_secpower-v1-2-1f47dde1270c@amlogic.com>
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
In-Reply-To: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Hongyu Chen <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719488872; l=2530;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=zWxLtelNKu19heqKs9wOyiplUpI+DyeIV7xOkfT+HwI=;
 b=Q2fjW+FoiPk3SlMyEGT1KOBPCDtlv+iKtLDF1wDDMNTEdR1UsHTAvXROY6xZNm5ch7gAtubOt
 ARKBdI22iOlC0SFpCvBkVGmqTg5pB0id21KF/i0mvBc3B9PmbWAxM+p
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_044758_706445_43CF2A28 
X-CRM114-Status: GOOD (  11.95  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add support for the A5 power controller, whose registers are
in the secure domain and should be accessed via SMC.

Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index df5567418226..f6729eea6b8c 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -15,6 +15,7 @@
 #include <dt-bindings/power/meson-s4-power.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -155,6 +156,22 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
 	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
 };
 
+static struct meson_secure_pwrc_domain_desc a5_pwrc_domains[] = {
+	SEC_PD(A5_NNA,		0),
+	SEC_PD(A5_AUDIO,	0),
+	SEC_PD(A5_SDIOA,	0),
+	SEC_PD(A5_EMMC,		0),
+	SEC_PD(A5_USB_COMB,	0),
+	SEC_PD(A5_ETH,		0),
+	SEC_PD(A5_RSA,		0),
+	SEC_PD(A5_AUDIO_PDM,	0),
+	/* DMC is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(A5_DMC,		GENPD_FLAG_ALWAYS_ON),
+	/* WRAP is secure_top, a lot of modules are included, and should be always on */
+	SEC_PD(A5_SYS_WRAP,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(A5_DSPA,		0),
+};
+
 static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
 	SEC_PD(C3_NNA,		0),
 	SEC_PD(C3_AUDIO,	0),
@@ -335,6 +352,11 @@ static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
 	.count = ARRAY_SIZE(a4_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
+	.domains = a5_pwrc_domains,
+	.count = ARRAY_SIZE(a5_pwrc_domains),
+};
+
 static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
 	.domains = c3_pwrc_domains,
 	.count = ARRAY_SIZE(c3_pwrc_domains),
@@ -359,6 +381,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,a4-pwrc",
 		.data = &amlogic_secure_a4_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,a5-pwrc",
+		.data = &amlogic_secure_a5_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,c3-pwrc",
 		.data = &amlogic_secure_c3_pwrc_data,

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
