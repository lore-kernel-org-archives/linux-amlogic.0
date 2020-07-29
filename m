Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E199DC433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D762053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrkrPzmp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WWZhs4ML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D762053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sgEr9WMNqSA1bTH+CABFjVO3LWSOd4UgQY04/tRH5lI=; b=lrkrPzmpXe4CfTFyfzJKnRZfK
	CUxc9VU91Uzerrl+k/dAdtxXkPfiQzeizbsakK4nk080TEXQRtLVJ09P0b9VeU5sxr2mAChnauJqW
	1U+f0kelGX2/RiFvlRtRtLeNWeYvhJIcYhN1DHZQTMNsagv9Hoblgb1ahGABzMPyuuO6sOiNWid/i
	jF7Ra/2RwRMSOc2R50f8YDmAtgbtT4O0Ez3+Sj5nvbThxp3ixm+JS6NSeBDs0+W3OF4P8U4YJx6Xb
	7QgGXB2BOObzx6QWlC9pNiyfFGv3718jFuCmGqP75otC4axNgZK0iUiU1jn3cqPQ94Zi+uw8vuH5B
	PzcFsJiqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oGf-00037L-7v; Wed, 29 Jul 2020 15:45:21 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oGc-00035A-7F
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:45:19 +0000
Received: by mail-wm1-x343.google.com with SMTP id k8so3450936wma.2
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4N4tDfzOiQqATdi2Zol4rwsnSDbJ8cgT+uEdMs1E22o=;
 b=WWZhs4MLKcUYxBMvUVTtWl0OAPx5neW6I3yi2mxSSN5FUCj+m2aiudakBjm5Zyn49G
 qNoZzgivw+l/W6yq8djsxGTazCCcggn8Pdw1nVPO/SxKY53BIYC8rJ37jQ6oVHIFn9bj
 TDE/IMadGdIEd6FW0+Uwn11oO/Wt7jiYKgY1uaAnpifIqkVnE+paKfydATCD8pnB1t8H
 RMPrl8/PzhHRDQVdgqTHRLIwQ0auujdmd+dX2focKFZz9yigqXmKMHqD8pW9euBmr4h9
 l2TOcSdKUsvE2xOj9nfWpk0IyMTwrJVcgBAyrVcS3yeK80UKf8oHd2oQg9BgVPf5Gep3
 qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4N4tDfzOiQqATdi2Zol4rwsnSDbJ8cgT+uEdMs1E22o=;
 b=KWl8cTKJauszZn3soz9h/DVYtAfZ3aYyPp135xnMAroZv1a6rayotMcfr0+4MrSGkN
 QQPbSDrTO7PqDHME2DLYPXM07Nmtmia6E/SSyag1vOVZdJweN+hZ5cHU01Pod1VkYGe5
 Z7vGlmP0KDY8vIa7DOQvPO01fdL4EcYciPwWj9vC4QhXig1EX54AFAP9SbLG0mKazBBf
 NE07ZEuIOxZY2Z7dSgtjx0fwnZyf2spM9LAGA3yEiPPT/k6fuky9SFteHdA9bYmtsrvI
 PBIhycl47Fi9aUa6HoE9lh8geUr0YCT8WdVBC+GqINFKdp9WNFXc+bHYUVflgkLxSIfq
 cyBg==
X-Gm-Message-State: AOAM530IBLQUIbO1ayLINt9hIAn5KmTRXqgps8ZYk/yjiWe6o1cwbInt
 nmaW4jqpwiv+dr8nk9XoCrZNmg==
X-Google-Smtp-Source: ABdhPJxDdW0mOc4UD1kq9GZvvkv4pRetXTg0qhqbn32pV9vNmdYnY++BBuAjJwZ83bppWNUoVHSA5g==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6152075wmj.92.1596037516141; 
 Wed, 29 Jul 2020 08:45:16 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: meson: axg-tdm-formatters: fix sclk inversion
Date: Wed, 29 Jul 2020 17:44:55 +0200
Message-Id: <20200729154456.1983396-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114518_324044_5CF1DE5A 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

After carefully checking, it appears that both tdmout and tdmin require the
rising edge of the sclk they get to be synchronized with the frame sync
event (which should be a rising edge of lrclk).

TDMIN was improperly set before this patch. Remove the sclk_invert quirk
which is no longer needed and fix the sclk phase.

Fixes: 1a11d88f499c ("ASoC: meson: add tdm formatter base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 11 ++++++-----
 sound/soc/meson/axg-tdm-formatter.h |  1 -
 sound/soc/meson/axg-tdmin.c         |  2 --
 sound/soc/meson/axg-tdmout.c        |  3 ---
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 358c8c0d861c..f7e8e9da68a0 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -70,7 +70,7 @@ EXPORT_SYMBOL_GPL(axg_tdm_formatter_set_channel_masks);
 static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
-	bool invert = formatter->drv->quirks->invert_sclk;
+	bool invert;
 	int ret;
 
 	/* Do nothing if the formatter is already enabled */
@@ -96,11 +96,12 @@ static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 		return ret;
 
 	/*
-	 * If sclk is inverted, invert it back and provide the inversion
-	 * required by the formatter
+	 * If sclk is inverted, it means the bit should latched on the
+	 * rising edge which is what our HW expects. If not, we need to
+	 * invert it before the formatter.
 	 */
-	invert ^= axg_tdm_sclk_invert(ts->iface->fmt);
-	ret = clk_set_phase(formatter->sclk, invert ? 180 : 0);
+	invert = axg_tdm_sclk_invert(ts->iface->fmt);
+	ret = clk_set_phase(formatter->sclk, invert ? 0 : 180);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-tdm-formatter.h b/sound/soc/meson/axg-tdm-formatter.h
index 9ef98e955cb2..a1f0dcc0ff13 100644
--- a/sound/soc/meson/axg-tdm-formatter.h
+++ b/sound/soc/meson/axg-tdm-formatter.h
@@ -16,7 +16,6 @@ struct snd_kcontrol;
 
 struct axg_tdm_formatter_hw {
 	unsigned int skew_offset;
-	bool invert_sclk;
 };
 
 struct axg_tdm_formatter_ops {
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 3d002b4eb939..88ed95ae886b 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -228,7 +228,6 @@ static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk	= false,
 		.skew_offset	= 2,
 	},
 };
@@ -238,7 +237,6 @@ static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk	= false,
 		.skew_offset	= 3,
 	},
 };
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 418ec314b37d..3ceabddae629 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -238,7 +238,6 @@ static const struct axg_tdm_formatter_driver axg_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 1,
 	},
 };
@@ -248,7 +247,6 @@ static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 2,
 	},
 };
@@ -309,7 +307,6 @@ static const struct axg_tdm_formatter_driver sm1_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 2,
 	},
 };
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
