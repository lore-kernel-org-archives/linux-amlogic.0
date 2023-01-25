Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D5C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T4Subzj1ZGj0hJVawcINAKcf+MuBiji7NgabY8HXXHQ=; b=exgWfA0EjRmzW+
	lO5+2Mn/9j6RPOtnHThvb+ZrKnO9SwjT1RCEeF6NikaXnNMMZEPRkLNt2Crp5gi+VxMfPrRokbB3i
	wE7eyvYZ6P2NH9vjWmNVUFEUPLvz5SNhXcFlPbXtcefRiJIZU4VMUnoct5+rekOtPldE4OsDtB8ov
	VQXFeix2unfkXoDCwvYwnTL9siaRnKU4Q4MYHzB6VsAejERAxP9e2VZo3Q1vHYgfwE5NePP+DFf6A
	7lWei0WeWCnlwWLdYh8qEXI49XuYkHowrdnU/xjvRs3h8c5HkqAL1Bt3erlayI9O94E0YxwP8qMGP
	UYo+l7ij0IULlQHQ6bnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKZed-006BxK-8V; Wed, 25 Jan 2023 06:53:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKZeS-006Bw7-Mz; Wed, 25 Jan 2023 06:52:58 +0000
Received: by mail-ej1-x62a.google.com with SMTP id v6so44996733ejg.6;
        Tue, 24 Jan 2023 22:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcRWz+wlux3+r5w9OU0gEpUewRtO5xydPlFIEWNqMqk=;
        b=ZB8XDp6C6562DC2Hg+9qfoCV27AdhPI++unNOigC82ZWrZq+Rtkv1TDkn9zdDk4dTK
         IS21ArtIyBMnHsa1z4prbONlWo3E6oyAec4e1zCJoXxDED+PDnqf3al09r71zxOwLjRB
         /T9jD5dz2DJVM7NCmJQ3ZpQBzwlxfqfd9INbLHUWnqS6vHNiRD9CXQ1f5tL5kDgUtbwF
         mImYbM0ad4iswkPsYpSSbNgq74SSuP+EOIljKDjo4XO4Nz1NZjCjT5ffr/10Odc9mNm6
         IYSEZpeOrcIocKm/LfSXBD6+qIVyXWIm7CjEmMpvdLT0rPIHrIOhBvI9tgeTcfQdrwtM
         ewvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcRWz+wlux3+r5w9OU0gEpUewRtO5xydPlFIEWNqMqk=;
        b=Kiyx/QrAKc9U7NtOFb8WNH5SUwgZh5tJGzijoEK3EzR50muwbQrCWgTCycn4UZGPid
         Mllr9Yh0VzRtxzABEqEGJZ35WD6vEC6jDfcszor4P4UJcZvBvWItKdKnAQSMf69rJ11/
         o+Z1BpArR3x4HU9icIN0WfpSQryb5BuRtXOC9zAgoMDT/zs4f2eAQpRZbnJXQJ08SSI1
         TK96M7E1n2D8g1rO9R7kwlYJaAc10L0wkXQoFq6B6KP48FHwcv4FGmGX3PtZ+WIs5NQR
         VS2X4eB4q7I7l2RldVJJkex1BovSw5LLVCtmVibGftwtz3mjcL6+88cpPe4rUEvJqSHk
         VKYg==
X-Gm-Message-State: AFqh2ko9oaCwP5ffDpM6Gk7ssrQjFcmQNEqB+GktXV2S+Go0ZiAr36Oz
	wwA4nlWQRSmQ4aTjWO4q648=
X-Google-Smtp-Source: AMrXdXsU0BQfMNqCbQWqvGPRzN2+dYPKj90qH8Q+WPYWIbRhtcSyiCEydPajRl+H1TS5C9aLij6ngg==
X-Received: by 2002:a17:907:75cf:b0:7aa:76a:fb3 with SMTP id jl15-20020a17090775cf00b007aa076a0fb3mr31698961ejc.66.1674629573497;
        Tue, 24 Jan 2023 22:52:53 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:9008:755f:20dd:1de8? (dynamic-2a01-0c22-720f-5a00-9008-755f-20dd-1de8.c22.pool.telefonica.de. [2a01:c22:720f:5a00:9008:755f:20dd:1de8])
        by smtp.googlemail.com with ESMTPSA id b4-20020aa7cd04000000b00487fc51c532sm1967994edw.33.2023.01.24.22.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 22:52:52 -0800 (PST)
Message-ID: <e635fee3-f5c4-2819-d6f3-a50dac55e979@gmail.com>
Date: Wed, 25 Jan 2023 07:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_225256_779930_B45AB5D1 
X-CRM114-Status: GOOD (  10.84  )
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

SDIO specification defines that the interrupt is level-sensitive.
Fix the interrupt trigger type for emmc_a accordingly.
See comment at beginning of the file wrt which is the SDIO port.
mmc2 = &sd_emmc_a; /* SDIO */

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.

Note:
SDIO interrupt support was added in Linux just recently, however other
users of this dts may be affected too.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
Reported-by: Peter Suti <peter.suti@streamunlimited.com>
Tested-by: Peter Suti <peter.suti@streamunlimited.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1a931d5c2..c09eb9f6f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
 		sd_emmc_a: sd@ffe03000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe03000 0x0 0x800>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_A>,
 				 <&clkc CLKID_SD_EMMC_A_CLK0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index a79a35e84..ae1a5a568 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -603,7 +603,7 @@ apb: apb@d0000000 {
 			sd_emmc_a: mmc@70000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x70000 0x0 0x800>;
-				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
