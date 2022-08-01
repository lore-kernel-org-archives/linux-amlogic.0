Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C886C00144
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 21:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9DZuxLriTIc9gGnrvlSGU0Zj3nhiYH+yR2DjNZq2LI=; b=H2neEQNAB0Q7oz
	xqbRfhw/NJ4vKa6NZAKdCrvNlAkA2ivLm6so09V9iV6cvFhSSb9bkQgRNIm5YI9Y+L64g8mo4n+g2
	ze3TY1u0sF9KWcOSUMTW2YvTiYW6N6iD0T9FPlFQDBwNXedGxWSFJkfBQ+qsg11vvIbEG4LNk3bQG
	MSKRkn2D/3QASxxFOuw7OUkKvI2aVeulvTFaIwSmD86MBDRRpheuJSG40yZXKvfsRSnXslTWsv2+2
	nnLvpUE88ltxLF9S+aGgPDvCSFfeoPQjMwzxztV0FvXYOPnsPBcvdRbeBhm2tC4vlwX9m6F80zQoz
	r/edm6J3xr4FuOiCsy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIcvB-00AqND-Gp; Mon, 01 Aug 2022 21:25:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIct2-00AoS2-Kw
	for linux-amlogic@lists.infradead.org; Mon, 01 Aug 2022 21:23:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk11so5757456wrb.10
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Aug 2022 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=6C15rnP4qts5mxMDjMldb86oCUjNi29lWZpNRT6hk1fFOPjDtK3NhIdyS8d4/skgsm
         97jsLwiozQwzrRAQKvE3u1G10h87gwDomYFVpQyo1yLFe0mQhKbnVRlP6UXjN8OT1z7o
         Jo/Z2Cn3W6AUDu266wHTMXLk+012Xp4Cxmcqt7FJ6fTzbm6Jg9QjwhzYQu6+x3uTiMpr
         ZObq1X9RBBlO4LpXqXONnPMMpF08whbc9bL6r4wXLVE/hrYTZf7P+pU9xp9wKft6LAa9
         7JsPbV4+KIhcPIzX5FP3EHhdI/lCmQte2zI1GuApAE0VjqNdmBDcgD2C9yF3xcBAgCXq
         N/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=KBoavXuA/xrdwIF0+LFuvPIIYfM3uZl5/MswXY58O7tDtl+79ufHtYzks2ps4ahK2E
         ysBI1oQxKO/7G7c3YFP2cTd2ktPreZspFvDeqcLB0Ju2Dkx7w5fwf5xaVqswirmgewzn
         yclmK6eFp1D95waT8vR5dDKGW/AZJC54sXlZ3R055EpIiaDAMa3QZXqa7Tpi40yKPcCo
         7m/Xfn/kH7vrOKPIQUA0aaq6R1iSHeEm2Vd69jVsBaY+A8naxw4cw4Zo0y5DIkTlvaNt
         lAdSofAz11mqej8A7EFEGnCg668Xgx6/iz/eg5DQGpOziIfKMUyBKQgpi+VJhcIW8hZi
         7G1w==
X-Gm-Message-State: ACgBeo0l52fSysBx73xywth50F2WC7F1+p+ffWo7RN7QQ75m/NZ3cuPP
	wegyc/X5/TEeUsjuuvngktqBRA==
X-Google-Smtp-Source: AA6agR5p4m1l+Ki819toRStoUeO4N92jCT4xbpy9RHRaR8/56BiK0/60qNayKRhiE6Svt2ResUNTTA==
X-Received: by 2002:adf:e588:0:b0:21f:ace:dd82 with SMTP id l8-20020adfe588000000b0021f0acedd82mr11080482wrm.226.1659389018150;
        Mon, 01 Aug 2022 14:23:38 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d00:ceb8:9c09:1302])
        by smtp.gmail.com with ESMTPSA id c7-20020adffb07000000b0021e501519d3sm12995285wrr.67.2022.08.01.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 14:23:37 -0700 (PDT)
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
Subject: [PATCH v4 13/32] thermal/drivers/amlogic: Switch to new of API
Date: Mon,  1 Aug 2022 23:22:25 +0200
Message-Id: <20220801212244.1124867-14-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
References: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_142340_724064_C3E9A4FC 
X-CRM114-Status: GOOD (  14.49  )
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
