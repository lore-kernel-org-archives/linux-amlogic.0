Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EA0C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Jul 2022 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACURgE20bQBJ6fDrEwbTKGM2XrUKp5LLgU/oSUyB6uo=; b=PDqIEadFT/eY6O
	c8FcOvfcWMvwEY+pJT0ARe5B5d8vA2qT50/SRx/TaQEE0iuhR7u2GD0kwh7+FMw/k+prRvWFhQk2a
	uLrnEjvouSnwg9qN4O913VeNb4S05OiHBpzSRClHjCF5oVfx1dwvs166RHZ0G0ksvmbC4IeyWg/1o
	t2za3mYrQxE7p7NEJwJ8rPPZnLJAFUH3onGHM3eOuDrV5pmieAWrDS+i6FNppaC0OGyqqPlBgvupJ
	p3TBEeupqjcU3RO2O59vr+yKvdlTI1Rq6lRetDtjfmxHW1gCef1FFRgHwsrOH3rR5OQRsS3Aa1V8u
	EMkdi+DOfb9/PtyDjaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAeQo-00DoS3-Ok; Sun, 10 Jul 2022 21:25:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAeQK-00DoE9-DU
	for linux-amlogic@lists.infradead.org; Sun, 10 Jul 2022 21:25:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so2015925wmb.3
        for <linux-amlogic@lists.infradead.org>; Sun, 10 Jul 2022 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CDpLMifMj8xD25r4WkNfIKy72vVUOFHmRwDlvbLrKrs=;
        b=u5uV8L0CMYjZ3UtssL772lhFuB9HX5aWqtsXxGQc2rgGuqmKez0AwC+7jF26V6usaq
         kaXCQWAI9cMaimIXKKeZO2JP3bqaOMg8Ip0psbVMPamwv/Wicw2umoWRcM0qUQ8zD0O5
         nNeC65Bf2xgedE35kO705wdh7C3apIrAHFsZL2CftoQt1m0zrkmp2llLnHJiRs2jnbrG
         bYWgGc5VHPLk4nOzpnEDeafE8GJdtgqSIclj4dtRwP/ULsfUPfqlM8Phvd2C3ZXSdWsz
         Gr00uwO7961qsnpSAZ+dlcXkEGnQEe9YEXrv04odFxZpI97Hbv+TZfXCwoqFMXB8ZxYs
         44WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDpLMifMj8xD25r4WkNfIKy72vVUOFHmRwDlvbLrKrs=;
        b=yQrI+9waAKhcl2YNhZ81xML1dpZCAtnDJjrB5T1kGgQtvyGxTJ7Yeex5LLJ6ZsoZgO
         1KK02HIGIRN60b6zwPiGVCA8WsmwyVQ8TUQtiQ64Qeju0uP/hR9tLeZsx9RUHUtFUpsx
         cZFSWqkp+IpfSo3ehaz9L3cojqLkXARt1ToaJXQa6IwUgT6iSCBuWkutYXtR4ltP88n4
         Uh9PNES0ht2oXfXGmh+FiyBQfDvASlTOfvPwsim4YhZx1q5PMypDb7fzBbfdhxt6xwme
         5OX4WY0kSVBKM8ZCk+IFCVxdmCHb2BX2c446/+y3bZlQKHYH7xINFb9LeWIYd9JtEFeV
         tRlA==
X-Gm-Message-State: AJIora+c6O2jSC2NO3IhOqBirj1MgvjuLNT8r3IlIo7T4Cdpzks29dYE
	UHv7rEJsHSjZngZRlvrKB/tKEA==
X-Google-Smtp-Source: AGRyM1tb9dJ2C2FATBCjs5fyOV7YnyJ32Mmp+pPKK4xv6L6sx3r48q2s7ovpZXLuMvaIcd3yG41Sxg==
X-Received: by 2002:a05:600c:22da:b0:3a0:4e7b:4237 with SMTP id 26-20020a05600c22da00b003a04e7b4237mr11879597wmg.101.1657488301801;
        Sun, 10 Jul 2022 14:25:01 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	khilman@baylibre.com,
	abailon@baylibre.com,
	amitk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guillaume La Roque <glaroque@baylibre.com>,
	linux-amlogic@lists.infradead.org (open list:THERMAL DRIVER FOR AMLOGIC SOCS)
Subject: [PATCH v1 13/33] thermal/drivers/amlogic: Switch to new of API
Date: Sun, 10 Jul 2022 23:24:03 +0200
Message-Id: <20220710212423.681301-14-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_142504_520679_5BF3D42D 
X-CRM114-Status: GOOD (  12.99  )
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
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/amlogic_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index e61b91d14ad1..53eb7612884f 100644
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
+static struct thermal_zone_device_ops amlogic_thermal_ops = {
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
