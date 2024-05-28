Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949A7C27C44
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUMxyQlaRbNr4fm+kNCHnWvdlzQj0bMRKsh3YbudvOM=; b=JeiaqAlq5PByHs
	Ip31PuVqUS7BCzmOqF0ZfRxTJkUhsZDWmkoMkWNCRnblQQJ+WW2YIIWdTfxmUj1scYbMUFk+Gq9Pf
	HAweEV3ZyJKMaqDHg0l3CHlpaal54SP/Ls2h1PJXj6r1xUFJw+2ZX6sCX59N0hBnv1L5LnXB3qW8z
	99bXR9sWyJ9DF5dcB/pyr75mlvnP/JsYYY8OxaYbhQoB64HBWNqzMBM1dsMA5udjGyB/mIQEKPAJI
	id38IFrXQBHvsk6FySb3ZtXw548w43yx7MUg/eUN7aU8AyLmI3PF3kFK7g22EFj3MeNheXjzXQNGD
	6huUnSo+WjSnNJo+WnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMv-0000000HVOA-1mf9;
	Tue, 28 May 2024 08:39:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMp-0000000HVLS-36op;
	Tue, 28 May 2024 08:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4BDDCE1196;
	Tue, 28 May 2024 08:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED52C4AF09;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716885572;
	bh=VixEXuZN/OUSqy2eSZYxrDn1DpDfF97cg6Yk2ft7Kos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c78yXd7CJrMeLJd3mtx29rXEPEEMhocLaIPBkGbR17Mn0IyMTUeg+yu0fautD+aAQ
	 vAEOwkaFnc4d03KiXVkutm9kC3XXmXAHzaRkKkfAuA3hJdesXsEsvtLOdPmeHR49i4
	 LpvnSAddF+h5H7a/vEMGJJUACzHzKjl5yCrCwd6PFBdIpMplSmcWWr7buhZ8cXwzuF
	 PojOnWpRI8tG+etwNLe4exT463RBgH4UiFGdN/AyODAtQws7Ody0JloPP3UAtIQsSV
	 zVzDaYzoAbft7JE+aYORlib2xTv3P9u/+rRMzrBBDhclTJAYuvv3cmcbtZrBixjMnM
	 XGs9cHb7KrQ7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A4FC27C4F;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 May 2024 16:39:29 +0800
Subject: [PATCH 2/3] pmdomain: amlogic: Add support for A4 power domains
 controller
MIME-Version: 1.0
Message-Id: <20240528-a4_secpowerdomain-v1-2-2a9d7df9b128@amlogic.com>
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
In-Reply-To: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885570; l=2569;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=sQe+JwBMkCZfsqfQe37iTq45WTX2B0aYtud4pwYKDcM=;
 b=RVEpNY3eCln5PraEVAxGJTB52ZTa/wiupPq237n3Ai2rXX+7bKSnHgeuc59YoL2mVESl6YaUT
 R0AV89gyPqPDWcfpMVduWbCJfczFVVrFWPLvzhdleELMX0Vd8QdoQ2t
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_013936_172990_5CCEACB3 
X-CRM114-Status: GOOD (  11.82  )
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

Add support for A4 power controller. A4 power control
registers are in secure domain, and should be accessed by SMC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index 4d5bda0d60fc..3a84d8a74a5e 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -14,6 +14,7 @@
 #include <dt-bindings/power/amlogic,c3-pwrc.h>
 #include <dt-bindings/power/meson-s4-power.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
+#include <dt-bindings/power/amlogic,a4-pwrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -136,6 +137,24 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(RSA,	0),
 };
 
+static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
+	SEC_PD(A4_AUDIO,	0),
+	SEC_PD(A4_SDIOA,	0),
+	SEC_PD(A4_EMMC,	0),
+	SEC_PD(A4_USB_COMB,	0),
+	SEC_PD(A4_ETH,		0),
+	SEC_PD(A4_VOUT,		0),
+	SEC_PD(A4_AUDIO_PDM,	0),
+	/* DMC is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(A4_DMC,	GENPD_FLAG_ALWAYS_ON),
+	/* WRAP is secure_top, a lot of modules are included, and should be always on */
+	SEC_PD(A4_SYS_WRAP,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(A4_AO_I2C_S,	0),
+	SEC_PD(A4_AO_UART,	0),
+	/* IR is wake up trigger source, and should be always on */
+	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
+};
+
 static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
 	SEC_PD(C3_NNA,		0),
 	SEC_PD(C3_AUDIO,	0),
@@ -311,6 +330,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
 	.count = ARRAY_SIZE(a1_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
+	.domains = a4_pwrc_domains,
+	.count = ARRAY_SIZE(a4_pwrc_domains),
+};
+
 static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
 	.domains = c3_pwrc_domains,
 	.count = ARRAY_SIZE(c3_pwrc_domains),
@@ -331,6 +355,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-a1-pwrc",
 		.data = &meson_secure_a1_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,a4-pwrc",
+		.data = &amlogic_secure_a4_pwrc_data,
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
