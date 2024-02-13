Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E43AC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGP1+O8AvMgEOgwk7/XtFC7vtDHg52PHcH3cvGZHPt8=; b=FWVY9Ui8n3zd3U
	+pctaHEzVqDhD1UfJI//2zVB/eqTlj86dZCZEq7sWnDeLCuOLelKl2bH+em39eKfqT4Ki4qpbk3z6
	7dPPCHAnmpZRcwS2ukBPNL4YRFEyYFqWn6+a3DPIeeolKJbLvXshLjz0xZD4QeGvUvhfb6slDPlAk
	K/twbQMdX6KD/pRh9TufZZy8HgJaSspGkYdG287cKpjebLSFHwDRR4os8x3g6+5CdhqMAhC/uWu8x
	nPVvEAh5izX6l4gadbwylaYusL2e3eqz8fKD8MltGQZf9x4g9GcOqY3TSj25jvwFIolYGeLrLa1j5
	sZP1B9JfY3IQWUQUaXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nN-0000000Awd1-3SBa;
	Tue, 13 Feb 2024 21:58:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nC-0000000AwXP-3Xfc
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 21:58:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-411d3c75026so4517205e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861497; x=1708466297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=Vkb1Hts2iG5HPxmQI51EX+mo2A3LnMkrKER4N+NK6YiV/K7YMkb9mtrbqzzNlMSKUj
         AsGsm6ogqL2uSKU4HD3/2giFXMOkos/mXKuZvZ1pVmL/WRqL8sGeMvcO6CKuO1aEmA/l
         S6NksFkgNsYNKojfSvnECI7z45t9GJsFx0I+J6D/eFfLORAD/04vF/8Kf47x+T+rK/7p
         xjPWp8gdO1zB6gQhub8x2vZ/oNKM6fxSnezKJS5ZJOB1tfX95+8AFoQ2jUUI7U41GHRr
         QviP9hEp2jawmq1tMR88UlSHdi2Vb5IA6Tu0hJ7HTsIqq9a4w+I95MepoGiVV6JEd6G9
         YrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861497; x=1708466297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=L3LmsVP/Wx8unrPi5+1L5LKullek1yEKMitUOieGt3KWh3TjMxlD41Cf9k3NGQDZOj
         Rc+LPQHb6erWHO3VoZGCJyimrQaY9IxZSTeJ9rFxJ8aDW/ZL2Gb7ZezPZA/Xdfk7rSmo
         XdtyE1YgSkeInJ1sBhNOZz2xchxbYZQovJr1an+O77ucE8Hekf5HB6UYQf/fQ1NMddFo
         9Rudw4Kkp32XD3SdC9qHzK8hHxCM1VELE0/iNqQt4oEAgB7mufBNkQY41jjruHD6t8fJ
         bwQjOWvdy5UFEzXmEbE/QMTMe6hEb1UJ1gJcSxehu2DpCUAQUknON1p5kQTFrCA2sixU
         R9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwEEllbYGVPWq2w6J40SDlvHUN/Z+L81aLs3VuDp6Vrq4taiF0g2wfzeIaYWHs+VxcUV6yRk+lI5rLVA4FUpnwmi0Fek81vlgpQsahvI6Boas=
X-Gm-Message-State: AOJu0YwVVQQJOo/2lx6TyfWhfo4TidJ7OA6JY0SXcbAO8AnyG1ysPBIR
	VgpJwXFh0IaMnI0O3fiUMH2NxcWQH1+0wmkeAj0a/JC76Td2d8rOexcTqY1xgD4=
X-Google-Smtp-Source: AGHT+IFQmIg0n0GJLfQcjyAmY5aOtHbpVk0kKAcJWpMWmARHiy2H/vQt8V6epQv+QeBGgNL4tEMGfw==
X-Received: by 2002:a5d:6ac3:0:b0:33c:e2d9:ad36 with SMTP id u3-20020a5d6ac3000000b0033ce2d9ad36mr369591wrw.20.1707861497019;
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXatIVkhfi4XEgXz5p/gNLbo1vWmEs55v5qyHuI9D0zr8zRt8TJ8ZvxAEkAOJ8a3kznQNaB9CwA0yXFBxNMvj53rHwJ036OVmcocDuLVPfg+PhWLsrC9mlRpniTJxWwH6grCm6vDtmEPJKmWES7/cqSCgpdP/SP1XUCZZN/cAwDr9J27u3hbZyUxvljt3BMCZHmzTpd0QV0bB1cqVdFgl8r1MWmfH7UPkPZq5G2SLjKlWyYV1Bny7ioTDZ9a0tYFo0aVVX3mZT8YahfGGdNcI0a2y2v5rR2Q//H/EU2oWk+rBkR2RDeq8lDwto1myB3M5HTP7it3hesDm99vHUtWHz2n2VKv4Q4O3O2jjAJiuJUqYaCCLIdo0fHDM/dFr/tAaBy30Q6tJz0fcYSUXI8mhoAxW/AWT/oJ1y9vKLuEWj5f8/2i42oUMG6NlN/UzLWMOBw3vS/ecrqYiEobhSloI9qEMgg2SNdaAJXIWgEP2QA8Ev5ZO4piJzUKTZcua59IhWs2zPvSJydJocUe7HdqVKGsdBiuUkwwPb1YyCR9TYWE9OrWora9hpg0mrQsWDgwKLvGk2X3utxRuNVkTTdirRufduCj547YWj/gaQCGXx+o44FtvU=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:03 +0100
Message-ID: <20240213215807.3326688-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_135818_938444_35B57357 
X-CRM114-Status: GOOD (  13.73  )
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

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  243 |                                        (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 19 ++++---------------
 sound/soc/meson/aiu.h |  1 -
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 7109b81cc3d0..5d1419ed7a62 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
 static int aiu_clk_get(struct device *dev)
 {
 	struct aiu *aiu = dev_get_drvdata(dev);
+	struct clk *pclk;
 	int ret;
 
-	aiu->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(aiu->pclk))
-		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
 	if (IS_ERR(aiu->spdif_mclk))
@@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 
-	ret = clk_prepare_enable(aiu->pclk);
-	if (ret) {
-		dev_err(dev, "peripheral clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       aiu->pclk);
-	if (ret)
-		dev_err(dev, "failed to add reset action on pclk");
-
 	return ret;
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 393b6c2307e4..0f94c8bf6081 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -33,7 +33,6 @@ struct aiu_platform_data {
 };
 
 struct aiu {
-	struct clk *pclk;
 	struct clk *spdif_mclk;
 	struct aiu_interface i2s;
 	struct aiu_interface spdif;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
