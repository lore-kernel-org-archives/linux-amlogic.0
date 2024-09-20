Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82766CF9C5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kUxDE2UwX81qrOri1DOWuZel6D+1Io6WhEa74Bq+oJo=; b=lVHehuNuSfia7F
	KXhionEHkviL3EJHX009Tw5VwKDDzfRN6F9iBkxXz0i/aff20d29EUIgm07WY607VpvgH1v7eP7FF
	Mpp+I4fx3VjqazLy6736jOakMnYoQFZ3o7xQuNIAnebnoMVKY6CrN05Y3tLot7K2Ff8plfVx5YnfA
	J+hUqG1ZXR0mXwgKRSfZpdsmGeQdvDGSoO7Z/Dc+VIEs8xabqg//9Mcw9Q+7f4Hy1Q3riHZ11YM9f
	hJNys9vMBsj4LCzgWp+TsNxeJmEo4rSsF4/f0kZ5j7HpfARazL6lDEa3lQyQP065fvjSwy49kowDw
	GiJlH78UtPSGLGUJmPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srhKe-0000000CgnQ-2JdQ;
	Fri, 20 Sep 2024 17:22:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srhKb-0000000CgmC-1vZY
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 17:22:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-374ca65cafdso1320473f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726852927; x=1727457727; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WyFAU3gZP69K4KqX0oXP5fhiwrGt91LVaFOF0C2rxA=;
        b=3GbzQMnGTyk3xnoNUFCwgpvVSYQEog4h24Hjv7/p3nthgB1zia//O+rLbEswQrw1og
         wpwITuNiRMUEjfwRAeL/LUKDca27CZ5liQ1iXU9c4J+QprxCrlvsR9Psk6bjRJe+/DwM
         99DQqSXQSiXyAFImztpyHU54Ux2AHk7c9jzVVwtgv+fOm3ysA6mQTUg3H9DuKMx1QJ+r
         sJnSzVx3pHI3URC+RcBDgQFvps4PJQOFZ8rlFBpL7AqnjrF+xzTgzACwZXodUHNMkfuP
         uwsgH6qBjD3DKXt+Gp3SJ4uP8MQm1o0V/EClEk26ubAThzfPDgEoJEdDBkwynL38n63x
         2Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726852927; x=1727457727;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WyFAU3gZP69K4KqX0oXP5fhiwrGt91LVaFOF0C2rxA=;
        b=WrvNy+Gm51jAOF7S1CCU6MwE61oTjW7ePnt6VjQ+t8s7gqcGTjHszqfw+PWzW7aMYu
         9L0UCG72U2VqslfsrW000+B9NKVyNDjQ/phUImvovE67UI2Si/JwjMDtZMbzGb1ErfdE
         ip6NeTdDZvKBqH0MCKkG5vGuBBhuxHaouvc0LFoW6Hbyn/PfiV3c9KfP07ccCy5o9pkq
         oFJyRIr+VQVW9xKteU10v3AM+9mYwAbIEbdiOMbcoHsjdz7QPTpE7L8aZS7wL69kRJjS
         TQKi4utdH/6dDC9Mals21XQ3hq5ccE3KoXwnCT3rHedylPTXz0iIIwvfepmfLTEBYYfK
         K4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Z8GDuQLbe6pcTaPaIBknVO8AP/jF0rkcrCvXpsuCpydrCtkzvYdL+mab81rKdazQJgkvFDIbIOQuo/zb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzml+ZHqANF6ZNhmuiujxDBLwRPC/Fl/b6tLLP89o+dad/n4X4I
	UXcLe+la+uNmDNPOzs/60h/t8QbFLD0bN7CFTAkaioXljrzz6B0UbcD/M8QoXyEwSAo8AtnN3IQ
	Z
X-Google-Smtp-Source: AGHT+IG7KNVfLQ90kEjbHLvaQHSRq9HiHZ+WNfDBFH1yjqQ1U84p9Dmob7LgtM7MyRrR7k9+SWYCNQ==
X-Received: by 2002:a5d:414f:0:b0:374:fa0a:773c with SMTP id ffacd0b85a97d-37a4235a6a8mr1830952f8f.47.1726852927493;
        Fri, 20 Sep 2024 10:22:07 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e72e4b60sm18110432f8f.24.2024.09.20.10.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 10:22:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 19:22:05 +0200
Subject: [PATCH] ASoC: meson: axg-iface: set continuous rates
MIME-Version: 1.0
Message-Id: <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADyv7WYC/x3MwQqDMAyA4VeRnA10XcG5VxkesphqLu1ophTEd
 7d4/A7/f4BJUTF4dwcU2dU0p4ZH3wGvlBZBnZvBOx/c6B2SZUaqC2okFuSc/pq2vBl+x8CR/DM
 MrwFa/ysStd7vz3SeF22zkTZrAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XuRTGQdHsl+o5fZjArZvReYmvRnEztE4lrWGf0F3hAA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7a89BkCMGZ9R9vS12+/O4OWsWm2IeNTlYXTjA
 OBEK50SSiCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2vPQAKCRDm/A8cN/La
 hUUKEACdGs9IkUiuT3NuUdcgARGZxXhvgtpDwX3qH9I4Bu6xiQy6gckFPpc3CudFn+265183SsF
 YCRsK6YHyVos8rAVXQiEEeqvibbaTBX74GR2QRTYGEyuRYxLsfQK2TfNQEgqOIn0271Bem+Dxjz
 cLZLovFr6w3xJVRal6Vqzv1WaIut/FooIAOhtU93WcqmOJFY9jtKh2LqWRFRKsLKfI5FxAMsdhd
 toV9l1uo5+I9Ie/heDKE2ZJTXf6HKUfAG04eKWLnQ2AGvcpZmbbZU34JiuRr3HKmbZg2Z7YT5Ta
 4nkDhfPJMggVClHZAAvLXFjQEOhdWkDB12anRG+v56jhW4f3gwWHS8DIswzn65BE2O/aT291a0s
 xwe10pn2FzvqoRkFbTUprKnfkZYR9iM3kwPik712VgkIvAOjQdggQ1YHRUrl3+3EoWI9pEJLjmG
 zW/HLr0ajk6V46YL0RWPKDfAdsO9RaN9B931SQ34uE60YB+ik28WhY076G5mMP0wwZDPPtvzcaQ
 3s1evkSxNC+Cz52yBMS/YlBJzBRWudPzFSq7rdSmRTMqLSHGXl9B77Q7RGc6c9gHxMGlwPsjREo
 n2jLti9zZFAmonNzSZCTRoMYbUQz+x/v6JMIVu+HSsJw/fCSq35gpBxKdQDiNzrP5TUE0jyePWm
 mm0bVeF1h6JYfew==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_102209_538565_714A7598 
X-CRM114-Status: GOOD (  12.77  )
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

The axg TDM HW does not depend on a selected set of rates.
The hardware itself, just takes an input clock and work with it, regardless
of its rate. In this way, the rates TDM can take are continuous.

What might force the use of specific rate are the PLL available as clock
and/or the codecs facing the TDM HW. Either way, this constraint does not
belong in the TDM interface driver.

Allow any rate as far as TDM is concerned by setting
SNDRV_PCM_RATE_CONTINUOUS with an interval it has been tested with.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 12 +++++++++---
 sound/soc/meson/axg-tdm.h           |  2 --
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 62057c71f742..09103eef2a97 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -442,14 +442,18 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 			.stream_name	= "Playback",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.capture = {
 			.stream_name	= "Capture",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.id = TDM_IFACE_PAD,
@@ -461,7 +465,9 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 			.stream_name	= "Loopback",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.id = TDM_IFACE_LOOPBACK,
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 1a17f546ce6e..acfcd48f8a00 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -15,8 +15,6 @@
 
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
-#define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_768000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\

---
base-commit: cd87a98b53518e44cf3c1a7c1c07c869ce33bf83
change-id: 20240920-asoc-axg-iface-continuous-b94cfa234787

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
