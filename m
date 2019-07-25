Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C8EC76191
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0DC22C7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5AbftWO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m0yzJqTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0DC22C7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmsU9WQuSEQJH/xzdOWGG+yWK0ehAxc502xlOsBbuls=; b=M5AbftWOJtZH7x
	pMcsbyztEZAj6aZjolcR7BZgaoP8eVzGOD98slmOwZGwX58Ccta9VAUzYCpG6TToWKkjgytCIyFkQ
	ZCIPJZB2O+k+9ydUEOS5Vh/U0YnIEJPG1DbHk10AbCQLBlFMggfYYp6FTTwxDFse2l7sduidoMAQ5
	4zwzd0nbpQESOjaJaKHNtMaJazyLMuNN3ru8Bb2OSxD5tAJM7LCaMpxPuKOap291gEWUNgDxidlVz
	WeV7oBhqDZvpvvcOVmxWbbOdNGzjPmG519boORMQcsPkcphUTGZ2SQHj3Z60Frggdb5gxw/VPEyy0
	DEH4yGboF+wuaqstO83w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqh5y-0005Bo-PO; Thu, 25 Jul 2019 16:59:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqh5u-00058k-MN
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:59:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id n9so51642433wru.0
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjZlNK5foaQOSQzbPfrKvphWkFDjBwZWcqfyFOMILTw=;
 b=m0yzJqTLfQUVO9D+Kp04i0U6B7GihD54VtnGw83R3RZXjnk719z2IdBOI4yHFIO8pg
 BcdA7IFFjKE+VXE5k7AdT6/t48Cn8BgYW1es8YENonXXslAi0vXw0v/7RxiVUZWu40NY
 oxLDlEcPXF18or7K10CjlHkCS2P3s/IbPNxHzqFR//ddxQkc2D7HdacUD4CzQwNnFDmn
 5ceEzOgsjLEtp3yWBOEQKSZCkSGxgNweL34gsO9+3A0vzwlmku1j47Ahvuhn6oVWNEjd
 z7MYMCObi6thyoGQ89GVEUCXW1s2RSyuvrGM86imrJQ+cKvmVgt5WggZfZAcsq50cfon
 uJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjZlNK5foaQOSQzbPfrKvphWkFDjBwZWcqfyFOMILTw=;
 b=ALxOmiRM0cSRtx7efkZKyFeuDsmMKRWj2NFUA2iaMTN77/YC681Df6qGuYNI44zOE5
 geQPo7z30jd1kpTmqXscCdn9IGuITmuzYds/krE7tHLePBKVTnOo9hvEI4RG+Gneutj8
 Txh+JCh3qUzbp3DZCQnfJ54+0Og+V5fNoqVOGoWiHt6G7uoz4efgdw7zh6nGx+UX+qUh
 DLfuE54vBqVWPQdlZ/3U1awKh1XV43idalGj3C4oQmOHJ1F1/rQz6rlPlqLFfXN4UwlF
 XPOAsQJa5kPiK1C0lDF3S+XHU5nZEteyPCeMyyncRJ8t/LOz+42Z+3Fe3prHKylRUu51
 tYXQ==
X-Gm-Message-State: APjAAAXVhsNm2g3RYQ9INyfrxJkKPSJEwHI6TmlpihoNWWnCuogX+Zt1
 reqieodwE4t2Ha/Ckg0Ai3F4Ig==
X-Google-Smtp-Source: APXvYqzkZIFz+KVxgJBu1r3Q+ftdDRhPRxm5CuaClhVaUFvnLzyoMd84/wr8z2QjCOwDlYK0tfyViw==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr3481607wrn.257.1564073993318; 
 Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/6] ASoC: codec2codec: run callbacks in order
Date: Thu, 25 Jul 2019 18:59:44 +0200
Message-Id: <20190725165949.29699-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_095954_728101_5C65A901 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

When handling dai_link events on codec to codec links, run all .startup()
callbacks on sinks and sources before running any .hw_params(). Same goes
for hw_free() and shutdown(). This is closer to the behavior of regular
dai links

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d04612601ad..034b31fd2ecb 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3835,11 +3835,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			source->active++;
-			ret = snd_soc_dai_hw_params(source, &substream, params);
-			if (ret < 0)
-				goto out;
-
-			dapm_update_dai_unlocked(&substream, params, source);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -3853,6 +3848,23 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			sink->active++;
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			ret = snd_soc_dai_hw_params(source, &substream, params);
+			if (ret < 0)
+				goto out;
+
+			dapm_update_dai_unlocked(&substream, params, source);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
 			ret = snd_soc_dai_hw_params(sink, &substream, params);
 			if (ret < 0)
 				goto out;
@@ -3889,9 +3901,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-
 			snd_soc_dai_hw_free(source, &substream);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+			snd_soc_dai_hw_free(sink, &substream);
+		}
 
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
 			source->active--;
 			snd_soc_dai_shutdown(source, &substream);
 		}
@@ -3899,9 +3920,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-
-			snd_soc_dai_hw_free(sink, &substream);
-
 			sink->active--;
 			snd_soc_dai_shutdown(sink, &substream);
 		}
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
