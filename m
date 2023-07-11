Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509EDEB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AYEVXHTg6OujakzcsP7+OuGeUPdFQ/q49y1mEbRsxGA=; b=HC1XnGlYzKaLqg
	+olHZ5N03iGhqP3wbLs51jPp8s9LfHpH2c3FkWR1WR82P1CdG3DL+hUv+Mngokfnw3y/Qx5YuKHlh
	4h6fIzpEpGgDTwTWqFruAC1QXf4wlP/laZmZPax+Mc1vu46WWq2psiDXn0fBjXl93845BmOa8RfPB
	nOVw9Yq5FUnM7/0vsJbELmkzdJOExPTotCiCSFxjFkm+5NkcoyYs/dviLIudRq9a3dE3HHYtJgjIx
	8iRwRp+8Uj/ilNQ4J7HCRSx9Hg065zqHJ45vQQzbw7rjIjUBDwglwDLDi3eA5IaJxkALQ5AHkgbZD
	xaybu3XimpYG80keEhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJEIB-00F7zv-1s;
	Tue, 11 Jul 2023 14:24:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJEI8-00F7zE-1E
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jul 2023 14:24:37 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fba03becc6so8585214e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jul 2023 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085475; x=1691677475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ETzJnyxb//1LYCRZgH6X5nK55znbdEdKT0t8qjhkAw=;
        b=TpQjD365mxeGXkAjNS1Yg5OzWV5hWBmQFP1W5jq6C/AgtBmyVfUiBwjjdYXC8Eae1p
         gzTVXLqA/LRNhkzEferJ0M3dGsZ8dYPRip9BB5MOCbevyG2N2xyIyS8V1PQ5paNd7W4S
         MYQukgp4KFF3xls+tzfj7Gjv0b1HA9RRV5PmYg008NBqRV9o4zLoJ+RMcekCayb8I+XM
         e1/HZ+1yH4cfLg3ulOsh1p53gr6Hm4neaIhMNFhBlZRV2NrRWRVzSouVSULYQwrSio1t
         +7lZ7G99ooRXummOAXo3N2Yxu5iF+kBjbhyypd/bSwwiAnWmTQr1ososN+jB3VRANZJG
         oMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085475; x=1691677475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ETzJnyxb//1LYCRZgH6X5nK55znbdEdKT0t8qjhkAw=;
        b=ha/E63mOwBUIlGM315Qw1W3VT9/+hBKn/UszRinSdG2EiDc3Hv+JgNN6yP/iR4T46N
         GbBVQUG7zmAEkNQq6xrYEMX1ZmR5ZkOtSfO/+FX/Etomrrb9u5Y/roUxESWH0M2VZfVN
         vlwUTAZkijubBH8DM4zAJkWcCgYyR2/OvCPUojOXLoY3v6WCDySfXOKhN/6RtiEkWr45
         Q/kVmhbFqXxB8st8LCmKP+PkRv8oRTxR55rmwn/SZqQH1V52PpHhoBRtWPu1kH+WLS5X
         UcRPiNaD7G/tJEjNXbNimZX3HGZeRJDWwFKXeVIiAvkLijeguoC3kfvKoD2/n0qi3XFJ
         PT4w==
X-Gm-Message-State: ABy/qLbDEjSpI1LeHrVYiiwwWRgVLK9Tn46X7UBNGLpgBLriGDRGzM7N
	24dGaZ3WoCNP++RSACacgkVr6g==
X-Google-Smtp-Source: APBJJlH5vtnfD2VWOxoAWSTv1/4Sxwt9FRzf0RXakCeJHs85TPWrAyK4Co3SRyIcN0Rf1+grwX7y8w==
X-Received: by 2002:a05:6512:4016:b0:4f6:56ca:36fc with SMTP id br22-20020a056512401600b004f656ca36fcmr7142871lfb.6.1689085474936;
        Tue, 11 Jul 2023 07:24:34 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id g12-20020ac2538c000000b004fb763b5171sm341888lfh.86.2023.07.11.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:24:34 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 03/18] soc: amlogic: Move power-domain drivers to the genpd dir
Date: Tue, 11 Jul 2023 16:24:31 +0200
Message-Id: <20230711142431.751888-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_072436_417932_331A2FB0 
X-CRM114-Status: GOOD (  13.15  )
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

To simplify with maintenance let's move the amlogic power-domain drivers to
the new genpd directory. Going forward, patches are intended to be managed
through a separate git tree, according to MAINTAINERS.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: <linux-amlogic@lists.infradead.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 MAINTAINERS                                        | 1 +
 drivers/genpd/Makefile                             | 1 +
 drivers/genpd/amlogic/Makefile                     | 4 ++++
 drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
 drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
 drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
 drivers/soc/amlogic/Makefile                       | 3 ---
 7 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 drivers/genpd/amlogic/Makefile
 rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38eebcc97aa2..ab583b8c5b97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1843,6 +1843,7 @@ F:	Documentation/devicetree/bindings/phy/amlogic*
 F:	arch/arm/boot/dts/amlogic/
 F:	arch/arm/mach-meson/
 F:	arch/arm64/boot/dts/amlogic/
+F:	drivers/genpd/amlogic/
 F:	drivers/mmc/host/meson*
 F:	drivers/phy/amlogic/
 F:	drivers/pinctrl/meson/
diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
index a2d5b2095915..cdba3b9f0c75 100644
--- a/drivers/genpd/Makefile
+++ b/drivers/genpd/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y					+= actions/
+obj-y					+= amlogic/
diff --git a/drivers/genpd/amlogic/Makefile b/drivers/genpd/amlogic/Makefile
new file mode 100644
index 000000000000..3d58abd574f9
--- /dev/null
+++ b/drivers/genpd/amlogic/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
+obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
+obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/genpd/amlogic/meson-ee-pwrc.c
similarity index 100%
rename from drivers/soc/amlogic/meson-ee-pwrc.c
rename to drivers/genpd/amlogic/meson-ee-pwrc.c
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
similarity index 100%
rename from drivers/soc/amlogic/meson-gx-pwrc-vpu.c
rename to drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
similarity index 100%
rename from drivers/soc/amlogic/meson-secure-pwrc.c
rename to drivers/genpd/amlogic/meson-secure-pwrc.c
diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
index 7b8c5d323f5c..c25f835e6a26 100644
--- a/drivers/soc/amlogic/Makefile
+++ b/drivers/soc/amlogic/Makefile
@@ -2,7 +2,4 @@
 obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
 obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
 obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
-obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
 obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
-obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
-obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
