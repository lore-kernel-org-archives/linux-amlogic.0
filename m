Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA5C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nuW0/AnIvfULr9Id0wWK2/JA27ucnGLXR4cEzkeC9cA=; b=XezEaMPEnq/+7o
	aG6NyQa8sHg1uLdzfg5XZrelRTCYQLFhjc6gfMjMx7wB5KmA7uAOGb7U2nFuyBvDsMIGPQQ1vFrEV
	of6lLxy6TKYP/E5TUouVnm+AuRIV95bHx94/BZiiotiUX1mP2y2YKlh0mVC7RC6I4c4psbK6oiBMB
	ZI5CCOGYQ+39wctEbh3oEkkX2nG5HXIeU4YZYeLtjdH3JnAyYc3IPZeURTEME+XJIRI76Vahbwm5y
	aIUpwyZyB6JCbtmm9b7vd4r9WQFOt1mKJj+4FHj7/Lc7OrJPUsppB+EYZDFyjkl39rDogJ7saIdXj
	2EcdM+3K6ktu3zAAYuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3Z1-002TX0-1B;
	Fri, 15 Dec 2023 08:28:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3Yy-002TUf-0O;
	Fri, 15 Dec 2023 08:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 42EFAB8215D;
	Fri, 15 Dec 2023 08:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93CF6C433C8;
	Fri, 15 Dec 2023 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702628929;
	bh=ArwbdbajuvXMrY2iE/LpmJ/4JFmADS7V6K3rm2vEt4s=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ddOySBNd2ktPtrrpiSjcWB65VxKQnUBAS5k/+a/gskbv9jFmpiiljK7LZqSxPOCjq
	 Kv9XhMUOWg2gEcst9lsuAqAudukrW4dzwtW1Qxb+5a1b6pkfP4dVmGZGcuNVg+Og8N
	 bmm6H9E/BQcEECn8fv/QRe2Kpsy+iolSFnExg4tOKb7ouRSX/ECC8DZrMafh6LM1MG
	 p+yQqedo37/9PG9rOeDnN9hKm2mrkem+od9QxRJP4VZZxNsAWAfblYIS2OhQi2HYQh
	 MKjFbRLrIrKKWmpnEfdMtgPmDD0+7l0dy9//qyIeqfh6CpMgDKK/lLVRCQ79pb7WLX
	 rc0/xIrUDLqxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C7CC4332F;
	Fri, 15 Dec 2023 08:28:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 15 Dec 2023 16:28:00 +0800
Subject: [PATCH] arm64: dts: amlogic: fix format for s4 uart node
MIME-Version: 1.0
Message-Id: <20231215-s4-dts-v1-1-7831ab6972be@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAA8OfGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0ND3WIT3ZSSYl2TREMLA9OkFFOzNAMloOKCotS0zAqwQdGxtbUAJ0N
 5KlgAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702628927; l=1770;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=RArDScP4iapdXOoGmXRe1ouD3aGqNXEnjFAHeK0j36Y=;
 b=8YWVWYB68WIuagKY9/MmSOxi3cDEmfkIpy1lKXTc9hgqrbNzIU7HJskJxS+EyIteu9O7mhXxX
 +LUZ9N6K9wADTtpyiKd7z41yH/rd/YIMyc5TnCzuE6FhItyitGm7sjB
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002852_474922_6C3308FD 
X-CRM114-Status: UNSURE (   9.58  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Aliases use lowercase letters and place status in end.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 18789242f05f..983caddc409c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -15,7 +15,7 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		serial0 = &uart_B;
+		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -36,7 +36,7 @@ secmon_reserved: secmon@5000000 {
 	};
 };
 
-&uart_B {
+&uart_b {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index c6b524e1a1ee..ce90b35686a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -455,14 +455,14 @@ nand: nand-controller@8c800 {
 				status = "disabled";
 			};
 
-			uart_B: serial@7a000 {
+			uart_b: serial@7a000 {
 				compatible = "amlogic,meson-s4-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x7a000 0x0 0x18>;
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
-				status = "disabled";
 				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {

---
base-commit: 078c5db2a961f674cc27c10f15d15949eece6a49
change-id: 20231211-s4-dts-4a1805bd56f0

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
