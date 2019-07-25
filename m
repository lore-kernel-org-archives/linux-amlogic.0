Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A504C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D03822C7B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mkiLKy+D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qxL/QDJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D03822C7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KFaAykyqVydL5YxKUKe93JelIZd4tzE9ikZ7S4DDKo=; b=mkiLKy+D37lNll
	faZPkTl99WGezwZiaRrt6/POVUwg8As7aS7abPMjWq/o478TQR0jXOPE9U7VL1sV7a53fKq042eh2
	QBfI8dIZziG33EFd7Ecp3PMSJ4yrmjEyfJBIjiKe01V3wi4vfAS1khQ2ohFl6Pb9f+kuVW9Qum1Uo
	uqQHyaGsSogxEjmyEFR1o9rXybPHoj5vymHZ3Yu2BJJCPQLp0kj2k0YmLnMSDps6A3H4EXYOgKqZU
	iQc8y+PsVjupm/zMzWVBtfSOfPzJQTlN6fbjYf6U7RIOcclhBAfFcXINbTgATNN+o5LMguWOC6D1z
	QrwUvxwciVRhvqwHSyRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqh61-0005Eb-Tg; Thu, 25 Jul 2019 17:00:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqh5v-00059E-Om
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:59:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id c2so48331880wrm.8
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/jrkR4hgpIY3IEk8lJ9coIWHj6BT0CIAMNbTJmR/YI=;
 b=qxL/QDJIp2o63X7xJzs9kR9eme+RY19oKFA3sv/4jACT3uZA7tM5wT5OVmqIkqJew7
 WkqaQHmP0EA4kIgwJ8tyjckEtbj4eRa0Yo1eFaR9a98Vf9UbymNWtQyHOpHsaW0TTHJb
 ko5LcV6CzamQgg2zO1BYZqrsJ1eJySWMDHh+rTl3OKYYhujCq4X/GeadawMabL5g7lKj
 50TQrfD1m5zsXD4TuNxjO+hJrsnkS8RyeHTCyemcFY4KotA8JLsymTHntcp5UXe7zPka
 XHp6dYizSOtMgWuIMfLptctCbjrHIGXCGfEFznNSPNbwxNJxBxzW/h8e7Frm+1OCPiGN
 Uuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/jrkR4hgpIY3IEk8lJ9coIWHj6BT0CIAMNbTJmR/YI=;
 b=Qo+fAPmj5q7R2wOB+YRGlQJPYepR6+7PKQv4z3sRZNBPG8PKQY2yB5/Ide24Rl5pMy
 K7Oeondd0FNvo5DX0uuKNsCOAsWFHorSFzL9t5m3miBHbJMo2YAstHZ3mMxl8nnmd2QW
 9AmmeV+cYgWxH1j9MS0U0a4aiKHr/yXjCLH9ep8KuROA82BSjbtdgvHedEdL6pOs23F1
 pz9GKK1EAN3PUCBnmSn7klySTlDws72HD8cZjJ8YDqeo3D9PWCtaoTTOTQhHh4/uMqxL
 trvxS0NQcRSzJP1i/ZOYMOgfOBD+/cYWmSOrEIDKBC+1YMs8D0jm9E4m/XUO56cLKfiv
 TSdg==
X-Gm-Message-State: APjAAAW5X3QWlYlFlL2WsfqtqWFmlf+wy+RDn1trH8AmH8Uyxwn4BCea
 1kw7CuaOXG+52Rd0Gjm1FncPjA==
X-Google-Smtp-Source: APXvYqzpTVvhh/KLIlDh7egDJKaGFgaz2cliKjsP5Ce7avkqYayCPiWNr+RETi3mzno+aLH8mp+cjQ==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr89216078wrq.319.1564073994390; 
 Thu, 25 Jul 2019 09:59:54 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/6] ASoC: codec2codec: name link using stream direction
Date: Thu, 25 Jul 2019 18:59:45 +0200
Message-Id: <20190725165949.29699-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_095955_801931_40133998 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

At the moment, codec to codec dai link widgets are named after the
cpu dai and the 1st codec valid on the link. This might be confusing
if there is multiple valid codecs on the link for one stream
direction.

Instead, use the dai link name and the stream direction to name the
the dai link widget

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 034b31fd2ecb..7db4abd9a0a5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4056,8 +4056,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 
 static struct snd_soc_dapm_widget *
 snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
-		     struct snd_soc_dapm_widget *source,
-		     struct snd_soc_dapm_widget *sink)
+		     char *id)
 {
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
@@ -4067,7 +4066,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	link_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-%s",
-				   source->name, sink->name);
+				   rtd->dai_link->name, id);
 	if (!link_name)
 		return ERR_PTR(-ENOMEM);
 
@@ -4247,15 +4246,13 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-
 		/* connect BE DAI playback if widgets are valid */
 		codec = codec_dai->playback_widget;
 
 		if (playback_cpu && codec) {
 			if (!playback) {
 				playback = snd_soc_dapm_new_dai(card, rtd,
-								playback_cpu,
-								codec);
+								"playback");
 				if (IS_ERR(playback)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
@@ -4284,8 +4281,7 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 		if (codec && capture_cpu) {
 			if (!capture) {
 				capture = snd_soc_dapm_new_dai(card, rtd,
-							       codec,
-							       capture_cpu);
+							       "capture");
 				if (IS_ERR(capture)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
