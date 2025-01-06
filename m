Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C17E77198
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYueXExZY+XWFtWrsXszL2y+lpkV53zCD19to52jarQ=; b=kU212ndUbFFViv
	Zrf+nZtcbAKBVN91srmlzyEUmRcQaM7ZfLr4tb1sIfVXBbtRh4XHGJ2FyTc6ULCiFtQDQPs4eEFty
	TEQX4R4wqFk4rYcDZKiAifuKZo3Rf9gb2PQmjiGQ2y3OfelMqV2gzrvf5pa3Li+XoUuWmo/0ucTro
	zewFnw5NfKKMNiZokzWYHhbJxvz+lEHPa+R/vmsB0KsdWX8BDhwW+0+pPaAot0RJspIjL81qLlIaB
	qv/gM7PxtX+bOLxLu7Bt44DhVhyKnT49+ZO/eKK7gLNMpN9dIpF3Y2Cjk9wfb+2iFe/k9ccz4IdFI
	6oF9dLqB44n9NPwv9saA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnrZ-00000001WnG-0UpH;
	Mon, 06 Jan 2025 14:13:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnrW-00000001Wm5-3ENg
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:13:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so9225861a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172825; x=1736777625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue4Bu5Xm3aSnr3aDQKCmaVaK/VUPDoH9ftWxJfeazzw=;
        b=nEp5+fcIN4jq+Hl8p2Bb/Q9pJeciO3u1JLsZmbxF9Jxz1XkvIU9LrA2UqYkNp6uNaH
         TSvpZ5ol+TEz5TZGFwKSNOnphMYKwh4R69wpFe821iKSX2CRi+QszfipCOG/3ZdlRgyE
         yxCuPHyGEdNjPEgXvFgg9Npg/y8JMRr3InmGQmU0mA6eeCb8rrGkmK3Jx4/7zh/bko3Z
         UWMDh8CS6yQOrR/NVcfRXvdR7VQSGyTZRY/d2ojuereEAagmbtX75nVxFsQ4mLOMN/03
         qjQKwLwaSbt3t2QatO47rMooex82teBgQtDTbSBeQUB9uwxTXgsYE2IGnka7n/A32dst
         Ew+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172825; x=1736777625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue4Bu5Xm3aSnr3aDQKCmaVaK/VUPDoH9ftWxJfeazzw=;
        b=iWb1RF+2Br8F+ya1ZtF6PlYediyZi5+7w8YoqPSCtBg0PLCSfOzJ/JCNxniTOhRaZr
         /Zs0Gv9MsYSbBQMYElcXcsahp+f3Zo8jv3cO5FWglRKJ7xl1ztUaeaVRPpDFfW0GpVHi
         NbKv2/kOIzostMOxzAyxExtVD8WTqRpjyVK066JygMVxkXuZe6yb9ZiqLImFNfcH+ta3
         jpwI9mmLB27whQJ2rGU9okdMWMVK3yAmUOVa86fjOWtsiwhnUwqPKJmNenW1frd5h8oH
         kADg04wgVyn8QPADHHRP33pLZXtXdlIcQZFEkkd1duJAB6qytQVYOLc97fSdSJ2TOuty
         iQhg==
X-Forwarded-Encrypted: i=1; AJvYcCV2CO0gx2Q1qBfmCG9jDrL3sdViRPs50YVrPlxlCSOARN7oxhqXtxBkgQrrUHNJ6Ok/8FesAPS1iwE5+uQP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo2klF16zrvJjkk9T8adwSMawahsN+2wpkL3s6NnD5yPZGQLYN
	NDPWxgfmmkLjuxFNHAetAcssocki+JhZJeA/PnIeI5/o4YvtvFcB
X-Gm-Gg: ASbGncs97daDEl+gITawaIf8ou7goezL+viqspz8N3CXKpCbusEjnw0oEoWBPZGWgfd
	0OK+uH9kTnvTWnE97R7BvaVH5+zIr97OBJQKQ0D2plyTCavHDqeEtzDrOceEBsux2f7HrC63Cl6
	dH3boUNeB7803N/kSJUd1hnskkTve08IYVy1VwbZjmdbmMlZBZr2DspS4D5irGJuoQra478O0k9
	H+rBCEfi/JAnXEqbJXSErM3BN4yQlY9OK3otOa0NnOVHLZWFrVIGf/hCClVGPAotcqBKEhaq0/w
	eY9j+g1MsupCXhQNUJHhjDfrEKgL91kxAMG2FVuVpsz4Ht1vENrSnrtyeIW5SzK+2bjPnSgIxOp
	KdDWQAw==
X-Google-Smtp-Source: AGHT+IEnu2WBqAc4ZLV2zVb1tutjBgjXj2jnmiXy8Gw+WqDg3zTtAv3hDkZ3fUD63mUvDPlmvBph2w==
X-Received: by 2002:a17:907:7da8:b0:aa6:8676:3b3d with SMTP id a640c23a62f3a-aac2ba3c134mr5574351166b.29.1736172825126;
        Mon, 06 Jan 2025 06:13:45 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Mon,  6 Jan 2025 15:13:15 +0100
Message-ID: <20250106141316.375984-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_061346_808211_DDAA69C1 
X-CRM114-Status: GOOD (  14.46  )
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
