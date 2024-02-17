Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D823EC48BF5
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Feb 2024 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Lb9vQUuB/7AjgrEopQqdOa7NCbCeaG4oFgaRu7KGJ4=; b=Qp97CtS5iTrFDR
	GpT0TXRKcrjPILd1H62butTzZpzGo9qxXfZb7naKFIDbJe7LlZ2Ukq/7QrVVZbseLnOxfraDSO2lr
	89GvbpNpJ8SbbagvefJxiu1O6Qr7gLUhqeIp7cTeEwDacqDvqw1bMy1Wzl0W/fikTtZ46eGJ/dBVK
	GEbNmx50F1DmjGKVPonq/uV51/Nhc9tmli+0Dlc+EchrBgR4+jU51hI7lBv3YLBnR1VWC5Q4UcPH6
	06pSF5+SOxRdqMIXorJPpwTBrt2ZnAO4j4GjyaWRyv+y7gl3Xzw4z2+n/EwYdgyH8NbP6M38q4CL4
	Z7EjZuzFlXtzBAXZK+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWW-00000005H0j-0qWX;
	Sat, 17 Feb 2024 10:02:20 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWS-00000005Gxh-0xLx;
	Sat, 17 Feb 2024 10:02:17 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a3e05775ab9so104704266b.2;
        Sat, 17 Feb 2024 02:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708164134; x=1708768934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZM66OWGdF6SbtT/QLY8tKqxblTioRIXbDjnM5RGQoM=;
        b=ebZig5JaND0Sp2J+WcvCYaaNidl9XhefSiwq+1QbI43EvTlWZaarIx88/I0wjHt64E
         Uh0tX7p/DnGTGaV3BUTUPpnMHjjle/5sA/DHAVnfNQ/M1dfLe6WxQWscQKsbEfHc5M5j
         SvvCUnDdtJtbZQZrJ/21jXa3mkbx+os5SRNIpYk47SKIrs/4Bn9vgYis5F5NC+bVfCm/
         nI3gdiOXI3esXmYRP7il3xyklDu7TV9UXQrdZdjUoqTaXgNtdMb9my1DhkX8s1fE1dJY
         soOwBLjJpRfZNSDJ7TaIKJUArcIZMbrW4DcRnWC5HljuovMIGhTktr9xyh9kxSZZvVa/
         i61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708164134; x=1708768934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZM66OWGdF6SbtT/QLY8tKqxblTioRIXbDjnM5RGQoM=;
        b=Dam8NbDqDr1EnYCR4zbdMRWst9esyVWpLo0qU6EMemu6JaMV8ZU/n1HFYuZg9hkg8D
         c6D3OAxXHc70ABnWO4XGc/trdHXLJ5nnjKRQ4WmhnYpqwvP0bj02zlG9wqn503a9OHjg
         BX52pr7GlxRakwiUfcb0ZNR+CNmYwPvMk/Zx0uu0NCxOmVzM7PTgAt+Zt16c1pwo9IWg
         OdlpYP439/PISoySqiQG+pMz0hsjzTaW7OOonta25VDYWPf+6blAvG/tMr13wvgTCC49
         nmq/u8OEU7PNP4pkHb7dPfSTKr9x34TM0LessyuubhwPjLzN6nZtfjbt4yrCjdCt4kzZ
         Egfw==
X-Gm-Message-State: AOJu0YxsUv772PRRq2lnCO+kSzPR0ji/DmWDyDvnRoJUKL1Nci1YKmoe
	rDLKA/W7ezYkxY84gPHi26ueUwR1BMspC8LXiY/r4Qxduoi2YYdweob88vkQ
X-Google-Smtp-Source: AGHT+IH8aFNkKOjHk2QaX+mE3vWKGtqusxEFTd96jtkQJfQEqeUCvx3ptfcS86lAFFLwTWbc4nxtwA==
X-Received: by 2002:a17:906:abce:b0:a3e:13f3:e1ab with SMTP id kq14-20020a170906abce00b00a3e13f3e1abmr890687ejb.3.1708164133432;
        Sat, 17 Feb 2024 02:02:13 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c18b-3d00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c18b:3d00::e63])
        by smtp.googlemail.com with ESMTPSA id vu2-20020a170907a64200b00a3d2e690abfsm832444ejc.122.2024.02.17.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 02:02:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	ulf.hansson@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/2] mmc: meson-mx-sdhc: Use devm_clk_hw_get_clk() for clock retrieval
Date: Sat, 17 Feb 2024 11:01:59 +0100
Message-ID: <20240217100200.1494980-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
References: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_020216_322643_A24E5F29 
X-CRM114-Status: GOOD (  13.29  )
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

Now that devm_clk_hw_get_clk() has been available for a while we can
resolve an older TODO where this API did not exist yet. No functional
changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdhc-clkc.c | 43 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-clkc.c b/drivers/mmc/host/meson-mx-sdhc-clkc.c
index 19200b7079a6..cbd17a596cd2 100644
--- a/drivers/mmc/host/meson-mx-sdhc-clkc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-clkc.c
@@ -71,12 +71,23 @@ static int meson_mx_sdhc_clk_hw_register(struct device *dev,
 static int meson_mx_sdhc_gate_clk_hw_register(struct device *dev,
 					      const char *name_suffix,
 					      struct clk_hw *parent,
-					      struct clk_hw *hw)
+					      struct clk_hw *hw,
+					      struct clk_bulk_data *clk_bulk_data,
+					      u8 bulk_index)
 {
 	struct clk_parent_data parent_data = { .hw = parent };
+	int ret;
+
+	ret = meson_mx_sdhc_clk_hw_register(dev, name_suffix, &parent_data, 1,
+					    &clk_gate_ops, hw);
+	if (ret)
+		return ret;
+
+	clk_bulk_data[bulk_index].clk = devm_clk_hw_get_clk(dev, hw, name_suffix);
+	if (IS_ERR(clk_bulk_data[bulk_index].clk))
+		return PTR_ERR(clk_bulk_data[bulk_index].clk);
 
-	return meson_mx_sdhc_clk_hw_register(dev, name_suffix, &parent_data, 1,
-					     &clk_gate_ops, hw);
+	return 0;
 }
 
 int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
@@ -115,7 +126,8 @@ int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
 	clkc_data->mod_clk_en.bit_idx = 15;
 	ret = meson_mx_sdhc_gate_clk_hw_register(dev, "mod_clk_on",
 						 &clkc_data->div.hw,
-						 &clkc_data->mod_clk_en.hw);
+						 &clkc_data->mod_clk_en.hw,
+						 clk_bulk_data, 0);
 	if (ret)
 		return ret;
 
@@ -123,7 +135,8 @@ int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
 	clkc_data->tx_clk_en.bit_idx = 14;
 	ret = meson_mx_sdhc_gate_clk_hw_register(dev, "tx_clk_on",
 						 &clkc_data->div.hw,
-						 &clkc_data->tx_clk_en.hw);
+						 &clkc_data->tx_clk_en.hw,
+						 clk_bulk_data, 1);
 	if (ret)
 		return ret;
 
@@ -131,7 +144,8 @@ int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
 	clkc_data->rx_clk_en.bit_idx = 13;
 	ret = meson_mx_sdhc_gate_clk_hw_register(dev, "rx_clk_on",
 						 &clkc_data->div.hw,
-						 &clkc_data->rx_clk_en.hw);
+						 &clkc_data->rx_clk_en.hw,
+						 clk_bulk_data, 2);
 	if (ret)
 		return ret;
 
@@ -139,18 +153,7 @@ int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
 	clkc_data->sd_clk_en.bit_idx = 12;
 	ret = meson_mx_sdhc_gate_clk_hw_register(dev, "sd_clk_on",
 						 &clkc_data->div.hw,
-						 &clkc_data->sd_clk_en.hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * TODO: Replace clk_hw.clk with devm_clk_hw_get_clk() once that is
-	 * available.
-	 */
-	clk_bulk_data[0].clk = clkc_data->mod_clk_en.hw.clk;
-	clk_bulk_data[1].clk = clkc_data->sd_clk_en.hw.clk;
-	clk_bulk_data[2].clk = clkc_data->tx_clk_en.hw.clk;
-	clk_bulk_data[3].clk = clkc_data->rx_clk_en.hw.clk;
-
-	return 0;
+						 &clkc_data->sd_clk_en.hw,
+						 clk_bulk_data, 3);
+	return ret;
 }
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
