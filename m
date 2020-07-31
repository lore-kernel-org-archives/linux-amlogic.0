Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F30CC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 12:06:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE47020663
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 12:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/iRXuG1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mbO9Ho2w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE47020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5YlhiTKOp+nv99KePi7qvnj23OSmJnolC3bU1+UsyRY=; b=A/iRXuG1incRZ0K2ZcCSlXBw59
	DfaB6FiOaRHNTVBOkwFtdkWZ6MxoD6ZgqyQV5gUMzisSJco8DWxK1ouHO8LIlIsqhaNs6F4df2RsN
	IUzaG0v2CMMbitHIBu/o9s/gUS+APhP5IQaiNJS+1SbOGqyBH/eTehIroyQEY0QYGeqs7rQiV3Ufe
	TR87TK3O8Yg/WyiI1mRE/Oi06bQl5Rc4JPZPGwUOgj06t9TXeebG6d41DreAgTT9fAgBpSKMde9j1
	Cteyg75aYnTB5mMDoW62gl+/LZPMarfEgb7najT3/+SfFvWVK6SgAgXR4wCrIjS3jZsdJE1c0HrFv
	Zt5doQ6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Tnj-0002E5-UN; Fri, 31 Jul 2020 12:06:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Tng-0002DL-Jq
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 12:06:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id 9so8327185wmj.5
 for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2020 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPGbKdWpP4J/auHhQU9i6g+5dqKdyKhc2qV2F7IdWpw=;
 b=mbO9Ho2whEsjgCbIV1QWsFLUK2smi52qT7wWaKiW87L26VYF+z85RR6d4vFtQK4cLG
 aSVCGMxewoVtU32g0OBkWB1/uTt6ws+Jcj0zjKJg1cSz26Kl0NedCWAwx6l2I45fGQMB
 HpzupOvHluciFnutq5bdGPaIif0FrBawHZQZ/plVzeHiJygqe9zNxIbYLmj5yufRoBhb
 iDADif1cXGMb981LyLn70QSAar4rIG7O/6hHjtP1jgMcSZfdVXZ5MFhz6Y0elhl8S4QG
 PrkAuR0sOjA827BBKqfj/TGF5Iw15t+iawU9sqv7/VuVoSKfXEPyW0+hqoO8nG+m8M6H
 1v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPGbKdWpP4J/auHhQU9i6g+5dqKdyKhc2qV2F7IdWpw=;
 b=q6VedwUSIKY7V2d8swOLEiM7DG76NAmLkg8uzWgg0a8EYpRjoY3C0NY8T9jXkSio+G
 SWqJ+bHj8wX+gx2oMDQJBkFvxWgtNgtM+Q9GgBnUpp99PDK2c7/r28jL59HMgQL/AakV
 OBIZLQeDEr4Qva3nG2TVK+3RBnidDMqyv0mB30BB/qN6w+D6pV1/5TEpmTDlx8lSdMbY
 w17WZfaa+AnQ9n+Lvu4crW68BwXA2lPFRdv3JplSwArWU4LwmSbyNUme2yVNImrotwkF
 dtjaww1saWxeU89lsarFNUuV3YyQJPaVwgt/2nFERpokeSYypAviYEoQ8EHggcDavI4w
 irIw==
X-Gm-Message-State: AOAM5327XLvshgRJsAZ0JNammgfHJZ7eA8yCgBWNm8Av+M9MHxWBzQZ0
 2IcVN+1QQYzogAPHxm5d2AhO7A==
X-Google-Smtp-Source: ABdhPJykW4KqeQYC9r3oDy7vW1cPW/jfK2qRpSTFF8xJ+gqC4QgmMJ93gKPbRy305pn2zd/hqHZuCw==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr3855492wmc.49.1596197171510; 
 Fri, 31 Jul 2020 05:06:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c135sm5438017wmd.31.2020.07.31.05.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:06:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: cards: deal dpcm flag change
Date: Fri, 31 Jul 2020 14:06:03 +0200
Message-Id: <20200731120603.2243261-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_080612_779673_69F3480F 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, zhangn1985@outlook.com,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
changed the meaning of dpcm_playback/dpcm_capture and now requires the
CPU DAI BE to aligned with those flags.

This broke all Amlogic cards with uni-directional backends (All gx and
most axg cards).

While I'm still confused as to how this change is an improvement, those
cards can't remain broken forever. Hopefully, next time an API change is
done like that, all the users will be updated as part of the change, and
not left to fend for themselves.

Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 For the cards be actually fixed, change 'ASoC: core: use less strict tests for dailink capabilities'
 will need to merged as well. snd_soc_dai_link_set_capabilities() as
 implemented in 25612477d20b5 ('ASoC: soc-dai: set dai_link dpcm_ flags with a helper')
 does not support link with multiple codec with different direction
 capabilities. This quite a common case on these cards.

 sound/soc/meson/axg-card.c         | 18 ++++++++++--------
 sound/soc/meson/gx-card.c          | 18 +++++++++---------
 sound/soc/meson/meson-card-utils.c |  4 ----
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 5176be165210..2b77010c2c5c 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -327,20 +327,22 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
-		ret = meson_card_set_fe_link(card, dai_link, np, true);
+		return meson_card_set_fe_link(card, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
-		ret = meson_card_set_fe_link(card, dai_link, np, false);
-	else
-		ret = meson_card_set_be_link(card, dai_link, np);
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
+
+	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
-	if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
-		ret = axg_card_parse_tdm(card, np, index);
-	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
+	if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
 		dai_link->params = &codec_params;
-		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	} else {
+		dai_link->no_pcm = 1;
+		snd_soc_dai_link_set_capabilities(dai_link);
+		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
+			ret = axg_card_parse_tdm(card, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 6da8535f4dd2..5119434a81c4 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -96,21 +96,21 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		ret = meson_card_set_fe_link(card, dai_link, np, true);
-	else
-		ret = meson_card_set_be_link(card, dai_link, np);
+		return  meson_card_set_fe_link(card, dai_link, np, true);
 
+	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
-	/* Check if the cpu is the i2s encoder and parse i2s data */
-	if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
-		ret = gx_card_parse_i2s(card, np, index);
-
 	/* Or apply codec to codec params if necessary */
-	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
 		dai_link->params = &codec_params;
-		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	} else {
+		dai_link->no_pcm = 1;
+		snd_soc_dai_link_set_capabilities(dai_link);
+		/* Check if the cpu is the i2s encoder and parse i2s data */
+		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+			ret = gx_card_parse_i2s(card, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f9ce03f3921f..6a64ac01b5ca 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -147,10 +147,6 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 	struct device_node *np;
 	int ret, num_codecs;
 
-	link->no_pcm = 1;
-	link->dpcm_playback = 1;
-	link->dpcm_capture = 1;
-
 	num_codecs = of_get_child_count(node);
 	if (!num_codecs) {
 		dev_err(card->dev, "be link %s has no codec\n",
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
