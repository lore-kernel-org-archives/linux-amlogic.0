Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24113C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84B9206F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVEa8NbK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YavSxQY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A84B9206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39fbVXzGcRKL9i1d+XhgUEtN2uR7xXXlnvxDjFaVlmc=; b=nVEa8NbKXJPjA3ACHNGfaF5gLW
	ICKDUBO3HEJ9otuzQeRFJ1DGMOdFUu8ABIwszvdfaSjUXiLhtXZLmEjb4NqBIvo7n4UXBiG6bFwsC
	Gqzi5gMS1cuFl8TIOXu5+PcilOKkI7a0J4GNv0UGNT6/4qTtp8QK+4ZRairVVTYQwxzf/yx9NL0HY
	ciAyx2kEAwkOijsqUO0iXcGwXrQ/bUbboZ/3L7r6Do5aMm6R48knrPjh7wnaQN8vepUFQybIECZTZ
	zRIabJqUXuuxpIKXJvXNVMyHw3Sf/KOByr1dZbgBG2isBoXKR8VOHSarvv/9bRwcELv9r5Hk3E0Lm
	falhSwmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxac-0000yK-4X; Wed, 25 Nov 2020 16:24:18 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxaZ-0000wJ-W4
 for linux-amlogic@lists.infradead.org; Wed, 25 Nov 2020 16:24:16 +0000
Received: by mail-pg1-x543.google.com with SMTP id k11so193867pgq.2
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2020 08:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=3+3gfHD91/328qfooN+OsmJ9PHiYPgpjIR8tzOiYBHo=;
 b=YavSxQY4iVhrdX0h9CXAQtfQY3M/lSfjiujDt3l6QkRWufd91bgIX9sSzVy/CJPQrq
 O5CBFNRz30U5BB2MtV0PC7AlA7DIr1/WCYNY6O5N3bDGVQzIb2auyr/opkOZ/7bHa9CW
 LQ4zKVgVpfc30Ou7esFAYnagn3CYfwnMQKlvKuJ+QFnmEaluVp/REQeVECsmrJnWeaYC
 iKC4so2wF9PdUkTGZrRwc7unrzLxFU3jCjfaiaHM0J99PfhqD/vuk5pUuRTxtySIVsMI
 cPUwyixg1xr3OpqZ8pW6FqcXtNq3aKrjc6ySOfwHdPX7pwyikvv8a7p1OwmraJD0fF0a
 8frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=3+3gfHD91/328qfooN+OsmJ9PHiYPgpjIR8tzOiYBHo=;
 b=sV0IAdBM9KFLXl0rdySa2SVOfhy+8QWc47ciOgKbxGgsqBZO2oWhHcdqG6DWGp+9Ux
 5IY5m4/8cZpbvKhuXpC4a3gDbb6A/17+0lj1sFSGfK2YuNOMk84yn44h7CTcTBA+bEgm
 IhMTqUcFflB8gHM9DvEaDoLOvmxkuc1WVhRE56VB7ajxZ7P+B2S3A1NAR/Gd/WSR+TUK
 VZBeGnQgw0OAlLTpVivyPNSBQT2TZQ0G3Y2sy1sWD7gRJAc4GMIwIe9PV7fxdSvvNWSk
 k+ewoWZJn2bsKQy4bkMXvA2upOHFRlAMMlp5Kfu8p8ICqjjjntdORT/He84tt6m4AyfT
 NvVA==
X-Gm-Message-State: AOAM532euq5txxbU0PK/HX5tk4DaMusSsXE/21ZQ68/j/xuubZ4tTwKu
 mwNYeCeV/lv+c6jMrv/Gt0Y=
X-Google-Smtp-Source: ABdhPJxClJOLijc/qN4Y2TsUHFrwBBO/dNGfLQT1DiaRCkxu34lVJljgWO/JNiNtq4Nwes8TWw/gNw==
X-Received: by 2002:a62:61c2:0:b029:197:f5ee:6ffa with SMTP id
 v185-20020a6261c20000b0290197f5ee6ffamr3134826pfb.18.1606321451401; 
 Wed, 25 Nov 2020 08:24:11 -0800 (PST)
Received: from paju ([116.124.119.85])
 by smtp.gmail.com with ESMTPSA id e4sm2613862pfh.90.2020.11.25.08.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:24:10 -0800 (PST)
Date: Thu, 26 Nov 2020 01:24:05 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Guillaume La Roque <glaroque@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: amlogic_thermal: Add hwmon support
Message-ID: <20201125162405.GA1263100@paju>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_112416_062650_F7E86CBB 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Expose Amlogic thermal as HWMON devices.

	$ sensors
	cpu_thermal-virtual-0
	Adapter: Virtual device
	temp1:        +32.2 C  (crit = +110.0 C)

	ddr_thermal-virtual-0
	Adapter: Virtual device
	temp1:        +33.4 C  (crit = +110.0 C)

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 drivers/thermal/amlogic_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index ccb1fe18e993..2fce96c32586 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -29,6 +29,7 @@
 #include <linux/thermal.h>
 
 #include "thermal_core.h"
+#include "thermal_hwmon.h"
 
 #define TSENSOR_CFG_REG1			0x4
 	#define TSENSOR_CFG_REG1_RSET_VBG	BIT(12)
@@ -291,6 +292,9 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (devm_thermal_add_hwmon_sysfs(pdata->tzd))
+		dev_warn(&pdev->dev, "failed to add hwmon sysfs attributes\n");
+
 	ret = amlogic_thermal_enable(pdata);
 
 	return ret;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
