Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B847BC25B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2024 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOSPTv52ZQ+lKcnxZBv6iHvbE870WVnMXck5DpYWqf0=; b=zBZzEeA6A+224P
	nFqna3Bhd55dWq52/UypIEhA3TKqNMBug00/uT86mg8ub0EHyadkNFFoX+Y+gI2CFslwNEBS8cSHV
	ytAUSnvxkiSKDTsxKNFIK75KRlv3MNNVtGTPb/FUplPDKF7wX60iBkuKymX04Kb4CLC8olhTUrGl0
	HEzdWRryzu93hjPJPWsynF5MO3kRejnj/IoHrPpi+W7Myk2xO05dnPnaCfD3IY5T4UUbaOKgsL1Ie
	OqFsSg1gUXHWiGnUh2TciQWxOZNwwK0yfHXWPSORt5c+o+9QGR9O6pBAZSdytzyA7F46VFTYDfrs9
	mTQxd2psl7X5Ww8B9cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tBp-0000000GBuW-0Dvl;
	Tue, 14 May 2024 14:31:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tBl-0000000GBsq-1Bk9
	for linux-amlogic@lists.infradead.org;
	Tue, 14 May 2024 14:31:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34d8d11a523so3588570f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2024 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715697086; x=1716301886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln4czWjw11QmRtGLij7AUk0r+XUH7GvNjZu/Euwwgag=;
        b=cB7u7bjx9FAIDHe/07CI1YuYChoRxCx2oZo6+IztPhvA58KY+OuKFAwKV3YeNX/3+A
         tyXqOWRcFnb/cTRy1lWwWNaPyc8Fa/jpT32Fw+VSdJrO74RYST9dP3QpcAsWXXzLkhLW
         NPq3DVbTrk3+L1yLOIhMqP9YWE3xzSTyViKBCSVD/F3qmxQmJc8FNMNrne3k1BlfxgnQ
         69Y1klQ+1p3mROw+lCmQw+PZmgEwzbm8Oj9Ywr0I9z1yBvbTatmx5j7lgZsncSUlVnj/
         ghFNwyP7EYeaQwXwQQT/nKVKdfIYCN1avh64gackBGWjeITpAlyTBaxlNz5/z9SX/P+Y
         LFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697086; x=1716301886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln4czWjw11QmRtGLij7AUk0r+XUH7GvNjZu/Euwwgag=;
        b=XsEvobrIoCEodw6TQ5PYkzlri42S4dI64UhXYD72KDOK4+9DqeH1MJ+hAy6+RmOBJn
         Kiz95rYcQWe/lEdO+40yZsPoYp1CiWhUXGg3I3fJFYTEyE/kWnagC44wh4SeVdnnjrZ9
         D6OLYWFtKSkXifRXhAj+gF8X6TV1PvtNgDyh3bIf+g5jlcdsWg38k8KosMGrs4z/dEil
         HqIGvx422pQd8m/m9ZK+voX/I1a4mdl07C77k+4M47Iwsj+1Gau3Krsf2ECYG8s0bdId
         SQDKz7ZcLtecGx8g+ox5QuKmBD8tkkKeLK+i5KjZdC9RHtAKVwRsLmcc6+WigH6uUOBB
         vUWg==
X-Forwarded-Encrypted: i=1; AJvYcCXv2zRO7P6dd+Hp2AGPXv35oH4owiHxa9cj0ULa5wzEnAQiTIUNCHHnzh8DXAK0XT/C00YTFTN8fIrSn+CxMsXzZcNkf/R6rPVHAkOtyJIy1IU=
X-Gm-Message-State: AOJu0Yx59n/Fr/cNnMMx31YJfht+3ICVLo0FeIjQR9Lj1o7vAsMVWjLE
	pCV6BvlwWCgIyy12DAyVp8GCMYebwtoYXSkDcJCHqe9ShNz+G61gloIn/YcsH34=
X-Google-Smtp-Source: AGHT+IEMwg+hLrvXY8E1TdPRRYJF6yX+6J61OrtJvgZefi9YUEoDxzUYDJl8/OrpwBDQbxRW36oP3g==
X-Received: by 2002:adf:fa0f:0:b0:34d:1b8c:1afb with SMTP id ffacd0b85a97d-3504a736b48mr7803454f8f.24.1715697086450;
        Tue, 14 May 2024 07:31:26 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-351cb0fb6b4sm627163f8f.24.2024.05.14.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:31:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH RFC] ASoC: amlogic: do not use dpcm_playback/capture flags
Date: Tue, 14 May 2024 16:30:46 +0200
Message-ID: <20240514143116.3824376-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_073133_456074_E68968D1 
X-CRM114-Status: GOOD (  16.61  )
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

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Following Kuninori's series, dpcm_playback/capture will be ignored.
However, properly disabling stream direction is important for Amlogic
audio drivers.

I'm not too sure how this should be applied to avoid breaking bisect,
before or after Kuninori's series. Maybe it should be merged into it ?

Any suggestion Kuninori ?

 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85..646ab87afac2 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
