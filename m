Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594ABC19F29
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9DZuxLriTIc9gGnrvlSGU0Zj3nhiYH+yR2DjNZq2LI=; b=Z2MqTtcOosRz3g
	ssEKeLW5SNYv1sX9zVZpwOd9YjEBUoDSihhJSZzo8bEY6Q+YdlrbjPaDAVahZ0GRWyjiYpU2HBXwX
	LR3WnoKUVApcFfwCj1AcAMLuiisOK/ajtB8DiUgcyWu1VXfqj+9bRdSnvhHD7GcY+VQmCmPkCXyzz
	5V7FgOz3SDz3l9j7ZeetBk/cQSg+5xncDcoDiX85yi0jvhWv9lr2Ld9ucBc4sfXmrTLfli9suP3Gu
	EEYZbRLsr9guZDT39Ula/V/toGvwiTgtaWJcnTlwFNaMZZPxdqD6bMSi34C3ijlFywziDQIjKoZYU
	elA8KQZYYmKsNpHvn1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoED-000IoQ-BT; Wed, 27 Jul 2022 21:06:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoC2-000HLS-FP
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 21:03:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h8so26063714wrw.1
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=47RymGc11nlAImgXbnxoetDsfvDXPpfxd/sUZKt+T2GBGm0k+GR2KX0yADQ3/iY8ZW
         RcEK9GgmSIyd504dayr0MWnP5oSwBF+vfbLe5/TNFY0Nkl3SmipU7lc5LSM8leX632L1
         2GXMqhdHj0qgnYXW6yJ4lZHl1jvwsXuNUhEGPgCneSuTkaKpMtjjuquaBQJ9yFgz32Zt
         lX26Sh3qdOtmWRd4P/GQxfIM9C56IMpWSijIM3v7QCyltU05Gm4dKan4iaVqbrO4g4FB
         QJhiTJEpt9cp2VwNr1x2feETRj59X5WErwnqSJtL0Kd3i6xfqyfLcJ+DfJftafrJB0Q2
         +64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLbrdXUnmrQegHQ4ArILFVac507m4xUt/E4MiWL2p00=;
        b=fZf5YujxPk7kgmeHDLGc1RDgdi6RQ5phXeFCsmhdS7CybyKbxGrd2YuEdSXpNBRpJf
         axrM2/soYpHIURfOmUgNv+PKrd2oj2ORnjUogfzqzBQefSvIpZju+QkdhC/+06saBseJ
         JAJ6m7mdGv1MO8xOzIh8j2CAONe0xmt7tXakU6q240gtHhNdvJYYt+eTw1AM7Uhah3JE
         muPEAcyO63lPNe59MTS5KqheSFMmCmayhI8irYjZRTI+HVNdpDmdF+oGbvg54K58DBGU
         pPgekp6Gq+TfMyI+XgXps1VVZ/mFs/+VnDLJZL+iYs3dUqVpXRT1LbgPNvmjq3vh/ttq
         jkIA==
X-Gm-Message-State: AJIora+u9J9FIg2FSAYca79JOzrI8A6hp1l3xzQQoWyPC/guvIEM0jfP
	Mg49EbjSB/CG4PsWNUGDjJV8Xw==
X-Google-Smtp-Source: AGRyM1t2JSzjiczvonH/VShf1AaEdECxWHyrV9ovfT8+o55/saAc25YXJBitNk4g7Oblrubt3m4YtA==
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id o9-20020a5d58c9000000b0021d93741373mr15262679wrf.20.1658955822870;
        Wed, 27 Jul 2022 14:03:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003a38606385esm37908wmq.3.2022.07.27.14.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:03:42 -0700 (PDT)
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
Subject: [PATCH v3 13/32] thermal/drivers/amlogic: Switch to new of API
Date: Wed, 27 Jul 2022 23:02:34 +0200
Message-Id: <20220727210253.3794069-14-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_140346_548660_50D5F4F5 
X-CRM114-Status: GOOD (  14.52  )
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
