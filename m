Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AA4E7719D
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygy+iji5rptaCXKGoeKLcIb4PMtTA+u+M+qgHytGm0E=; b=SkjlAqQ1Dv7QsT
	5Szx/3Nb2PhBRCWIl3sWM/wnro56JVmceN/hwAACUAjd52RabYSpM/pZcH6Be7JCCcN7SN8G3fkNw
	BPseUbjMZwcXcznhPlCypRzPlONViVcAKCOCPoESLjgN59IGPHg3U3aVJKewlS0qtdufXrMq07HEU
	Emw2hdvMf0DsGyCCBD5M/ZGzs3A+2xfhs6EGwisTyxhiewtmq6Rr8JoU5N23BQJu10Z4HJ3zAiIUr
	WMICBbF5yVXwY2CxunFCjsYS8qQueBNBxp2smxkeAgDeCCANXcmLn21qlHMFkX29S78pVaeY8EkTC
	3krj/xrV74syqjEa+GmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEO-0000000GyWt-2TMs;
	Fri, 10 Jan 2025 21:07:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEM-0000000GyVe-3eCV
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 21:07:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso466600366b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jan 2025 13:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543265; x=1737148065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIZ+oSgurarcRt8vr8zAYXncwg0sc5woPL8Ha/0VWlY=;
        b=G8R8ZBRFsZmd546kQpj2JvdQJRcfk+O7h4l7XnGSj/WxwvlsnCKJWFKrHobyWrKu2K
         VbfNRlj3VqQmdYvP1x/QMpOk0Bw6pCPSYoDedfyawYdYiF0ZB48X+RAsUoDpGJNIpVAP
         2Ds5hw4g1Am+DZui2Gddk+nM+vyFb32I4Sx0SDU21h2yTZf80cwhmp+ZEkkMxQr2t8Va
         hLYiP+3VxkiOEUmmXNCAebTiL/pi6Mfy7k/zPqZJhp/1ajFt9foLn0dR+OK6ysnbOKZn
         hAU01eaGhveyeCwLOQzBkETigMOCFDxcbYSnmqvR+k+WaISGU+QV7GprWvLxeH2xXhb1
         b+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543265; x=1737148065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIZ+oSgurarcRt8vr8zAYXncwg0sc5woPL8Ha/0VWlY=;
        b=BU/Dwqt+pDUJJX7DRcaBQ11WcFpigRSJfnr816J8HFDJI3oIbOzFjm3M6HUqlwNico
         scff3VVxwl3xmE7zAVIVMy+rZzkSFeOQYxPiGAj3lEjfJQwmP9jqn3frQt0X/H6kIrmy
         b1eqvTZI/R2glH1Z3MZJMIDwhbi92RQrW+ZDcrP1bQCPj06mB+eOfdyUTq4Xia8udrT9
         pafDrCv33kqB8mSE8fqF840dNLrZyh6NL5Xhyup2sX6ri+cg4lzsIf4E6u3fXQWFAPdb
         iqpNgIMYHZU68BZ3qU80C+h4xWTlS3xiflentPnocqZD06RhnjpuwjSpYuShrmO1oeSg
         4lpw==
X-Forwarded-Encrypted: i=1; AJvYcCVvnVSbh6YVOMb+bgCMH28oWbFgBYnWLDax09ILDRrQR08QxSZjglaMizG2dwTNMWjnWQuDd1qUOkUoMl8P@lists.infradead.org
X-Gm-Message-State: AOJu0YwBtwJtoNqoXTUUxTHAYTlnAz04eWzN3AhU2DYkt3p9Jb00/fcP
	9W8bKfUbKkpg+2dpTC6PKJCRJumj9UIsUpYUuc9LU1JyKatT/Q4e
X-Gm-Gg: ASbGncv4lph5QiOQXn7mgrJ7ypqnFc+rYRxF7kjkqyKu/79TdpwiGorEbTmJw//VLfJ
	LbAykmGc7CexPXoCJ1d1nKlhzb2mmdXE8Pv8znjkUlfUWoQW8y/hecePlB1MY5VjvitdbZb1RGO
	CXXWGlvOKbfmv60Bc2aJOnawWZYGeLy/R4E4VEULElFA7ByyddPN/J/X7QXPlNKg/KWaRSfQU8s
	+dUUfb5VXEeI/c1otLX77LrUR2ql9HR/BEt+rCAzGdvkMBlwq6Fnr/MS8W1sI1bBDUHUxl7tIlb
	ZB4+hKCyt9konN+oBDA1CYOiSXu/G6DLzqNpCDryayry6tccJPVmZ02pgLj5AXIGQk9L/E7JxmU
	RD1yuyJq/sW3K2W6tIV7C1TeA
X-Google-Smtp-Source: AGHT+IGfkZEI61CgIzpYxXU8G4mktTudXEmOYpm0fxUboDfEgHg1ACC7bWH08mfx2wWTHyIwtIbcEQ==
X-Received: by 2002:a17:907:2cc5:b0:aa5:44a8:9ae7 with SMTP id a640c23a62f3a-ab2abdc04b4mr1051516566b.47.1736543265084;
        Fri, 10 Jan 2025 13:07:45 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 2/2] ASoC: dapm: add support for preparing streams
Date: Fri, 10 Jan 2025 22:07:30 +0100
Message-ID: <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130746_908026_7B0E5FF1 
X-CRM114-Status: GOOD (  14.10  )
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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- also call snd_soc_dai_prepare() as suggested by Jerome/Mark for the
  source to keep things symmetrical (this is not strictly necessary
  for the Amlogic Meson SoC as it doesn't implement the .prepare
  callback in the platform drivers - but having it symmetrical means
  less confusion for future platform maintainers)


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
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
