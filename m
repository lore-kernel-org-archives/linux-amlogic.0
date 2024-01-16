Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ABCC47258
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jan 2024 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8INDCNW40iWgkw7V78z3jsl3QapnDC4b6ph0YxGhLNE=; b=f5XzS6bolTH6sw
	lyNeulPesIjZ6SRDGvsMjwq3x14RezcojQ23XW0G+jxaNjr2/2jh8l8++/G2QEbaxI2PpTK2yzHbZ
	vrMohYr4RxgMnmaF7U6oh51ugqV10lqNuyJHr4jhoBirngx6acoB/rHTCmrHmHs6TVycKLeQs4iG8
	hNLHGPx7Sd6qj3Z46eITa582zXfFoFVnglO4eZAtM1JTKRO7KDBdyUDHIlOmIi0zcWXFtr28nUqYK
	ufXX80fY7g92Hgft0BYaH16VL1nZJdxr243cCsxLMjcgq2bTBZcr9LsP5FMSrFRliqH6+S0QN1oZY
	wm9MvS85ixAKLhdH3veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpV6-00DGFQ-2Q;
	Tue, 16 Jan 2024 19:53:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpV3-00DGCt-2x;
	Tue, 16 Jan 2024 19:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 85404B80FA8;
	Tue, 16 Jan 2024 19:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7A7C433A6;
	Tue, 16 Jan 2024 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434807;
	bh=D2ixwIy2DgRLBSaqA87mBG0pCTbp+mlrfu3WdPxsoK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bnWLhSZCQj34iKWkhgwrYdEuY0SzsqhUzycWqDwxSM5gHSEeeS8d3c5vrpoIRJHkg
	 ICMYL7BYpCk8dqnTVYRBDsRkYfqXuQNUdK6Wi59Z4R+pqHNccEDV808L7NB26Qd6b0
	 9yNOLLleA6bsaWbaAe9cjqIj0ZYC7Omo9ca4Tv/HjE31p4/IbuzkpybGcnGPt4Tjy3
	 nF809hgju69RtaIiXng88oCef4hka8YEVeNgCFhRqteLFQ///VZ0mIgR4ude+gPlQ3
	 Sy8eEQORRixSv0iVyK7JSASoriTTgWUb9chp58JVaz4NRph3pCxKycupjJXnNFpG3y
	 EapcwemKBPF8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 086/104] arm64: dts: amlogic: fix format for s4 uart node
Date: Tue, 16 Jan 2024 14:46:52 -0500
Message-ID: <20240116194908.253437-86-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194908.253437-1-sashal@kernel.org>
References: <20240116194908.253437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_115330_095133_3AB02776 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

[ Upstream commit eb54ef36282f670c704ed5af8593da62bebba80d ]

Aliases use lowercase letters and place status in end.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/r/20231215-s4-dts-v1-1-7831ab6972be@amlogic.com
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 8ffbcb2b1ac5..bbd3c05cbd90 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -15,7 +15,7 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		serial0 = &uart_B;
+		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -25,6 +25,6 @@ memory@0 {
 
 };
 
-&uart_B {
+&uart_b {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f24460186d3d..55ddea6dc9f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -118,14 +118,14 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
-			uart_B: serial@7a000 {
+			uart_b: serial@7a000 {
 				compatible = "amlogic,meson-s4-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x7a000 0x0 0x18>;
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
-				status = "disabled";
 				clocks = <&xtal>, <&xtal>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
