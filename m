Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83640C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520772063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A76+cSaH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u1lFVoEL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520772063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiNquhJjBiiNVAW868T66dVR42ehxQBisumsAz53gLs=; b=A76+cSaHbi1CEl
	Pl2qR+Kkok41Esvpi1qp+KISGsSK9EaQRYT0xiruKWndtJSC1oYNVyQLnTlno13t2BqaMNR17nO8P
	2Y1MUYV2qdQ3yn3keWahzYgH+iH/r7xkHn4uTk7qxO0IYMxtyNkOsSqrnR+N1vFNU09FEnIObFVF6
	9ZAPo5FjST3ncLQscLCgNFXxujgiBA3fzoySkuoDDNMZ6YIGSw9X6AObECzarZJNK8B021BOpAJXD
	LPgYuo6ebiJqzBNqefIBmi9m9Z4QHo0PRmzcbyrNlAfZjGUESuvQIYjzy2oC7oaE7YvBl/izPZFcj
	7DTjMC9YJXQD/19msZ7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p3X-0004Qn-Uo; Mon, 18 Mar 2019 09:59:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2o-0003U9-7D
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id 4so12251438wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gW6aA78DkLc8bNvO4THAoRegreuRYuXVAD8A6LBYhxo=;
 b=u1lFVoELp6WaVPX4WCAZ+1L6pyvWJjR6UGjDDUGEOj3L2ua8eDkYMRNTxYD1wnDjKE
 Lli7IVmlwqBkOUTCFx272/BBBoCUXrUqrg9v/bEpwuwLU3sOQJ7IEGni/q7sMsbaW7Dg
 MOkKbShHod9AKhG05vSzteDL4NgRHlW3xgaPdtEAWrA3mudwoWQWBN9etRhjVJWn7lKU
 grFS5J88gX2spEEDdAJBo1wm5NhtA9JSXxty9ptI/jZE+efmhLpF0iD8bYQH6JzkTHp/
 vjm8JFtq/Y7tdzbIN9NP6fK/b2oI/czRyghxYrHiNQhd2qJIWiy7VYyuCkiqLhp35tqU
 BsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gW6aA78DkLc8bNvO4THAoRegreuRYuXVAD8A6LBYhxo=;
 b=l9Po+3UCVngpLoLJ8iKkA1PMsdBP+xp5zlnu1i+r92eTf26s8lP8tuYfy05qJFGjDo
 vJPDE6iHkZE91n1UYSWmWFlDqhhYnG/Fp7UboIyi6qfd/aYnzL3uH+u/vBdSLiMQc4+q
 ZrVDFT8SGWZXTODQgqaetjQ1INHSsNA2yrYxnHQYkra100icZG8vHbMYgBVixcSt+t3m
 jYjQxwzY8g3yPQEDqgzKhZgQzkB3OYEBwMUV+fHfih/l+pN5TBCGw/TK0s6Z/S+yY4sj
 o6+nNgDapEOPB5Io0k0th+8OjgvG2RO1bD/yKu7P7Km7T6r8xIlH3jf118q9je2EwRAT
 8pUA==
X-Gm-Message-State: APjAAAV4oT2KoBXx7jEEeQPNEJOVlpx5XUl/SIL98jwxh4weHOaoCfJ0
 2EMUhLdVWHnstoWH5Xp7a5ObziPkxXm2hg==
X-Google-Smtp-Source: APXvYqzHotNEq5LncXeT0eIauOBrgU5fKe1nKlJDVJj4FZrZRFVObLov5jICRQE+bhscHn5nR6ME3w==
X-Received: by 2002:a1c:7c0c:: with SMTP id x12mr10423779wmc.38.1552903135161; 
 Mon, 18 Mar 2019 02:58:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 1/8] arm64: dts: meson: g12a: Add AO Clock + Reset
 Controller support
Date: Mon, 18 Mar 2019 10:58:44 +0100
Message-Id: <20190318095851.4062-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025858_584155_06017AB4 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add nodes and properties for the AO Clocks and Resets.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 31ddf9444b3e..5c0983edf837 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -122,6 +123,23 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
+			rti: sys-ctrl@0 {
+				compatible = "amlogic,meson-gx-ao-sysctrl",
+					     "simple-mfd", "syscon";
+				reg = <0x0 0x0 0x0 0x100>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
+
+				clkc_AO: clock-controller {
+					compatible = "amlogic,meson-g12a-aoclkc";
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
+				};
+			};
+
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
