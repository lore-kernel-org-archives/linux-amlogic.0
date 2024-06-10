Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC2C27C6E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iwo9qJnPVV+HxbMIrPiGOnohc/yr2Tvc6vbwNcXQXDI=; b=EXFmJtT3UA9hdK
	WuNESWm9LzQucIug7M8ly/qrNoR00CWk5+2s87fM3dEh+wWZSYeIjxUj93AnQwj5DYFJ+E1ixVfAc
	JeyXp3SgonwemAsViOvkRF2Ylme/b42weJ6O0iWD8Cv8unEiIp5xkRy5jkHsBgtEfLZ/1+4/VWVuK
	p0caFoCxYhIqKCJxXCBXKw7LzgtRPaFej3W74bk0k/QPFF/mL6kFrVllGh0a8QveFBG567KR23G+o
	yNIe+tPqsXNEyKlUzbfTg4IoN5tX8K0+lRpiC2Zr3WK9t8N3pS9AQxfaG/Bs9vnBMfuBOVWgYphiN
	q01F0uz496c4FCL5Y1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaas-00000004Hof-1ajN;
	Mon, 10 Jun 2024 08:41:34 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaad-00000004HcV-3DYN;
	Mon, 10 Jun 2024 08:41:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EB15FB01A;
	Mon, 10 Jun 2024 11:41:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1718008876; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nrT9Mv5nhx7yJK+tAbs1JLdncnlFoxlReCq1D8Bae3E=;
	b=cv1kCaahpe6gnVkHI9SOjnmxfMQ+VoRDS/FioNBPlKBsr+PzPhaIqdBYFEoRfzY3+TOAPs
	oZ+g8h+mW4bp52FYP05/hNl0YnaFvHQtcyImt5VOw09mMGeMAFv5wZqLbQfZCnW0+Cfux4
	rZKzVeDhyTKeVrUtiomABQ8plzUNInb4d9v+ZCD9AfvSpRyOzye8WtYYZ17nmwB4SOY2gy
	c4vaOYgdUF7S3ZsLIT5ZIJZz7LGaf+3+18C3RiuP4SRonO6nIiP3oO/ZVsletXFxYbgjla
	znWt5FANvF3JzJ3KopquW69vfFJ4MGpUb2mBXhNGO7pRORl8Sv9WMsEMMxlEYg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: dts: meson: add dts links to secure-monitor for soc driver in a1, axg, gx, g12
Date: Mon, 10 Jun 2024 11:39:50 +0300
Message-ID: <20240610084032.3096614-5-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610084032.3096614-1-adeep@lexina.in>
References: <20240610084032.3096614-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_014120_068339_85BAF3BF 
X-CRM114-Status: UNSURE (   8.61  )
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
Amlogic family for use with meson-socinfo-sm driver.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index c03e207ea6c5..d47f056117fc 100644
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
index 6d12b760b90f..45791ec6694a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1689,6 +1689,7 @@ mux {
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
+				secure-monitor = <&sm>;
 				amlogic,has-chip-id;
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index b058ed78faf0..11422d0be22b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2045,6 +2045,7 @@ cec_AO: cec@100 {
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
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
