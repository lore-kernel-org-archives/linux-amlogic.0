Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AAAC001DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fD6OLH1GASRtL9r8/e/uIwqsa5DJ1CtC6gsYp33V8w=; b=iwEpeSnH8+he72
	xM8dzZhh07swtgM5fDMfo4x4QqD+JpZY/5p4hUm0qzGLu/7y9IFspW61J9WVi29lDPvh801K1xdBc
	r3VBozUQkwLsrzodKisXPuhznui1/wdPnUJCgs/XjFjTvZGynGD2P1xATR2QsNYG1IZ6Tg3WBlQje
	WxvgWPn0m9l0VgK3Vtc+8H9xEI03YecbPJP9L+NQ3zNhyeq7jApCRSsrA/4E4mhbpeKAftltbI6hQ
	sm/LYxbuYOZfuNZPFnBg2ftQcuhSWlLKf8RG5V6AJ+iPz72hsP7FezHKuivfXXvyGJbGVC9HW0VmJ
	J/KGF3D9bZsE+FHBO+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPPd-002wIG-1P;
	Tue, 08 Aug 2023 16:18:25 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPPZ-002wEu-37;
	Tue, 08 Aug 2023 16:18:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RKyzD5PMMz9srj;
	Tue,  8 Aug 2023 18:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1691511496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8pP2tQ9G1CSgP96+czw5oj85ohoirg2opvYsmKnh0zo=;
	b=swD0Gt911PkveINFB9XoG1S0KrqsjzhC6JkYGgzBTXWYMykA76Sy3Ab+0BP1HuX5dx8qI7
	gDzm0hT9FLG4Dtx3jlWoyd91LSoqghGkE4AzkqToxbMOS0HVsdMi7639O0jGDVCFYxkb8x
	qBlHbzQ4T1F44LTS1RE+uoaqnHigTfI2dJUhgR3g+4SQdP2zZhaj21HSatMVO+cjdpHi1V
	MCkiQI9a8btiGvTOYS8amPl5RaBXx23VPB1lOgzWvrRuj+c2dar7fug1NY15pHEuq9obur
	TDz+p4dCIHwzhzS7aJ6Zzjwlw+/J4E3MV4e05U7dsBneQBmD6vC17PufYWs3gA==
From: Alexander Stein <alexander.stein@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1691511494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8pP2tQ9G1CSgP96+czw5oj85ohoirg2opvYsmKnh0zo=;
	b=IvweC6uzvKC04XZnV72YV25I4ec45dN7dN/KpjCvk9aMgFbDvEijP+6dSNRpoLTveSnbrb
	bVzzS6UpI5+lPrRiN88ADJMf7NIlOJqkZ+CKGuAOHCf7VK03BSRWCpIsPTysVV290aMC7T
	RkXe16oNWOnAOyD/HWeB0wlgli9VzhTfR/wkj4HO8jxDBZyjTOrmN5WWe7+ssXjsmMeRaW
	su/ch8mOhEX6FP9gYgsu/JxwDxuzAUwk0xdMMo8+k4UYDeAZBqsPQbSZu5MaT8uhCbJqEU
	h1Te08p6fsWwpgIz9BwBXwORyHEQKHNEGPKSjbX/hAQMaTfO5V+z7EHWEvTqcQ==
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for amlogic,axg-tdm-iface devices
Date: Tue,  8 Aug 2023 18:17:52 +0200
Message-ID: <20230808161755.31594-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ca8srwyci65agwfa3nidgadabspxws16
X-MBO-RS-ID: 55e9cb80a79df6dca71
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_091822_209331_7A6CECCE 
X-CRM114-Status: UNSURE (   8.02  )
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

Binding specify order of clocks as:
1. "sclk"
2. "lrclk"
3. "mclk"
Adjust clocks accordingly. Fixes warnings:
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 6a1f4dcf6488..3ae6875707fb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -15,10 +15,10 @@ tdmif_a: audio-controller-0 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_A";
-		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -26,10 +26,10 @@ tdmif_b: audio-controller-1 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_B";
-		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -37,10 +37,10 @@ tdmif_c: audio-controller-2 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_C";
-		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 };
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
