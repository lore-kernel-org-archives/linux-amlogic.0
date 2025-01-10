Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2881E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBksaoq4mmJ2ArVhT8p2amlvyFu/PNaGJVtSI4uXixk=; b=eMb2Baa3l4J55X
	COfNtR9IfSENx7L1aZpW6PyyG9fC58KcPgc1msMaU0ncWW1okU/7PTTDQcHL8r6g8WgL4i0vZatt/
	UfxgoSrr/UsVGvKz9lh5K3uiaadVIRF5NX952J6arnUbCUJqM+J9GV9+nAvpUWddiVXmosaIpSvmJ
	7Bk/EeEaajQEnjLKT23LhryBatMp858iqL7wD9OdrTM+3uaJ4Kt+tqBhejiItvpX4qtat7yn9wjE5
	QdjDpdMgRdU7rVPQ9hDtH2nyVVL+Wbf09TxlSu6vSBkx8bdPg8vGSWUJWmotmojJheEyow7ZmihCo
	UhGZ2w6Y8B8JmG75yF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEO-0000000GyWW-0yfy;
	Fri, 10 Jan 2025 21:07:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEL-0000000GyUz-1CvB
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 21:07:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso415581866b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jan 2025 13:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543263; x=1737148063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqM66oq8blRLcCYzJ2r8dGrXeD7gM6fhGOLD4v43C1s=;
        b=e5Wr+JxaPYCKOYtPceZOvigyxihtdmbITDOJ03B/Hd55C+X/PoeOjMv/FJoDLvkjZW
         OQiueozzFQkegkgtc38JftbKtVRn6gC2m5ysVHRfbH1oGIQdAOJnKaKrhluz8jK79kPV
         UUT2R73OGzmHYfx8pcrt/GSXBhjBamvm/g1Iwhc7CTiFAZrP7VadyueADOLcCAkgVKMQ
         D3p68tweYxRrBaQByML2PXhEof/zC1jPA1UF6/YNhaUvtMuchMFnxjWe3FaLIwhB2lfq
         OwUQBlGqjh5P9E0tAW005zSzsqxbwIMMAOWehsHf9kbHTHhtgV96J82/WCHvQbnjuOZh
         Zw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543263; x=1737148063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqM66oq8blRLcCYzJ2r8dGrXeD7gM6fhGOLD4v43C1s=;
        b=ueamztmb6AUb+oGZbYXST1BRqm215JfzZYlchwWoV6wq60BYCTSN78Tt2mjE5Jl/lv
         AA8jNHg/QT+S42NPotMFBXpckFwFZNSRwREpGwm5N+nc4Bm82qf/qVVHJlBvEg6g5wDL
         d/GlAW5LPO2xy8osuYaXc5BMtqarcooVcgkCvsD/8JapEaawf4uoG9KNWlJxad4Skrbj
         9PprAuO2fcQChxkD9ohaNiZTvrahmWCSEvu+sKswIzDUHmmfphZeno3tDrgRMq7RK/kW
         4URdx0I6GWs3xaYtCgsxUSg04HCx86TXN82lGfwK9Inw/8odWsU50CoSQDSKO7Ukzuvw
         ZZLw==
X-Forwarded-Encrypted: i=1; AJvYcCXCSlfB6X0iuLGVvEn8dTyIoPdsU09sLGJMUJIInWAlb2eqJF1OeNctV1XiKlvPm6b8UiNl27Ed4BwKEM+I@lists.infradead.org
X-Gm-Message-State: AOJu0YwbmR9lwYjK8yE2nSFwdeRcz0PUTryWW03Bg+iOLrvCY4wo4lTr
	A0GlQQCvpooJLJCVLpgl9362oMrsYMAGKn2IwiJNBdR/DaUgF53+
X-Gm-Gg: ASbGncs95LqSJO+CHiTMuhntRVipgFLakoj0HOCv6msSXIukJwp04o71ywytBk95rcM
	2t9X+5y1HXlRA4FdtBxHt8zd2rlHaS9itnMKUeKl4RZIKoArmHxvRRAx6aMvsWM1VhbeSogZAuk
	p455CjvCYHYfdwV5uPn1BfDR4qLRA+zkaOrdc/SBiSn9Xa9cby1aU8asJdAKSttFEvBQQpa4/9X
	Fci59dXvxy5tJXc7ARuXb64y2emb9JwzzOz44vF095pK96XZ+SGz9JHtsoMWGg6C4yZkm4UtS2L
	+uYfVdYHpShrTCEXWYTzPtptaUF/U7yXSzt4I438oUohJshWUqh3tHmLVg0gzbLEJqeYL0vV0Jo
	ZjmBtMfKTeAMhukv6pwz8U4kf
X-Google-Smtp-Source: AGHT+IFjPcmaG75UjWdWsZvDbLhl3UcK9XXTRLW8Fl8wf2CyQSnJCCTdS1notr4bnsELUVoeaKGUxg==
X-Received: by 2002:a17:906:3492:b0:ab2:e262:686f with SMTP id a640c23a62f3a-ab2e26269e6mr295678866b.56.1736543263214;
        Fri, 10 Jan 2025 13:07:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Fri, 10 Jan 2025 22:07:29 +0100
Message-ID: <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130745_334871_0101AD80 
X-CRM114-Status: GOOD (  14.24  )
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

Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
by soc-dapm.c. Use this new function internally in
snd_soc_pcm_dai_prepare() to avoid duplicating code.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- none


 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aab57c19f62b..a11501752637 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -193,6 +193,9 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
+
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 34ba1a93a4c9..ca0308f6d41c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -360,6 +360,22 @@ int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->prepare)
+		ret = dai->driver->ops->prepare(substream, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_prepare);
+
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
@@ -577,14 +593,9 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 	int i, ret;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (!snd_soc_dai_stream_valid(dai, substream->stream))
-			continue;
-		if (dai->driver->ops &&
-		    dai->driver->ops->prepare) {
-			ret = dai->driver->ops->prepare(substream, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+		ret = snd_soc_dai_prepare(dai, substream);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
