Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A08EF48D1
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 05:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O79b2YJ7Jfx0hcyeADixEcDd6Iit6SaNvTPoWuVaPH8=; b=QwXJgvy9GBH4Qn
	MnABakwl21OCcyesPSqf6LIygF3JFRVwj/A13RL3e4Lg1NyJlHWZ0Z2HV4qWe7eYdaOCwsJIlLZ5R
	zI+jT4HiGBkmFuCYsqcMljFILa8bFiemOfNGD3E4sxgdOuLoOV9FDfZAq2jGP+lm6gnbUPWb2gW59
	Xvvwnm21541cotJb4SYS8hYXAj0il+1cV9rlE4PsH1NMAo7/+M/28z7JB8Cd7EsKMAXFNaMa8nmm7
	rrHgVp8FknnwZuBvNqrn3/jsh/4mE9DRZxlfIV6UpQ3TJy94qmmjgYju8ZTQegfjMZkMREeW3kcNx
	QlQGH8TFd6wQuU7PSscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlUO-00000002zmL-2TQD;
	Fri, 13 Feb 2026 05:13:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlUM-00000002zl6-2VYw;
	Fri, 13 Feb 2026 05:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE7E1445B8;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B31BC19424;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770959588;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tqSUYwmnfOnHODzJdY7HHNEnQS6HyulkCg2dqoyAHX2Bs3MeGEizaFiW5PKNSnbi/
	 nsuTAr0jq8OgIvNIn9mGg3wkUQE3KDf8b2Di3+kX7B7sK2qp1Hv6f2dRXRhzUeIffk
	 P8xOrR/JBOraWmCoUvLWLYr6scEK6djF7qp1pSLIbODsUM6m2ojDRt0CUAu6EybbAN
	 Ai7tZYh8H2k8bTmDZEiwHE1Szak2xxerRt5gcROg41z1S4biSUkl2SJ9p9hRw7B5TL
	 u7e5KdrudueTwzAk98t0Ua6eZERBCGBnIdO2unAVpliKxxVvAyXJ9Eujw/dbzTJVVV
	 ys3VaOLeNhiCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F27EF48D3;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 13 Feb 2026 13:12:40 +0800
Subject: [PATCH RFC v4 3/4] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Message-Id: <20260213-b4-s4-vdec-upstream-v4-3-c7112d00d662@amlogic.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
In-Reply-To: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770959584; l=1534;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=IzNXt2+VyFRVs1Y87t2pUqlUvtHK8Yc5ii/YgU+Xf3g=;
 b=QTs6TPy9KkrYLEDduY0sEmpyT8mclN0g9T3FDQX6AkMEGZVhX3DxD3eWySM4WD/SCcXjaqfRJ
 smAF/WbBOXuB0P17sOpMiuFlbD+b3m5Rz+8nxL6Nbk5rhu4ymvA+P1L
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_211310_718792_95039860 
X-CRM114-Status: UNSURE (   8.55  )
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
Reply-To: zhentao.guo@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61..b8355e41d550 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -862,5 +862,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+			resets = <&reset RESET_DOS>;
+		};
 	};
 };

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
