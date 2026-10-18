Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF72CCA490
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3Z4EUvehQr+61v6Rhaa6xusDf9namM9FUO/tvDbLFI=; b=00+sqXujiVMsHO
	590uM/1L8YS5E3l0znBRW5jCt9iX0BlpMBx/b4nekUIkDfSIEpgB1R+h2uOPH6Lu6x/Chaum1VUtJ
	X52Salv6aaEmR4q8MRJJb/VNkRWl3pYCIl7F+ua0m1PML7F5rEZJ71lHuwMiXMA2g1O+FQFYiPPVi
	jHAA4t8e+3TXkVT1BbAbtvzETxrz6zLQx+8ZVRqLguNQmKb7fI3FSX9DuM6O/wlc9UcRqRrYfkyhD
	u7pqZJ//8EYgWDbbPqzo/aapWh5jCOtMSl1hQ2Xf/LYtds+mH7klzp+FMDtLcgXlWnISBP6zF5Bzp
	LDdtygdN1NUDknAO8o3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyv-00000005jxd-3t8y;
	Sun, 18 Oct 2026 10:19:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyZ-00000005jhJ-135w
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso925287f8f.2
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318725; x=1792923525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=eIe9lIl2aW4CkzcQHMERvQr/Sn4XyhgSP0sTY0jn2dUHC6oe9Hy2Xds5mYTbzxmopM
         V1fa6Z/6KwoLy5ATKFqQP4DOWlrCWQ3RsBZtp2DLr70V/voKT4Y4XNXTvvWwsW6pdZaW
         4un92pqbe0ryXsnvxPMBcHAQ3U3TObgvduZe5VzvZFvNZQHvYUScgXYAI3o+7Vhkbb5N
         xNXslF3XnjtNyPFpWQGJDnXwgzE4n7FmqUVfhGyHC9uHaPy0Awz2d8kDmvMF7aruCE14
         bLLp87fUOgILBmQlheR66G2FqwiOVMXfJaPZo7fUUy2Zmt0FoS/DvUMiv7fYdgw0jShf
         07Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318725; x=1792923525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=hLNhF+wMGZvpsQ4c5yXUODXZG43XqSmPszBUaH71eqoUHKmh6MAT+6AFGGcNsXKhcR
         K/fb/OpgmtI22K0V5JTnGR9oAEt5SEFbTlm/51KxS31mJzW+VKx2TiY/Dg5r8v7byzcS
         LQ4WoYHVHBSjhNtc8xgjyZyg0ZLyclunmstMSzTgVpqa3zyVt4MIE2MJgWSFegMhZTQZ
         zSiLaZBAhSQXHy3Yx+sONGjwA7KLQGOi4+HldqiwIT0ZCV6GPeNbMerfS0K9LgTgRPEd
         ZumHcbFONGAlbPOT0TXLUdN/tDLR6WspJLccDSunGxPCYmZ6aWqHL+wo2comxYE/oleb
         7zTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzireYd6pQB8lyWYGTQOTe+i4hZlViBlzhcGBiUL5oJZUPlTZURDJl3wyN0WgmvIQT7WEJWXk19a1rACXWn@lists.infradead.org
X-Gm-Message-State: AFq9FYL7vGPGhHRmjjJyHRY45OWOWTIRRqof/gFCcwROCJ/RzV+vaOQH
	pD0LwVFIXjeuvF8KSwXaPv3oB4E38IAZz3m0MYkmTmeiUPK+HZCAOjZRFHytvowvO1xQ9447HPJ
	g2ssAuVzE6g==
X-Gm-Gg: AYBFou1bozGnXYuW82NGA8LPTiFHV0VT/c/o9Ty5YmlXvQsFdz5JL2PvaoBoe9JmhXq
	Kc6Qsltf0snd8GLnuKbDC6bUNswEkQggS/9fOjRtdJyNBBUZsmvD0+WHqaPS8cLPkEjkSHaPpPP
	UWADjxM6xYDspL29BTo2nb/GQRS//qT3G+h2oxdF6KeYkUp552361HBSBBQv7wh1o2nhkxdaeS+
	q9vgdqeSyj6lK8OXNiSh1ByHMqwgM03D75zLQAAcjtP9Z5h6WkeQFnBFjKHZo4S8rufF8i5btjR
	owR9HmUkjp1OSiIsKNxlzEglQSB39T9ZfQZxXTkRWsOONg3w/hKVYKOiXcq3XJ9CLhBpSboVcjT
	2DksQkEY+oQ6oc1A4NM4wTFHcmqv2bu+aq3VAqKDaOHZV7I9vaQyis0J/Yj0FHuh3MtkjkuD9q+
	43w+baVWXG6EYhj81EBiNvBvV1iQNfd3IuAuvAMPoaizl8KBxStIPo9CJ+LEuCGamrYPpt
X-Received: by 2002:adf:f8cb:0:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48e07fa40camr6081304f8f.48.1792318725277;
        Sun, 18 Oct 2026 03:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:02 +0200
Subject: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Message-Id: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vyW17Gfsjqy4bPUv23K+y0TruzSyPMN/cPRHPJpH
 he3cuP3jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzkdzDD/3RrjuULFd6EWv53
 Tlg6c2rKc/ew30zM51b+Xq6xncnhIRsjw7nwrhuaopp80cpyRxwWhjfulVuze+urLyzTddOzDAz
 auAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031848_992720_363CA6C3 
X-CRM114-Status: GOOD (  10.84  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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
