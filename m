Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245D6C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16822087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EzDT8iuq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0yQyXf+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16822087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mikaKpo5EEtyGRFlIkxhxJnKq/9PVhXOYcZM4gWWIZw=; b=EzDT8iuqtQNWkn
	p6mdt8CkrR/C64wedqMjAIeHEjwtgxRl6uRrdjKp8mwv1pY877vh4hTWEe3IUy1uHKOlYA1OVWF7Q
	D+azeQn486TZZvxmYZdx03PZYz3Wms5CNfUaqIxAqwVLCFVfjvU3OSF4jQpo6Kgt7dtEHD7AOquCE
	uRFtNLjmQo70Z3iiar8TSuwuJFAjzp07FacFTIcOICUogu2i0BKovuuco/be2tvtm9c6NiQD9xdU+
	0ixkYGmqXoTr8cgAgSYG52S4mmdgVcBjezipBhRGmmjvYqFRVaUFEETEcZu1Nwebrthj6CLU6uM5j
	T+6a9Cui6Rn6e+krP0cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p32-0003si-U3; Mon, 18 Mar 2019 09:59:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2o-0003Vk-2s
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:58:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id a188so12002181wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3eHeD7NoqoSXtftkvb/ote82xUCD6KJ4VjSqqVyBww=;
 b=0yQyXf+/gZAHiHFv8dS1dlc2q2pFMl8jLkkS6WcZLV9by/P5q6Xdb2NRu/Lw00Pa0P
 fPAFDRjhK0S6VibqKfS+K2UHyJ7EtWUVkVk8zzyxSYWzauAArR2Ve73f6pV8IKqCPOKk
 5WVDkhwZ+I5aNzt5VbHZGwTlH+AQ6Dk6JnLFG5Gdb73riQmBrMF6TEzy6Sss8Ww1xER2
 AuiFyqcAcbj3AMjqmoIi/7no+mJlXFoG7kfeVQs5BOw8QWv2I0d3SQhdc/fHcguqNoba
 Bi654ZZ49k/SxQv7ko1kjI3TUr1HAPe1jJtBwMhuy3YoZn/3h0Apo6Sw9oeEV670wBqM
 SMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x3eHeD7NoqoSXtftkvb/ote82xUCD6KJ4VjSqqVyBww=;
 b=Q8G7Y8xntkAcVNtmAdiVu5g2yKY2i7oxOLLE5n/Woc25/+pEXUuS+ed9eNpPB4Fp6F
 nFLJLINK+XM9amuyiS8jTfeCcd9T2sIrYNtfMiGK2j6gLrGg5q/PegJKE9tpcF3NL3G3
 pIdNFqLeLGnNSNEOf7ohowkZiTnF1j3Klx06TomehB6NewcAxHmVKkQ0lTpFUoE61e8N
 lMeCqmD3z5udIqIPjek+ziB4+iAw5DV2jxzvsrguPyG9lMjt3wFUganF5jKAG9tnpJbC
 CnWflqfcuYW2PbgNAuEsAB7Ozxv8WPN7OHqYVYCzmgCYw7kDCmpK4pbTlI7r9L8OsRS7
 0FLA==
X-Gm-Message-State: APjAAAWeHEBzEf4KJ3hoeW9si24xw6MAvov96bMBBlbq565CnvhCp0z0
 uBmj2mDE25SwYTuT+1h7LbDm5Q==
X-Google-Smtp-Source: APXvYqwEHorPmBfm+wkGN58C/2JKLA4lZebmb/32rMaYKe0Q0ROvwExRiyD/GdvNIVsq1qoT2isbsQ==
X-Received: by 2002:a1c:8112:: with SMTP id c18mr10736870wmd.41.1552903136279; 
 Mon, 18 Mar 2019 02:58:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/8] arm64: dts: meson: g12a: add pinctrl support
 controllers
Date: Mon, 18 Mar 2019 10:58:45 +0100
Message-Id: <20190318095851.4062-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025858_481383_BB8CAC39 
X-CRM114-Status: UNSURE (   9.78  )
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
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 42 +++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 5c0983edf837..e050737a1b3e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -92,6 +92,29 @@
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
+				};
 			};
 
 			hiu: bus@3c000 {
@@ -138,6 +161,25 @@
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
