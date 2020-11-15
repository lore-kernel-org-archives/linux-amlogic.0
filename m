Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CA8C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 19:07:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614D82244C
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 19:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXchTj9u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mIQ8Av7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614D82244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yB0mKPqM3PEj1my8Nsd1c09V+ttNAUKVmUVk+e1OgTo=; b=sXchTj9u5VQ0u+kD/XKF2cerg/
	LLa0rD/RFDyZJ62JAFafxMcz50IO/T7tLalaDbCHcMc6UejIOx63llqUSi6ocwkqHCMFhdmE441p9
	58RmxR6Aqyuh3oMhaynPqBz8qzKFKOpQDWXiqBPE9TGt78dCvES3/M317KVw2K5KPs3ZTfXSO6CNc
	XqOUPc26LX7eSIOFyI1sPmkK7y5Sy90jc1hJCjEsVBt+oxTxvWbulC8D/QTFwS1UNwormBUDrQffT
	FJEPjF3bXPqJvw2jv+wnmANFI/4jndqYpxDa3DThdkPxzgWv2I15BbBRzfItXGeIjH1bd7SIQIQTE
	2SXh1p6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keNMl-0006SY-9b; Sun, 15 Nov 2020 19:07:11 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keNMi-0006S6-7J
 for linux-amlogic@lists.infradead.org; Sun, 15 Nov 2020 19:07:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id l1so16427221wrb.9
 for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2020 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7roRCqL5Ay4r8Kq4FOxDSQwbJ/1pjtvGTuBd9UPkQAM=;
 b=mIQ8Av7HDseFauMW4+BA3K4phgYTqQpav3PChSMOT5uP83FkZcTXS/8F3Vq5TqcfLN
 EKU+C+Qwf8qbM6r1lmVEfUIav2Uh6nqjPDnm3L3j5/IRd80NTUdyjiDpXevuyJuxRyaX
 04l0/sF560u7nCJiYQpghgqqEOv3NmfunWpBgbCBm+e+edBNII/y8q1MzP34lu26LY4A
 Ha1m1WNTQuQ4edJ2AOGu+EOZgIB0AfhNqL7kooqNuAVXpCFxNCrWh5Hi/qwOPRsktQiA
 IUExLCybSeUtZvLMBLiC/PagdD6CsA/mtdp98ZnD607yzJYz02N0McwH39Va3Zbn2mwx
 mJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7roRCqL5Ay4r8Kq4FOxDSQwbJ/1pjtvGTuBd9UPkQAM=;
 b=Z1QqV6mzPNEezSi8ggSy6VvIL3wPkirTSCf6Cb6sMDryWBoN8ISQhpy2Z0xN9qBJDU
 flqnYMER+tf9Y4jFKmnKvCotjlLbE1GOT2B/kXzc4B2iLeELhdRrg9GSPdLm2Z0yd77z
 WGSPPPYiLVJYAI3SUz4y5QenKKSnc/PhJJdQjE7SoL09cHBjTXrLvrhQxL+NXPXpJT65
 E17chnWoTkU9YgDE8CPiyTf+n1eGmiYEw2IBK9sMmzIoWgRqWtzq/1zJwXEr5uwpWq+P
 qObQMycjaHeZxs5dkM8KBP08vslYaYswKeHiW0fsze2MKbUOVfY5Acs/FeSb/ZQ3bf51
 Z/6Q==
X-Gm-Message-State: AOAM533Jaf1K9UTqjTk8+pF8ejGedshk5fC6eKuFHkAp9zapm0TYu1Im
 C8cHUb14E5tn6bLJL4hkSeU=
X-Google-Smtp-Source: ABdhPJwGSvwkPTTNP2qUQL/7YRVjKWuNCTuVxK+0a3BAbOQqNJL31OfQm92WtFl4KKsqcy903mJphw==
X-Received: by 2002:adf:814f:: with SMTP id 73mr15192513wrm.174.1605467227250; 
 Sun, 15 Nov 2020 11:07:07 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id u5sm14707869wro.56.2020.11.15.11.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 11:07:06 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: glaroque@baylibre.com, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] thermal: amlogic: Add hwmon support
Date: Sun, 15 Nov 2020 20:06:58 +0100
Message-Id: <20201115190658.631578-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_140708_302091_A546F36C 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: amitk@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Many monitoring tools read the CPU temperature using the hwmon
interface. Expose the thermal sensors on Amlogic boards as hwmon
devices.

Without this lm_sensors' "sensors" tool does not find any temperature
sensors. Now it prints:
  cpu_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +44.7 C  (crit = +110.0 C)

  ddr_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +45.9 C  (crit = +110.0 C)

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/thermal/amlogic_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index ccb1fe18e993..dffe3ba8c7c4 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -29,6 +29,7 @@
 #include <linux/thermal.h>
 
 #include "thermal_core.h"
+#include "thermal_hwmon.h"
 
 #define TSENSOR_CFG_REG1			0x4
 	#define TSENSOR_CFG_REG1_RSET_VBG	BIT(12)
@@ -287,6 +288,9 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (devm_thermal_add_hwmon_sysfs(pdata->tzd))
+		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");
+
 	ret = amlogic_thermal_initialize(pdata);
 	if (ret)
 		return ret;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
