Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E57C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRLnQrvYfLrOEGqhs5Of0j/nbcxKPgSs8trYGnLNAOI=; b=uz9ROtVsympkDa
	mgXkR+a7B8HKk4iegXbCvtFsTtZpQOw4FecNTaeQ7RIZKIk7wBFA5TXCeVnDelr6RBJUDnYTUef+0
	nquQ5nMRPBz6W8Xj/XeBayo/o9uHcyDuqa/nrRog/E+7+5mi6JNc/0uMGsjdh0mgZqs7c77DHATEP
	OJAiPR1ZVxD7qemszfLplke/Y9w4fRYwYfbcYSSx75kXpJezHVzL+TA0NimzaCriCC6uekr/9hLkn
	wswq3TSWjpSCEGkV6GD29flJ9Ap6e21GVgVyqnzaDJjcJ2RA/yBPUQIwawJqB6n4WOdqXt1OdAA2e
	BDcKLAFAb6SE9tPJ5+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZBV-00E8FJ-8Q; Thu, 21 Apr 2022 15:57:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZBT-00E8ED-DJ
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 15:57:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id b19so7291313wrh.11
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0Xr29KwZXsM1RSTvbGVQLKdFlm6gLr6JsvZ9omdm1g=;
 b=Hr7mGBNybXCXwQwcy2LhZMdh/KpBSQgzb45nO28fqdIb6vNwaGHZPto4AqwTiu36U7
 1J2H0Cy3CB0P4pTBdwieJdyBcv8KveCl9drrDLRiGm4BlVARbKLHJW/hnop9cbcN9I90
 EV5xQyDgi4Z8kbFDOjkHK67bStZIAzJ+QmzlgzdXGURjmqUy2J54hMne6Klj01BitVe1
 bx92ejZJKC2cswFvPxZFkteZOeEVIbqyfasj3U3pvxTyRoZniputX4dbzF2PiqgIPwv4
 Wkz+RJJq2OMylno4iVKeRVvwDTKo4U9zMIyUfsT1lfUkqCnm7E8bIGShTC/eAnKcDC2w
 GCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0Xr29KwZXsM1RSTvbGVQLKdFlm6gLr6JsvZ9omdm1g=;
 b=wprqt3c5ehFxhDLJk33lSL7fPaB4vP99geNeNqAna7eBWJVs8YbcxVelAaQkZj+ZDA
 zpxJCpiNrl5675BgsNPnS5Ijhuq17bq73VXjI4qdrwl4OGiyqMuqP1q5o7xjS8kLng5E
 HgtY5Kq8/NAaMG+rlsAdmk4KKDNf36m6hGUFdLuNb83yGOLXvmY8RjfvIdDKx3uacPOL
 j5fFKLtpOVphQelJgcymh5sNW7EXS7MlZRvgTvS70LRgHkDmLN13aCWXzIZn5JXt2+4z
 +6G3Tb9vOtmShrQr6/cGH5Ey5TnbNCGaOJIpJ6faU59syn3dGq9gHAKL4QvrXgONWRfJ
 otww==
X-Gm-Message-State: AOAM5304mz7kyBq6YkcGr0xMIO/qXjQQm5O89epX8Rh3QiZO7a+JrCdR
 CkXpCl4fOT0bBhbQXjMRytctCA==
X-Google-Smtp-Source: ABdhPJx7vw1kRWMEjCJYzAEdaiwrgrOvmaqPUNeDkFIzBjyf49b6SsrkX7g8rEkQbjTibXRCOHMuJg==
X-Received: by 2002:adf:efc6:0:b0:207:b89b:232b with SMTP id
 i6-20020adfefc6000000b00207b89b232bmr280197wrp.403.1650556650106; 
 Thu, 21 Apr 2022 08:57:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm2623140wrm.87.2022.04.21.08.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:57:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dmitry Shmidt <dimitrysh@google.com>
Subject: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage formatters
 in trigger"
Date: Thu, 21 Apr 2022 17:57:24 +0200
Message-Id: <20220421155725.2589089-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_085731_469436_93E0E06C 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
causes the following system crash when using audio:
 BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282

Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 0c31934a9630..e076ced30025 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -351,29 +351,13 @@ static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
-				 int cmd,
+static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts =
-		snd_soc_dai_get_dma_data(dai, substream);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		axg_tdm_stream_start(ts);
-		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	case SNDRV_PCM_TRIGGER_STOP:
-		axg_tdm_stream_stop(ts);
-		break;
-	default:
-		return -EINVAL;
-	}
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 
-	return 0;
+	/* Force all attached formatters to update */
+	return axg_tdm_stream_reset(ts);
 }
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
@@ -413,8 +397,8 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
+	.prepare	= axg_tdm_iface_prepare,
 	.hw_free	= axg_tdm_iface_hw_free,
-	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
