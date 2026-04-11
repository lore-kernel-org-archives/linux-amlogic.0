Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E6EF3ED55
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXKS7RSAAcSK2THNt++93tglkF2+RUukvF0D6z+fIBE=; b=cw95r3NFtEtpTk
	TeZQ0VOFvpK9oL19IlSpVV38zDZ65Hyr4aTdGxld5gz/tMFL1+Gx0oXotJeR5DM6vOGHIielFx9Wq
	ONF5bPoHYj/SdYxOSXTJGCsH+qnro4iTYQ6Id/6YiGAh9QtDRuyopO0vD+eWZx0+bfXQUgLsFDwjN
	tsHujMk+csGQItXjFFZdH5OsT/1f5BHYlYQhs/HAw0nnyIiLTz+ih7fwwYiG5WcaR3B3oWkGjFxcu
	eu2dtCiiQQVNj3tQJd4POsg8UIoe/MixqXzKp0iY6vySotcxHJT4vjDxKhJJrdDmtj57L/twgSrLp
	SZkK8wsCwpXRsJcyauwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZms-0000000DXuc-00uT;
	Sat, 11 Apr 2026 14:58:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmk-0000000DXhY-1sDd
	for linux-amlogic@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b8efed61so27352015e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Apr 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919489; x=1776524289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=ZjhpH1yd1wnuYD+0v80UAQKbEB5/zs6Naq4QSs6r6TKUVstNkGsafirABaEr2CMiSD
         UIHWfCCqrMeqi3tBtzQyRtpfR1hXnEA+z/t+c5+KlI+qrw3Rn69BE8TgzIICKcpk5iHK
         kYojgCyT4kjABtxnokdm+cNbYTN2boZ7HTJTVocdz3VpJFkVdEaxrGwQlXd89TxNY1FE
         h5SyI3YmmmF5lpabDCbOUq0ZqvDD4pRI6bLQHcJf+WcUMRPf7IOHIBhETt7yQoeIvonj
         YSUhOVsINQ9ZjQ7H6SV8W6q5L6sG+WaB6HnovIhGgNk6zeBORI/mO2GSL5U6K/00s6cb
         E4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919489; x=1776524289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=iJM3+TmSGtGAyjfr0Oia48/pa47yFZ0pv5lnYf+kjV3GuHCrReAV1Vd3n+/SWE2t1+
         kfcHSA01p7lKdttemY2fWO3NlasjxcN30/Yxa7eSba3b2S7yXY4DIgyUR7DVF9Y0+0n+
         qT+IEvu03QWRYSnzpWwZxb3oRwIwe9+g1t5dLy5MfCeZY9rqqqJOC4k1awwmsmsuopy3
         YbKgKqGBkZLs0qZqOSSoFQJV4b7In9CuUQJfhxoAkIkEZGyf9VZSOwQ3ngxGK++k79Im
         Q8SSA5J08lebfxW36CFYnDkacMYOZl9qbhY4XTdiZ8+fEGDVMrpMofAsTckXX92KZMMS
         wHmA==
X-Forwarded-Encrypted: i=1; AJvYcCXWgWHuZeoh3qkZasJw4Q95U9tpQZjQMJMVuZrrpsEGRkRFkMTfdrQl+ilDuxOmvvkyRAL23hLzEiX3hoFM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiqh7yEWUhvfu+wPNrgqsAnwKBur8IyxU87xhuAoWCFHz6I2/T
	vIQMNyzzi1PZ+ECSx+yGtr8QFs9NHmRU6R4ZM+8o90R30QXTDvOUUBLuVxa4eucKJw0=
X-Gm-Gg: AeBDieva5NADhBvz0Mqdn9RCUIL4clSY0whysrjVIf/21xc//IZB0cTHOhqbPrIfS6P
	+Rw8529mMH6vdWU3NxhjO9a4jgksS6A/klktdpbnVzcBbXS3teMb66hfwVUuA+451dhcl+i5tut
	2swJBHqF2Xd12Um7iNWgKgyltlTzYohOXJkFLRPt7d+CpEsiF4GUj2cEz0bTlHRA82Q8xDU4wal
	5i8Uju+7Ch8wlqXxC8Shx09h/OwmFQ5tNelQzE9sbzFriG5Khn8EStHjJugxp+kN2Jr7CZ9MEc9
	jZ2iu0U4iZH3PNmFFBXWGizDTlc9Jp8/k2HI2xi3l2uGiJNfSolzbiYWWhj6pqkmPGrfKaWKBKs
	5E7h9AlaMmmYZm8rIcidDB9/+uSV5FOgi5rnm78BKmEE3GusOsSqzuHHZ0meprQp6euPSA3fZeC
	95tMueQ9g/FnS1T59qG0L/
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr87734405e9.5.1775919488826;
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:33 +0200
Subject: [PATCH RFC v2 08/11] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Message-Id: <20260411-audin-rfc-v2-8-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6j3v3mDrlDrlzFC6qKMxljaBySrCYlr4KNLaCiaa91M=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Ekt27DBdU6rFqj7t7+P5ibppX97/M9BYJ++QMKe1t
 cS5WHp1RykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACYy5SQjw6zSF59O/F7VUOUe
 +/OU/g9BQ5HD823mHpnc7d+7Ol74Kh/D/+xT3U9uKKUnLRd+JfJ163SuSvHNMh6CjbmK5ltFft5
 p5wEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075810_542600_18575A97 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Add capture stream to CPU_I2S_ENCODER. This is the final step to add
support for I2S capture following the recent addition of
"audin-decoder-i2s" and "audin-fifo".

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index bb3e0364190766ab4ce9ea3ebd313eecf220a244..2b6b94957b051976191d9b1e0dbdb4ca01ba2a94 100644
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
 	},
 	[CPU_SPDIF_ENCODER] = {

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
