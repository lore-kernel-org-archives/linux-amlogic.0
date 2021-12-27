Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A3FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 18:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U58WcrpMVi+7dY1FBTI0GBK9tTnTL0CfRqnmRgf8DdE=; b=L4wrnSVYNMZgF+
	B3p09kRVmE0eYa8UA9ppPLxCKSWd+lRSFUhhwoSDU3LcRMlMQMkMVn1OAhMh8jRis/esYXoN35LOE
	IQVSayL8H5tel2mpNokDtNWJkePCrlGHuKgPiN+PQZWTqMeRAzNBNLeySZ2JMi65tHH26d3sC6atx
	M9UAXx33s5auRes1TMc8RySKqjAW/qYXxi9UAmtd08o1l/cdlzDYgZ8EDLPtqstJ5n1agWZm2KNxG
	myy+/X+fvIehfSU21h8Ze2C6GfV/gMFBISb9iFIUoNACEjXEKMBilDQHk5/uD0hJSQAgjnPCPIis6
	2BCqnGt4FrVf6EXrrWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uIq-00HCyU-EE; Mon, 27 Dec 2021 18:00:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uIf-00HCtH-3t; Mon, 27 Dec 2021 18:00:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id e5so33670349wrc.5;
 Mon, 27 Dec 2021 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPoQgTS1KmVFy90W+NvwmeK9gvsrVLDXWCHILurYpF4=;
 b=R6a1sE60uGxkTSpchGmaw0fcubKH43ijxIMCNwBV0tRzTrlu1VljnquWFpLBo5Ydvu
 v83W/iKkvv9yFHIF7bHaMawQa7eTPSp5RQ+jukanfcEILTo8MKkjQRdvV7Fdgw1xrHJA
 uFDzcdBKS3LiG7ksWv7Cwe6y2hOVZlJkvPXcpotucohOS90+Z9pEXmJah3ENfWj515Zp
 SKgRCh1Ny+SGqZu9WcyO8dpu1KShg8WM4MULg6xgEj+268mTNm+LjNEirbt2hqyaXCw3
 FlOzA5HVb61WoqtltTVuAi0uOvFxzXdZod69NXCIlJlYjOcH9iD//6CXlLnQM48aZzd5
 TEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPoQgTS1KmVFy90W+NvwmeK9gvsrVLDXWCHILurYpF4=;
 b=k5EVQMDTrr6bqgvnaBD2KGslUtI8/7hd29QugKPahkCZ56d2EWHyTChyNdAgycHkGj
 S158GfuXKLGWB45Ranv2nectjvtgkxNP/VW1scVxcKj8mMpHLW8boNCW09w6Dr6O0sCD
 TjeOEpBPwfa9GJwnAqec71qQPnL239sWy5Pux74DjPDAZs6q+uCadVqYx8p3kdygkNCV
 pvsO7TVbp7H7r3DXL/v/zmlkQXV7E5Gn8293TTohyCc98z2/amZQ/OwIi+SegKnfqZNC
 W66BrfeNO58kWuqvm3Vu6drFWKf8HAZxZEUmJb4lXxFezFc5QmpVcrVfvWJ3wOoCxsgt
 ToLg==
X-Gm-Message-State: AOAM531qTj+lt11kBykgpLYx+5R7I1aJjwL5Y62yZFJYc8rVquQNhQyz
 37eBsWhfcw3MhLuUCiwuhl+8L3k59V8=
X-Google-Smtp-Source: ABdhPJzH3wWk4vzNSxrurF8PiDQCpZOr2Tvtc+/Setuzmad0Ya+yIxzDoJRnDBxWyxG9Z1YJddhgMA==
X-Received: by 2002:adf:de84:: with SMTP id w4mr12966739wrl.67.1640628041292; 
 Mon, 27 Dec 2021 10:00:41 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c4b2-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c4b2:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm18572946wmq.15.2021.12.27.10.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:00:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Date: Mon, 27 Dec 2021 19:00:24 +0100
Message-Id: <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100045_181397_69D95E3C 
X-CRM114-Status: GOOD (  11.13  )
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

The dt-bindings for the UART controller only allow the following values
for Meson6 SoCs:
- "amlogic,meson6-uart", "amlogic,meson-ao-uart"
- "amlogic,meson6-uart"

Use the correct fallback compatible string "amlogic,meson-ao-uart" for
AO UART. Drop the "amlogic,meson-uart" compatible string from the EE
domain UART controllers.

Fixes: ec9b59162fd831 ("ARM: dts: meson6: use stable UART bindings")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 3be7cba603d5..26eaba3fa96f 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -59,7 +59,7 @@ hwrng: rng@8100 {
 			};
 
 			uart_A: serial@84c0 {
-				compatible = "amlogic,meson6-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson6-uart";
 				reg = <0x84c0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				fifo-size = <128>;
@@ -67,7 +67,7 @@ uart_A: serial@84c0 {
 			};
 
 			uart_B: serial@84dc {
-				compatible = "amlogic,meson6-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson6-uart";
 				reg = <0x84dc 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
@@ -105,7 +105,7 @@ saradc: adc@8680 {
 			};
 
 			uart_C: serial@8700 {
-				compatible = "amlogic,meson6-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson6-uart";
 				reg = <0x8700 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
@@ -228,7 +228,7 @@ ir_receiver: ir-receiver@480 {
 			};
 
 			uart_AO: serial@4c0 {
-				compatible = "amlogic,meson6-uart", "amlogic,meson-ao-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson6-uart", "amlogic,meson-ao-uart";
 				reg = <0x4c0 0x18>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
