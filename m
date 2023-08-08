Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B76C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+soItQp3I4XkmQI5CM6vaGTgXoUQs2TWz0JmhKyQUZw=; b=FCxW43Q7U7BR9E
	dH+6WEqx7vcYgxk6cp3NkrdT60jWh9wDgSWiWQayZT+W8r7ozIqVmz0D+4x+9ylzc2ZuQd412bdBQ
	oZ4xmSwcQg1PvKh4Pi97IM0NYUSqP058RIS2ki68RufTXc2yTnDAtayHdFjK6VO8udAcn9TxQhA+G
	4f+DWaArDJ8FJNDBPmkmHdXjqQZQ148vRckZ1YBApl5F+OIWEiuAhitoJORWO+tNh2dOKaNdYft1v
	e34uTCreVtG+UfmE4opDVjKLXu388ZrVM4t0yJ/RhauCLKbuOKs/RWOCxHiLaaYOzT3OjzZVHLhHb
	kHNy/9i/UJfnVVk6+wVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPPe-002wJ3-1z;
	Tue, 08 Aug 2023 16:18:26 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPPb-002wFd-2O;
	Tue, 08 Aug 2023 16:18:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RKyzF6RRyz9tMn;
	Tue,  8 Aug 2023 18:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1691511497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGGUmP8Tng3VDvVivMqZI/5pDN809RPPjvmptF0sisg=;
	b=bsTIBi12Pe64JIxoBnSalS1DT7RjeXs4s2VYNnHcpZcJg3xvWJz+NagR/HZIgRYEWRJuKa
	BhD0eBFJ8RaCswhOVwKWl5zuHpAoIm6jHQgJZVtCf8wieR09LrczJNpIdesQifxEBvD6im
	E9e1UlIh2Gn/ZJ09htJxFMG1STTZjwncUewKt2lsNB/OzlUVXIMXUcSloURfshw22Kgy7k
	ezKLs0+40M1GvoSypeOVukBXPf2H35OzmspJYH/eLC+LQL5RCO4zoppesCVBISg7LVLNAD
	LqNg+ok03E8eImLmjJ+EE8amCqBzLvKqdcMyUgt+SOJ5NUNlzVYJzH9KSm1hOw==
From: Alexander Stein <alexander.stein@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1691511495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGGUmP8Tng3VDvVivMqZI/5pDN809RPPjvmptF0sisg=;
	b=U0gwFzhLSqiiHgzavg8A96lBqmiAWamAwodMhVepBYigWqUtnFjeRI+RFpMMUuTNHIfth4
	+HV+KBMBxipaUDEMwjFynvcBLRxOI6Snuh2QDHVe89N/ZeVAX6yPXJXhlH+DjPEhJEAf5j
	L5Stvge1VZL7ORa11JlL+2p8PjO9obJeeM2qQXG4YS5SBPWpQNxoHaebraNGdxOjFt/Fpf
	21wzS01Wwb4e/7GobQZUnbkIoVbqg2dO6lf9yozNOU4YZAWLXpn8bSmK+VXItlvsytVi+O
	5SVpP3sVQeYIDJcqRc4GEhMA+Sy+uZZhXUP8WvOZbyvxlKEe5YdXFO730QzPqA==
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
Subject: [PATCH 2/2] arm64: dts: meson-g12: Fix compatible for amlogic,g12a-tdmin
Date: Tue,  8 Aug 2023 18:17:53 +0200
Message-ID: <20230808161755.31594-2-alexander.stein@mailbox.org>
In-Reply-To: <20230808161755.31594-1-alexander.stein@mailbox.org>
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: k5isb4nfwbxr8ra4z48s7oyw57iabrgp
X-MBO-RS-ID: bb2cb0716d7e664ae40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_091823_930528_321BBF4A 
X-CRM114-Status: UNSURE (   8.39  )
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

amlogic,axg-tdmin is not listed as compatible to g12a-tdmin in bindings.
Remove superfluous compatible. Fixes the dtbs_check warnings:
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller@300: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
 from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller@340: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
 from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller@380: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
 from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller@3c0: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
 from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 3ae6875707fb..eb442aaf57e4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -195,8 +195,7 @@ arb: reset-controller@280 {
 		};
 
 		tdmin_a: audio-controller@300 {
-			compatible = "amlogic,g12a-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,g12a-tdmin";
 			reg = <0x0 0x300 0x0 0x40>;
 			sound-name-prefix = "TDMIN_A";
 			resets = <&clkc_audio AUD_RESET_TDMIN_A>;
@@ -211,8 +210,7 @@ tdmin_a: audio-controller@300 {
 		};
 
 		tdmin_b: audio-controller@340 {
-			compatible = "amlogic,g12a-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,g12a-tdmin";
 			reg = <0x0 0x340 0x0 0x40>;
 			sound-name-prefix = "TDMIN_B";
 			resets = <&clkc_audio AUD_RESET_TDMIN_B>;
@@ -227,8 +225,7 @@ tdmin_b: audio-controller@340 {
 		};
 
 		tdmin_c: audio-controller@380 {
-			compatible = "amlogic,g12a-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,g12a-tdmin";
 			reg = <0x0 0x380 0x0 0x40>;
 			sound-name-prefix = "TDMIN_C";
 			resets = <&clkc_audio AUD_RESET_TDMIN_C>;
@@ -243,8 +240,7 @@ tdmin_c: audio-controller@380 {
 		};
 
 		tdmin_lb: audio-controller@3c0 {
-			compatible = "amlogic,g12a-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,g12a-tdmin";
 			reg = <0x0 0x3c0 0x0 0x40>;
 			sound-name-prefix = "TDMIN_LB";
 			resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
