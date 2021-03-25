Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306E5C433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:25:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C996E61A1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C996E61A1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u2FGtZTVXg36bssSI5V8ww0Vj47Ok7pXGD9iD4eff6Q=; b=ja/FiqmUQtllaKUfuldrDflAv
	e3RKnleK9v2yk3iIfyaCYcgUqLSCUX2DSDmLAc/2e7jOF9HFuJdWJH+yMXlPJiAPq+4FU144aAKdV
	VED5upzH0P/1vRRbSZ+co78V4KuhdptF+/YrUNYtq4mRZjpDNcGA31+u2DWDf22WxPbt/tDEmvOia
	i87aUZkQRiba/wHr7l826Jjpp6JbOQWkuISep5GUO9C/+ZNZ2/gD1e48pSSee1fRgaz7wX2ZQNESJ
	slKn+LLAbNFUM0JBkZYEPZqd3h11Sva+V3J7MCF8G0euVeRGbTNYQOlbgXEOpJMJqBzkLMXn5a23J
	aVdv2bm9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPRqv-001iaj-IO; Thu, 25 Mar 2021 15:24:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPRqP-001iSb-Pg
 for linux-amlogic@lists.infradead.org; Thu, 25 Mar 2021 15:24:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id o16so2750397wrn.0
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Mar 2021 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsI7RWhSeaDJo4VSjykxLGXfOxolxJjq3ZnK3Jkyy1k=;
 b=wg48UBTKMFHtUsOUEBOoTrvtZYz6a3QXdnHmLSpUuHMydZTb3UBEpFcnTrMzTCb0bZ
 Cwu7hOdMFXIt+943OFA69HNpTugWpZ1cl+XH198G47qpAgPttKHALISWRAKLNGl5gr6h
 OmJx/BOsU4f+qB6o0MJwD1KvkFtRYgcuZG1MavtR2QMwf8XZaOpTNIkHFR2lcWMXawFl
 L2pnpn8j1yvUJuhRZmRvV4sGM+2gq3/snDOoTJPOL1VhBW6IFI8+SZgU/fSeA7AqALO3
 vE+nJmBAoqPtZ+vzmdl0kRkn1ZJcgL1lV+Y67Bry6lt209brXzVempIeHq1uzdk6Kmmp
 Y00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsI7RWhSeaDJo4VSjykxLGXfOxolxJjq3ZnK3Jkyy1k=;
 b=RnXh2599f+6PxqDQmi1IXVxyOKPn6WEstRMedsHwuKaeu7RPE3vzHlAMLwV+iw9ovP
 uqndiIVcnNqTNADkzkDilb8tQe6qXUxvWBXtL6kBpP7ru0mEL0xEMkFYMLmbDPlw8XVt
 rWITJpvDbuKBFxH45ZnRhtyPM/05+/sEe6ko92Xo7bINCHy6gX4/wnhMe6Y1UWagus9Z
 rkHzd/kHLSddFrh9qFUb8VpOFdP1whGaNkd2cIw9YsWzfWX4xUzrC0jIXNjNm+pSvziu
 zTeTqPISsDEcpOS+d6A9eve1lzAvXr1Lx9az5xwJXCM0A8rcsTat+iuNfgix7f5Vzzny
 kZFg==
X-Gm-Message-State: AOAM5314SgyyF/Ff0iV57pQbnGVYB9jxSZoUD8norF3KMQmmhuniAQiT
 uyQoMR0k/E7uti3f2216bOZvew==
X-Google-Smtp-Source: ABdhPJwubghLvEPh98CkBt+hC8/x7JIyFel31g5ZYSlGAhAgzRMes6kB7jwOtfcBrtlFpS6NQjHi2w==
X-Received: by 2002:a5d:538d:: with SMTP id d13mr9719471wrv.92.1616685860592; 
 Thu, 25 Mar 2021 08:24:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b105:9672:b0a:5820])
 by smtp.gmail.com with ESMTPSA id
 p18sm7395260wrs.68.2021.03.25.08.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:24:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: set 128bytes FIFO size on uart A
Date: Thu, 25 Mar 2021 16:24:10 +0100
Message-Id: <20210325152410.1795557-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325152410.1795557-1-narmstrong@baylibre.com>
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_152422_620223_5E21DFC5 
X-CRM114-Status: UNSURE (   9.70  )
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

The first UART controller in "Everything-Else" power domain, usually used
for Bluetooth HCI has 128bytes FIFO depth.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index d945c84ab697..db3dae932a08 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1872,6 +1872,7 @@ uart_A: serial@24000 {
 				status = "disabled";
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
+				fifo-size = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index b858c5e43cc8..4f5b85ad3120 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2311,6 +2311,7 @@ uart_A: serial@24000 {
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
+				fifo-size = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 0edd137151f8..8eae0b7d1642 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -295,6 +295,7 @@ uart_A: serial@84c0 {
 				reg = <0x0 0x84c0 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
+				fifo-size = <128>;
 			};
 
 			uart_B: serial@84dc {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
