Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F73C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sa9NVnzP4qE8mB3jVe9UM1RTdQXM9xxTUs/g0CM7uco=; b=KjMcwFagVuNuqZ
	AeWIe8+bf3TlGoNTzdIGYYpFK9o0pfVt2l1j1i2CdjyzZCB3VKunoJkWIUV1rGd5wVU4kMEKbP9qj
	lP16RBWgolLpuVNTtq1TUn0/C5F4w2SjRBkdIsVowkkzpsvzbApIUg7DSfbU+XMlESYfX+HyCsE5I
	E/IID56HaWG5SypG9tP7yyYCY+TIrtMQO+MiCIL2AeDc9lQ1axXo5nSs03QUitOLH9vgpEAoT0aM6
	G++iS9ZqdUZaTplm8c7eHke1nbd2NlsdwLyo5Ml8t5jAknQSlCmhuOkjlX2pCzichInRccoX4C0o3
	kiwedJQGujfpF2zke6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8fU2-00ArTR-R0; Sat, 15 Jan 2022 09:36:26 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8fTz-00ArSs-T2
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 09:36:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JbY2V1fmvzQlBW;
 Sat, 15 Jan 2022 10:36:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1642239373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ji1zixuudGwd0KFQ/Ox3LSNxpnb2w/YqY4LhAEAcapM=;
 b=aQcslm0SvP8RxgX/5WtFtwQ5CDhUqa4u2npXd0DbJocvpmqMwMipKcwBLjlEYKx+2U9OM/
 ceYHyMhOXFyFETNVzuqYSSzKC5ffXxp1MwRXxcj8ORFq3RG+JsVHMFU1wZSKciP+kCOdRw
 z4lIgzsBihg55ox7ARcTuH2UU0X0r5vghRhGUOtPqufQ9Iwl4lR51VI1WYStNG8BehPhRE
 8stuLcSDt6oo8+FKYNJZ9hvfP0kGZeQ4hJPwWwHBEG+zQBvYQ4QZh89q44eIZgPqnJqAbm
 kvNGUaHptrwc56l8+F8nH20pciY2msjaDgRxLmj5ggGnee1JowmHz72ZKA3PoQ==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names property
Date: Sat, 15 Jan 2022 10:35:56 +0100
Message-Id: <20220115093557.30498-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_013624_128962_BB9E9B93 
X-CRM114-Status: UNSURE (   7.14  )
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

Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
property. Add it.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
This is essentially a preparation for YAML conversion to fix the
warnings.

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..b14175e2f1d6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1333,6 +1333,7 @@ toddr_a: audio-controller@100 {
 				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
 				resets = <&arb AXG_ARB_TODDR_A>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
@@ -1345,6 +1346,7 @@ toddr_b: audio-controller@140 {
 				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
 				resets = <&arb AXG_ARB_TODDR_B>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
@@ -1357,6 +1359,7 @@ toddr_c: audio-controller@180 {
 				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
 				resets = <&arb AXG_ARB_TODDR_C>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
@@ -1369,6 +1372,7 @@ frddr_a: audio-controller@1c0 {
 				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
 				resets = <&arb AXG_ARB_FRDDR_A>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
@@ -1381,6 +1385,7 @@ frddr_b: audio-controller@200 {
 				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
 				resets = <&arb AXG_ARB_FRDDR_B>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
@@ -1393,6 +1398,7 @@ frddr_c: audio-controller@240 {
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
 				resets = <&arb AXG_ARB_FRDDR_C>;
+				reset-names = "arb";
 				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
