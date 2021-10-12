Return-Path: <SRS0=tINo=PA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C594C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15E961040
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E15E961040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXq28ukodPHZD5mUulEYu5YPTzGll+650in3MRSp67Q=; b=BRh5fr83M8Hl4Z
	+pw3hLXJTAq3hNuqtLf9PDr2Edb2E1hhivgraOaTbY37qDI1n47T2/ZME02NNKuwRC6bn+a9wvknY
	sVTWC8pi9ViGWd/GcN4NjY4I6x6d7TWKbGx13RjesMFdQoqVibSMuH4b9iZEHH/Pmnn9hm2Wxpmuh
	CJS5DD0n0bl10OFKrf9JqcSERCChfk4/utDAa9pIDphbPsuCnzk5YgxsQrJjaY+P1Z8Jgi8yW+l3x
	tiHaUtxCkbHfJ3o4hmyIFDrrwX92qzkPxOxlvxOuSv860jSdtsPnmDmbvFM1zeMJk2bsfWl2Y86tb
	j+m5aQBA7KLQ8tMFPuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAIp-00BbiO-Fg; Tue, 12 Oct 2021 05:26:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAIA-00BbZG-46; Tue, 12 Oct 2021 05:25:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id g8so76305660edt.7;
 Mon, 11 Oct 2021 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tl9ETMRggwTt4w1BJuvSOqa6Sje5OfaoWtxCYX0xMYM=;
 b=iP+o4z4l+t1ja+iu363orMJJ7zwyAd2jhBzfzgx004tVQ6Q5dnXfO3Eu9zfor8ImbT
 nAE4MJcarP0hZelY6wDGVRvNPWo2oDwY8+antfp65W1ftS7baKH0ZYv9dqbuXs4Od1aK
 7eUT591gjiwnJ4LqCx7XOnvbe/L2bMikzCjo/PGUXtsRHvWiva9HvDkjXZ8b2V9o5fm1
 3CGVe5Ph+EBZPRSw9X9R/8922OFZeXrxolBjAncXBBDO4mWapuRcmDuXu33+QV8QP0qu
 cKxj2hxXBs13HVDEItHxwatMtODCB4Wm8uzsEQL48K1w217AL8PGHlFVbGdOizs2Q3S4
 WTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tl9ETMRggwTt4w1BJuvSOqa6Sje5OfaoWtxCYX0xMYM=;
 b=jNzLVboxwnWe2hoxK4EfAFNFqsslPUDDTF9kIBFRbYU7a14L/D3sAtaphwBMJBZrV/
 PXD/7oIDlbwmQwlaPFxa+FD9e0rEyBn1EwVLMr3uaukbgHQYOc8bhlGjpJFQ946UW89M
 pajPsn/lGtDLKWF54/MbWsaGREcOx59eWtuJegFLWB0u7hvYaJjXTIzPCmRGfu6KERQn
 0ISLLrESV//nTGjNpx6aU/9IT6b1DR6RNDAQgIFVo21XZIQj6u8zwroCpyqE+1iCS/2+
 IKmMizSLLiogdLwCwk/qijGefkbWvE/rLtSxpgbEBTJzf1tSbaBCXbBg+yi7zaaEVwPA
 URfQ==
X-Gm-Message-State: AOAM532UnPOLO2yPasSSrGZWA6JAT040kw5hcRWi8LMuhreJuoqcujFI
 3UH5JYVpptKcFw6gitcH1KM=
X-Google-Smtp-Source: ABdhPJxcaUjKbcxZ4kYoGoH/sohed8/AYst/1v6n91ZXxoR2Z7hPP48dUNM3cuYKYRfXZkRhp1CXgw==
X-Received: by 2002:a17:907:3f27:: with SMTP id
 hq39mr29317304ejc.352.1634016332664; 
 Mon, 11 Oct 2021 22:25:32 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r22sm4323321ejd.109.2021.10.11.22.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:25:32 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 3/3] arm64: dts: meson-gxbb-wetek: use updated LED bindings
Date: Tue, 12 Oct 2021 05:25:22 +0000
Message-Id: <20211012052522.30873-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012052522.30873-1-christianshewitt@gmail.com>
References: <20211012052522.30873-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_222534_187383_807CAB45 
X-CRM114-Status: GOOD (  13.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the dts to use the newer style of LED bindings.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index a4d34398da35..94dafb955301 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -7,6 +7,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	aliases {
@@ -26,8 +27,10 @@
 	leds {
 		compatible = "gpio-leds";
 
-		led-system {
-			label = "wetek-play:system-status";
+		led-power {
+			/* red in suspend or power-off */
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_POWER;
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 			panic-indicator;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
