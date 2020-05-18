Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F86C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 06:08:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95C320715
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 06:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYZhRKTY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="s3WBzOtQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95C320715
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8q9XfhcuVlda4RVhQi+qZ2gb33fn+rYYMyeCxhHTBQ=; b=qYZhRKTY5R5j+n
	j97pIBK0DnOOU/oDx8paFQETeinNo86f3sEkFlhkPz0K/Xtx01k0/h3vhZ//DtYteYXIhzYyMruvF
	Z6pqJwEONegMMu2cHZr19IC82Qx3Qt3upP0kwg9OO6YLzSUHglT+GJ4u4qlAf+Cm6YxbRLznQewwo
	25tj2+SN0pLDSoHxI9bOZsRzafudyZXec7AgKPI27TA6IfNgECq9rwiug9GXMT34nBGpE7OG0EaRF
	n3+nMnQJTp+vi30SJvwiCAPGRquwMePIvFNFpXgG+00xtpD5XUWjOZwhtbbUMdhijM6YvYnCD93ZY
	x03RjwYFGd/okocbWq+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaYxF-0006fu-1C; Mon, 18 May 2020 06:08:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaYxB-0006b3-5A; Mon, 18 May 2020 06:08:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id z4so6807314wmi.2;
 Sun, 17 May 2020 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gzDmmSRgID/AAT9U9NADJh+Q7oTNQ3LSGXH6EEbMns0=;
 b=s3WBzOtQG0ZljGSteUJ2eRPFU1efr1bExm1oTwdqFkxMXumhLyZ2lZVMFcsVD0Ogw4
 6oGpVTwLaDHkoO6WCqexPfswEoaAK8HpgI+TJI5uj7WIXHCAf9lE017pHW3WE4l4IcBZ
 Apbb1thutl/X57y+xux0VVIHQ4N+eglWBDjSeKzFoD0XlWBcZ5lCj6OULveC0hfKSgBi
 aEaWNYQfScsjCUzYeAlCR+Qu70cDDpOV7oNE9hECvpH1t2fzMslk0c03S3QaCWy+FNro
 Mgm2YA1uKMteGjkXRqX6xdAiIMDRKGDVbfnh8QkNXbMO8D9vxPPi+IzyvhkAoJo3AKRe
 Bh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gzDmmSRgID/AAT9U9NADJh+Q7oTNQ3LSGXH6EEbMns0=;
 b=GxTgrivszvbKT8ijjLrcpTDK+lGwrfJg1uOnNuq13PUsIlr1SIX1z+WSoqFnRuKvJ4
 5FYNSNtSzRleX7ycx/hMrm7NpA2cPwOa1FTgYZZMvZXmSyc9iZCci/LFOTKt3D4B94L2
 UV+Qje0DS4XxlaapMBcvApey/6WWVNuMdJYzY81wd2JXkrmpMUET7Ztj/C0q+5r+DST2
 YXzir6GUxkm9a9YqM530CuP23GGxhSENL4jUMGuBMYNHrdB7MK4asgybsVvrgi7JxuQw
 QxDuWQF0b7xRnGSzo3o6Z/Chz0iurCxRA491H341cPsYpuUtb2TqPNa4yWP7uKIEPtes
 OBpQ==
X-Gm-Message-State: AOAM531xAE0tvhmvIxueKiCnFWu5YwbNMT/pO6GFXgJ3ebNlNx6CBKIV
 PzkIeRiG15/M8yzPyxEzLPs=
X-Google-Smtp-Source: ABdhPJxHHbeWWsbf/7SLYQQSyy4HAmj400J9BP8xOtLUkcaJuTQaA8l4sft05aKFWuA6QJi4ZtJBCg==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr18593643wmh.121.1589782123183; 
 Sun, 17 May 2020 23:08:43 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137132e00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b19sm16120469wmd.26.2020.05.17.23.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 23:08:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] mmc: host: meson-mx-sdhc: fix building with
 CONFIG_MMC_MESON_MX_SDHC=m
Date: Mon, 18 May 2020 08:08:11 +0200
Message-Id: <20200518060811.1499962-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_230845_226088_F5C20CA3 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For an x86_64 allmodconfig build Stephen reports that building
meson-mx-sdhc-clkc.o warns that MODULE_LICENSE is missing and when
linking meson_mx_sdhc_register_clkc cannot be found.

Compile the MMC controller driver together with the build-in clock
controller driver into one module rather than using two separate
modules to fix these issues.

Fixes: 53ded1b676d199 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/Makefile                                 | 3 ++-
 drivers/mmc/host/{meson-mx-sdhc.c => meson-mx-sdhc-mmc.c} | 0
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename drivers/mmc/host/{meson-mx-sdhc.c => meson-mx-sdhc-mmc.c} (100%)

diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 8bcb420e071c..8f459259181e 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -68,7 +68,8 @@ obj-$(CONFIG_MMC_VUB300)	+= vub300.o
 obj-$(CONFIG_MMC_USHC)		+= ushc.o
 obj-$(CONFIG_MMC_WMT)		+= wmt-sdmmc.o
 obj-$(CONFIG_MMC_MESON_GX)	+= meson-gx-mmc.o
-obj-$(CONFIG_MMC_MESON_MX_SDHC)	+= meson-mx-sdhc-clkc.o meson-mx-sdhc.o
+meson-mx-sdhc-objs 		:= meson-mx-sdhc-clkc.o meson-mx-sdhc-mmc.o
+obj-$(CONFIG_MMC_MESON_MX_SDHC)	+= meson-mx-sdhc.o
 obj-$(CONFIG_MMC_MESON_MX_SDIO)	+= meson-mx-sdio.o
 obj-$(CONFIG_MMC_MOXART)	+= moxart-mmc.o
 obj-$(CONFIG_MMC_SUNXI)		+= sunxi-mmc.o
diff --git a/drivers/mmc/host/meson-mx-sdhc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
similarity index 100%
rename from drivers/mmc/host/meson-mx-sdhc.c
rename to drivers/mmc/host/meson-mx-sdhc-mmc.c
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
