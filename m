Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C96606A321
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j0bu1Rge;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EeAC9zca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MunSNwI568XKYx4aB9AZfB1y4AJHpTfaKBsyEaTFn7w=; b=j0bu1RgeJj1yl/ZG7F8QER620K
	XIzqooxzFYD1AYPFqfZGXJ3UN9voxh+DByw4pLqEMqQ7EKtCNILaSSP/FtnTX+gSmFk6ysySClJIB
	g6EMjSlwGCxhbN/FJqHhtvWb4iovYrzp/dnU5p3BHWuFILDhj1W0EWcl2YuyOt6bs3vYiUtBDjY3+
	0/AaBp9KbfgUPwSro52aOEl55ng4q0hfEP30dARcE4ILyW/6kOtvJ2ca6oRVpKBLgEe+NRZwckshh
	g0OadMh6iRVD6SJerQ4om6tyvSpt6edQl8BfeMHaJqhCzhScCUckJWFGjkTfAQ7Ug/mnWYXUUproC
	jM9RnB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXI-0000000C8DD-0IjZ;
	Fri, 30 Oct 2026 16:33:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpX9-0000000C88U-1tG4
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7679895e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377970; x=1793982770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=EeAC9zcaUuNMtZvaDjkAcELuzSg6fr19EFpVxoaf+MXZ8aV9IPpwkDfb3idEF3tKoU
         bNjnVkmzZ5VBxcgnBbXit+aVEGMJDoCw8hI+eZVIT1e7otfe/IJi+zyRq/zLaOBhpgR5
         ZUP73s0abDA7vdpVWomVGeJ2JPFebOVsctMN2gEKr1w0ebnJqTW04smnj8rI0PAYUO9Z
         JhWS5JltZ55fx3Jb2GNSiC8blXuHeSgDVoPfMpTmKQOWb7udFt8fCncOisv3zD31fuEK
         IityCJ3rBApQyCwlQzIOOHdWB7/a2HC8VQeN71psKzcvYX4UiUxYoHU/beml472q9dY+
         1/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377970; x=1793982770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=RaFFY1C6aiFA4YSAGmxcrV/R7AMdzrQtP/jsojYynX4t3it03qPt10dZTxRJDY2234
         piJWrD2ZR42b52u6LPlwExx/cmoIQnG6tNK61I9H3M2Oa7lRTOJdfrMLRk/UxuxtK3C8
         KsHxaBvzkQ9PXmJi80ks5uNWYBKfZyMrLiQXukvt4GKnpcwq2CN96r1Glj1FitXmVHA2
         ItG0iilJUU66uq71dxwYoT9JZFd9nkv4/t4uH1E0uhi4nCsIW48oUMmPXm7WOpaNGU5j
         Bw8pNy34kywU8MhvmVKxE7m/SYcz8qJYapoH7x5wfrAKadmbvdwHta4gY953tzwjnBX9
         E0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxOZJz8GWqOBEslFohmyVTF/f4Z8U9ZWdn2Bw092pzdeTTFhBp6gVyvSNxYAXW/iH0KGdMhhl7auG+V0C8K@lists.infradead.org
X-Gm-Message-State: AFq9FYKTX5cqciK1fYG1gVVvSWqnA79c+laEyxyTrrsYfSNJi19isBYQ
	qafXUQFlff1owrPBZavA+ROuQILmqLl/L/rZZowCWS2k0NhXkYmb5cGcNtip/zPeQJw=
X-Gm-Gg: AYBFou3w0jFDwHqWpUFVmMWwPSw7FqLqAx/4WUCCHeR3TxjXnsvREYMoH7cPToSWsxV
	meubfv24uk5XAYVNKdVAnPVMZrAOX5mAzRDpL/M5nKvFEt52q0x04gDrk3Ju2T836mOY85feOMM
	kPeY3UalZi49TrC5pybff2LOXxA4f+ks9qPySBSZGOpEEIQu/W//IJPwG6ZAqov7FmWETmAfc+d
	BQbTlHZz3mwYtAdxhZBglwAZNqEwI+Cq4ZtCPF7/xgH5JrrUZTkJqazD+/Z7cBX26V1FPeYJJcj
	FV/l6fdN05aIiu5re0kjNRtc5bOjQMgVJWR9D9p2mdtB0YyHBKN5CkzsD85nxuUFFwauVGjmP/c
	qH+6q8w9uxerFm1sIweBMwF5HUX2Uc+Q9BvIDj+sZF/qAYofsQBvO88b4o53I3lPMcxE4X6+O3T
	JfFHGYqI43B+dJp9r9s47es9qMzUUyfRw7p0urw+3J06GrSlX553x9XK9ECPMQG5KRvqs4LfVjW
	SfZAYEyZKL7z06MtA4ahsFP8A6RlWiafv93vad3j+piWwTlUJx7Awk3KJVUgF9VZvnXLMjbomXH
	woiZPWDZjLE9arLu5f5jHLtD9X1sBbQoDuui80IleaLC8lJSvA==
X-Received: by 2002:a05:600c:8b55:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ac17b2b023mr70629455e9.19.1793377969852;
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm4062372f8f.45.2026.10.30.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:54 +0100
Subject: [PATCH 2/2] ASoC: meson: card: unregister the card before freeing
 its links
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-meson-card-register-fixup-v1-2-6474985e94f6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MbVgYLo6a0sH0b1W+GvzTE98oQ0+5OC6agqIsxBjCpM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq0Lkf+sf85oVkmvYbuC66yvHz5Vc3HOvrCEzd/If
 LbFjofPO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRlb8Z/im2TJmvXdm04Wfk
 zt8qz6atM45WzcxKkM82sThy2XpD8EdGhhNTdi+SP1rUmtsY1C7j1bfppaDdlW5mD7kXm0uZKkN
 lGQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093251_517826_D08653C3 
X-CRM114-Status: GOOD (  10.42  )
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

The card is registered with devm, so it is only unregistered after
meson_card_remove() has freed its links.

Register the card without devm and unregister it in remove(), before
freeing the links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 3cdc73b3fe8b..24332f29047a 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -309,7 +309,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = devm_snd_soc_register_card(dev, &priv->card);
+	ret = snd_soc_register_card(&priv->card);
 	if (ret)
 		goto out_err;
 
@@ -326,6 +326,7 @@ void meson_card_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
+	snd_soc_unregister_card(card);
 	meson_card_clean_references(priv);
 }
 EXPORT_SYMBOL_GPL(meson_card_remove);

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
