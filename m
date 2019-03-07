Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A63C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9416A20840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2TNcNUQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u2b+USzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9416A20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIb4ysUSUpi7dRwdthZAnxnldoMH9vqJEXaudrxrpbI=; b=Z2TNcNUQFN9ZDf
	gZIfxJXfyqfpksbMGlA3L8lPb5wedWNuW89WPq7YWzWwHD8O5sawKgfelzqSaMP6wcF0OQLIIcOgh
	ykP0/Tj2kZMa2ANGDIoP3XJDsniLtArmHKenxXMBUITPSgFCtb/UyKWQXuZJzgALfZx/mFIC2PvPz
	U6o/GM0jCL8O9R6//qszkukN6N6t578Ws6h2nmdJoHY0PVHSlzK+4PTEFsK/ZxeMf3RKYmpj4Kb8w
	BcWDhGWlWFJUwqM2g7DuuOKd7GsoVPLQpoD0PB376sQYS9C+tFQP9N+3Do+QDwG0fCRLRFq6vu6dI
	wGdOI+OksX3lHd/B4Q/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ujO-0004kC-QF; Thu, 07 Mar 2019 15:14:46 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiV-0003T3-7N
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:57 +0000
Received: by mail-wm1-x341.google.com with SMTP id g20so9518881wmh.5
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HuUseLa2zmd8/nZS2QxaCguzDudsaF0923rEqJjh/Uc=;
 b=u2b+USzzZuknePxesV1i3XLW46MLNIfHeJ1uXhlCrDlrqh/2zc9re1W6y5bLdK5tCk
 XSECgJ542UTyTJ+2g7K34xukuXRA2IkUjhjX5j5tt8+TPtNtlfb9OpQ2Ac8NBSE78RCs
 mpls+bQlg62oVM/CPKd6Gl9a0XHfSCM2z+NObYE9j9mgh16ESU9+Pu4dYz44nwgkgeIx
 5iJatANpwWW+jJ3fLTPnR+SeAmyrzuBS23rnW/M8IhdSpAHHKEY6HJF/W39aAyAfYssB
 wK/BG2Gmjmz1LksoNbJfGVDKl3t8CZVTljltdlIDTCDkpJU7zMz+HyBpE25taPqeYylr
 HuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HuUseLa2zmd8/nZS2QxaCguzDudsaF0923rEqJjh/Uc=;
 b=RgqZzCiJrJKXOdMP2kKz/gujPftK0lST6rQklW3a/WQjgrt0lm7VXwY/WbiY8oxRuI
 i3nWiOOKy4aXS0nSJcB2u0KDDwhXBdqRq5ei9KnlkcOmYCC0pytXP6EawshwGJXpSLiZ
 usU3nlIp/x7MqwOpwcgkEJXHv4f+BlGPi8J7GTtXqecf4PNZCxDUcbtnFl4jXU2e5OOO
 9aCPU9leHi2TP0/tvRokh1R1hTonN6fnItSYz7JfGOvyq3MWGsRHpWBMZIoE9OEfEEaQ
 esNac4RMMB9R1PCJPLEMePV+sLZPslej/EWi+gtb5n9SNOfpkG+9Jnx6xy+vOw1ddnre
 j6Zw==
X-Gm-Message-State: APjAAAXgyGee5TXvHjF4vzBAGHIWC+wjQKHrjr1buF4rufcNHa6vKi7e
 YqtMQDxexunEGFRlOpZOzfhEnQ==
X-Google-Smtp-Source: APXvYqxHwJOBmWipAe3mwBTFHjRKhGEGOdYqEvoIPUCBtbTTKuLVoot/CGmhDmOGHdpPKiTdJTQ13g==
X-Received: by 2002:a1c:400a:: with SMTP id n10mr5856094wma.56.1551971629333; 
 Thu, 07 Mar 2019 07:13:49 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 7/9] arm64: dts: meson: g12a: Add SAR ADC node
Date: Thu,  7 Mar 2019 16:13:39 +0100
Message-Id: <20190307151342.7381-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071351_549390_B026397A 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the SAR ADC controller node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 50e2cd36e08b..3bcddd412aa1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -278,6 +278,20 @@
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
