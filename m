Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209CAC02185
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmxXq0HvN3yINy/uZXOOANTMQ5iay0Th6ikYBLenb1c=; b=UHZzWtVDqk2/O4
	g4H9P5o6ytq4g1hLrDbnfZaSVEDrO0Re0v9IBhkbnCq8NMi2/mSnjozpuDo/BMFt0f4GconOJN8Uu
	jbyQqDD6x9LzdrIjNSc9ZXfq/G1SSQRiUakkM1oBFr7JMhWmTc4cdpXFWMQq34L4Wv+zoWUI83Tbu
	EO3TvhHoniOLK09e3fXkXSYmh0QmEu2xWdW98iaclF78CoIdye4cqYXPgiAeMvEcad//PhvqBoBvV
	fkn/bad/OH7awWYq7h81KO+ym+m5Oism8gNZZON0FJ8YYyBt2sBTZUXU+4AwlZxWrUUXQZ/ySN39K
	9ydN6/Yl7vhta1a0cfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXotj-00000009rYw-28OM;
	Tue, 14 Jan 2025 21:56:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoth-00000009rY0-0Bwp
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jan 2025 21:56:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4363ae65100so63401435e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2025 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891787; x=1737496587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIBpBpyOl+m8my/7PkVzx37jn9QibwV+Vb+YTMscE9E=;
        b=jZA8CBBhD/I1qZTzzfMZCUOJ++/i8O7u4INNirDMjgXBqEekihC1L/JHO58MErI00Y
         ymHWuSUaVGyU8CMaVsTDfukYFHf5MC+0ZplQVWVYawTUqu6Pa/affH5EvMZ3fM4wke38
         kkgX08HgyNsqAEooHDicBp9lrQNImQEL75VlmpZkuGzoD7yOr+mGt+RL+YNjwnXLxOEK
         Y+UkhUgeVq8Ove9rmS1YJ4bylt4Q3wf/Yrzcnfr5freXfFGdNtBWVPVD4nlVdmYRWwl0
         2OnOFDnxRIHVGbjdeeyAT33a2ZI9RPXWDHuu4ch/nrbOCm+BruJFZ4wFxrYljBzCMImy
         zisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891787; x=1737496587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIBpBpyOl+m8my/7PkVzx37jn9QibwV+Vb+YTMscE9E=;
        b=rrfVyc5ccPD+rvqYaMLYkCf+goAnr6MfZQJWzLAPPE8c9aM/Z8FPvtQFH9lUOc7Nff
         CrABqbauv3X9IdBOSgZ7CAAGmD+jPa5D8dinyIdGPBHkq6/LjVuwv/emu2i8K/XSXqY6
         Bw5TjQYKwDrasCMSs2dh3YDles4P2Yq+ZHHvSG7vdFmMdmTEn8LbtEa6tLD+njSn74md
         pB4PiLKUmSpodDE9Y+bQZGU1WwfrTXwMKpJkNJK0xIgTDbv2m4TCaJIJ148y2I9nb81G
         IQrkFbh2lbDSNbh+d6Es6xcngQij2vdIdW3qv8osHnR/nRTBvuCBTUbAc0i4MTr6pcup
         Qxuw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtwxaCWtc1Afl5s3F5gCIB+wt0omfaYzUhE009zODFGwm2HykKB7Vfes01d726slukT3qHW6YtmhnDXcQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8nJXNgBOQyDT+pQzKWk3XhAXhR+mdLpT1eApig5HSYXzcG3mz
	05+trdETLwuCJQpgvpak3DLu2k2HEigSmvaBNl5sZ5XHHjDDlQYl
X-Gm-Gg: ASbGncu+osWflnjlXhVDlrJeIkrCnYS1Jy+TE6AjeFOFJFkBPIW2h/Hs2HzCRw+PF+Y
	kW/HOczJTdRT9b6PtdMKqermo6J8XBk0stzwSclD4UAf+azf4HAp2wAmy+xOhiYYOZW7v+AAFio
	4zWEJtr5LtokUhZ8UOUjRa6lgQXYd6X0f/JS6FX7AIIgvTlfCDSfROmEk3RrT96cj76OFDRhk/E
	pgcUO2jPjcj1fwQS3XtM4sh66NkNmNNQymVO9FPFGxlC8bxFKQVM4jno0qvo6kJ0LphZHXdDsXS
	uYYCsoRwwNR77bMzbcN/jqn4PqkYO7hbgcvgk/XhVNVVhhMOmcTLiVV+CMlE18+K5E1EWDGuOz4
	8wP6PlNIEyRkIQWNTlAwbOxfr
X-Google-Smtp-Source: AGHT+IH1+RTIHsrE+vTasbshXKRaZEajmGfhAz2kicVYW+YLEriTzlE1yRcHESQS3J/h2jMF+SFSYQ==
X-Received: by 2002:a05:600c:1d1d:b0:434:fec5:4ed1 with SMTP id 5b1f17b1804b1-436e26e1f7cmr225829625e9.26.1736891787190;
        Tue, 14 Jan 2025 13:56:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/2] ASoC: dapm: add support for preparing streams
Date: Tue, 14 Jan 2025 22:56:17 +0100
Message-ID: <20250114215617.336105-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_135629_083192_16A7B7DA 
X-CRM114-Status: GOOD (  14.16  )
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

Codec driver can implement .hw_params and/or .prepare from struct
snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
callback has been called.

On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
(sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
codec output because further digital routing is required after the
backend. The new DRM HDMI (audio) codec framework (which internally
uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
of the hdmi-codec to be called. Implement calls to
snd_soc_dai_prepare() so the .prepare callback is called. In this
case the mandatory part is the call to prepare the sink (which is
the hdmi-codec on those platforms). Also call snd_soc_dai_prepare()
for the source to stay consistent with the rest of the code (even
though it's not strictly necessary to make the DRM HDMI codec
framework work on Amlogic Meson8/8b/8m2).

For platforms or sound cards without a codec-to-codec link with
additional parameters (which applies to most hardware) this changes
nothing as the .prepare callback is already called via
snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
dpcm_be_dai_prepare()) on those.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes in v1 -> v2:
- also call snd_soc_dai_prepare() as suggested by Jerome/Mark for the
  source to keep things symmetrical (this is not strictly necessary
  for the Amlogic Meson SoC as it doesn't implement the .prepare
  callback in the platform drivers - but having it symmetrical means
  less confusion for future platform maintainers)
  
Changes in v2 -> v3:
- add Reviewed-by from Charles and Jerome (thank you!)


 sound/soc/soc-dapm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b..ebb181aac7b7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4013,6 +4013,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			snd_soc_dai_prepare(source, substream);
+		}
+
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
+			snd_soc_dai_prepare(sink, substream);
+		}
+
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-- 
2.48.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
