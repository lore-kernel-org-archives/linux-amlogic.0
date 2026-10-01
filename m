Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98514CA5FDD
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDzScwBS0izC88gYQm2u2juQKGOrw29HMjq+CyXwP4w=; b=Re4VvpRpjT/TJP
	+kbXE6ub0KGEr70rZfFJ4bTWDsgjZh9Ol26vje1X9sSVL83k5QsG72utOHID9z44u91rOxGEXisRT
	j3I0/22npFWUepPl2fVwac5kHalGJ5RBSJNMb1OtkOxee9oeRhsOLzwxL53R78QH/FNETxi6tU0wl
	X6ERaTVz57Iz6kBjDTqaScLP/3r3foNtlLbvNRe3BqWR3jkL7zui/FX7+aHsxwvMMsihlInbliVYI
	OSfneBkj32qDupW0MUfAC6SAL/KrXUZWTqHctfWPG/zquMzp6fhpsHeDoqLfr4sZ5pgknfK59PzdM
	F1Sy9E/VO2eR7YZL1nUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ1-00000009dsb-2eAi;
	Thu, 01 Oct 2026 16:06:47 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIx-00000009dn0-3u24
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:45 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso41509295e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870802; x=1791475602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=N8v0QN1qrJWZvnXf3SbxcNhN36RvHTdXalLaabnvr0pmsS3Qx4ti9+agjVBHIXEkWR
         JKkl9lnnbiP76A/lbSBEcziwP0jwWg+rV8MqNurPr4C2bu41dFDpAlotZLEfpMcFLtKR
         VBggScrspEnJbrAFb0ujSUkGw3RGtXE1ptnN+M67bzfAvdFQB8mq2cDw10dXPf3HuKhe
         VUYf7QTfg0C4asm6QL2q6kIXh5hIIu6C6KlHp35AEVqOACMpu97f5wRwMrTAEhjW09h9
         hr6xCKyQzHN4WOiDaPIvAvzMZ2sa2jxqIoWq2uImAZJ8BCHmQNHsMTpxmBq7WpeBHbTU
         SxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870802; x=1791475602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=r7iIxejRy3HPTONkuR3iFqClk9PcEO0kD7REeQtxt66RCpfKvg+kjJTvDrgbQV/Ejx
         JYALgTBQZJ6z4iylQosnU5uS76x5u8hmO6el76lN1gCxK/80wVa2C1VrNnyf6Jgorkvk
         4GT3TEUVbpX7+Cvg0lXvEsV4O1m5p+vv7KvUFsJybCPDDcXwKf7Qym7gONhvUqrbNQiU
         8Qi0umNfkOPKVajJ+eIMmeG5Mz1gdkskfKZGQNzW/G/8ehOkMQc3XAkYY3u+g/4CLnQr
         TIvONUAl/FnNHgIJui5/8OL+G85Hxp2b4RAjbedWmCBDvYogH5iDepK3AAOHb+XV5vxV
         BBEg==
X-Forwarded-Encrypted: i=1; AKwUvBylMcUugpknBlVEPqHiJk7CCVtkbabxlq+UQijgmtQAR40kpZyMv3MQ/wS5yRbmcIOP1NBZWmoeLlnPXsee@lists.infradead.org
X-Gm-Message-State: AFuF++lGncGLZn8wZdZfVhTayrXqDPV41BQCVI6U/4lM0Q877c5IOUcX
	Mt31mFyvmf8XNexpFo+7vDFZhyDwnVuO4QKVYpBf3L68QegF+Vz/4IuapIKCzhRpuFQ=
X-Gm-Gg: AYBFou0I6D2q1mJxsVBbJtgFoiqZzWlgK9zIXvMPZPJyXr3eE61C9yAhOuRItiqqesJ
	ehaDxMfOVzG7lI8+TeSjDRr/73BTFvHRR4X0tI6qbygeVSNlrZSVBU91pZfBz8VgwJdiVNHwSGr
	YWdT+vYgXBVyBmzzr4PgdL9tsoSd14oabPJGyk6pufqUxpF9N0wRF3XjJArMAG4MdFChlqM55uS
	lVMDzvUuKtv0j7fihNZRTf2U3IgF7TGyPIZkK7K605AtYl3yaxq/1McwSPvqqOdWFy/ifxUXQOi
	1NxS8g58YTyfhylaU2NBePRQ+mVowJoilw8BLMsgFZoV/IyeLpz3o30HyW9vYF9OvIDb8p/YyOc
	lGu3XbGJyLLNHDK8f8FK70zscR60NcifcVNjhrVaxsVjyafIC3pgbn0l/r16N4t7LRibJvBYOlz
	CJoY3z3MembnzzFP3CdxKsDMz1n5U84QAKdlhTMbmPwfKPkTvARNzUS8rg2kkky/Rz
X-Received: by 2002:a05:600c:4f88:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a0274f9c06mr2153635e9.4.1790870802378;
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:30 +0200
Subject: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Message-Id: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrm1f9gaFjtvOB16V+bf14s6N/wc0k7OqqtkijLI2
 LtgmQZvRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy9h8jw2ahV0o2Gz4cvM/J
 v39B8Rpf3e9rvk+crWh+ovLufvW84BiGf/axdec3K0zd/V9/XmbNptbWxrTC+MPrdvuuXRT61rR
 pMTMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090644_016022_A8DDA16F 
X-CRM114-Status: GOOD (  12.14  )
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

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
