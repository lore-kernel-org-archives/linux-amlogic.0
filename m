Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A927C3F6B0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Aug 2022 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9DZuxLriTIc9gGnrvlSGU0Zj3nhiYH+yR2DjNZq2LI=; b=yI8dYDYhv77wZl
	dxQyHheyEyOLZPGCa3zLmTuWsbPMtof7k1yUHhFK+2uRpBxbA0jX4poYUkLZBRG6kosUswFuxifXB
	e7jJmTJTdrBzsseFg8F8sOl4BpjbS4kFrHRxelkZvsKb2jGcLBmtHbT0JQ5UA7JvYfIV0j2qF230d
	cKurfHk/rUVRY6Pd4XzizrHT2uPbify+ahlnOoAHsbFDicBbeJ8HDY1Nn7LaSfO6C9gWKu43G13QE
	JEeD1jmkBYwGPRrMFIIoVvfwOIOyVDdtObalxZkgo5w48Z/va32jD2e7fJpTfHlkFcOuivNiRTGNU
	vBNoabdCFCjxpveVku1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjjE-009mMi-5h; Thu, 04 Aug 2022 22:54:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjhf-009lRD-0S
	for linux-amlogic@lists.infradead.org; Thu, 04 Aug 2022 22:52:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id v5so633793wmj.0
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Aug 2022 15:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=aFhzj5S7cwF1iOCecWm82eQU6McBfgSTPX45J0fnRoQZNIevy+1bRoUm1Ey/y3bEm9
         mIfKVl6+oUu46UHACCXtykLrlntdDaaea3/EohI7qi/jKdlZhI0siirJJAhl9YUSaiIH
         MUJ/2OSN806EZjmC8cTVPZ7R66ddAcD2v3cywdgmuYq6ZtUww5bmgnxnAcePM34VVhxN
         JVDNDuUKmjs3fqNJ0f5GrCUz0+fA+hAWtEjNV5HTVyyPq5TGey6MrR4bRNEpoqC4Xozk
         p8ZR6igzNcjkYbtLB8BcKH3626bQAvcpUqnSq0PWZfH1mBUaWiKLw1nv1KwxX35Rdy9N
         4gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=0Mv0+vL9S4nuSroNgtCUiakJoyK0ItC1ykzD9ZchARhHfoLyf27Pw7C6YnZ9wryrMu
         oSPGaBgYi13wasOlAoljr0VD8UCHUYK7BC+IXS3VIucb8N09cIWB9lsdsF/62lcJO8iH
         lRMLb3tYq7y03nbfPpG/8VZgOX+8pFJhT0eP57wMwMpY1OhKHBeRGdJgNjPs1sFXqdtl
         01ny7JWeeAX4WT5/F1ZSU06P7MhywDEHto48TP0breTCW98Y+9pKyE/ZrjLxsPEQLhfY
         frg3Hobx19Hq6W4F3FJecQuN9Dc9DXyJzM3HP5X+aT+1x0KsiHNNtV/OYLdmCUMjzqX9
         oBFA==
X-Gm-Message-State: ACgBeo0ESyQe+c24GbuvDqnoJAZj3/WphfRyvUw+A+zBpk/yD4wXkMGz
	Lp6+uskDaoiZXxFN6vhDyC5mPA==
X-Google-Smtp-Source: AA6agR4ULFOekFqR1S23ofy2jgc1fgTjsC4bmHGRK9CQ5SrpNqwQUdtYwfFJ6ZBkTrRq8vCZMKDn6A==
X-Received: by 2002:a05:600c:35c7:b0:3a3:2612:f823 with SMTP id r7-20020a05600c35c700b003a32612f823mr2664666wmq.33.1659653548997;
        Thu, 04 Aug 2022 15:52:28 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:31aa:ed2c:3f7:19d])
        by smtp.gmail.com with ESMTPSA id a16-20020a056000051000b0021f87e8945asm2495906wrf.12.2022.08.04.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:52:28 -0700 (PDT)
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
Subject: [PATCH v5 13/33] thermal/drivers/amlogic: Switch to new of API
Date: Fri,  5 Aug 2022 00:43:29 +0200
Message-Id: <20220804224349.1926752-14-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_155231_091902_EB10CCED 
X-CRM114-Status: GOOD (  14.12  )
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
