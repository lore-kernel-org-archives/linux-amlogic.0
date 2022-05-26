Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FFC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 May 2022 21:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss+qXfevTxrbLka1TjLVX8GlOYSJXFICMqAEE7ADx0k=; b=cNO1B+EnoVALNY
	2JgXDB7jBjWIFdd3ogFxFxMk6YiHcA7Hyk2sLihCdvnfdsnfPa5CStuxXwnRCsEnKxVP8/xN1afzR
	zdXnGcOomd4uHxXfsP9yhSEVmTVPk13Fsp+t6mzA/hHnYvoJjIrVBZmTHyeMm6FdO1EIE9xUSqezA
	5UThhxbv/LGIJKv+BbghiUPi1mBtY/Mf4SQmw8K5AD+UT5QnjxPifHwLtkpDEE/c7kfXW9f06AVnQ
	z434qUscdNrQYQiOW5smmzoz76CsbBKzzajPBHJWxI1X6DpuLpEJBWq/6RZStw/hypI1caKFAAndY
	IIvsVXu0k/vkcsDA/K4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKbt-00Fvnm-PU; Thu, 26 May 2022 21:01:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKMp-00Fpff-ND
	for linux-amlogic@lists.infradead.org; Thu, 26 May 2022 20:46:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id gh17so5165517ejc.6
        for <linux-amlogic@lists.infradead.org>; Thu, 26 May 2022 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IYNJKDiS0GsxsIfjukniKUSVecFLdtV/BJTHhq/ubw=;
        b=owB1dleLPG3OEjVQ4kP49KUKmgZfacfRD5gYgPRUOIMN9K8eJhrh7WsqO81aI5JY2N
         opwnKxla+8MAlR9Zi7c0OeSV+2PWc5oTLpcFm2y1vOUusMOCPrLds6xD1tYc7QBFIKNP
         NE68c3ZMgmcJmtFzaxACWNdcQZvl/vkOqOuPSvPA+pMkuaXM0qU5gLLEcacIW8wWtSkZ
         0O03bC5+93aU6iKf/iKLvgxZeIwKJas1lslpIZFSBTUZLYBa+VCcOmniNQaLw7YLE1Ds
         dMVDslwWbvbc4TevZUSOthF+Q+C2aYrjyBUs604DXzMHMGAIJpNVcLMNW+JqKc4supIG
         /V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IYNJKDiS0GsxsIfjukniKUSVecFLdtV/BJTHhq/ubw=;
        b=fGHzZJkbFwZz8gXevGx6YWrPbDtbJNrWRBqCQaJO+PS3jIuKV3fxxKgc57+lXrWTNr
         /UVbGW8+/e/cISAXu7izZWJnH4hx7Q3kDvbNOzHcbH4udyK8bLML+gtAt3qVQdB1zFRK
         abJfsPOvCg40YqPTJxITlVdkJuUU2nbR1wP9Vx8J0T4i6VZPc+jDC27M1FyXE1SCoJuj
         cZlDFI3ACcxNwDJ57Ya8jn/bS7hLskIPbZ6SpGHJlIGj71+wIE8PF1lP7RsBBMnMWe8p
         OlThJDsguF69K/p5pjXnV816jvz8wmqVULmBD+wHg5QSamgne1De1r8uUOCv+PLvcN7X
         lCGQ==
X-Gm-Message-State: AOAM533aS6WTIN/uOTBmMu+kVa/MsIr4xJ2Js8SPM9PeFHLqyijoHSXj
	p0omXTKDqMJQ83stdkhKAyQHLg==
X-Google-Smtp-Source: ABdhPJz8AXnd6L8rAXQTGJvqOqAm1R+IiFsGG7//dQPGu4ApZsgRXYECTsCTneE4TJbZqANQfqfPlw==
X-Received: by 2002:a17:907:1c81:b0:6ff:335d:a0f7 with SMTP id nb1-20020a1709071c8100b006ff335da0f7mr845104ejc.182.1653597958016;
        Thu, 26 May 2022 13:45:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709067e4100b006fe8ac6bc69sm827633ejr.140.2022.05.26.13.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:45:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: meson: adjust whitespace around '='
Date: Thu, 26 May 2022 22:45:52 +0200
Message-Id: <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_134559_828674_4EB3530B 
X-CRM114-Status: GOOD (  11.70  )
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

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/meson.dtsi   | 4 ++--
 arch/arm/boot/dts/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 26eaba3fa96f..8e3860d5d916 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -214,14 +214,14 @@ aobus: aobus@c8100000 {
 			ranges = <0x0 0xc8100000 0x100000>;
 
 			ao_arc_rproc: remoteproc@1c {
-				compatible= "amlogic,meson-mx-ao-arc";
+				compatible = "amlogic,meson-mx-ao-arc";
 				reg = <0x1c 0x8>, <0x38 0x8>;
 				reg-names = "remap", "cpu";
 				status = "disabled";
 			};
 
 			ir_receiver: ir-receiver@480 {
-				compatible= "amlogic,meson6-ir";
+				compatible = "amlogic,meson6-ir";
 				reg = <0x480 0x20>;
 				interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 9997a5d0333a..0f8bac8bac8b 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -430,7 +430,7 @@ mux {
 };
 
 &ao_arc_rproc {
-	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+	compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
 	amlogic,secbus2 = <&secbus2>;
 	sram = <&ao_arc_sram>;
 	resets = <&reset RESET_MEDIA_CPU>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 94f1c03decce..cf9c04a61ba3 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -384,7 +384,7 @@ mux {
 };
 
 &ao_arc_rproc {
-	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
+	compatible = "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
 	amlogic,secbus2 = <&secbus2>;
 	sram = <&ao_arc_sram>;
 	resets = <&reset RESET_MEDIA_CPU>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
