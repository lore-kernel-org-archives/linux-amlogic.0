Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9589EC43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662C220840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flLIDrdc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="M0/9j5+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662C220840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7Bff90Bt3aoSeA2kP8YZjno7Fio/wzXfwGLEADoL9c=; b=flLIDrdcZK/csw
	1bJSmoJspOo0ZQwX/IzuAiO/6w6TRWiJCRSMDDDbdfe9CWm7RUsBPE07diJFSfNUewGSawlQ7JSuV
	KDDwuN+KVU6O4QEn6DLM2o8NYW9S8K6Mwvby56y6BUJlj2N+6OyeIMwkRRj5t+T95mt+w8cX7JrZG
	QTbd8scGgeQO87g+eGS+gN/G71Nl8kiEX/f0+d9v0xj9c3Rc8piIxXDOHa7C7KHKvcmYNJy53sG9d
	IMOobGq5EaHDEibzlycg9SFYYMgrWut4+M1mS+/Ns7dE7/8qEvmSF/2v2zsa4LAmSwCudXRyhkDnI
	FRERuq7Dn8DYDz20U60g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uj4-0004ID-Gt; Thu, 07 Mar 2019 15:14:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiR-0003Qs-Qn
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id i16so17834501wrs.13
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5vLPLHD1u8ZKSzf8/MNIriNP/bQNhz6kTsOhKPAebg=;
 b=M0/9j5+ktnBXtm9Y3+kdp2HiDFOK3F8lvKtWoJsEBoSLGk0lcKV9olvxIgFpDV41kW
 8f2VuawmWRPYSI5fN/w7hb/Dmi/JN32VIRxPAn8/vKp0WMyeXLrBUWSBgbcmyhWNa6jS
 nicp5lAM/G224vGGmwapFtQhLGsSSy0uRmgNSsA75wM8UYXltedl/t1IaKIgtu7qgtmF
 EWlUOBsb0lkMxlyedFpfu+QseJc695GbpFb6QHnXOqHAMFBG4ed+yPzr0gYTtYnkp5pl
 cDas9vkVwkRYPTzAXJ9vwhLIAKxpd9r/NcJNggnneSElHczzMWKWtLVD6vmC9qbSAuht
 DPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5vLPLHD1u8ZKSzf8/MNIriNP/bQNhz6kTsOhKPAebg=;
 b=E9WZWAownLVk8L3HlZS4LB5+WDn8h/QsWMCOP6Ir+RycxYRjI/xH3awjbyiPnqrl8j
 JXDWQ5UUZjTjowUg7Y99AtYWiqXOWlDHPZS+NStU9udqWkXWrKM4vpB1nUMs2Cokw0DN
 JL2PjttbYxdSPHB7vv5Sjarlimj9YG8Ba7Ivx1XVhBDWtgC2wSLiv4H27WnWd+3PTCg3
 xy9P810iRbBOkcDrTB/2Iee7Je42ceAP7epgYHzoRCOvpV85t0QtkmbHr6pH/eTqbJhN
 RAM9Zp48x2ASETS1wmXt7hrh46uU6i2yZMQmlqv+yIKthTJvh295FGY4a476XZdeIaZu
 I4IA==
X-Gm-Message-State: APjAAAVuHWDOwyD8EuFhpCnOs+QMSvqgwHgo8zgafvMu1hG+dR0q7ErA
 Q2DIuePj/4IeFQkCg1LOai0vvFFHfDoRIQ==
X-Google-Smtp-Source: APXvYqwgmx0WDwSidnP2KR1Czind1bkHzqSxfAgLdwZ1QVm1YlPCf529X8abJGgQJOMDywgb0liRAA==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr7139662wru.116.1551971626321; 
 Thu, 07 Mar 2019 07:13:46 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/9] arm64: dts: meson: g12a: add pinctrl support controllers
Date: Thu,  7 Mar 2019 16:13:35 +0100
Message-Id: <20190307151342.7381-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071347_867688_4FF947B0 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add the peripheral and always-on pinctrl controllers to the g12a soc.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 41 +++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index f2fc0f654150..c141cc7f6b09 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -91,6 +91,28 @@
 				#address-cells = <2>;
 				#size-cells = <2>;
 				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
+
+				periphs_pinctrl: pinctrl@40 {
+					compatible = "amlogic,meson-g12a-periphs-pinctrl";
+					#address-cells = <2>;
+					#size-cells = <2>;
+					ranges;
+
+					gpio: bank@40 {
+						reg = <0x0 0x40  0x0 0x4c>,
+						      <0x0 0xe8  0x0 0x18>,
+						      <0x0 0x120 0x0 0x18>,
+						      <0x0 0x2c0 0x0 0x40>,
+						      <0x0 0x340 0x0 0x1c>;
+						reg-names = "gpio",
+							    "pull",
+							    "pull-enable",
+							    "mux",
+							    "ds";
+						gpio-controller;
+						#gpio-cells = <2>;
+						gpio-ranges = <&periphs_pinctrl 0 0 86>;
+					};
 			};
 
 			hiu: bus@3c000 {
@@ -137,6 +159,25 @@
 					clocks = <&xtal>, <&clkc CLKID_CLK81>;
 					clock-names = "xtal", "mpeg-clk";
 				};
+
+				ao_pinctrl: pinctrl@14 {
+					compatible = "amlogic,meson-g12a-aobus-pinctrl";
+					#address-cells = <2>;
+					#size-cells = <2>;
+					ranges;
+
+					gpio_ao: bank@14 {
+						reg = <0x0 0x14 0x0 0x8>,
+						      <0x0 0x1c 0x0 0x8>,
+						      <0x0 0x24 0x0 0x14>;
+						reg-names = "mux",
+							    "ds",
+							    "gpio";
+						gpio-controller;
+						#gpio-cells = <2>;
+						gpio-ranges = <&ao_pinctrl 0 0 15>;
+					};
+				};
 			};
 
 			sec_AO: ao-secure@140 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
