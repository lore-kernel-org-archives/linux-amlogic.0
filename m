Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51BDC98307
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDzScwBS0izC88gYQm2u2juQKGOrw29HMjq+CyXwP4w=; b=r+nlYFnO+1zyj0
	q65mrlfHfNsjX+RxFomG1+OAD0R36v38HU3mrfpldPNGYVg7e4NKkDfhpNPNc1gKByVE2e3fng1vO
	/lgPQH93bUZsI/t/FU6Fw3OcB7mAUsr0L52EK7v9PBDAvWHJbXqdqDJP+xZtJuaV63pAntJBa+eJ+
	hNNIWld6kRTbGucuVXb+1v6J6qgCch4gL6zcabpU7K9yvcoXqx7MoFG9Vj3mB/6Hzq1OSD4FTgLU2
	+G33TIWy+nso5zfUI4g6ejBdCVfLYoybv5rq9rYGmaBzDLOj0C4jMXIYG/V1IP2GPAfpVWS13Fcu/
	ioZTxQ/ToCOG0wGi3s3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wN-00000005yfT-2jX1;
	Tue, 22 Sep 2026 16:01:55 +0000
Received: from mail-wr2-f12.google.com ([74.125.225.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w6-00000005yXI-3ESw
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:39 +0000
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so64205f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092896; x=1790697696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=B6q7VDxBnKhwor/MPGdoMX8HV90Ubn7xrD1LzAMjQxWOLDZbdqf32/OHvjqjFS6RQB
         PWd+ToMstF1S/Pohyff717V59ZzpInU7vnxzWtpAfNW91/VzNVfSZF0PgE5sj4KXgWX1
         NciTpc3+xTipPXDzvnp7LHGKqOGOc0VKGpTfaYCzAqZAXHJ1y89Cl7/nYwOG/2M49jXJ
         xeLVftqAa+Y0BjyRuW6cnqUmTj0jKsB0s7DwtaEv0yJHJm6snQcsYTtIKi/sjmdn2CJc
         KB3A2spoSnFfngTNm5406ixE/GxAVCqw/31cNdZGBpXaoAk2X/xwyyRlxqgjmGPvIWdQ
         /RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092896; x=1790697696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=JDytW66J6euwGjMF7HqF/Ui0Muuehat13eGOUeaH3y/2rY7KTGfkvXCJXTfqacCtDa
         f5mJb29Ck35fTnKjKOnHuhzmbMwO7BCP1P0uVRKTdy1qALly77+B6M3jO6pIepFvYemH
         W5+rGiOxVzWNX7WyK8RIK/ieZ2aZO+MLkzYJxeZVPq4nZL80+yo+KcMa1EsudND/UK8h
         vK42ZnSVLqQgZR75vPdKPtBudkgf088hbZ+2YRcaoNi8wR7opk568fHvZCdVD67jDV4e
         HHzR3HIZS0+rhULNz8yjo+3RIqSdP8QL2eKX13sYmf0WhV0Ph51ChJsS0gvC/ayoDsq5
         b4QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjdK6tZSHeynurpimUWcIU0HjrkdYxnRbOwSCBsxUAH0uuyrkJwqIsswtpzSbpS214mc61qB0ZME7r040W@lists.infradead.org
X-Gm-Message-State: AFuF++mgyL21ufTcz5kGpQgezm63kQwhIv49CsUxe2zIGSUQGsJ93rY9
	3UvrTOoks08NXCUbcp26XgTfNLHfcGjLLfrvUzWaPm3klvjsTEFLapdjtXiv0kcxS2Q=
X-Gm-Gg: AYBFou0ZzTVA9c5SXaf3DjMJM+qUBs/RPvcD/N9NxeDXqxUo3IFQb9cULKnpb1EZJAz
	iB4+/pc3IBNGQwp3lsn7nzdkn7zByG03AAlabAMddlgx/Nml4CfIygnsqpOhpGDaujy14xLqje8
	6qu5EiVCIoonJ6OcE9z6eTMunisjnYcWMzmbCV1cxAq83NS1ZBe3Vj69GO9EJUWOPrFNzLzBujU
	SBWvz7LqWI4Td5gnmNzYOEx1LDfiOO2l1+XL8ffOxsjUCBo06xsS8IOKuQbEMbaqWxDFNuyj8gq
	WPpsLg55fIwxUZi+tIhVzv/s2vsitB42c1Sh8/6vSUdCYEiLxs/IT7sAHsPRTjQxQKTShs50z/z
	F37jFp4dUM1lffK8T0kCJEXddoO9Y7tfyJFKIMcqVnHsatK55RwKWUQPrHiFZKKHE1evViuKDSw
	YNfGGmNHE1zSoxw0i9N4NFuTCOwCUOWUEysq5OBixAYMiupAyDdHOCWJTqkx/PsnNRO6w=
X-Received: by 2002:a05:6000:491e:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-4886708a7c7mr50365f8f.30.1790092896498;
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:50 +0200
Subject: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Message-Id: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkVtm8ch7b+rdEeF24O1qxX7Q+9OCG6Yalu1deMbg
 cIFkROWdJSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiURwM/10Pswef6OL78Of5
 qanpLsULSnRd7qvUHAub22fQI8gbZ8PIsG7x0a85R2YGzDt56vFKLyubu5IFe0KFeTfUH4mPtrj
 QzAEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090138_835163_8D50398D 
X-CRM114-Status: GOOD (  12.60  )
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
