Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988C4C7618F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7012E22AED
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBPyMuNP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T0XHmH7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7012E22AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0NJLgWCpb93or+NBHZ1UMOrlVrXraxDWRdKFXAOp/U=; b=VBPyMuNP0Ja04+
	YX1/Cdokht0qCG+u1uTlggQUjMwF1drnXa6EeBejI/+BVOwv57I0uhVC9sR/JKLcLn4fGLsuALMaH
	I/dviM1k+L+FBjit/G6Rd+OkDey6Br4BlGMW1QLygsgpJiH4svWvZ1ws02pmhJ3JAdWFtMvh6+3Mz
	IWGG/4Fo+sm4EkxFsiNvrfFfDtM43iCfj81Z17kj09IKOocO88nz+CkMW8k1EIZ71E58O7OqgPGNs
	8KVMmoh3aVnXI4bp3XIelzNDogrg1o3z8/JI5sVXMzcbCSHl70kjWNaGmjFDgllbXDRNSzlrEgk1e
	mdmZjypMt1lozWNC20SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqK3q-0006t5-W4; Wed, 24 Jul 2019 16:24:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqK3o-0006rf-J2
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 16:24:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id f17so42163770wme.2
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ocUEQSXynTuFhR8u/rePjf3f/sB3eXLVGjV4BtMdyVs=;
 b=T0XHmH7fMTKgxRE+sBpYoKeEOwc7aBtGRsTgi4fQxLrOEfcW0U1YUrrDIw3Rn8GfcX
 lhkdzqNgssqMuQEo4DlEKUn+PqiRDTIY4NzwiQSGNCWQYJT4nWBscmNenvtx/y77qByz
 O8J4L/61kEPly3Vt5mbDYBXjERECUfgji3eBFFbA6oDgkOQBZ8258HWGNKxps1E1ytBc
 yhcCI72ckTJOjSU/9LYbSvhgbXuhl++XmTvK3k18dhhjOxg4/KAzDMeMlj+t7BdxUBl4
 j/DDcIcHQnT2kaq7UbX8BV78x4zpvLXHqdaoHZc5oUhkEUtplY4+LLtmUNuYSRCw2Q2N
 fe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocUEQSXynTuFhR8u/rePjf3f/sB3eXLVGjV4BtMdyVs=;
 b=NAyV0cUzNly4yFu8JP3AW5GhVQr9sRNyhUbxukw86gDrKKM4ZU/L6v/nUotuwYlWqk
 VRlUGdy3Q1USCq3mUkuXw866LpvuphwtjHK398cW2arR4JbLC9xm3uJcoOmoD7ahs5Gy
 rt/EP0adtg2LSjzJCgSAals0ZslURGTyRLjLh/hfeYf8uVpjatbAXyGqrIwQm4UQfdKX
 6PBgq3H+JQcyFwflizSKqGjgbVJhcyYWNojcb00tszzkjSuaXjl4jFMn24nOnURdgMhC
 OgO47YuY9qYsdH2euc8PsMW++CQwx8w/tRHwEHm5I5SMe7ZHgvFC5TTNP+eEJSJSC9Yh
 U3Fg==
X-Gm-Message-State: APjAAAVDWtGPVihy6LO1wVvYc1qdpmJ2urGJo5m0vKo+QiOd+DGxp9j1
 thn6Lr4D3pAjhZrYtovSkkHDOw==
X-Google-Smtp-Source: APXvYqz5KeYU3i1H08gJ6KW2smQMst4ZM+01sZk1tJDy733pmW2ILw3I6IwRuTSHXx60lHlH/0OyTA==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr4986239wma.176.1563985450593; 
 Wed, 24 Jul 2019 09:24:10 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/6] ASoC: codec2codec: run callbacks in order
Date: Wed, 24 Jul 2019 18:24:00 +0200
Message-Id: <20190724162405.6574-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_092412_624375_D583207B 
X-CRM114-Status: UNSURE (   9.85  )
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
 sound/soc/soc-dapm.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d04612601ad..5348abda7ce2 100644
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
@@ -3853,7 +3848,24 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			sink->active++;
-			ret = snd_soc_dai_hw_params(sink, &substream, params);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			ret = soc_dai_hw_params(&substream, params, source);
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
+			ret = soc_dai_hw_params(&substream, params, sink);
 			if (ret < 0)
 				goto out;
 
@@ -3889,9 +3901,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-
 			snd_soc_dai_hw_free(source, &substream);
+		}
 
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+			snd_soc_dai_hw_free(sink, &substream);
+		}
+
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
