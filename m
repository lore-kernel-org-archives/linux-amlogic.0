Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85234C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72j9KKwpMOvlVJ1xwg0JcEwx5MLPMRbdTO37XTE0SL0=; b=3i4lXVGcmMzZuN
	Ma95s7vVzwGL3Jb25AKc/2b7WlFiDusNK4NgL8EU9D6Q8SbiIfIZwQGU0LsDlNUNhbTKljow82fzi
	BNvJxWtxVOjzqp7Izscr+SkPWdF2r0WXGjgY2kan8CmPKK4PmWGbfyDpJrLM56TTtvjX9ThToPZG9
	oe3jWIMuX8uWneqp3ZRtLQe3gI6TIS4ph4jPICYdcqEoyELUCl2b3I9g2wFvDzcP3BvNBh0Hb+OK6
	ehWLGbaNTyccxiDDaiuSfE4tkRkSjRUm4RqlH0iVbR2P0IT3JRvvU5nCg8BgHIFU0CzzxjeJRH6A/
	g+1seBH8dfUKOO0SFC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7uH-001Pjy-Th; Sat, 11 Mar 2023 22:41:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7u9-001PhS-1a; Sat, 11 Mar 2023 22:41:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r18so8175905wrx.1;
        Sat, 11 Mar 2023 14:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678574490;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUm1Ql4A6dJNjfOmVJq8BeI+WEiUEaG4afPfgrOMYF8=;
        b=hfUr87fRvgRB1LqgOKiiKK8wFryHTeFjxhnBFEZJvp1Doyc67cGgtTIkoJukPmW/fU
         g5gSDJooqXtvZlrG+edrx5xo0UNvu+QqJPh1+omlRzLynKLm6qk/hhLQjojfa4TvSDhP
         KPoVUWGrIuMIg8RkwrLl3e1nKeo3c5JdnJ7bO6XIivn6RsD0oGY49LJn2IWfWvsiIYYi
         XRIIY34PI/ardAPj9t1mt/u+pm8JwKA4Ey3GMIRex+7ON1oKi0M4+fzpn2TsYjVmkQmy
         FeySLn4IOKI0Y25XPhjYLQ+hD/ouQpvd+O11HeT42aAjBzkMl3DIrXyS87bCZanlLI9u
         JUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574490;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUm1Ql4A6dJNjfOmVJq8BeI+WEiUEaG4afPfgrOMYF8=;
        b=27q/L3AJwCHmPZ1jSEfXbJg8aOwpWoLUk8kjX6GISN1Tt/Q/aTNU206ElQNWbmuoAL
         ifMimyxNI90Mt9dwh3h/2BqjvRC06g02+BURENPeXtPIm/QedUV+pU+J4sSU/nG2LUiB
         dNboEAn48xC10KIFF+0ELsWBFLvQaiuTUrutZ87qT8MIUyBJBoTjgfcCffm6nRG39oJm
         FsPyjdviymC+Ljb5aCmU23L8Cxh0ol56LFTJOTlUJ3yfQ/397fZ5l/4J7WlAu3cUrYhi
         zsE0MBk3nMPEaLFAeJlpDB8ciDhOrJ0gWn5c8jXFMmBJ0cT/MLK56qyaQ0jFyFIlnRay
         YQRQ==
X-Gm-Message-State: AO0yUKX/z80vZG2s6dEiXMeoc/EBtYQA2xUQHw0z5fdtDcIQJPEEKOfv
	yiSi6KsA31oqfcWdzQunE+s=
X-Google-Smtp-Source: AK7set/Vm/Xkk5kfHEqPkh8r+McdnQ9cdSuz3+aw3vdYYfTd1gZJQkVRkErfnzH3SQvUEgg3zOIlYw==
X-Received: by 2002:a5d:4a8b:0:b0:2c5:5234:882c with SMTP id o11-20020a5d4a8b000000b002c55234882cmr18700423wrq.7.1678574490405;
        Sat, 11 Mar 2023 14:41:30 -0800 (PST)
Received: from ?IPV6:2a01:c22:7697:7600:79dc:4e28:a7d7:a00c? (dynamic-2a01-0c22-7697-7600-79dc-4e28-a7d7-a00c.c22.pool.telefonica.de. [2a01:c22:7697:7600:79dc:4e28:a7d7:a00c])
        by smtp.googlemail.com with ESMTPSA id y7-20020a056000108700b002ce9f0e4a8fsm3200065wrw.84.2023.03.11.14.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 14:41:30 -0800 (PST)
Message-ID: <2ceb62da-07e6-bafc-c29e-13cc1cdde93a@gmail.com>
Date: Sat, 11 Mar 2023 23:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 2/2] mmc: meson-gx: use new helpers
 mmc_regulator_enable/disable_vqmmc
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
In-Reply-To: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_144133_119466_9BCF9D5A 
X-CRM114-Status: GOOD (  10.82  )
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

Use new helpers mmc_regulator_enable/disable_vqmmc to simplify
the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 28e04dc4e..b8514d9d5 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -174,7 +174,6 @@ struct meson_host {
 
 	int irq;
 
-	bool vqmmc_enabled;
 	bool needs_pre_post_req;
 
 	spinlock_t lock;
@@ -605,11 +604,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	switch (ios->power_mode) {
 	case MMC_POWER_OFF:
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
-
-		if (!IS_ERR(mmc->supply.vqmmc) && host->vqmmc_enabled) {
-			regulator_disable(mmc->supply.vqmmc);
-			host->vqmmc_enabled = false;
-		}
+		mmc_regulator_disable_vqmmc(mmc);
 
 		break;
 
@@ -619,15 +614,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		break;
 
 	case MMC_POWER_ON:
-		if (!IS_ERR(mmc->supply.vqmmc) && !host->vqmmc_enabled) {
-			int ret = regulator_enable(mmc->supply.vqmmc);
-
-			if (ret < 0)
-				dev_err(host->dev,
-					"failed to enable vqmmc regulator\n");
-			else
-				host->vqmmc_enabled = true;
-		}
+		mmc_regulator_enable_vqmmc(mmc);
 
 		break;
 	}
@@ -1179,7 +1166,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 					"amlogic,dram-access-quirk");
 
 	/* Get regulators and the supported OCR mask */
-	host->vqmmc_enabled = false;
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
 		return ret;
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
