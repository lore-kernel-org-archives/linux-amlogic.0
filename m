Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE531C04EBF
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B022E2082B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwkw3f78";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x9TFE5l8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B022E2082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZdP1rCViZqKWLCIQrgJGpb7oJq8liZkwOkAU9h2ZGI=; b=iwkw3f78xKs063
	OttVxtQ+vWwK//R++7jie7cUdKNVVatfsAKkGJ7DrDrJiP/Pbj+qDq0SqcHQMNsbaaSXO2G3V2TIC
	fkHL3wlWryj267w9oi95amLvmqQVsDocX4MnhR5MBg0QxJsqsAF82fcSi17lNyK/JQtsPnCK8YJ8+
	QYSB8JffK2AL2DRYQTmaqK68yHHZq5qzGkOTUDo4riBc0d/HumJgn+aEL/2ZgdhRoAeccwCjTcgRp
	uFgIIrEejy4ZhGpA+nnwcH9p8chzf5pDGoH3icH6xeKMQgx7wSQik39b/4pD6USbfJdca+RhfcxNs
	XfG5rwO83MMgQbheaxzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDx4-00025r-UU; Tue, 04 Dec 2018 16:53:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDww-0001jg-Vr
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:53:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id n190so7918782wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K40kWu2bFnwxaEfpkYLrLkpBZbXIIj4vA9lroIFYCFY=;
 b=x9TFE5l8GS7goMvDCBMrggwMzWFPJewP9EWehtKPz+C74GBF1wjzGEA0Esix8yZoMs
 qwXb+gjJTPhZ3uaYsm5PMrzFNvtbq+67jMLYb3rO011WaS/udaXsUlP1fXIa/3ePHamD
 aVGJ6Ikl++hZUS+lUp3Vn3hCqeXR5Fsqrckht/uh7yfwDOsD+PwxiJ8Gu3FB69Df3XqH
 TXow5eFRDl2rVgrACLyotp93fPlOBYw4OinzZecX4jZrHYkwQ7kAY/UwgYHPBnUEqzV5
 THeQqj3oAqVxcsP3sjX62SwLZ0HgHIEDMKB5df+WJ+Ls0u3c1va+iEi+MSu7K7NnOCug
 vKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K40kWu2bFnwxaEfpkYLrLkpBZbXIIj4vA9lroIFYCFY=;
 b=Op20G85IFOa+IkzKxMzJwsOfRcRNmw1e1QIJcX9U9fPIJ/BkB95AtJ/NyO6BvxDHNe
 suTDyKqSsPlrPAsS7eLwYw2Dypu13FdqDscJaXkH/PTCY0ArULA3uUvatILeDI41qAm2
 wIx5h+SywYRcSwAuPqVuT5mwP7Up+E5epu29R38Zoop1UNAc3/lOn79Ys9SvdclQI7+P
 ddjOqBx+4LgiPWu7nv7KZni4vmgwKbGOY3mLbrKnvykTzjDSt+Z4eD1O1BWpLL4GvWS6
 EOAEOv5otuIVM0iZ+g8KioV1M72fxvZpR2nvagabF2KoNSVJYxGGR5oLOgo5ac7o3trw
 9LBw==
X-Gm-Message-State: AA+aEWapafgXvzM6lcbL64hdfU/5RBRn8cfiRxB3BvVHrpzR7PfY9OYi
 +SQw7aXjsJqUpKDsMJOi1tQl4w==
X-Google-Smtp-Source: AFSGD/XPqhimKpWte2wk1Eo37C89ytBiK4mTyBVgUXcKqbOMtkraPZ6t9wA4bmsy2i3hDxh1TA8BFw==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr2811790wmb.98.1543942399163;
 Tue, 04 Dec 2018 08:53:19 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s66sm11581633wmf.34.2018.12.04.08.53.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 08:53:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 2/5] clk: meson: clean-up clock registration
Date: Tue,  4 Dec 2018 17:53:07 +0100
Message-Id: <20181204165310.20806-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_085331_241268_ADA1E0CA 
X-CRM114-Status: GOOD (  12.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Order, ids and size  between the table of regmap clocks and the onecell
data table could be different.

Set regmap pointer in all the regmap clocks before starting the
registration using the onecell data, to make sure we don't
get into an incoherent situation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index f965845917e3..258c8d259ea1 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,15 +65,20 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Populate regmap and register all clks
-	 */
-	for (clkid = 0; clkid < data->num_clks; clkid++) {
+	/* Populate regmap */
+	for (clkid = 0; clkid < data->num_clks; clkid++)
 		data->clks[clkid]->map = regmap;
 
+	/* Register all clks */
+	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
+		if (!data->hw_data->hws[clkid])
+			continue;
+
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret)
+		if (ret) {
+			dev_err(dev, "Clock registration failed\n");
 			return ret;
+		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
