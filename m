Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E1C44500
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aq1VM6FHwLZe5ToTeYW9dBoEjv1tGS75U+10hXBesUE=; b=XVYjMhxP3Jztub
	BfWB7boOdhCLfRF4Qk7RA4hyB9chzuIs8joabb3ek8bQbsdF9YPv4gkzJRqwkqTQC/wrCULWAyoiN
	fUqwnZYL76JlKxLWShN6QtDYKQgPgjn6hi6eB0PKqzxWtPAHMDt1t84BnIKH3qZMZRpYpVLStS7r1
	tBnqzgoms2IU1zlieSMtqZ4+ahfPvcdV4eAhKApUMiSuiJI2b0Kr0eoXIcFwuj+qk22IT1HDHmxmo
	Yk3XXXDa4tpK0WqA4fU5D/aeSy9msIkiyW2ucyG18b5TiDtssvTQXmYmn5gxiqtHsEqtNP/nTy2dc
	9RtYBNheElmn3Y34rktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6J-00000004F7p-1BHO;
	Thu, 02 Jul 2026 10:56:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6G-00000004F3w-2A56
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 10:56:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c59f740cso3620565e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989814; x=1783594614; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhPyR/JHI+8SvwQdakUo+27AIHgXTbajazll57qRqz4=;
        b=bVQZtecAoz59RM9gKdj8P7xiCWEwHre3uKkfK4+thxPyQnR1usFrZ43wOQ7ugDQE+B
         nAHGjFKKAMpvYHFPtbKyuDD9DaZa3H2dwv5hKIWb5B5QFzYIz8ZbX8PvBAFbjFNwY8nj
         dLXXsmHWygB8bKMPx/Mdf8Jhkobj1y94LsQZYfGQxowQNs5lbY99s2QQnBa8xdGg29Ip
         Z8oQq6HMEdq90Q+0XqLlmOvJ2Gqk0FZiu44y34hnHd4BmTorPgF4VraUZK/Kwi3ZS5xZ
         7hHGbdWzQqjX6VeOX1nn5mqLCjPeU7LpkfKE3GzNoxDvzfzO2V4Dav13iTFfQ4wjMlhK
         8wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989814; x=1783594614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhPyR/JHI+8SvwQdakUo+27AIHgXTbajazll57qRqz4=;
        b=TnyaF9agDOFZ2gc/PCNt8gkHzzoazltQOQLBVyTRnDT38+NlXwEmQlC1FpRX5aOiDX
         4g8c49JXjh6348ye3VFn8ZZ8iahUf1Hfxw8lFJgyE5GlMw+StB28jJnt6vXdL74XNt+G
         iKEsrFO0x335h0GYmq7VebyUX2PdK+lImpA2iSA/aO5BzGvGfe4QyeM7Tct442jOLI70
         Y2xfM38i9lQKuN7Lhx9BCQ1sN54EX43EZfCtiMgiweMojNlKP2M8Sj7VG0dmT8eqvaZj
         aqy2KyPr0BlMHTOxb2ETfnL0DAx1ZLrNRoAMJZ0zYOcbGhzN26/itYL2NL9dRcWBX/8b
         Kn3g==
X-Forwarded-Encrypted: i=1; AFNElJ9J7CP9ZAN+hc81FsqnLQA+vo4p3YXYyiuUMgYATfIYInW5QUXTcrMnUVrHIz0pL6uk1r/0siX6qdY1WQHV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1f1TZo+FV0F5nIWEk3oWtaiFLstNxEaJVOTTTH1GrG4qXEgm
	4JWpFTGizByg5PqHtmeKG2vne2pypxwdtxw8FvYkN6Kv+ucLlcLXL54wiGwUKSY5k5A=
X-Gm-Gg: AfdE7ckc7DA3oRJi5+wiZDb7BSBkMsePpm/XpRq1nF+wcymy/1H1JPfZ5tzMpi7OVI6
	LbaAzmC49fg8iyUy9/5tLvtKwF3Gl+U9FlhuDGLca64rS0rc/Pf+FZv6HNCQHTInZudTrCjrsxi
	VIFgQ5zuT6P19KRlHyWFUJLKHF1pFQd+DhX4ybfUZqiCwm1GKVgCPxseNuHZH7l8YX+Ig7rgMzN
	yrv9xKPyuLBvimjJo8TR4AJHaorxjOEaX/0zAHcebyTMOe386UKauheqUwgrk2xrKwXKMCpW8da
	obS6mcwyNxvnRUEi5E+Fm0rECvt2j5MDbcV42XnIDzDeOtwAr2gj2LC1K1pb+OLFBUBdxWFJDyc
	BHBaa0pwV2ek93VGuB6AR6V2NPcJpn1+o34o6MkNhS0PM1ulzPfSSRkloaNSAh2c/g6veq7j320
	GW6vAgHrBL3Q==
X-Received: by 2002:a05:600c:34d4:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-493c2b4a99bmr74553955e9.11.1782989814221;
        Thu, 02 Jul 2026 03:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:53 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: aiu: fix playback issue for 24-bit mode
Date: Thu, 02 Jul 2026 12:56:39 +0200
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOdDRmoC/yXMQQrCQAyF4auUrA1MQ+iAVxEXM2nUqNQyacVSe
 veOuvzgvX8F12LqcGxWKPo2t9dQ0R4akFsarorWVwMF6kIMhBf7IDFmm9DIcXymJSd5YMfMbWS
 J0keo77Fonf7Kp/PfPue7yvTNwbbtWmYAkHsAAAA=
X-Change-ID: 20260702-fix-24-bit-i2s-playback-6444174c7cd7
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ZGpbg2z/BcDMR3QWPvQQyG4U7Q/PzwR7ljHElEr4bCQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluzl/szCo/TP5e//H1mz8NC19vCJVoclxsM8nIlLln+
 aa1+54u6ChlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEMkoY/pf27ao5di34+5sD
 1Ruf7LCI1FtXNHnl+alRdTyzpE1+i5sx/E98VLpAXzz5tGu1qq5K+OvXR7UWSwQe1f75JuaOzW5
 XLlYA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035656_577924_C6636E9B 
X-CRM114-Status: GOOD (  11.70  )
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

A patch series has recently been merged in c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one") which unfortunately
introduces a bug in 24 bit mode playback which this new series resolves.

Among other things the previous series moved the content of what was once
called 'aiu_encoder_i2s_setup_desc' from 'aiu-encoder-i2s' to
'aiu-formatter-i2s'.
'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset happens when the BE already did it and
started the playback. This cause the 24-bit playback mode to be
corrupted.

This series:
- re-orders operations so that 'aiu_formatter_i2s_prepare' is called after
  DAIs' prepare, but before triggering them.
- removes pipeline reset from 'aiu_formatter_i2s_prepare' because the
  very same operation is done by 'aiu-fifo-i2s' on trigger.

This series depends on c7852d2dcf66 ("ASoC: meson: aiu: align I2S design
to the AXG one") which exists in 'broonie/sound.git#for-7.3', but which
has not been mainlined yet.

Please apologize for the inconvenience.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (2):
      ASoC: meson: gx-formatter: prepare on attach
      ASoC: meson: aiu-formatter: remove pipeline reset from prepare

 sound/soc/meson/aiu-formatter-i2s.c |  9 ++++-----
 sound/soc/meson/gx-formatter.c      | 33 +++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 13 deletions(-)
---
base-commit: bff7fad1010eea6f183fb110b54171cf8700ef8e
change-id: 20260702-fix-24-bit-i2s-playback-6444174c7cd7

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
