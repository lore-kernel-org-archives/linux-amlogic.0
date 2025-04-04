Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3CC36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtoKwarspVUc8S9dAvrGf06Hr52ktcYSSr42M/gP6NE=; b=4GKETeJ5y5enfQ
	ZcRVFmyFNJGKFy60d6nK2hHrJgC7wF3/3/7XmzbcaDN+i/t23eA0yEzk+xReIkSiAQ3iXDhcLE3tJ
	+vS/SsuimhSOdTILg/IJbKYeiywZhbo/vH7/o5loqgBu81fq/5SGcwWt6PDFihVJPv7as3au4mQlg
	PODkVwCRPu4ozWCGak2KA2DvqefDLz9ftD7hSLvkF7RSCwWlU7+5BwQEp2G+a5tX7ouiu+Oc7fyvX
	tHtgNM88SuPyySXD7js4gxiZio4nQxsROrqbAO5tAbc4V7AMEcrwqHFWQei3UVDcEIKuNCcstfXPJ
	FrgjYHFcMHkbYoCF2mHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0foM-0000000Bd7u-1aHA;
	Fri, 04 Apr 2025 12:06:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffZ-0000000Bb9e-0OtC
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1376455e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767827; x=1744372627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=u17jNumRN8Hd8pGkm/gntgmXrLA77oyBfE9fQXePViPGPiAE+VDWLu6cTfD1o0LP70
         unDcwXTDkFuDtm19RvN9pKxFjMLOXJvI79ucUwkrMNIbQ7WK2IhQYV8EAoQXeZuUNO9D
         idc7YlKc2ADK83vLca4+zyk9l6ArTZq0gJXnehbICetav8ybO+/Bg9VnVGrXzDOD017t
         h5af6DUlS/qMSDmKiG5W3oUCIMquEvAP1RSxP/gFXszHfw4qT+JuzjqdFkttySVbJkua
         A8msQTgeUYXpQlifznU3BbUFHPqjKnNZig9wgxjgu5AG1TF4hv8d7f0Kcz/PH3lNLOHN
         zdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767827; x=1744372627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=WtHxcsHW12vtOLOOBHg8+eXPoAJscsRXvPVFtUiQnhoeAaLkmOzF9/8up5kifRNY95
         phvxlT3KgPgXgZUH6kyqSaRXxvXddhM3e31CCRWHktqiOJN9h0RVNfjL1N8GxKGNbUtl
         p175cvwaKTr0eAGH1nR8B0pBHVmFNlKbwIYObb9lqFlFxxIJwKRm3s6UwgohRFIJ1WiB
         SuTKPa/CyzU3uQPtV8wq+VHPbUT3LV/FYUhxfAB/g/mcWK3FINKyoGib4xmUvZgcdL/2
         Ke5Vk+0ypdfwLJwOa5YmCvXtRGiQEPRIGEs/Ordo4PsExAnFv/6raB8r1c2qgk3T/aXp
         4EMg==
X-Gm-Message-State: AOJu0Yws04tMqMePtoD8lxzMl9L+V5kZnNaJcOpPLK9kHFHq8NJd4dKZ
	yBssSqSc3gbpK8iGN4aAkKtfvWpld05SrQM9BjQCjlQUz9GQwdRzpCSXNlw/QIE=
X-Gm-Gg: ASbGncsKlD5e346DacLlaJKVC+Y/mqd2zwrPORlZFL2UB0FY/RhZcwskS3N15ok/5dH
	zDkowQC3us9eku6ngl123gmXBF6Nirwvin1BlGGlnpEHqvR/TwxkNVVglyDNuo51EhyHUSBbHzE
	DY5I28mvHzrsFaK6dfuHEk/8qYGiG3gP/AuKA4iRnw/1Y+qZrWN8EJJvyUIxbSQoBxNd481luoN
	gN79ipcdYPNFAkgNdUB6jPgLyv8Rf9PDR5hbcXUGzFhH/NXM+Qj/20Z6GF7ILURQXwE+ElVD3YJ
	LqOn6u/sS6zpKaCIytkORsI/Vtf7fH/fw8UQc6Pzu1a/4RLz2Kn+c50YYSs0uz0=
X-Google-Smtp-Source: AGHT+IHHD7HuendpPytpQj7rstsIi+Mc3ng61xMnf8Qu66Hus393p51dcdiyAL39bcJzERvr8KKSjw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr9352835e9.6.1743767827420;
        Fri, 04 Apr 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:00 +0200
Subject: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during compile
 testing
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045709_152465_0234C24B 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -9,123 +9,123 @@ if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
 	tristate "Support for the Allwinner newer F1C100s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUNIV || COMPILE_TEST
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1/R528/T113 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_CCU
 	tristate "Support for the Allwinner A523/T527 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_R_CCU
 	tristate "Support for the Allwinner A523/T527 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 
 config SUN5I_CCU
 	bool "Support for the Allwinner sun5i family CCM"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN5I || COMPILE_TEST
 	depends on SUNXI_CCU=y
 
 config SUN6I_A31_CCU
 	tristate "Support for the Allwinner A31/A31s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
 	tristate "Support for the Allwinner A33 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A83T_CCU
 	tristate "Support for the Allwinner A83T CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN9I_A80_CCU
 	tristate "Support for the Allwinner A80 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 endif

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
