Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE34C25B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d24DAkKU6hJUxb9WcKstwYUKSKmyP1H63j0QSUQxRCI=; b=Pub3O+jaxZNuiq
	Zj4Pj4zdDOZ2Z5jtdG/hK2/wW4FFef7ynhv/Sknb2KyNZYHg3mpxD7dVuFkt1yqS91EIBOHkc59FD
	zHqZNebl0HFN/nIvPU2lpwppIWRjTaNXVWfYuBUnQ2JtwIQvsPaL+7q01MQfhbL0A6dZseEenL5eo
	s3/8xAVTGA04q8ECoRk6bgTxX2JtidswNdk/Gi/zlDaP/nZRz5J0XM2o/Tni4GFn/Q+X1rMfLPiL4
	o8rGwuv4MovA5L5+69KuIKX/d5ipjLe0linychGoXld0T38Q6UBEf0AKN6CMcLzejMiDcheIwBnLr
	OFFPZ4442rR+EGxE6BcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9iH-00000002fFV-1jz8;
	Wed, 29 May 2024 03:10:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i6-00000002f9m-3WpF;
	Wed, 29 May 2024 03:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A591FCE1691;
	Wed, 29 May 2024 03:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96362C4AF07;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716952236;
	bh=uo0PCDDoky5dhGl+bpeCvO6ft78yeRE4RUqFKCEKRSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EBfjnfyREu6VyCSQTdq3JiOWwwrKtS2oIB7s9ggRQWvPBJEpGDP9j+AhRwBX44OU0
	 WVG/EbuYJdNo5lbE7/V8lBJXcBhu/GbMP+eMQF2niaGt0yEAPv/sfvGyfAY3Bc2vIp
	 O4z9stj06m2YxVW9S+X2xsQ/tJObCt4w08ZWlTeKKtcuHilHxs/pNecwwxc9Atsgjd
	 0q0Ndl5lKyyskMEybnhl3hv6EIXa3qv0WDIuMJJF/XXulIWUQAq8/m1EKcwaWfZrEH
	 RO+yxyRIWdSGhosrUTlCY8RnlmivNLZt1UD86/vrHW4Djh2DTbZpnQsEwIM9MiiFJC
	 Zu4ou05JPtW7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DCFC27C4F;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 29 May 2024 11:10:34 +0800
Subject: [PATCH v2 2/3] pmdomain: amlogic: Add support for A4 power domains
 controller
MIME-Version: 1.0
Message-Id: <20240529-a4_secpowerdomain-v2-2-47502fc0eaf3@amlogic.com>
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
In-Reply-To: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716952234; l=2626;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=xHQwoF0xxtI+C2XFx/t3frUsHcsxAgorsw6ZKo8der0=;
 b=mLQ4AfvdscxxLVeNIfgZB2VnyugTUuQbZSysS6LAb0zTrB6XFaWMZjTWc1AJaCsGV4ZfjMElU
 2BkqNjElNNQAPlxrDtG6tIaVTi8PEHVq+JF/CTJ9r4FZFrkaQSt00YX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_201043_335263_95A5B873 
X-CRM114-Status: GOOD (  12.22  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
