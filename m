Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD66C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1392075B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pyDsb/EY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F8plumSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1392075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EcO6x6zSMFH18mgDLrIdDLJweh9UmARxRxVr2+5+hns=; b=pyDsb/EYYhg+NlMkBowurRoZHj
	64Tu3psaLHkWNkxX4Kcs/xe429EvVYh4Ob09yKIvgReW5eJhLdt5cg+dfDRU/wU8s2IyQv9rn+Xot
	6el60wFGbtCz/bukLKlxGjHHLrdmxJQ+at7Rs00qzJY7xqYnwCbexL8s/zc7tzJmb5QLuMOd9rr3Q
	JryyH8nq8YnN/78tOAV0jD/A/KnbNF1nIG82IqKI6hWmpG57HEPWJ7dSAuH5pJqESbB77DQdz7hc2
	SQ/UjVz7SqIzWd6O7xvATZpRY+8gQJ866XFqcuuAU57XVgVcyRocz+WZOCGgEzL2JWLWPWmM3BevG
	tfgv/eyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBg5d-00016i-Qv; Fri, 28 Aug 2020 15:14:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBg5b-00016G-Jw
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 15:14:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id k20so1232255wmi.5
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XO7ADdhJqpOQN7r6IzL9NHcOCfqqL0xalqP8Zr9AVw=;
 b=F8plumSakJirsH7lNu+Hn/G7X19AHjzTM5ONVDRwW97YDaWp3eg5szWB9CGtJhU1Vl
 xDFBvsnLlFHfbRlyNJtUC4tBi4s/mV1k4Rb02oFIBor+rPQeL/cg6t4Cew5Gn5mWJpIE
 Vt9KWC3iVYvkuyvrFRynD11z7LAMVPS+NI9tnBG14HFtnOHW6LVuCYnX33VWdWOsXr5e
 qFu28wlsnB7Y9L5unZLg6f+471jLdM9fe5jHwFkhnxxvaPAzYGZRjDgNUWQ6qtm+iBJt
 x/eqVD/jlV7ybQwhqzNXBTd6BUWYCR8zG7Co5wjqsfBCECYSt9kbIJ4zzWAjtCSaqkcb
 kGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XO7ADdhJqpOQN7r6IzL9NHcOCfqqL0xalqP8Zr9AVw=;
 b=pC53tS/eaKexAZ9gbSPNkEh4s7FKZUaXQbm6Qm3iUTDmeCAOYuvda9lXyB6+DLI1+R
 sDK/M2kTNrleye7oK5jK3+/oKo1OJDvaFuZNqNEskINm4gYYeql58iiyC80R6Q4I4t/f
 EI9Y73hhL9eXTixVaKHXl16/1HBVPHe5w/5NoYOUHQf2GIlVJiXtbKFy5e3pp5cgCF6o
 icT+E3Me+uh8tYf5SLlh2WA1Fa9nviR/TNf65Ee8FbqQcfRDcYstrDhtQpXCjj7ydQe7
 zKcy7ISTndtQqre42pOO68+rkoffdczfPLOlzRx5ZWAJWWnPitmiZKYI9sSQ3FrNEAcm
 RIOw==
X-Gm-Message-State: AOAM5327T6ODsU3nLeepdfOY5WdhSB6tkKiZBBtd2uN7QxsO2hSaq91N
 GkLnyxEv6pSwaydPfz1v7+sM+g==
X-Google-Smtp-Source: ABdhPJxjB6+c5w8aI5zAeGsZDGu6H+RsO/PecnVXHIa5KCb0j3pXBs/KW6K15lIti3aH81H18eacBw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr2039022wmc.156.1598627690389; 
 Fri, 28 Aug 2020 08:14:50 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b8sm2877677wmh.48.2020.08.28.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:14:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-toddr: fix channel order on g12 platforms
Date: Fri, 28 Aug 2020 17:14:38 +0200
Message-Id: <20200828151438.350974-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_111451_781460_9010A7E3 
X-CRM114-Status: GOOD (  17.03  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On g12 and following platforms, The first channel of record with more than
2 channels ends being placed randomly on an even channel of the output.

On these SoCs, a bit was added to force the first channel to be placed at
the beginning of the output. Apparently the behavior if the bit is not set
is not easily predictable. According to the documentation, this bit is not
present on the axg series.

Set the bit on g12 and fix the problem.

Fixes: a3c23a8ad4dc ("ASoC: meson: axg-toddr: add g12a support")
Reported-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-toddr.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index e711abcf8c12..d6adf7edea41 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -18,6 +18,7 @@
 #define CTRL0_TODDR_SEL_RESAMPLE	BIT(30)
 #define CTRL0_TODDR_EXT_SIGNED		BIT(29)
 #define CTRL0_TODDR_PP_MODE		BIT(28)
+#define CTRL0_TODDR_SYNC_CH		BIT(27)
 #define CTRL0_TODDR_TYPE_MASK		GENMASK(15, 13)
 #define CTRL0_TODDR_TYPE(x)		((x) << 13)
 #define CTRL0_TODDR_MSB_POS_MASK	GENMASK(12, 8)
@@ -189,10 +190,31 @@ static const struct axg_fifo_match_data axg_toddr_match_data = {
 	.dai_drv		= &axg_toddr_dai_drv
 };
 
+static int g12a_toddr_dai_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = axg_toddr_dai_startup(substream, dai);
+	if (ret)
+		return ret;
+
+	/*
+	 * Make sure the first channel ends up in the at beginning of the output
+	 * As weird as it looks, without this the first channel may be misplaced
+	 * in memory, with a random shift of 2 channels.
+	 */
+	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_TODDR_SYNC_CH,
+			   CTRL0_TODDR_SYNC_CH);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops g12a_toddr_ops = {
 	.prepare	= g12a_toddr_dai_prepare,
 	.hw_params	= axg_toddr_dai_hw_params,
-	.startup	= axg_toddr_dai_startup,
+	.startup	= g12a_toddr_dai_startup,
 	.shutdown	= axg_toddr_dai_shutdown,
 };
 
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
