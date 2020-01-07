Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75D6C33CA1
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761F1207E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i8Lz/BdD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QWaRBgfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761F1207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laXY3MSoP7poMBnR7ZGIXTFCe9u2qWiP89P8QWzqZRc=; b=i8Lz/BdD2Io0Mc
	v9VsuoS123CG5SAX20Wj8YLwdbxbNSrB7AlSVTQlcMRaEo4tdXDWn91Qt/XQ+q8a9XUhqqbncgoi4
	0N390wknM1RvE/D+nY1KN8vHz/B55yairojoVBS4DQ1aFYGEeORECPYbOq6rRXIqzD+WuP5ArmjIS
	POp0dBLGkDq9RhAtA9UwNKrRw9IxenpqEdSZYZ/aY04rB05Nr4bD+nwBceTBLfdsUwRVR0jfkrGI2
	mnB1WWFE+4usY0wyFBPQH19nAE4a0f2YOQSwKzHke7AlXxc4htpLIfI9/YSAX9YlS1ntWXh3xvy0M
	A5yLmh8aWRmcsUKsM5OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioy9m-0000x8-DV; Tue, 07 Jan 2020 23:21:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioy9j-0000vf-BF
 for linux-amlogic@lists.infradead.org; Tue, 07 Jan 2020 23:21:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id g17so1462303wro.2
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Jan 2020 15:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vV3UUGvvS5e8WsB7ogZ/noPCe30PWO4cAHloQARZuMU=;
 b=QWaRBgfZaWwF/o5TtRmsgFA8xMd72UlNn8DRyiFN0jTom3bemOIPUhrrsKBbPAIFPJ
 OfNPUerjyxw6FJm3VOSYYi5Jgr+yKEMboXZfvsuYAU45QDTIYTNGFT7b4Dnd6llum1GO
 OYVNZfemZicnDMO/Gbi6LPR+cmcbUamwBbbKb6PmT/ZELPKX9wA3PiUldg1RwEFbpZJn
 FChDB9Cwd2uWGi82zr/EoW+/0IdYDj9pSitFG9zN1kP+GK+xahlLOedxl0bQf6TtlRGj
 mcHrgAF6imjQzl6jZDR9Rxjj8vQL2u3++H3O10BNjbxcTxdtE1Aaad7VlOpHNIRI7GDf
 JY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vV3UUGvvS5e8WsB7ogZ/noPCe30PWO4cAHloQARZuMU=;
 b=YZIZKHmQuRjXzbIP1/7e3tZo+4Hta9JhPhx9UEbp8DxLUn/Fz+Lr8hzN2OaI6wiSX+
 aKNu+f18hGJaEb6TzsAodYdv44j4ce3ofOzxC3B8SNunUe2NoCc1zy+KX94UkiT9dw7B
 qHUvd1J9eEYMzSlsP8k/L4HbslHqusnUFBkip8dSCsCxrpFDfSi3P5l59PH36VqTOCIn
 JZlkm/XtevqTxw192koG4kFloQyW96HxvVa/EN6aQAfI8XiDHVIDIOBgyottxnOHFfBG
 ZcCVkojVC6yOOHFHIBZSznop8C5J5BM5TL+RgNZZt0xEfdL3G7y2yyC6sE6fYqioYxSs
 3vrw==
X-Gm-Message-State: APjAAAVlBWr4vkXV7PWs/vKNn/cyXIUYkvB2gxQOI+b9IGjzNKWzXIGl
 fZ/JRX5T+Lz3fC8jkkuTYE8=
X-Google-Smtp-Source: APXvYqyKuhYihOEUdettZiq3ZmkfYHAwS5DF2R/FVnINtIyY9r4EbiuwLBRM7ACqUWiqDdfnsEIjrA==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr1319611wrv.197.1578439258079; 
 Tue, 07 Jan 2020 15:20:58 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n3sm1669577wrs.8.2020.01.07.15.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:20:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amit.kucheria@verdurent.com, linux-pm@vger.kernel.org
Subject: [PATCH 2/2] thermal: generic-adc: silence info message for IIO_TEMP
 channels
Date: Wed,  8 Jan 2020 00:20:44 +0100
Message-Id: <20200107232044.889075-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107232044.889075-1-martin.blumenstingl@googlemail.com>
References: <20200107232044.889075-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_152059_416838_2316B68B 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: edubezval@gmail.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, jeff.dagenais@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since commit d36e2fa0253875 ("thermal: generic-adc: make lookup table
optional") "generic-adc-thermal" can be used with an IIO_TEMP channel.
In this case the following message is logged at probe time:
  no lookup table, assuming DAC channel returns milliCelcius

Silence this info message if the channel type is known to be in
milli celsius. Keep this message when the channel type is unknown or not
of type temperature.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/thermal/thermal-generic-adc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index 226e3c2b7469..73665c3ccfe0 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -76,13 +76,17 @@ static int gadc_thermal_read_linear_lookup_table(struct device *dev,
 						 struct gadc_thermal_info *gti)
 {
 	struct device_node *np = dev->of_node;
+	enum iio_chan_type chan_type;
 	int ntable;
 	int ret;
 
 	ntable = of_property_count_elems_of_size(np, "temperature-lookup-table",
 						 sizeof(u32));
 	if (ntable <= 0) {
-		dev_notice(dev, "no lookup table, assuming DAC channel returns milliCelcius\n");
+		ret = iio_get_channel_type(gti->channel, &chan_type);
+		if (ret || chan_type != IIO_TEMP)
+			dev_notice(dev,
+				   "no lookup table, assuming DAC channel returns milliCelcius\n");
 		return 0;
 	}
 
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
