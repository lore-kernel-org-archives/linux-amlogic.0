Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23CAC001DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB/z37YVYwQ4ivgXSyaR0SFPjRK1w27Tk/nDJ2Akohg=; b=qOZRHF78hNKTIX
	4CITfQdcS6qKKho8hkRbkZZ233HU2Bc/iOE0u0hBh5mCSgNoo3jcpClpmIKHkKMt4LERcNjAG4TG7
	Mv0F+03KlcBVrDjWUVi53v65EGWFZIrfbfvdY6vu3ev/Er+c5USoPDnEfapt7cXfBZIauyYf2RoW3
	8RFlGFIHlbpZHbhoHXJ3jki6zDT+qpIBFXnDo8pfjny7AOWCvk3fHL0/rT8/DwS2ltcqf2DeKytyj
	4mfxhT8U7nLkujZuMZCXBsuiVfkUoEUYNV9Nuc4eCDraWtzVEbShdObBGXWVCMrbXBFtb2kfa0Led
	Tnbo+SNdqD4vPpWRvQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm50-004oPm-36;
	Fri, 07 Jul 2023 14:05:02 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm4n-004oF7-0q
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 14:04:51 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so29181771fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688738686; x=1691330686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeh5/DbFBerqxJsBbnsYRr6PKdng0uv/R2Q5wv9639U=;
        b=jGLVwn36CByMCtipg4d4XALkBRUKqWv0R6HZTUXklQUvDJCclxU+zkrJfwUnRo44Qe
         pW2zszr5s3fk0xHaK2wfVsPmyWtLdTYXuKiKvKMKOA06bG0PaUXzAvBNvb8+9Onh2wQ1
         KXLzplmLECGVgtrwD6mmd7fkyHTUKy6kxTcK/V12edvM6fP6tTHaQ1LTTZ0h9Kroy86I
         jAXka0FZW5Y9jTSJ23RUg4fA6UWNK1PtrrzWg+4QF9a1d/WACYvlNPx0YM4os7nNXclf
         dxEhJDmLqgC5UqiNQsKWpF8Wqly/n71ODUYAKiD6dFXtmP5Hm/Md/cb1hKjYE6rZPYWQ
         joDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688738686; x=1691330686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeh5/DbFBerqxJsBbnsYRr6PKdng0uv/R2Q5wv9639U=;
        b=MvvjvNJ/5pEzENwPkPOfhtAkBe8zym5kGZo2tEcEpXfMymMgneieR96x5PWHxdNoJJ
         FVTZIoxM4xIETY0FzKSmaQ08sRXMPI1xRDjkbNq3p2MP3YhAzZpZDbIKGkqGVOnWUm5l
         nukv8DziQTdUr30qFMN9ENmQSCjcxbENcj9H8FacMZ7/rO2aZ3zdFowQi+0Md7PscT+Y
         Eb5PbG7EL5lbm2XpRZ0zEouh9Jq/jA+TKvkDgESWVUhbEibISyeQo3IPq1MMjZV3v9RC
         OhH4eN3OXAyvofGfJyBBYgSG6EkOIvpmyJyLND5QB9P2+/wLaJRFUSdCnjr1+qRRR0TN
         15TA==
X-Gm-Message-State: ABy/qLYhguMbU4rk0qDQW4Fu4ExjvZcQ5/LtmgahA7R5cbLekLCrrsnb
	Xf/+6PYfB/Yh86EQF2QhkW6VmiLWtAvI9iNJhKo=
X-Google-Smtp-Source: APBJJlGU4sWqpzDzusqijcw45XQ/FfxTFm8i0SwYKzBkADAqexI/4PhgDGiNTsaHIZds4E4hrP/oDg==
X-Received: by 2002:a05:651c:201:b0:2b6:dbc5:5ca4 with SMTP id y1-20020a05651c020100b002b6dbc55ca4mr3496861ljn.16.1688738686129;
        Fri, 07 Jul 2023 07:04:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e8555000000b002b6cb25e3f1sm760341ljj.108.2023.07.07.07.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 07:04:45 -0700 (PDT)
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
Subject: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the genpd dir
Date: Fri,  7 Jul 2023 16:04:19 +0200
Message-Id: <20230707140434.723349-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707140434.723349-1-ulf.hansson@linaro.org>
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_070449_321665_67BAA090 
X-CRM114-Status: GOOD (  13.28  )
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

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: <linux-amlogic@lists.infradead.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 MAINTAINERS                                        | 1 +
 drivers/genpd/Makefile                             | 1 +
 drivers/genpd/amlogic/Makefile                     | 4 ++++
 drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
 drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
 drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
 drivers/soc/Makefile                               | 1 -
 drivers/soc/amlogic/Makefile                       | 3 ---
 8 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 drivers/genpd/amlogic/Makefile
 rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 588769fab516..9b8c9ae2375d 100644
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
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 3b0f9fb3b5c8..dc93e1762ca7 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -23,7 +23,6 @@ obj-y				+= mediatek/
 obj-y				+= microchip/
 obj-y				+= nuvoton/
 obj-y				+= pxa/
-obj-y				+= amlogic/
 obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
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
