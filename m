Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D018DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0CD620811
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V0+SKGtH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q7B5q3AT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0CD620811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF8wfjxfK3CaR2kgI9Mgya+iOG3U/e3d2chWEeJfz24=; b=V0+SKGtH+bLLrm
	p6B862vnlbtmFQMWgFGTEx/EgiKT/idO9c2wOm/VEFBn62a2xOrfXLL2FDe07Ubals09dVjQSSTVY
	Duz1OvZtnhOn/gAKjKsqXHDUpqwdMkw6CWvYphgYPCXUq+w0IyuoAac6GldX7etfaB2nRmzBPmICx
	8uLsJaHuPBsdBISnrIPT2KvZf2xNILRUqVDCIaHKJaOCNPbqikzsYtTty31qTOrknmbcoN/ML5wcO
	SKh/hugwUMF32+i3gTBMkV3lAMUcwjtPrHEFkdZ3XVkgzhDbEf3Q7MDeERUSVrTRr2IbPTFRtdwt4
	QdE5FSZJ2167kjYjFA0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MSg-0000eX-8A; Mon, 25 Mar 2019 10:04:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MSH-0000Ab-FT
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:03:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id j9so9341017wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHgKHPDIn4oZfNwrx5bv3RspG5o23PVCYfzbn1lDJUs=;
 b=Q7B5q3ATRV1w5atycDojfRWSj9ivifyCBPYS0daY12qNapjkoK43b0eBqNHOXH+YrT
 fhq/EeatGShg/HYIOGfNihuD4tk3lqCbYzSjlhPBl5WvJpoWBjW5euAFPSFF5Ie/JfXR
 UTZTLWF8vePvsFRK1JdD2NvaZKsbwFCUq76EQk9VWxVLI9JEOTP4LIEcIsdQMS6tYEO5
 LnLSQ2LdmTXBu5/78E02kPukL7b1nVncAOo5t1lvxEGJopsW7HhgjdBzXbR2dHtyNlUh
 AXp2mIKH6W3m0v4TG7dnjpGhvgOXkQKLbEFwu5sFmXcB3wjAjtJvzY8bOeb27N0Z1VbR
 OKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nHgKHPDIn4oZfNwrx5bv3RspG5o23PVCYfzbn1lDJUs=;
 b=mfh7N7CGOQqyqRtN9VRk70lIH4qtg2pxibhBpEVJYttmM44exlpxpG/l7Goa9HkUei
 98Bq03BfaA7fB/scC2Fa+or1XIiVxkLq/bHXJP9s0XVFec/J6eLv92uvTfLBhktvqOzl
 5kcAJ3RyB/yUyQ0+U9jzkJLMj3xrwO//PaulfeJsBLrCYGgacZX5syk5Kf0tCPOZtsPO
 yE4YIEjhazFIF1qUKqF6nPYE0VtHTeeZ3ZpKkTBrgZrpme9E79h6Sir9/6EIDOdTF+se
 mDlNhowZ5iL5J7uE3LVOwWGp+gPgiBn7+XTzkBetiV805ANP7FfFxDy+WeKs6C22xEOU
 9kOg==
X-Gm-Message-State: APjAAAXTBu3XD39AYxNRFHHAFXBamCjZOFWcFcseoId++rBtKVx1JGnM
 k3J0iVBvsQCxsIBjCdkMmQyWVQ==
X-Google-Smtp-Source: APXvYqwZO5I+FBNv4f7hxmGJMhPBljwSh9//kLnLhGX78HWEVWmzOWflknEr0SGlVnObuIL1OMOxmQ==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr14574387wro.232.1553508223264; 
 Mon, 25 Mar 2019 03:03:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm11581215wrw.40.2019.03.25.03.03.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:03:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 1/3] arm64: dts: meson: g12a: Add SAR ADC node
Date: Mon, 25 Mar 2019 11:03:37 +0100
Message-Id: <20190325100339.749-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325100339.749-1-narmstrong@baylibre.com>
References: <20190325100339.749-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030345_644365_6C67FD0B 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the SAR ADC controller node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 4d04742b05c2..4b3be7e60b4d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/g12a-clkc.h>
+#include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -282,6 +283,20 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			saradc: adc@9000 {
+				compatible = "amlogic,meson-g12a-saradc",
+					     "amlogic,meson-saradc";
+				reg = <0x0 0x9000 0x0 0x48>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_SAR_ADC>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_CLK>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_SEL>;
+				clock-names = "clkin", "core", "adc_clk", "adc_sel";
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
