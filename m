Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470AEC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:05:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F220E2074D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCiXyUjL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="siFPR6aR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F220E2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aI+fWrRRH0Zqe2wSsafULOgKhj84CV6KHLgMblFCW2Q=; b=XCiXyUjL3C9puYsD0BRj7K5Wx
	Qh9xPGxkx2zAXbMAuKLdQPQHMjiBS9Uf03tIfqB0m7KpBIU1viHb+K4JS0DLq6mbFNEJwJU8q8AXo
	6N2m6J+8EHsji5XI/IaomMdI4aaz9jwlw7f5Ql63pVG2TLrYgc2TU8v5MInwtt4k8oen9y7s1voRg
	bO9KwMZBr0af5w+4DUj1oQXdvAuoYIJq+Kwk2pxkqX2dfXBAi7C/vQHTPV3ADPwkAagcFEARk3qw/
	kNn52rUus5oJdc6IPvtAQ3ci+cACx5lqVh9v6sttg2Yt3ecalE5PsKs5ZffHRw1yMSTjBnx0cZG7L
	VwGNlAxkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEED9-0005Te-4l; Fri, 04 Sep 2020 16:05:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEED4-0005RG-0Q
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:05:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id q9so6552729wmj.2
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTXlpKamjwyTHjWdGVSl8o9My/8vSac7U2q74lShFws=;
 b=siFPR6aRivTG4UwTsmGL9oE+KFJlvZ6Ik0/YOfh1DsNSaTy+zYFSKZozg7FXg45SEu
 ro8fVmQTuJKWq/NvSL1cPI5dD/hi4XV3dQqDk7dw98BIV74+GxybrY/GvsE3FMLRQfvW
 b3XW7lxpFHBVqjOgF6REu6V5843LXZCTeAmjcF/plXLrAqfSt5VBrhV5ln4zCUnunLla
 bO97YfeqoAbfT703K+bt/i3B5w3PZsdKVedVs5wtFT8xEoU5XSuYdE5/bq7b7cKpmfdU
 /7DB/YfJA6iERxJoaAbcgrTinl7iG3bvIat4x0BJO/lLlcB1t164vVuQoPK7ncoUNEsq
 imuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTXlpKamjwyTHjWdGVSl8o9My/8vSac7U2q74lShFws=;
 b=Oh+8vogS3pE3Wc+xqQLLhCSU7x4WqWO75f5T3U6Ju5lj2o3qotJZf0TzV/VO1XZwuV
 23j9Wj9zCPa0ab5tXU1lSks51OLB+wVnAMTusaJGgMa6JGiYocD5RyYHcAh/rfmqPtcZ
 MkzpV3TwH4y38vwlmuDILzWChDkZiNsuyYQJfjGpNMfcYkHFfdtNTA+17/5HuK36iRdh
 aK74hyRdgaAeuS1dBhYccVn22ICtgV1jsiJyd+TpcZzGjZLaCgnZZL6cu1CDkBIOyGIM
 GUnvY5GRMfACXsf8yO0MnwIVbeptHPzkza+pPPAfZGjMCN5aGtsBwiU+apJ3I7nCD915
 CNZA==
X-Gm-Message-State: AOAM530IIvmHHZVwn6AW0qDA+9jYE4AgF3edWg8i/enLdT95K84WWddl
 d3gREsiNuZ8GfJfjLK9cESU/ww==
X-Google-Smtp-Source: ABdhPJxI3136LpiKvLQIjnG0wTFZ8dVizPe7AJBMHTf12fW/qqwn8dx3TZTFNeztkzCDV9ZSTfl78g==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr8363530wmf.93.1599235504887; 
 Fri, 04 Sep 2020 09:05:04 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o9sm12038486wrw.58.2020.09.04.09.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:05:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/2] soc: amlogic: meson-ee-pwrc: add support for the Meson
 AXG SoCs
Date: Fri,  4 Sep 2020 18:05:00 +0200
Message-Id: <20200904160500.22924-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904160500.22924-1-narmstrong@baylibre.com>
References: <20200904160206.22570-1-narmstrong@baylibre.com>
 <20200904160500.22924-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_120506_458463_84743A4F 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
but with less VPU memory domains to enable and a supplementary Audio
memory power domain.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 43665b77aa9e..81834eb166d0 100644
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
@@ -141,6 +142,11 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
+static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
+	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
+};
+
 static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
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
@@ -237,6 +247,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
+static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
+	[PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
+				     pwrc_ee_get_power, 5, 2),
+	[PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
+	[PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
+};
+
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
 	[PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 12, 2),
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
@@ -566,6 +588,10 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-gxbb-pwrc",
 		.data = &meson_ee_gxbb_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,meson-axg-pwrc",
+		.data = &meson_ee_axg_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-pwrc",
 		.data = &meson_ee_g12a_pwrc_data,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
