Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADB6C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxwViNDunf4BDGU1zjaBdnsmwvLrC68NAvAFCXftQMQ=; b=f06Z78rX+g/HiD
	l4IkfPMulEMYAKEKO5WIqOM1Ou6D7sR04DsV4ST+su76l/cJvhOzr5j5InVJCL3Td/oVb8XbiGfvd
	g2kmM8WMkBOvarOVQnlcZ78vr43c99R5Pn+i8PPxLuZ5GwvZJydRb5WRiQmCnLNw7g8yNTd9L8IZp
	qKy/oU/fgUeZUE8NUB8gJKMjW+h6H5ixqw2Sx64Oc+GQ+DUI7uLTrbKzBH79i00EjHO/SfM5BwR3Z
	Op2wbMDJE7VtEn6MPDwSIDditZyVmYxURKO8MVrlDB4d2LWsj+M+B04t9tN7ZC7OMPiI5T09L0YJV
	O5inNZWCWjqzg2WI2lrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglnm-00AttJ-02;
	Mon, 27 Mar 2023 12:18:18 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglmS-00AsqK-0k;
	Mon, 27 Mar 2023 12:17:00 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 5ED3421074;
	Mon, 27 Mar 2023 14:10:35 +0200 (CEST)
Received: from venus.iliad.local (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 424E72106F;
	Mon, 27 Mar 2023 14:10:35 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
	Pierre-Hugues Husson <phh@phh.me>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: meson-g12-common: specify full DMC range
Date: Mon, 27 Mar 2023 14:09:30 +0200
Message-Id: <20230327120932.2158389-2-mgonzalez@freebox.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051656_439315_4DA3B05C 
X-CRM114-Status: UNSURE (   8.37  )
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
DRAM Memory Controller (DMC) register area spans ff638000-ff63a000.

According to DeviceTree Specification - Release v0.4-rc1:
simple-bus nodes do not require reg property.

Fixes: 1499218c80c99a ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 534178eaaf373..a5653ab1f0b43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1577,10 +1577,9 @@ usb2_phy0: phy@36000 {
 
 			dmc: bus@38000 {
 				compatible = "simple-bus";
-				reg = <0x0 0x38000 0x0 0x400>;
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges = <0x0 0x0 0x0 0x38000 0x0 0x400>;
+				ranges = <0x0 0x0 0x0 0x38000 0x0 0x2000>;
 
 				canvas: video-lut@48 {
 					compatible = "amlogic,canvas";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
