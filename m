Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F7AC33CB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7CC208C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qh3w++/f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2SMfKJvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7CC208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kOpocGQtdnecXIcWzKtmkT2kZ138rOf4kp56GcCj6Q=; b=qh3w++/f3hhC/F
	L+vkqanMGN8kCAUGUdy/LiCP2XWxe5eSTQMefQdFKnGTEGieA/ygs196Sk3BSLXWA7K4QJAZiaFuM
	0D2tKLrxw4wSNdulVWwscYBEbT1r4D6BTjDajS6hVdI6uZKCCEYx3eOkr+qmYShPxljWmCPqm0/bp
	9XOT9cKIkArZLcmxGvH+7QPzvYPrSIREr7ELd4i7oqpxlLJKDxdQpMT5n0SKWpsKM4BgjIWr6z9F1
	5XBAB+hLvn52dAXJWV8KFnFTRBfPzmagXAzEO4QuspKCXLX/u7A3eGrJDs4e/lKUhE3c2+Shb3pgg
	ZOqqxE57eOLvZXnu0X3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8GE-0007Al-1k; Thu, 16 Jan 2020 16:44:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8G9-0007AD-Gm; Thu, 16 Jan 2020 16:44:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFB2D217F4;
 Thu, 16 Jan 2020 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193081;
 bh=FpYL53Dj7ISOj370RYGF//iYufuzQ/MPLCM/sYKfHNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2SMfKJvb7MCUwSJcYATMpfkOkrKfkjzygSB3wJY2VXpWOs33Nppkw1WyB6HItjj5Z
 8iqspO8qFx5TDbpOrcn8ku8Gz0X0ipPuEsr2HgKkrIWtpk+GpGzEOKLKaFNLz8sJwd
 JvLz/swmib8UcmCuDO9jNFGqauz83dAVQvnUeeSU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 020/205] arm64: dts: meson: axg: fix audio fifo
 reg size
Date: Thu, 16 Jan 2020 11:39:55 -0500
Message-Id: <20200116164300.6705-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_084441_578226_1C46AA34 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 301b94d434ac3a3cd576a4bc1053cc243d6bd841 ]

The register region size initially is too small to access all
the fifo registers.

Fixes: f2b8f6a93357 ("arm64: dts: meson-axg: add audio fifos")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 82919b106010..bb4a2acb9970 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1162,7 +1162,7 @@
 
 			toddr_a: audio-controller@100 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x100 0x0 0x1c>;
+				reg = <0x0 0x100 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_A";
 				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
@@ -1173,7 +1173,7 @@
 
 			toddr_b: audio-controller@140 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x140 0x0 0x1c>;
+				reg = <0x0 0x140 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_B";
 				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
@@ -1184,7 +1184,7 @@
 
 			toddr_c: audio-controller@180 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x180 0x0 0x1c>;
+				reg = <0x0 0x180 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_C";
 				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
@@ -1195,7 +1195,7 @@
 
 			frddr_a: audio-controller@1c0 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x1c0 0x0 0x1c>;
+				reg = <0x0 0x1c0 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_A";
 				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
@@ -1206,7 +1206,7 @@
 
 			frddr_b: audio-controller@200 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x200 0x0 0x1c>;
+				reg = <0x0 0x200 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_B";
 				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
@@ -1217,7 +1217,7 @@
 
 			frddr_c: audio-controller@240 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x240 0x0 0x1c>;
+				reg = <0x0 0x240 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_C";
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
