Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A04C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA5B215A4
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2TKlErgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O7ge+z+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCA5B215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CvX0UdLFPLizkS9jVXPwWfckkP6HvYdsD9f6CH8QWd8=; b=2TKlErgjvvVOvo3jj/RgX0nIg
	mgu5iif923SmuNGxe2bTsLlW2bGU/SszpkiHL82lPKpbCsn7PvJaLuoFs8n6ya4e/QD3RwQ2Nn207
	l+ctycshwsqYALjE9GQdBmVCnZ2nnjZpBLCA3rMZ9A5ZcIREyzWH7ilXePsKTAgdH3GjQ0wzjBUOe
	SVcoT0Eg7CYFdgqZMOy6ZM1uw1sM3zsgtTs83mr7pkXQww1okjEtrknd5/THVlbugdmNKe3zi0iM8
	aair1iP0cOqBS7x+BA8Y4Y68u3VttGEmD4CwvFi7fv1ZB3yMPaEZzefFmkzfxU0vwu75XpA1B79PO
	tdqX5kx/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCaR-0003bY-KH; Mon, 07 Sep 2020 08:33:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCaJ-0003Xd-Vd
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:33:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id w2so13521312wmi.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BskRtsfSrtTPxUTZWhMJwYdJ0y7cfpBILFNcmq3oTKY=;
 b=O7ge+z+DXSflA2nuhw8jVKX1cOoi2X7CTELrpMw2/JGMs2hKuKOPfL7/7V5uAs9yUi
 ZdLkBakj3/HuYnaFmYJlAyO2c51F1xS4YVRtdYc3lyIvtBnHcL0FlfjOgxXtZuJWv6Kw
 C0pEd8mu+v/Go3GuN8jjGNyaYN41uj0AjePn5n2D2nbp4KeAtJFuLLMFu//SynsnmINp
 JKTl66vaA43c/AoDvFjnciRhInMhoDn4pJedefiCPEK9ZNYCTJkUsyygkpqCWm5xZIRC
 fisfxfJJOeoH9KjVRQmZ1dlYqAL3EQ1Wmv/HGEkSJXd3dWu2meUCd+jRcuYkRXdN2jG0
 qhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BskRtsfSrtTPxUTZWhMJwYdJ0y7cfpBILFNcmq3oTKY=;
 b=Irvoh5l6rvu7b9KqIhmHmCKKUu6T4FvLG86e/R9qfYgFRTGVH+Zk2sXCITN/tYHszu
 GH+0UJt0Nhg4TKN/1rtXKvHpgsuaAK/TPHlPv0/otmZ5+dbIYCT8M1d/0Fd5TDr2MkC/
 iD/+ujJ/4X3US2hhTfuxCt8rqQ5tP0EVLMuuD2fTpq9yy39bxvabSDI7yeVleuydR/XY
 I7fplXig/c70NcNsga4rFgwv3AimffFJNmbszAh6ZW+7S/mBYsRDAYkBBP/WqOIiUf+v
 tIMlAcSidwrw++co8gspMP8xnz8XnrBQopQM1i7D/HbMoPhnSQNByycTxF2F/czd67zg
 px/g==
X-Gm-Message-State: AOAM531V9eYvAWASXctc9CfE03Rrva5EEbBA+NaN2ltEsnv+tbX7ESEG
 4623J8BNBQrQpUBgWiTs1dI7/Q==
X-Google-Smtp-Source: ABdhPJwLZwS9A3Au5pjUdBGSVp1oaVkRMPuW6y501Mdqjo5E2ZTDunW08wCkhCnOFN3MICg6WGnM+w==
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr20714139wmi.13.1599467586730; 
 Mon, 07 Sep 2020 01:33:06 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o5sm25205111wmc.33.2020.09.07.01.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:33:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/3] arm64: dts: meson-axg: add VPU and PWRC nodes
Date: Mon,  7 Sep 2020 10:32:58 +0200
Message-Id: <20200907083300.14412-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907083300.14412-1-narmstrong@baylibre.com>
References: <20200907083300.14412-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043308_056135_C479BA7F 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This add the display VPU node and the power controller PWRC node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..4a93e3fecd90 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+#include <dt-bindings/power/meson-axg-power.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -187,6 +188,7 @@
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			power-domains = <&pwrc PWRC_AXG_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
 
@@ -1117,6 +1119,46 @@
 					clocks = <&xtal>;
 					clock-names = "xtal";
 				};
+
+				pwrc: power-controller {
+					compatible = "amlogic,meson-axg-pwrc";
+					#power-domain-cells = <1>;
+					amlogic,ao-sysctrl = <&sysctrl_AO>;
+					resets = <&reset RESET_VIU>,
+						 <&reset RESET_VENC>,
+						 <&reset RESET_VCBUS>,
+						 <&reset RESET_VENCL>,
+						 <&reset RESET_VID_LOCK>;
+					reset-names = "viu", "venc", "vcbus",
+						      "vencl", "vid_lock";
+					clocks = <&clkc CLKID_VPU>,
+						 <&clkc CLKID_VAPB>;
+					clock-names = "vpu", "vapb";
+					/*
+					 * VPU clocking is provided by two identical clock paths
+					 * VPU_0 and VPU_1 muxed to a single clock by a glitch
+					 * free mux to safely change frequency while running.
+					 * Same for VAPB but with a final gate after the glitch free mux.
+					 */
+					assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
+							  <&clkc CLKID_VPU_0>,
+							  <&clkc CLKID_VPU>, /* Glitch free mux */
+							  <&clkc CLKID_VAPB_0_SEL>,
+							  <&clkc CLKID_VAPB_0>,
+							  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
+					assigned-clock-parents = <&clkc CLKID_FCLK_DIV4>,
+								 <0>, /* Do Nothing */
+								 <&clkc CLKID_VPU_0>,
+								 <&clkc CLKID_FCLK_DIV4>,
+								 <0>, /* Do Nothing */
+								 <&clkc CLKID_VAPB_0>;
+					assigned-clock-rates = <0>, /* Do Nothing */
+							       <250000000>,
+							       <0>, /* Do Nothing */
+							       <0>, /* Do Nothing */
+							       <250000000>,
+							       <0>; /* Do Nothing */
+				};
 			};
 		};
 
@@ -1563,6 +1605,22 @@
 			};
 		};
 
+		vpu: vpu@ff900000 {
+			compatible = "amlogic,meson-axg-vpu";
+			reg = <0x0 0xff900000 0x0 0x100000>,
+			      <0x0 0xff63c000 0x0 0x1000>;
+			reg-names = "vpu", "hhi";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&pwrc PWRC_AXG_VPU_ID>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+			};
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
