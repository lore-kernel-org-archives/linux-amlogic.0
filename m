Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E7C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyxwuMuPkm/I05srQKwCvAgNLiIqj4ub/b16A20d3bQ=; b=jxDXTDCa6Hzyxl
	3iGbuWbn3FKiIb8hB4U+mBrn2NPW8W2gsyzTaLDaOOM464oT2Kg+Qxq0BoSjentro1QIUAU23QFsW
	c9NnR15g1OfnW0Zhkw2xXpFjrq6llQyn2juv0ylxJaECXj06XzBMFwzoj3eyfEj4tJyWEpi1AO4Vn
	SVZ+AO5NkeubjyDci+9/RSDcNyXhN91pMNT5kevc1hF2EUF7fygah68lEdesHaR205iQ+KpFGay/p
	6NXj/AhO1aEUVibzn1mHoNi8pMLJX6U/LDG9NTPid1q+6tDbfWwxPNV1+tz4DeQQz8mokm15lGr5A
	qJ23GvSEWcNDcoW7gKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS2qP-00APLX-0b; Wed, 09 Mar 2022 20:23:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS2q1-00APFZ-SH; Wed, 09 Mar 2022 20:23:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id gb39so7618668ejc.1;
 Wed, 09 Mar 2022 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=NGVLTVFJsUCjubXSfriwHtfIwsDlVociFIc0hJBnwpk=;
 b=pqtjIe+ZUtDb1ZeuVaqwVq3YPbDh9rBJ4o7jyWzzNMQt0nHlCL4Wuj5VpJemji07sH
 Vf1B1wzDI+F6bk5VrPCnxIfcTUOa6+A/th9ruhGAPiVAdw6FIlTN87ic5wVM8qhQs2aK
 r74cazB0augzHOao39P1VzZcnbuUtXilmz7T4A6pQXaIfiY8a/0fOUNVmTml6eUh9WLh
 kIkLRp6KLWr/gE3g5XRVvuOv7zvaIGQSTN4qzuO4s9VlPfpVVV1n0DcRTFfV/7kbgAe3
 gmsXVwzg/hnw9U3yfK1kreuFVymSQyJq8IMjb03WOkkuIaK1iT9NsCzzGEuQOibTJuvI
 h6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=NGVLTVFJsUCjubXSfriwHtfIwsDlVociFIc0hJBnwpk=;
 b=nzz2wsax8g3s8R2cV7DO1hPDYUshCwH4D5/beXzWoj63Tua1ojf0pBLSMLka06Yjxe
 9l+K5+yZ6JGRRPa9osk8Ix7U59i27jiFUFdk9W+cBzke9ErB/eM2VVuBWkqP7ZTO++a7
 t4KPtvUlZuYQHsjzMMnTuBeTshXStTnYCQYZKb1+pydsIMz4DtntoqQfUdgxZkl2kwta
 /KnGBqBuGMUoFz9ok+9I3RwIl5oLeujt2xOCoIUPaLb9I1pKCSLfJe8m6OOoqVvFu2o3
 qGrLs/E+JN17rlhy/DxuAm6FNhSYj4MqunL7If+RZ91NPBnP5Y+80WRdqL+4yWELATHk
 2Oqw==
X-Gm-Message-State: AOAM532gmrpluMYi8eRVZwhF6GQiheTjIJ/cuRuDU3R30gI7nUbjHUok
 OsP5Xj6y6I1rUBrnMIikfHQ=
X-Google-Smtp-Source: ABdhPJwjwNyDz7Zhk+G5PJeQBhyjrdvyfOflLQPcu37GGOkDRuK7VvaTPqYNd6yuk4zpv9a2q9rHSQ==
X-Received: by 2002:a17:907:2d25:b0:6d7:c831:5714 with SMTP id
 gs37-20020a1709072d2500b006d7c8315714mr1411549ejc.137.1646857392603; 
 Wed, 09 Mar 2022 12:23:12 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm1143326ejy.207.2022.03.09.12.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:23:12 -0800 (PST)
Message-ID: <38053baf-c33b-7fdf-7593-99b22153a9c0@gmail.com>
Date: Wed, 9 Mar 2022 21:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: [PATCH v2 2/2] ASoC: meson: aiu: fix duplicate debugfs directory error
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
X-CRM114-CacheID: sfid-20220309_122313_981470_5E092FB6 
X-CRM114-Status: GOOD (  11.37  )
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). With the patch the error is gone
and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 sound/soc/meson/aiu.c             | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 27a6d3259..22e181646 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -193,6 +193,9 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "acodec",
+#endif
 };
 
 int aiu_acodec_ctrl_register_component(struct device *dev)
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index c3ea733fc..59ee66fc2 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -140,6 +140,9 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "hdmi",
+#endif
 };
 
 int aiu_hdmi_ctrl_register_component(struct device *dev)
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db..88e611e64 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -103,6 +103,9 @@ static const struct snd_soc_component_driver aiu_cpu_component = {
 	.pointer		= aiu_fifo_pointer,
 	.probe			= aiu_cpu_component_probe,
 	.remove			= aiu_cpu_component_remove,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "cpu",
+#endif
 };
 
 static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
