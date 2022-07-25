Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C860C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jul 2022 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9DZuxLriTIc9gGnrvlSGU0Zj3nhiYH+yR2DjNZq2LI=; b=uoDNL++6KWtHy7
	pRaqfSPavsw9n8Gsz7KTSGEOzhzdQhaPpp0Gs02BECABqcSo+VwhbgN/w5/QPXbLqtvj+5Lpcfgac
	w6BC/CjZEBpVsuO8vK5JtX98bUPYTMm/VZvXRQqYspMWm70CBGixidugMCRw/+X4AJB1mT5eMqt4Z
	XhIXENQcKUzej6Vl77eYB3tyx5T32Aa56VvS4U6zTgxknFHYd9qWPdVaTj6k+75S9ERzMSZxL7uEG
	oj2P9TXIv7e4txhWu45S93ONhVTuOYy40DLaJ3z9oW8xtCahAEvOFVYyXV7Qg/VZ1tXekQ8Uy/h7/
	MG4JwtHbUwuGUKH1xGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG5cX-002gca-Mn; Mon, 25 Jul 2022 21:28:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG5bt-002fog-Pt
	for linux-amlogic@lists.infradead.org; Mon, 25 Jul 2022 21:27:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z13so17706996wro.13
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Jul 2022 14:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=5obZF+IG/xdPPKwvOIBUwn2Hf6xxT1MDTwIAwW4oZQErkW4sorJfIuG5NMjy/WfJe2
         8ysob65cSqtWIe+CFNTlIrL7qJPGGVYorc1O3o5eg5pIA2OiZOP/hSyf/uQ10QVWsbSM
         /xd3zRQ5+d1hMbKpKVfKLTkbiU5olsoFIJBPV4FSsxX+Ov9xLAmbgQ+8vQBhk/ERbIAE
         qxnDSZZ+kpTZ7lDd+g/BlAyYHMT6PWdU1n7kjvqD/TCoHhfqrzv5xBI51YoVem3W9ofI
         2cgL+YZVeGlk3Ra5VOtXvL4pGJFVDZjAIl16xBwN9vnJRNx4ojtv+4YRC5ZOMhDyDsTd
         PivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=WBr8yH2jOc9aMLOMSdLXf9c2+AKNw3oYM7j+8lFTgixPRn/MOmuknhlYeZ/9ZMBQBS
         +Q95djIwFxG5NTzjZ+LFgVMTSFs8a3DrkaHt48Jd6FDHpdLmd/W/SF5XbaS3qnj+mzKA
         mDTBVxQm6n5FJWGXCuFGVlP7ZZfyOlaZS1iJfsY4X/zStK8yZnSLhCy8erOtZWArMe3d
         GH77vtYQPsWXnvHd70P91ltyAo0x9p0hmnZx0C4hK6wVPFDqXiK523JofzOFf4Ba1ONk
         PRLwctjadl3kN0mTvOKanNHoh2syGkfIZ6ft3BMGl4vjQ6oPEzHcfIPqP76t4wAyLkaS
         4Njw==
X-Gm-Message-State: AJIora/EapjJxkS5IjfgsvNEhW4LA3L6OuojJt6A4fRzoHys2xUX7PqX
	v0dL5VtyOz48T8YB+oeC5TR5nw==
X-Google-Smtp-Source: AGRyM1uqbR2UqwczcVNLDMmivmK8GC2b7p7ZjfknP1S0kTyDeKlT36aRIN75zYUuHNl1fngQZvICTw==
X-Received: by 2002:adf:979b:0:b0:21d:868a:7f2f with SMTP id s27-20020adf979b000000b0021d868a7f2fmr8703664wrb.409.1658784449396;
        Mon, 25 Jul 2022 14:27:29 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1780:8e54:dd38:6668])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm12668772wrv.94.2022.07.25.14.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:27:29 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	abailon@baylibre.com,
	lukasz.luba@arm.com,
	broonie@kernel.org,
	damien.lemoal@opensource.wdc.com,
	heiko@sntech.de,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	talel@amazon.com,
	thierry.reding@gmail.com,
	digetx@gmail.com,
	jonathanh@nvidia.com,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	baolin.wang7@gmail.com,
	f.fainelli@gmail.com,
	bjorn.andersson@linaro.org,
	mcoquelin.stm32@gmail.com,
	glaroque@baylibre.com,
	miquel.raynal@bootlin.com,
	shawnguo@kernel.org,
	niklas.soderlund@ragnatech.se,
	matthias.bgg@gmail.com,
	j-keerthy@ti.com,
	Amit Kucheria <amitk@kernel.org>,
	linux-amlogic@lists.infradead.org (open list:THERMAL DRIVER FOR AMLOGIC SOCS)
Subject: [PATCH v2 13/32] thermal/drivers/amlogic: Switch to new of API
Date: Mon, 25 Jul 2022 23:26:18 +0200
Message-Id: <20220725212637.2818207-14-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_142729_885978_5A1A1337 
X-CRM114-Status: GOOD (  14.64  )
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

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach. The ops are no longer device
tree specific and are the generic ones provided by the core code.

Convert the ops to the thermal_zone_device_ops format and use the new
API to register the thermal zone with these generic ops.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/amlogic_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index e61b91d14ad1..d30cb791e63c 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -179,12 +179,12 @@ static int amlogic_thermal_disable(struct amlogic_thermal *data)
 	return 0;
 }
 
-static int amlogic_thermal_get_temp(void *data, int *temp)
+static int amlogic_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	unsigned int tval;
-	struct amlogic_thermal *pdata = data;
+	struct amlogic_thermal *pdata = tz->devdata;
 
-	if (!data)
+	if (!pdata)
 		return -EINVAL;
 
 	regmap_read(pdata->regmap, TSENSOR_STAT0, &tval);
@@ -195,7 +195,7 @@ static int amlogic_thermal_get_temp(void *data, int *temp)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops amlogic_thermal_ops = {
+static const struct thermal_zone_device_ops amlogic_thermal_ops = {
 	.get_temp	= amlogic_thermal_get_temp,
 };
 
@@ -276,10 +276,10 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->sec_ao_map);
 	}
 
-	pdata->tzd = devm_thermal_zone_of_sensor_register(&pdev->dev,
-							  0,
-							  pdata,
-							  &amlogic_thermal_ops);
+	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
+						   0,
+						   pdata,
+						   &amlogic_thermal_ops);
 	if (IS_ERR(pdata->tzd)) {
 		ret = PTR_ERR(pdata->tzd);
 		dev_err(dev, "Failed to register tsensor: %d\n", ret);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
