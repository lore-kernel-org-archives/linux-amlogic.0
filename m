Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E05C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1F8ZcWHPRquUxDP+yKwwd8HG2V0EMdGRAr3WAGqI00k=; b=m0skgTCr4rmEfU
	nyptZHpN9lBOCMxo4NY1Mw63y4xU09OH3bkJOO/TM6iW4stqgYmtbeljf/md5UBv39quRNveGvpuL
	PRy//m9V53+FWzYPFy7Du6IH2tVxcWZ5289tlo1kQ2Z3qonCspgv+2jOZ2imQfSEJ78TBoSTOWmH9
	d0FVr5QdY9t05tDkE7+zcCnGy8sxJ6q3Y1e9kUJKsZlnhj65joUz5UwPBxTjpBxFR6PfE+ZOLXw2z
	hq3mtWlYqWamYehZF/I3NYxTEoAnUp+8nG14srdXCOz7o0lllwww91j2WN2P8X7+nhe/N9zqOg4BU
	m7RD/RQSQx6Z/gZHQb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQy-00000002Q7Q-3qW2;
	Fri, 14 Aug 2026 09:42:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoQv-00000002Q4w-1CrE
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 09:42:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cacf197759so13214325ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700556; x=1787305356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=h7Gx++zj62qgc/qr7qMjnf1d+juml+RUH0A2kkIfbuxMF+c+/VyJgfMzX0lrD6f5yR
         JS/W/tucjr7jFfhoeJt4zttn+cYlKf48CbiA+YUkEtpvr8Le8T0Hc/+c7ZfM9jF3tVqB
         lpvdI9xLdrsfeVtPJVYTTovg6FyPF2+TmohIT4EO/y0ii8/GZJUksOaYkxQ5fQQGpCo8
         JKsVz0IFgZooXp5CCrW3glkWdoTYiRPgOEcqc1zR2CUxEYk8xW6VQ+Q0FUwN/7M8nQUn
         Pl6ZZa5za/FVGS/iIm6yFDAn4vcRIMXSyQRCDUL7T+x6RO/wZ3zmffxBQR6LFA8/BNJ6
         riXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700556; x=1787305356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=JWFZW30le4GGDg3mbD+ePVZvmOotI0mOxD9vBjet8psdTcLrSw+pmRqLz1OOd7Qc2p
         iNg9KcLopPtZHg6CdRSqTHi0LzJO52gpGoXsYNRwrfkcah7JPyMkUVUcKxFjPeJFZIpJ
         A9HVXlBdAmn/DhnYHCSUBGVRrzLPLuyvvJn/fFRxXmq9otBqBrcVppSn1qBgq2jSYfBE
         Tdnpl0eSHmwi1ZOv2Rpoz6K6vjINp8qs7sHsXVZFGQ2yVdRaSLwMFPxllZFFkslnHxmZ
         cM2/AAz7KbUyEACTojGRqSYexvCUpRawTeo2JYpCQ+j8bUjsihOQd2M8OSMfP08qpg0W
         ZHbA==
X-Forwarded-Encrypted: i=1; AHgh+RqNy3P36eF/Jqy1XTVR8swW35FtGvcUOqEZPReCsMaAfuZcwExIrpYIQdBDq9M9izHU3Nv2/cuJuoBTUWCM@lists.infradead.org
X-Gm-Message-State: AOJu0YzfuV4fqGjfcgMxlwLwMhOHITHlHYmLIDEy9WW09cRO8VMYvb4A
	QJXXWFUVb5qYhjo/2g+n5IZ0ECxAZyOY4tDQ+Plhln0uiikF/L7XsxFK
X-Gm-Gg: AR+sD11BcEbdnzxMIcDLi5/U+m4YmffF1zCIR9VJjsWxKdHAF0KL+XtbPeM40NL9NVp
	sV2R95d32RAcqrM8a8FqsLWyLWOad7M5zu4YstMDyhI7DLyclgyLbYHw6q+DLJda+ek16Do81UY
	mZ4PtOXcZ1dkQ1JO/RH97DkyJLi64Qbb9bJOuenZXaYqpjXcnFkIqOYMMonQnAgMTP7vFBmuLWH
	X0ZP81pNZhpSWM3d2XmF/ByQXjP05pRSfDaX4E1iAMviX/cb34kXei8AtzAna9TKUkdqjt29QZ3
	8yeEABQCw22eho1C55hvvmz/cQ/gpyLmpN8s2qw4NP9XWQmXnyJ/bgwflM7HBThBYx75kIJj/xu
	VQGlcrSG0LTRshT1Fpo9LSLqDEg3U1Y/soOBerda+/93kQ5NuzZQSpMhKZcc9FGH+l6yq3SRJz7
	rrQ/TzUfrUwD8XQPrjptNN2CjgSdtL2Oji14PKc8SYSYGOH3fRT4/7iOjj6uMC5Jm8STCRtSyJ+
	ncWRh2IkyDGZtXJEkD5eHTdFesC/UdpC0qELuuYcgp6b3z7xHTlT0RQJ2ZKFOIgP1DXxtqYOUV0
	/xA2
X-Received: by 2002:a17:903:1a08:b0:2d3:7887:7e7f with SMTP id d9443c01a7336-2d3b0c5de30mr56550695ad.11.1786700556062;
        Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:10 +0700
Message-ID: <20260814094211.25151-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_024237_342164_81A3D816 
X-CRM114-Status: GOOD (  10.93  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/aiu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..2ba61e2f703a 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -242,12 +242,12 @@ static int aiu_clk_get(struct device *dev)
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
+		return ret;
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
+		return ret;
 
 	return ret;
 }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
