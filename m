Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63BCC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FE22053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pyDgUbp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zLTcc+Hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FE22053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d4i+xPvv6bnU+WfZiRpdaS/etkB2WYcwldWkjJX0V08=; b=pyDgUbp7DF3Vanzsy2KP3w3LX
	bKOhNR0IOaNUXmCtIqh/Lma2CrRSXJMNvwo+Tk8QBHszM4lTROHeyIcJvqqn8HXbm+qIG0ESKxR8R
	JbFH3NTl7C8VJ8YgdQbRhKs2pq+duMZZn3YR4YM1qpXjjmRPTV4rddr2q7ovD0vFvNDVOs4qdThOy
	ZwQKROX+6HYgWb5n1I1arB1hpOEOssIM4b8R0tm3SUXVsPd87E0VW50zb4HEHCg+Gk2EYxv4wnErB
	ITeDK2Anwgq6V0i2NWzS5iwM8FK0slUtTmiUh3urIQHHCBD5RFqKS9v4H7zGmAKBKXqqSrjQ+8//D
	ElglRMzCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oGc-00035Q-Bi; Wed, 29 Jul 2020 15:45:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oGZ-00033x-8f
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:45:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id d190so3140089wmd.4
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFwWixal6bg6/yGBUeckQ8zNlylY1ZjbXYs/S0fdtuA=;
 b=zLTcc+HfVBRchrfIBW1jERIX0biVz9CZS/q5ReBKow+W3caoKQqKObHjtFUrUxj8c2
 xwYDvY0erPB/k5HObfYjFrjWXFf3xIgp4skpvwEhKdnWD4pvRG7mDcnMK7xXY/RLg0Q5
 K3K/UK7XjR0RwzpWZzGemhvur36OTxJZSTaGEacmgrpybzO0SQ/H6ly4coZCWfDqL1sZ
 iHGvPEtY37h0owml1JyQD2FxV5jkGh0MmFPmTNXfE4WbzYS1dLMIXDwJKQCTg/f+TeuA
 y4Za0NejtucqFd8pW6sexE2gwHte8Ksk4JOt6dmVBKrfIrlntfUV9npxZnOlQHsExRRY
 xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFwWixal6bg6/yGBUeckQ8zNlylY1ZjbXYs/S0fdtuA=;
 b=skexZokMLwN4Y6JhRD36GC7bqG7QAvL64s7CoCELr2F0b7c+NMgGsx/3pBVvEgX8Da
 2J+ifzAZYa6hd27IAq4acHcLmjnJGPYEhEWgRsVATdYKCzRQJpPd99v5nyTdORbogLx7
 rXgZIrJgr36x27FUPF0O9GYr9un1SNtVHoYdbU1fAuNGnm6gb1N17QzZxmu3Q+oX/FOX
 3I/n5t+ipo1V90kCq8eBFHWnYL9p3F1MOn9vHzCC0Ny2+YemaNkbuMvJocmUcx3AXIgV
 +WsaV+s87w73zTuOfJKEG50lV0vcRE4VCWqdAUR13Wt8NlF/kslKAAuSpD6CgmhhnoDB
 KIOg==
X-Gm-Message-State: AOAM531B5/JyqEacSxEPvknVQkJlsBNL3O3aY5h5RsUpzqXkLOxmqcla
 DZZYXEhnlpmow2gHh3kV2BKjvQ==
X-Google-Smtp-Source: ABdhPJy0qqcwBITavP16MW6ffF+xI8XGXN/tI7XsE9Z0703/iHSoM2qsfi/fgn4gRUXAFwua0XmGDg==
X-Received: by 2002:a1c:9914:: with SMTP id b20mr9098844wme.15.1596037514079; 
 Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/4] ASoC: meson: axg-tdm-interface: fix link fmt setup
Date: Wed, 29 Jul 2020 17:44:53 +0200
Message-Id: <20200729154456.1983396-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114515_313011_E089D6F9 
X-CRM114-Status: GOOD (  14.61  )
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

The .set_fmt() callback of the axg tdm interface incorrectly
test the content of SND_SOC_DAIFMT_MASTER_MASK as if it was a
bitfield, which it is not.

Implement the test correctly.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 6de27238e9df..36df30915378 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -119,18 +119,25 @@ static int axg_tdm_iface_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
 
-	/* These modes are not supported */
-	if (fmt & (SND_SOC_DAIFMT_CBS_CFM | SND_SOC_DAIFMT_CBM_CFS)) {
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		if (!iface->mclk) {
+			dev_err(dai->dev, "cpu clock master: mclk missing\n");
+			return -ENODEV;
+		}
+		break;
+
+	case SND_SOC_DAIFMT_CBM_CFM:
+		break;
+
+	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBM_CFS:
 		dev_err(dai->dev, "only CBS_CFS and CBM_CFM are supported\n");
+		/* Fall-through */
+	default:
 		return -EINVAL;
 	}
 
-	/* If the TDM interface is the clock master, it requires mclk */
-	if (!iface->mclk && (fmt & SND_SOC_DAIFMT_CBS_CFS)) {
-		dev_err(dai->dev, "cpu clock master: mclk missing\n");
-		return -ENODEV;
-	}
-
 	iface->fmt = fmt;
 	return 0;
 }
@@ -319,7 +326,8 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	if (iface->fmt & SND_SOC_DAIFMT_CBS_CFS) {
+	if ((iface->fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
+	    SND_SOC_DAIFMT_CBS_CFS) {
 		ret = axg_tdm_iface_set_sclk(dai, params);
 		if (ret)
 			return ret;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
