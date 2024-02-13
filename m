Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E377C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqM/XLkT3QEdOTtnsIlYTICBhlYtEzuAy9TfoOqpLOQ=; b=A6vI2OjBEOzCu2
	jPRu7wlTPKhZQKErcQxKbRdxZ06WynSZ/hY7C4CeeSm9ioCI90QYgCqMblEtaOcIwU5mklaZZ0XX+
	uWgZL/x0PROfCsnO+UCKKySHx6C/5toaODuKOk3nidSQEZiaWOeKsEZVhgWqJp8KgMl3o9/SW/sh7
	9wXewPe8bvCskRV+wdF7dj5AhOL/Tm8E/68rh7R8LChULsjNMgHSy8Y5o1bm1Q7m09LB7P2hJDHdd
	TD8CRvAGJTCID5i2HjxoDSkocfBWZwhnS5qJ0t9oqhAYWF8FHOaWlSYSt/K8KgUn16PXFkh2lmUM5
	bHzVDKDipEHVMoYXHIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nM-0000000AwcS-3DgZ;
	Tue, 13 Feb 2024 21:58:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0nD-0000000AwXp-3WcR
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 21:58:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33b8807b55aso1209569f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 13:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861498; x=1708466298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=CEtk1Vj+zCzVtbNiHoXG8Qkf7tT4LqgZa17StUj7Iq9Iu9ZUaQaZxLn1WVn+FOJv/3
         o0BAz9NgW8koc7zG/kEhgQN4ar3PMWIN+4GNnUBSjcM9D+7Xba59MGIS2hH8rLY0q8J8
         zs6dm7IYXcC1GNaLQRD25MNzdO875QZcyKrWdcGtOD8YbxK6DXllNP+smbRtvVucYUQ+
         6W0fxGn2DpVriWXridYYJGjwEwIq1jTEw2VcnUT8ZEJl900Ko7b5XSA2khY4GGnQIXri
         Y8S/FcAHJuO7jbDamGrjk2BADb+PAFSUaBA7UtMFtpHawAcrcKF4kbd5mWAWjtEkGHMP
         k9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861498; x=1708466298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=Jga0Y+TDAsYfpG/HaDIpu1M2qrgTzlTDSB6GtK8eAWMB8Nu2RJpQE+UUhE9aOYzIt2
         QL1Odxc/nCjT3fq9kCDtOrJ28mywVzRL9NY6jkZ0mgg1F9R+TIwV3tWCyvPYRTiXxKVJ
         4oPOTldPrQncZcCpwYcRUa88v8WZ2pprLt/kWPZzs+OvstB9bQLeDf3XtlrZ8yESCeNu
         G2ZUEyr9GaQFrOSbiDlaKdWoOdUdXCFnAXHkA1jdZgVlNiUc8xnaKsJHdE/1S3fWbs6j
         TD5VuUSPVnJsYDRSqAha8aD70xe2B+UkjHVa/ILjmQoZEMQoI3VIobjYYaxetM+9K4aZ
         Utag==
X-Forwarded-Encrypted: i=1; AJvYcCUTiZn1EMDQe1Svm38LQ9DEmTRIO7uOdNmy5eDse3LByCY4HoHrbiRCVP/flKJ0Wj1xh5NxFLTCfdJDNzPzzHikCxmt8uaRE2raNLfFQUSczsY=
X-Gm-Message-State: AOJu0YwBIK3Fd/MvNlUvMpW2CzHkgv62XhrTSjl3QpTvZTpXjWtp9vYm
	olXVcpKev+RIef0xq/Mo5FRuoUGpfQh0BK/S5qUkD+vZEUr7YpGVuOnhYdFgFj4=
X-Google-Smtp-Source: AGHT+IFZ3n4e4596jcQPvb4/M0w5BxopAfbxvEnr7lIBU6iDbCf0cnXOAXxypGjN46bUXfIJV5p8/Q==
X-Received: by 2002:a05:6000:8c:b0:33b:eef:86bf with SMTP id m12-20020a056000008c00b0033b0eef86bfmr388447wrx.25.1707861498107;
        Tue, 13 Feb 2024 13:58:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJ0VVy771lMRNflwR2yXi3R6/+dub54OOGnNJcvbuYIcEQsS5QlZrroSyMaWyijwq5c2hC2NvAD1pLPuWErPD4resXTwAhLmgxRmddslpV+8WAJTZhqazEat8FROH6ieAWumwv9lwt2Yn+FPrC6KmppIxwT/69asnfrePkZYVyJm3MK8h6ONvWc4IVBliqIFds5PZnsuGbkN5YWb7v+EZ3lPaVlx8GQXS98E5BHdIkhe2fksr9g6fEQtBkmWZfjgIWHMdjABQC/Deor8k9BzNBZ/jZxeieUroSwXKpwXdAHo9GV7XRnDmuBhbRO+C92L59xtUs95jer13d1n3ZBFTan8/bDFyhPVJtW6W85pRJdzcG8SMhFTgzPnvTI9XyGvrfPCYEwTn2530CpHXZlnm58uKPeqEc/f4S8CjWah4EKiga/vB75UKu5a61ol+z+cTSNM2/+4nM0LDdsn3Xe02hOUew7hU8xN0JxTWaapP3O2LfNImUG8yZiMxgbypKxrbgjYv0pwfGsy5NiexdQymHchYp1g1/WlBYRa30jRBImDVuDC3qnO+VtTeO4PfPh4VlA4esexQfeGrSzLs05LRvxWwnxHyNEIOclcbc1msQ1BOqA/4=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:04 +0100
Message-ID: <20240213215807.3326688-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_135819_904890_A20B843E 
X-CRM114-Status: GOOD (  12.70  )
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

sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  274 |                         (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/t9015.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 9c6b4dac6893..571f65788c59 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -48,7 +48,6 @@
 #define POWER_CFG	0x10
 
 struct t9015 {
-	struct clk *pclk;
 	struct regulator *avdd;
 };
 
@@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
 	struct t9015 *priv;
 	void __iomem *regs;
 	struct regmap *regmap;
+	struct clk *pclk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, priv);
 
-	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk))
-		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
 	if (IS_ERR(priv->avdd))
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
-	ret = clk_prepare_enable(priv->pclk);
-	if (ret) {
-		dev_err(dev, "core clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			priv->pclk);
-	if (ret)
-		return ret;
-
 	ret = device_reset(dev);
 	if (ret) {
 		dev_err(dev, "reset failed\n");
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
