Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D65C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Qr0m0oZdFizNk6S44K5B4Tca12blTawitPh1nMSwWM=; b=g+IVle6EgZ5uWE
	gMHBaBslhHu++xIwwZ2zStBXEqY5qOiD3LyTUWW72LFgaYx3YVMY3DiK4a1xpBKqg9y8dOayBiz03
	GQJG9LyCqXBESQBZr+HPWXAB1fEl3Sylfow/PsKQOgXPRYyIT3UbHJx9RM+JwLD3UEpLBHShcSCjN
	8RJOzcV43DDWlBDhQgjJgNrQtCMid1/lP+1aAI+jeysISOfy6/olpCbi+uUVyyhn7Kh6UIXYrWrin
	p5cBoWbFDMpeQdFQz43bMVRfo13QNjGiqRZZKIfr6d/px0Nhb5PQS46f3WbPHP0f8UCzdU/F98OS2
	nLdrqKQmWhSLL2YxeFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS2qE-00APIg-CM; Wed, 09 Mar 2022 20:23:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS2q1-00APFW-MR; Wed, 09 Mar 2022 20:23:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id hw13so7191906ejc.9;
 Wed, 09 Mar 2022 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=58V2fCGzsfqcmE2/CejONEbjJLKwqBAus/Kg3pGGFn0=;
 b=DTW0Cg0XQbj7eZyB2vytYdHgXI76DV0YL6Kw7gXv82AfcZibZ+Kd3ekPi3rwu/5gkP
 D1jhDgNU/KSarFjqcu9BKFzQzltE1BzWAO0hpo7RpBl0eCyN+nG/HdbSinB2a132d4iM
 7bKiQjYltwuw8IkqT2Rzfk/xKS7qsn+W9vJHSo22Z+3Nk5fB7rX90TM1iORek7K1VZMq
 zfjlpwZ0LdGfonW4bf1mdP08XaFfopD8IpAQiclNelX5cDzyQ8RKaaUeZeCQ+qIcKoFL
 yBrjmFnBpBZ3x1d2ro2woTt4hVjIfe9fTr68m1CCnvyinsGPaWsf2jd4V6d1yzqr+lfO
 iU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=58V2fCGzsfqcmE2/CejONEbjJLKwqBAus/Kg3pGGFn0=;
 b=rfZqLuxQSIVO5EFTzNbTp2MpDFFumrpT7zviLHilbcWcrlxvVhPg9gyb29Nh5590WA
 j77/tvMOR1u0YxmOa6WYWEEgWFxvN2M/0vJXyGp0Qis8W5XpkKKpXrKmn6SEsm5EOMKs
 Z6qmC050lVfbCKJTxsvgGJmzVO/eayj/INigJQLcLigGe6ybnIjJ0XIna2qiLlh5G9hx
 xlNLQX+uSwYGNo4ZItNg/0t83D8ShrA+/9j5U2JsqKIohOBgXMJoKb0/DHnv7tEuRHZI
 Ag2oUAhEiky1imP5lNZCankVLexFD1SRXqgnGLrF32OekJsMbHPo8TiQxhYfh9bVlAme
 2YNw==
X-Gm-Message-State: AOAM532OHqUh1Due3ausza2spx+1glHQ8J2eA4AJvRfnjs+wExwF7UQw
 HGGH6gBslZMnRZNhSelv5tc=
X-Google-Smtp-Source: ABdhPJw9W6C1dtgKkVtzTNA2p/OxN3Hn/V9XQcdDnA9AWe1lpB4wWU73n1t2Zni0youpz82qb78esQ==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id
 fe19-20020a1709072a5300b006cee4fe3f92mr1353881ejc.389.1646857391435; 
 Wed, 09 Mar 2022 12:23:11 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 qb30-20020a1709077e9e00b006d6f8c77695sm1101748ejc.101.2022.03.09.12.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:23:11 -0800 (PST)
Message-ID: <d18bff6a-1df1-5f95-0cf8-10dbaa62d7be@gmail.com>
Date: Wed, 9 Mar 2022 21:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: [PATCH v2 1/2] ASoC: soc-core: add debugfs_prefix member to
 snd_soc_component_driver
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_122313_795656_F53BC7EF 
X-CRM114-Status: GOOD (  11.41  )
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

Allow the component debugfs_prefix to be set from
snd_soc_component_driver. First use case is avoiding a duplicate
debugfs entry error in case a device has multiple components
which have the same name therefore.

Note that we don't set component->debugfs_prefix if it's set already.
That's needed because partially component->debugfs_prefix is set
before calling snd_soc_component_initialize().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/sound/soc-component.h | 4 ++++
 sound/soc/soc-core.c          | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a52080407..766dc6f00 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -179,6 +179,10 @@ struct snd_soc_component_driver {
 				  struct snd_pcm_hw_params *params);
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
+
+#ifdef CONFIG_DEBUG_FS
+	const char *debugfs_prefix;
+#endif
 };
 
 struct snd_soc_component {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a088bc9f7..11cb15319 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2586,6 +2586,11 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	component->dev		= dev;
 	component->driver	= driver;
 
+#ifdef CONFIG_DEBUG_FS
+	if (!component->debugfs_prefix)
+		component->debugfs_prefix = driver->debugfs_prefix;
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
