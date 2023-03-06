Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD19C64EC4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7JvlX1aduIiDXgbWRj7Vf2RmsHQQtWq7DRkVdQvtqg=; b=jLAppIPougQgK4
	S7g0eptRcPUk9hI6G/hf7H09fnvYqNYpdHt1KpFwL/y9vMPTUZbDh76LoIoD4gjS5ghYzsaS2aEn9
	utw6kqBkaxNLeA+tk8dxVh0z0pjP9UjPWehOqQ3/OjZC0BHICFqebWgw6d/E5pNPbqvCXQZmAxBGY
	7ZJveDVnF4ex1aPiqDTfYfN/xOwPpdwpSN4YP23HiPF2EkFw8RrIia0gMLBNEznoqwybP0ROtxrLj
	opYZ3xIXw44LXgUmgz0vUGOh4buaXQ/GqfMJrO+l4grzOfe5Xb5UvkWAJHZgf7AZHp3XiLjGCXfK7
	WrDU+GyjuLe7EeCRFFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjf-00Ee3k-Lv; Mon, 06 Mar 2023 19:43:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjT-00Edxe-LR; Mon, 06 Mar 2023 19:42:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id g3so43485835eda.1;
        Mon, 06 Mar 2023 11:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678131764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VMz7FwRCPzl0u0g9FryvFIO2eSi8c5ik8HpdOZSYw4=;
        b=VUW2S/qEm2qEaDo2jeLcOTzcZgk8r82W2NCK67wkcLUUGmJQ5PgcieZ/L9CPCX8oT0
         hYu85ZRSxqEX/iL/zqW3LLlqlQOb9FNfUqOEF83qSeGsRKPdYxINQRY3OagViEJdSASS
         y7U7vCSZauPO+yTH9qvQDgn7vO4zPDZ2pvxXCJXobR04ZLlKhGlU3ilqBOEEHbR2AQKS
         Jl0HjTxvTY4TzOIsuln5Lyk/nZFWuYct+Z3eklJS3kNT7s/37dmPfpecc+AOY0hfTx+q
         fPxWnp3nwfcApw8joRla3lW+xQpD5OEwHJN2K5NffDrtNoCdb7x40+my/gViEef/DlU2
         FWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VMz7FwRCPzl0u0g9FryvFIO2eSi8c5ik8HpdOZSYw4=;
        b=kUbkKx054I/QmQZn1a/MuCjUpbivpGRYNk+W2I6jql7LnWgRjKwiylO4J0l91sMqK1
         KL4Y+xkGDPsYZJdKNWxwCWk8iwM4Kv/2AFJipCUaf7ACvD9fcgMfs8KHVUUWyBPlLilo
         9Hub4sZCet0d1x/ceiJERUj4v1EYObILj8x4wqfz2oXd220de9v1CilB0WW8LnNuc3U5
         GzZclv3yItw5lj2PwgMNhMv21j4xtTQmdN83+hWEh/mYwcf3nLuORdldo0xbrOn6dlVr
         QGGLUq5HjTRHkRLnllDuS4MluKnbNNOD5Qz8uDCgn3ulTgqDpGyMKJH5+8Id0hKoPLlF
         NXWg==
X-Gm-Message-State: AO0yUKWcel3w68AfYe0opQ50ThsU128EewGU8zLqP3VvoIt7tV7nKGMT
	4XwFt0I4jRqUjPqP1Y800sLkes8jZ3Y=
X-Google-Smtp-Source: AK7set9y6Oy8/mPj3AB2/VR4I/2YrjSZlx9rcTbnl7yOfgnNZbZXeS60WL5YLUgYGyYN79oO69pukQ==
X-Received: by 2002:a17:907:9721:b0:8b1:9e47:9101 with SMTP id jg33-20020a170907972100b008b19e479101mr13076253ejc.12.1678131763930;
        Mon, 06 Mar 2023 11:42:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c405-5c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c405:5c00::e63])
        by smtp.googlemail.com with ESMTPSA id e19-20020a170906315300b008f2b0c6052csm4951868eje.89.2023.03.06.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:42:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: meson-g12-common: Use the G12A UART compatible string
Date: Mon,  6 Mar 2023 20:42:23 +0100
Message-Id: <20230306194223.1869814-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
References: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_114252_263481_A783B38D 
X-CRM114-Status: GOOD (  11.11  )
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
Greg, please don't take this through your tree. I included this patch
to show the overall goal of this series. If Neil won't take this as
part of another series then I'll send it separately.

Changes from v1 -> v2:
- keep meson-gx-uart as fallback compatible string


 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 123a56f7f818..904bcd4d2acf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2046,7 +2046,8 @@ pwm_AO_cd: pwm@2000 {
 			};
 
 			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
@@ -2056,7 +2057,8 @@ uart_AO: serial@3000 {
 			};
 
 			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x4000 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
@@ -2293,7 +2295,8 @@ clk_msr: clock-measure@18000 {
 			};
 
 			uart_C: serial@22000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x22000 0x0 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
@@ -2302,7 +2305,8 @@ uart_C: serial@22000 {
 			};
 
 			uart_B: serial@23000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x23000 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
@@ -2311,7 +2315,8 @@ uart_B: serial@23000 {
 			};
 
 			uart_A: serial@24000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x24000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
