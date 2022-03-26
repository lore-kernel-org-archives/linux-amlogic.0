Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A3DC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIlr4Ez9RIvm9EaLB5xg+UYGVnV2O2DJSRyp4CK+0UE=; b=CJpb+YwF7TH9AV
	tQhPy9wttZk2GwB+D3QeSvax1PeMkGpj/kFkmOuNCmqXozw6bvlfwcznS6QJ37AUGSkrcKi1IXut0
	/Qm6vBgn9s+uiCJkVJnzCwkX9DM3kJF9XdVffJrdETxlBNGrK9AwE0pCz807LsyV4RqsakmQ1Izkg
	4dtNQ5qHf5Gh4udoQCMtbcnAk6LZ5eszwE21/Famp6eKP9LooiYfZye9GkQvfQZY8cKj3/WjhxOm+
	tsVy4e9sLL3pUVXoJnT8D0CWQpYhGnCiMQET4QO0EgPDeIldpsfk/E+6pTf9YDfh3nbiKRhwv0nZX
	9KtjZvjVzlgAuf/SujTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY3Ze-0047wW-M2; Sat, 26 Mar 2022 10:23:10 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY3Z6-0047mH-OD; Sat, 26 Mar 2022 10:22:37 +0000
Received: by mail-wr1-f52.google.com with SMTP id u3so13840213wrg.3;
 Sat, 26 Mar 2022 03:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMZJCSh8j3Scx/3Txqvkwixsg8qJcGalusKt/a4e+ag=;
 b=0Jd1CzY8qKlKJ/jehjNCAGK4aEIofC7NQzLiGxV0H8CXhazsyma3CRV16LVtDsFaHB
 ckg1ByvH+QhaETashUiTLFCdCBgca6mnSrRSXWGNT0Y+A35h+qYtfRjyIWB99tmRQJeW
 U4EObvyYpm9fkwCO1Npv1yxuNd5aO2nEm1CQL4E7p00Hv0+elPSerLrYUExafsyfYqNP
 glgToc7Fd7kqPtA7GOia8NpJ2rshetAtQCt128QHTlkwcSEU8h0dx4rKWGusCriEPwaP
 1TrcwRc7oVgcw/5w3DtgzoHEEA4vIavVkaS6G59SWhn4ev9rXjGf5n+gv6k6tDKTMVOY
 lv7g==
X-Gm-Message-State: AOAM531tVhxrx9A1+KnbXcTEwvUsW+bU2Hg6wI65in0JykiaD3oaf/LE
 xB+jt0JEQCosbWPBeiU4N3DUmvl/B5mHLw==
X-Google-Smtp-Source: ABdhPJzaI24/mzl5qv3KP0ViFbjsTjiYbJsuzzk3dbm2uJIcK/DK2s2v9pDGdnM86sVwphHiXmtJ7Q==
X-Received: by 2002:adf:e444:0:b0:203:d6f4:3cc4 with SMTP id
 t4-20020adfe444000000b00203d6f43cc4mr13112278wrm.493.1648290155255; 
 Sat, 26 Mar 2022 03:22:35 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH 3/3] i2c: meson: Remove meson_i2c_data
Date: Sat, 26 Mar 2022 10:22:29 +0000
Message-Id: <20220326102229.421718-4-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_032236_828433_F2397673 
X-CRM114-Status: GOOD (  11.34  )
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

The div_factor is not used anymore and can be removed.
With 50% duty cycle the div factor should 4 for all
devices.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index b913ba20f06e..c35fd4122bfc 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -65,10 +65,6 @@ enum {
 	STATE_WRITE,
 };
 
-struct meson_i2c_data {
-	unsigned char div_factor;
-};
-
 /**
  * struct meson_i2c - Meson I2C device private data
  *
@@ -514,22 +510,10 @@ static int meson_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct meson_i2c_data i2c_meson6_data = {
-	.div_factor = 4,
-};
-
-static const struct meson_i2c_data i2c_gxbb_data = {
-	.div_factor = 4,
-};
-
-static const struct meson_i2c_data i2c_axg_data = {
-	.div_factor = 3,
-};
-
 static const struct of_device_id meson_i2c_match[] = {
-	{ .compatible = "amlogic,meson6-i2c", .data = &i2c_meson6_data },
-	{ .compatible = "amlogic,meson-gxbb-i2c", .data = &i2c_gxbb_data },
-	{ .compatible = "amlogic,meson-axg-i2c", .data = &i2c_axg_data },
+	{ .compatible = "amlogic,meson6-i2c", },
+	{ .compatible = "amlogic,meson-gxbb-i2c", },
+	{ .compatible = "amlogic,meson-axg-i2c", },
 	{},
 };
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
