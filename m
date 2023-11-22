Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EBBC61D9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPsdIxfNF8a60Ij5mrwmw8/LjW5jHRVQlTEII3XOGns=; b=QUPGUog8UpeQAO
	UP3ki1NGzqAXpoDSPanSqp8DcaPkIvDiuy5wCryz6Klp/j3FFcaPoBnTTFYCbhcl4A2A7GhKAVqgc
	P0L0EsFZA1lqoGNH7gAcL5Qi6Y59YgV1pASPkCr2aA610ngLUqWhG7waC2jJrqGaULrd58FTwbdIa
	vmvqZI3Klb7r0YQDi/gs/XjD12T5pUYF4NpJsZAZ33weOAs6l7+SvPtP68+H1SRbhB0gYIMroHyBK
	umiKCyhc4GtkGn2ULTKB1rNp6pZnOFCgX5e/Si5PoAKQYSkSEzJ86TtlahGqQRv0Gq3wLerixlq5m
	ZbYK1FUrTaxlRn2CJ/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mn9-001t5Q-18;
	Wed, 22 Nov 2023 12:57:19 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmv-001suA-2x;
	Wed, 22 Nov 2023 12:57:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F41A53EDB;
	Wed, 22 Nov 2023 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700657815; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ulmefl5yig/F+2V9QAbbUBGE0S2hQKZ3IPeqik+z0UI=;
	b=obnqjWRUmpCSg3j42I/4HoO5hACMJaABq0MXfrlaqopRm6vDn6C0+Mj7rsbVzWyuJB6i0R
	rjEYNy2N5QabL5j55uL2EuFfluAXcRx1fVMIf3tqMODJ8ExoqO+oOUWxCMeB2ZZDxgXCtr
	4WkKzmMnRlipOLOWil8NEG8ZgBUTv3Vp9hPkE7Z2lrMctIPzXeWkmdMsWZ7zhjRe10kITM
	sUfdmvw15/XacURTXUN/K3o3z/+4tys4qR+AsvUCkT9H7A86ubeZVzxzOvPG2XDsRLwb0w
	wCCSRyH6+5lprySgxtdAGPrpxv5NwOhk2gFWquNk4bZtT99ub8WMI+zbFJuvAg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/5] arm64: dts: meson: add dts links to secure-monitor for soc driver in a1, axg, gx, g12
Date: Wed, 22 Nov 2023 15:56:43 +0300
Message-Id: <20231122125643.1717160-6-adeep@lexina.in>
In-Reply-To: <20231122125643.1717160-1-adeep@lexina.in>
References: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; h=from:subject; bh=5P5fYju1OuJiL/byEBiP3PSi5QUDOL3VUZ+An0H3Yq0=; b=owGbwMvMwCHmnhFhrJcZuJTxtFoSQ2rst6PzpSIPfZiQwrL/6Lz/Yq6reYpjji2pORTNeLc+Rj79 0t/7HaUsDGIcDLJiiixhHUFT93msvjhxgdEBmDmsTCBDGLg4BWAi50QZ/krcyUy9e1Ag4O/3OF29F6 eL570SVgi+mt7GEMu57ENL3Sagiv4ltcEzrio+it5Q/COaS7csWft72s89slNKV35d8s2VEQA=
X-Developer-Key: i=adeep@lexina.in; a=openpgp; fpr=E2FA1A767ACB0716E02E3E7AEE36B110025A8DFA
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_045706_127463_9D8CEBAF 
X-CRM114-Status: UNSURE (   8.20  )
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

Add links to secure-monitor in soc driver section for A1, AXG, GX, G12
Amlogic family.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 648e7f49424f..449b328d62b1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -407,6 +407,7 @@ hwrng: rng@5118 {
 			sec_AO: ao-secure@5a20 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x5a20 0x0 0x140>;
+				secure-monitor = <&sm>;
 				amlogic,has-chip-id;
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index a49aa62e3f9f..6e80bdc525e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1660,6 +1660,7 @@ mux {
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
+				secure-monitor = <&sm>;
 				amlogic,has-chip-id;
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..0a6b703b0dc0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2026,6 +2026,7 @@ cec_AO: cec@100 {
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
+				secure-monitor = <&sm>;
 				amlogic,has-chip-id;
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..656e08b3d872 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -471,6 +471,7 @@ cec_AO: cec@100 {
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
+				secure-monitor = <&sm>;
 				amlogic,has-chip-id;
 			};
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
