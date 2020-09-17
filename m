Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C2CC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B3A2074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocM1OIZd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HLb2Xfcr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B3A2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bJgJBHPVteJ2FG6lu8KQ0BYI4nUZIcOfJi8Fvn2QeUc=; b=ocM1OIZd6tKCIa12IxiFLw39w
	6BzoHHrk2m6IVfRaV2BZC5BGoUqKz1D1v5fX7kXdE5jNpI6rwPoBZ4QTQ6xGWX8DyTvbQbcG7KVKv
	os3R56AxixHsinjG3rKq16IVU5PaU4c9920eP5J/V1QPUTtLLuw80Du9XfTox/NRT76nqP+QpOTxI
	lQKIbZFWT4mTn41cqEgyDMK8pTtltzOJAyQgO63B2g2tTy/ArLIaolk7c0zFI32DQrDupi5dv3HfY
	bMEHLjYPvktAUAkoMdpvje18wQxaQ1JU8ZsL4/S9f5g+8rvbipmmjunmR8tN88yu75kmkEyLj0n3G
	jqy6jP07w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInhV-0006hc-8O; Thu, 17 Sep 2020 06:47:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInhH-0006cS-7d
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 06:47:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id j2so750703wrx.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 23:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AaSu1mbinkSllUZXWx/vayonkfswFrhIgZlz/kNiwoM=;
 b=HLb2XfcrqdgVlkkiCIQjz6D4LC81XJuj1soLphCAo3h9Yz+/ds0bXv3kAmw4/qBut5
 j2/QsvrEvqvUVdlNdJW8uR66wOoezmqF9++6XpHsYUwIK2LrnVM+1ypC/xpd20BNuARN
 lI2d260WkIICOJFOYY7ksCh6pt9nOYvfQDWliVJDKvsgZfjC1Ng9GwS6lv/8FaK7cuUk
 wU6bs05oOtfvfQeUAQTLKBvGE47AxQGS67skGuMyG6CnZHK8Jn3oFk0xlWPBw9IC9UvT
 i93NQFriBC9YcWMg4fCSDL3oZVnlynpBglGA5OEJUQ4d7AHZPnBohweJza0zpY+A4mW7
 +bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaSu1mbinkSllUZXWx/vayonkfswFrhIgZlz/kNiwoM=;
 b=oPtLjo0lcWYkwW1zgX2cxcB4XDtcVdA3Qnj0pAEA3+HsyiUZxdmvjCv6DbG0JA4ogz
 G83K1aQuRqvMhZL76UZBz9cM9AZuzlUC5mQE6bzJdyoB7h/c6lAMwS1BR1nfvolzVtvZ
 g8N/R15sKF2SRG8fSTL4L1cru6kjY8bbuWniUJYOTXvnDj6KPdnSuu8uFESdHNO8v/mD
 7vloU2SKErIv/5Beb83NRIQrPVrwIjvOHNuDSvba7KBMxezMwQpjYTPto62VndcoH9Rq
 lSqeSw7AKzoErErNsUcWThIPqMQld0Kz2f2RpK2B2r5ihqpehbpAA91YEMETblr9alYB
 f7HA==
X-Gm-Message-State: AOAM531GCB67+2LX8tfRGPoFIgZFVYNV9UvQBHCdBO5qygyXc6P1j0zF
 6IFejcdt6M2rW0I5ZIJyrPjheA==
X-Google-Smtp-Source: ABdhPJxZHZqXAyOL3Q/e1oXYuulul+alwZKOl8EADEz4t0qhsudAKKhYgCPKNirVAHMHZmKIXVnFVA==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr29880151wrr.414.1600325230154; 
 Wed, 16 Sep 2020 23:47:10 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q4sm38516552wru.65.2020.09.16.23.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:47:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/2] soc: amlogic: meson-ee-pwrc: add support for the Meson
 AXG SoCs
Date: Thu, 17 Sep 2020 08:47:02 +0200
Message-Id: <20200917064702.1459-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917064702.1459-1-narmstrong@baylibre.com>
References: <20200917064702.1459-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_024711_315482_EC35089D 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
but with less VPU memory domains to enable and a supplementary Audio
memory power domain.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 43665b77aa9e..9fd97ad02806 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/clk.h>
 #include <dt-bindings/power/meson8-power.h>
+#include <dt-bindings/power/meson-axg-power.h>
 #include <dt-bindings/power/meson-g12a-power.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
 #include <dt-bindings/power/meson-sm1-power.h>
@@ -134,6 +135,11 @@ static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
 	{ __reg, BIT(14) },					\
 	{ __reg, BIT(15) }
 
+static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
+	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
+};
+
 static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
@@ -190,6 +196,10 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(25, 18) },
 };
 
+static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
+	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
+};
+
 static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
@@ -231,6 +241,13 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 
 static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain);
 
+static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
+	[PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
+				     pwrc_ee_get_power, 5, 2),
+	[PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
+	[PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
+};
+
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 11, 2),
@@ -529,6 +546,11 @@ static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
 	.domains = g12a_pwrc_domains,
 };
 
+static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
+	.count = ARRAY_SIZE(axg_pwrc_domains),
+	.domains = axg_pwrc_domains,
+};
+
 static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
 	.count = ARRAY_SIZE(gxbb_pwrc_domains),
 	.domains = gxbb_pwrc_domains,
@@ -562,6 +584,10 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
 		.compatible = "amlogic,meson8m2-pwrc",
 		.data = &meson_ee_m8b_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,meson-axg-pwrc",
+		.data = &meson_ee_axg_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,meson-gxbb-pwrc",
 		.data = &meson_ee_gxbb_pwrc_data,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
