Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD43C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdBQh4m3mwXe9+fk69QHv0k6ToeogyflTvwUn3C+UgI=; b=kqoF24duPfwSVX
	jlFnWudhiCoSplFlbj5TNi1SBXnesnlHbSiJJkeHBn58e9JN7rBjXafQyFUmLE8gCh+Mjqki+7nyj
	mxpZ0hQ0ax9QfFVVgLdqiCzDbDio3PM9SVODl4CBtUB22tfwWbsCPxrLI/DexMyCG7GjUddn7wC61
	Fu3ZiyAG6WYdoMyKXsve3PZQ6GfGBym+dq8xx/EG5bKutSqJBay4opQUtfTs4khMakSe2hDshf5TI
	4GXk+se2hEoNCas5I/ueoKNuoRvzqzkP+QWJpiMlXtjbQXkSnc4pYwmEaxCaZV/1ax/Nv+K+XXc+O
	vK2+w0u5DGt8IoQTDP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIT-00E6hp-1B; Wed, 22 Feb 2023 21:05:05 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIB-00E6Wq-Ox; Wed, 22 Feb 2023 21:04:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id ck15so37023447edb.0;
        Wed, 22 Feb 2023 13:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4sT1wUlCbHRDpbMzMMTT4BWgWGszScqpQQPPR7Avx8=;
        b=fV1pXve6qVGgUZzvzS3Cvik+RMpTsqvE0467NRn8Yb6V7KweUNBEWo4/q30yGcFc9w
         D+rYJdf2EukzBDNH1v7G086P4Dv9oonD3XT2xLE1mdfg9C347zfJ0wMXCy5hhBVc14pH
         SBV+mro6+fG+QnaFP472RGso/v2hRpfnF2P7WuV8kfWU8Mqe0zirTpHBCeHrXRTAHwWJ
         RQO/Z478Q5BdO51H3sh6xqDR5tX03sOJMgzlLDVjzSY+1gQ3jogJjmrdqQLm9kBjMb+q
         SFu0bUnQ2TzX+kKa6RHt1qzdrPhfdrIk/LHxw6OAiSEcMmw0Xg9bjFXjEbqvTChMmY4Y
         utgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4sT1wUlCbHRDpbMzMMTT4BWgWGszScqpQQPPR7Avx8=;
        b=xkLocOH1DiL/o3aZFHBEf+M2ze4OPG98DJRxZGTDtKK24kLcnrY1xSdV/VK/1XGLcu
         qvePmB12DZctNNWFozJNedzf4nUDhS8XLIBi+QWdJ5ZlAHSf8eGwNRW+rEIreOMEI84d
         dfijqVlockBqD8sUe1eWYmIdWLBb1/F/RhaM/rpPus3NsyPegRVxHJyJHB0GA65KJkTx
         jEtU1HyGg82Dol45d/yuayiLzx254qOA9oPSqxxjIyRczAQzMXlvPcpRT74JErmMVTLS
         Ano6Fwp6IY0ij5tJLorRfMWF2f54yQXKnNmozXSVQZCk4XyFqGZnKiIC3VVtnokTn+mo
         P4uA==
X-Gm-Message-State: AO0yUKVD/7hSadMn231oCoa9h8FpBWLZ+8yfRo6NQcSCxG09yjaBwN0f
	IE6FYGjIPYCzbxBx4Y3YBP60qDQbpwbd+g==
X-Google-Smtp-Source: AK7set9UsywGgwcaKfpjQbvcN4DriltaAx6XT6S28Ki/RySsfHBlPZPWUAWYQaHmEPazeYrWLX5orw==
X-Received: by 2002:aa7:db44:0:b0:4ac:b309:3d76 with SMTP id n4-20020aa7db44000000b004acb3093d76mr9530208edt.31.1677099882731;
        Wed, 22 Feb 2023 13:04:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-76c9-eb00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:76c9:eb00::e63])
        by smtp.googlemail.com with ESMTPSA id m17-20020a50c191000000b004af6a840f21sm209208edf.15.2023.02.22.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 13:04:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 RFC 3/3] arm64: dts: meson-g12-common: Use the G12A UART compatible string
Date: Wed, 22 Feb 2023 22:04:25 +0100
Message-Id: <20230222210425.626474-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_130447_832632_EE8E6B61 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch meson-12-common.dtsi to use the Meson G12A specific UART
compatible string. This enables the "divide XTAL by 2" divider which
improves support for UART attached Bluetooth modules (for example
RTL8822CS) running at a baud rate of 1500000. Without dividing XTAL
(24MHz) by 2 a baud rate of 1500000 cannot be generated cleanly and the
resulting jitter breaks communication with the module.

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 123a56f7f818..3dc06848f3c4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2046,7 +2046,7 @@ pwm_AO_cd: pwm@2000 {
 			};
 
 			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
@@ -2056,7 +2056,7 @@ uart_AO: serial@3000 {
 			};
 
 			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x4000 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
@@ -2293,7 +2293,7 @@ clk_msr: clock-measure@18000 {
 			};
 
 			uart_C: serial@22000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart";
 				reg = <0x0 0x22000 0x0 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
@@ -2302,7 +2302,7 @@ uart_C: serial@22000 {
 			};
 
 			uart_B: serial@23000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart";
 				reg = <0x0 0x23000 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
@@ -2311,7 +2311,7 @@ uart_B: serial@23000 {
 			};
 
 			uart_A: serial@24000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart";
 				reg = <0x0 0x24000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
