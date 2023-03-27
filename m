Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63188C761AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQ8Zw84ATVccLlzpUMIxM1ty3H2lV2G9wOR/wt/7n50=; b=sQNaZsYhrM7bgw
	cRnyjrzbXR71RuMNLxWO/Xi62WGnZJbWa6Nr3j0dE0HaFC8OVh5JPOP40SHMiEVg4Gnb8lLhGAzQ3
	GhXDxPZo7vCvQcSAu3BU6Ru9JOjanmOXBj9pSWIfIu8gj0/lp0RVLd5plXDO4KqwBAoIiO4q9UP8h
	6V4tbsdXon6H/qRENIUogk+ziZlyDYvVOnuAHwN/Zzx8hXS/QyqQkElsxpuvsQ0aZaSquw/VB/lIe
	vbuJSlK9gNcrsERsFIZIdLeJ15HI5O81pgBo/lrbwGbx0Y/Q5O/BdW+dvAnqw+9voamlQc/EKLAnV
	1wKUSfHyyD2YtnK5tSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglns-00Atxw-2j;
	Mon, 27 Mar 2023 12:18:24 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglmS-00AsqJ-0y;
	Mon, 27 Mar 2023 12:17:01 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 99967210A1;
	Mon, 27 Mar 2023 14:11:09 +0200 (CEST)
Received: from venus.iliad.local (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 7CBAF21079;
	Mon, 27 Mar 2023 14:11:09 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
	Pierre-Hugues Husson <phh@phh.me>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] perf/amlogic: resolve conflict between canvas & pmu
Date: Mon, 27 Mar 2023 14:09:31 +0200
Message-Id: <20230327120932.2158389-3-mgonzalez@freebox.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051656_526320_E8CB733C 
X-CRM114-Status: UNSURE (   8.06  )
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

According to S905X2 Datasheet - Revision 07:

DMC_MON area spans 0xff638080-0xff6380c0
DDR_PLL area spans 0xff638c00-0xff638c34

Round DDR_PLL area size up to 0x40

Fixes: 90cf8e21016fa3 ("arm64: dts: meson: Add DDR PMU node")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index a5653ab1f0b43..1aab65bb5f578 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1585,6 +1585,12 @@ canvas: video-lut@48 {
 					compatible = "amlogic,canvas";
 					reg = <0x0 0x48 0x0 0x14>;
 				};
+
+				pmu: pmu@80 {
+					reg = <0x0 0x80 0x0 0x40>,
+					      <0x0 0xc00 0x0 0x40>;
+					interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+				};
 			};
 
 			usb2_phy1: phy@3a000 {
@@ -1710,12 +1716,6 @@ internal_ephy: ethernet-phy@8 {
 			};
 		};
 
-		pmu: pmu@ff638000 {
-			reg = <0x0 0xff638000 0x0 0x100>,
-			      <0x0 0xff638c00 0x0 0x100>;
-			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
-		};
-
 		aobus: bus@ff800000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff800000 0x0 0x100000>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
