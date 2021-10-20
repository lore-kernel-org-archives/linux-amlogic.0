Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B86C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D049601FC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D049601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeCW9g+gHcRk1sGY0LkTdJyzrj2Yc7M5YTV8PQ4yR7Q=; b=kMrdep/KpCwRf0
	GQ3eJ22qlA2VMjyFsaLd6YnXWvIGnXjzX9NJE5QqsdiBNoHnjAGPCnA9ctmFzNqMdRPNVe0KuVpe9
	k8vab8nlErYNATgrXXXqlMyLiOhc+X789bUbTDY4U42kwSu1pRg/X1HimepW2CaXH3+eAld+sbHW+
	10rWvq5H8Kdlw4MGy8uqK7FGkzShGKl8tJz+vEJYd0urYSZ8/ujjd02KdQXvPecVzXi/R+ZIFbtQN
	BY8qbTJ4zvoyeO7mQBLurJVwZKLm7QAxokrjohFmGd8f/1Y6W4vk/I+bbPnTVell2JPBIjvEBWATu
	miie+WuCKKjviF0AV5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9zX-004M8G-0b; Wed, 20 Oct 2021 11:42:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9zQ-004M5C-4A
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 11:42:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso9506145wms.4
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qt1kRkQIhdl5KXXeNc9j0xtUv1cZrn94RpXEyZ0WvkQ=;
 b=CSs/m7ZiRFp2v9dmNvryyzrk/kgz9iLi+f2hjBXZ86n0m66tOIlF4bDh7TwJRT1YeQ
 xtBGU9XamE3lh+vsqdLOabMO5xm1lkoHFIupF1+zP32Zesf/TOmtuj56oEbiVFHYKcYj
 xlWS/CYCWtAW+LhgD3srkF/TORtFL79SqihWMaU1ga/VS1usykttVpe5JTNzM36AbqS/
 /DthTpsIp6ZetkkMqdYyK7wmpb1CEIOipRi4S+kQa05b0IbSDbxhRYPx8RjVflQmADO7
 g3A0WZ0DtBg45SmRNRXQ9whBClOz6e+KKRRY0s/BZe2P0bNcoFXhoBw6LcCy0vkaVGCn
 leIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qt1kRkQIhdl5KXXeNc9j0xtUv1cZrn94RpXEyZ0WvkQ=;
 b=QzHGjdvBAt3cXF7Tq3HgvJhOKNZjFrpE2DVIVNn3xjGibv/5c07HTe3jqAcDsBEjP1
 CE1meUXTCrCIzonj1IQX9qyh6cFAYQzTvRjt3cJTuMmBDREDJ7mS/bTfsKYhD5kwQvAO
 JSoz4e9YTXTSjRNZDUcnJjdhvDosRaJMS2hxzsix1Ewh76vy3Cmmqo14N/XpRAuvnCa8
 jb2F5JFeH3S5QdeXny36+MMYrBxkjVVIeI7hM56frZ98b7X2C4tg+5lcn1YVZS2Jo7LW
 Pc2iwvsl76Z8FXraVxv7+aT23hk/BAWVN521NcbXq/3D78/p4NXXqDR48mZ84evNC8L0
 blyg==
X-Gm-Message-State: AOAM531YzTWvhIptwr43ItjRhLkZbkURgObGBEtKIxh/EEfKq0QPd57q
 BEovANzYWX4u84Nj8UfBBAHJQQ==
X-Google-Smtp-Source: ABdhPJywVaZAqRITJci/WxzJmCqmvcgN4vbJsFCQPeyynKUpuyJ2uNuZgf6d9710w0xmYnfDbyl08w==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr51027972wru.65.1634730154240; 
 Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] ASoC: meson: axg-tdm-interface: manage formatters in
 trigger
Date: Wed, 20 Oct 2021 13:42:17 +0200
Message-Id: <20211020114217.133153-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_044236_187614_86E005CD 
X-CRM114-Status: GOOD (  19.08  )
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

So far, the formatters have been reset/enabled using the .prepare()
callback. This was done in this callback because walking the formatters use
a mutex so it could not be done in .trigger(), which is atomic by default.

It turns out there is a problem on capture path of the AXG series.
The FIFO may get out of sync with the TDM decoder if the IP are not enabled
in a specific order. The FIFO must be enabled before the formatter starts
producing data. IOW, we must deal with FE before the BE. The .prepare()
callback is called on the BEs before the FE so it is not OK for the AXG.

The .trigger() callback order can be configured, and it deals with the FE
before the BEs by default. To solve our problem, we just need to start and
stop the formatters from the .trigger() callback. It is OK do so now that
the links have been made 'nonatomic' in the card driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 87cac440b369..db077773af7a 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -351,13 +351,29 @@ static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
+static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
+				 int cmd,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct axg_tdm_stream *ts =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		axg_tdm_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		axg_tdm_stream_stop(ts);
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	/* Force all attached formatters to update */
-	return axg_tdm_stream_reset(ts);
+	return 0;
 }
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
@@ -397,8 +413,8 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
-	.prepare	= axg_tdm_iface_prepare,
 	.hw_free	= axg_tdm_iface_hw_free,
+	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
