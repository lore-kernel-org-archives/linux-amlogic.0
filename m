Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDE606A33A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpmVETeJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RGmYFh03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uPplj7KbexSbYrUDl5ZMe3TitDIPxBSxCyk82gxewxk=; b=PpmVETeJMbxXGLkrq3HRy9CcPW
	Ue5bhULZKXxvtAWGRtiT7c4gnswSKzTS0aFzy4tx4sb9kAMdpY0TNMjrn92/PB3MyAlzcjrooEiEg
	TeRTZBAfPhpLKw4sk3WqvkMPKh2YKLQIPC9Z6VSmImFvLze1G+BRsZyP9DP63XqYYDrL/4Xs6rTiQ
	5CfLjG0sbz+98ZD/xp15GGb0CDUt2oNLW/dD0/XxewzStk1iC//vLU3erlYujy1fMK8kfumjKStO4
	dUduRL3NBOKX5xwg0IC1CqpfDD8GtiddJ5rL5irc0Q4+EIlm2dz2CRWi3jgiCg+6WPqg2mVBwkM68
	c5Bub3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXB-0000000C8AM-2Sy3;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpX8-0000000C88M-47gt
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9715135e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377969; x=1793982769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=RGmYFh0370HhfZZ5rhzNx6hcIPYYDQxYKJr0NVkHCPpFatohS5DrW0HqLf2VaKqgjk
         mNFbdcQJ2Nd4o+ACGy3uU06VXMoZWi7jw03HzLBFbPjSASjgcNsB5KV219IdWhirViPy
         V1KFRSmJvRb3WvOJPSaHne2fiXwR6dEX6t7Sev1kN/a/23GImJOu0BXSIgqS6fVlX+OF
         xRr2yZfy/ggc7EQsHSVgaYE1kM8/1mDLxpSzuu3ZZ/raME3yOqPeCEyoKfZ37TqbrpyI
         j/0WDLE5/+O2VqEzU5zRuYAMHIuKqjPO84AJrh/aBC0+wmGQV+ZYERxvjTjjdLhp4NNQ
         6Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377969; x=1793982769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=c/L/iB/bRNRBJnpyFkvY9yjrEsVQsJtNRye9a+J4Ro+QjQABnXo3Dc5je9r7bFlYkT
         JLYvtJVCAGEs1/j3Trqiem7MbQzpMpDeGg3EdJ5ijr5tqEKGIDE2haxjHHr879qsJl9E
         WhLoj3xe4txBJoipwZT8L3mLZ09UQTs5+9qyYu730TlD39wS7HNHaNHhEkflaheMw7jS
         aoosKFmcLCCO428+jcPYRf6Q2kkgFuP37ls6lpBcNyPIMOHmIjO7dDKPZLmUGwXjm5NF
         tgMCOlDYaiSLihe2SZbAGoa4Co8wvKc7AtTKmCoJs/P4poKbmEvw5lsXeFuRtFzltWGq
         NL7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzE5ikQQ9ddnq6FMCT/ZmTAl4YT2YqvXuddfNYs4o7hMVZ6t5O0HjpCn6NvmEAl5tv4JPpUwNwx0yyCgGic@lists.infradead.org
X-Gm-Message-State: AFq9FYIRSoQTwYsgmeniQcaCw3+8jAgdVxFndKtLRumovGuPTprniaJ6
	afBavvYUpVkvVHCBYXRDKxJmNroKFFKsjI8nqEZTQeFEynyVCMqGM/Uyn6WJjJaqtLy6uk6xm4e
	xI2r/HEQ=
X-Gm-Gg: AYBFou3UJoj4Vv4NL48InjF2fcdL/oI17yhnuCKHi5IKm9gFWszyHO3xqjwlHL4QiNh
	1p16GFz1PIyd3Gf1q414uaotSVHYt8PJOPNm3mOqGm89JSkkgft3Ad7J66ZL/r1erCh6LH4FU+b
	+sL5w92cIXBUxhosneUdggaG8ftKP7cbntADfyKO6euPZAxCwpCM6w6QeRTlN9C8nvw8c2/NQBM
	5bYOXVtr9SbLYXIm4NdMNZokVS6pDqK/guWXVkS44YBWumomjc94okVtGuD+hqZIQNhpLzFrmmb
	1TWMimuojPOaiqtWtO3DioS2YbVYHziIo3iwccBr8fHzt3/ojNHm3DTPc1v+5CcHyxJtbVOQorI
	SRzQ+tx27sIcsa08Zn55qf4qx4z14N5ka8IxhldJiUKp9tw54xfN34jQe+OYdxbupP6zbUxVBvf
	l0/mMUptE7LmD8lyx36x17Wi4UqTQgTMmCeIa4GqYzkHnDMM3O482KTwKJgXN4A6aohurlD3hz5
	yoKGhrH0z7vwxnbkPnppeaywuKtp9/Jh2zOsv2mHvShimssdTrfISEXPlx7zEbnCsCdqdsBvj6u
	R0EZoURD2oxzbP2ArCvl/xL1/Uu5Fhw+ugJalklFBCFnRwwg
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64716115e9.29.1793377968735;
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm45130975e9.0.2026.10.30.09.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:53 +0100
Subject: [PATCH 1/2] ASoC: meson: card: leave the device drvdata to the
 ASoC card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-meson-card-register-fixup-v1-1-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RFe1Fr3NaxVtejZemaL7j5wb6r/Qt9kPR04MlhQsks=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq2bcGOyzGlzq7QHs65mvjjvKLVt7V/Jc+saPA+rS
 /KVXHh/uqOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQAT+XKckeHfCw+1YwYd73yc
 ly6uTff6EMXxOD9pR6zZ/iXVhyIet/gwMsxx9l7/94VQvvGk7R2Kpz7UKYtXr1U+sp9nDpOxd6b
 6CwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093251_075075_B3DBC945 
X-CRM114-Status: GOOD (  13.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

snd_soc_register_card() sets the device drvdata to the card, so
meson_card_remove() gets the card, not the meson_card it expects. The
card is not the first member of meson_card, so the links are read from
the wrong place and remove() crashes on unbind or rmmod.

Get priv from the card and drop the platform_set_drvdata() call that
the card registration overrides.

Fixes: aa9c3b7273a5 ("ASoC: meson: axg: extract sound card utils")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..3cdc73b3fe8b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -276,7 +276,6 @@ int meson_card_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
 	priv->card.owner = THIS_MODULE;
@@ -324,7 +323,8 @@ EXPORT_SYMBOL_GPL(meson_card_probe);
 
 void meson_card_remove(struct platform_device *pdev)
 {
-	struct meson_card *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
 	meson_card_clean_references(priv);
 }

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
