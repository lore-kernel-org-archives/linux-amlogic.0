Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B7C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6owRKuNR6UUlo453AxEljO5fW+XgImL8b6URqhsLZe4=; b=aHlxcj45XMLNA3
	8Ez2IZoo+esXJp/tsklE8u3trJiO/r1ew5L1WyY460YkqtEVA9B0xD3mKcV7vzbaIeVrQELWvlLgp
	yItT9qD+PYXRf2P3UHRkGy+WMqnmjWUNvihRXb1nCehMZavatqzdXBvS3xjnfE84QeQV6L+jSMCMM
	V640+wpv2mTNf0oS/AqqbdYjQOltIlIeEcSe7JuZEREXnfbefTDuAx4NrEu+v51R4wAO7oXfyu5ZO
	HnRITQaqsa19srXgGOe56TmO1/8CUjkF9Bp7dh3CoTBGuhLJcOJodouRIvcYDn0TbFVcniIiNGzJn
	jz+ShgsigZNXoQxpU6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZc-00Dpk5-Gs; Fri, 27 Jan 2023 10:03:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZG-00DpdN-83; Fri, 27 Jan 2023 10:02:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q5so4513008wrv.0;
        Fri, 27 Jan 2023 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9M27q2IpS/Qgdn1yNsrG13oA6vUzw3FyxyzlhUf80=;
        b=Q7trYkSTlAZXOsRcsKdlmUhZ4OcdIPxi3dKRXSGOGiTkY4l4C/m54LLcxVbmvswsQC
         t7JUNwdTVFnGo+yKKFKArZL3sCJUWS1AzWZQlyn+wvR0180ZW/YNF2/jC5MF2B8F09II
         +sLeAIVSoaKP4fYdurhARzf2YP2CCPawhLdsW01oBH8z1JAe8rMX/t6HOnsrppjCWfPk
         xvf6MuT3PMnGj1LR0DqKidpFKF3mh07In2fSSfbjsLx3WvRsXzRxrvRcPlQtRQcqoPK1
         EB5NJrwBZJSvOx1XRx/PhmU1Ty1bz1WM8AUmQCwZzWSW3weGht6rO/BbAksWPTS+3GJr
         7+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9M27q2IpS/Qgdn1yNsrG13oA6vUzw3FyxyzlhUf80=;
        b=Uiz+M/fYi4ceTqwlHrmNQanmmGo50CbFGjoI5KXDGy6oA0VjuJaRLjLQaTX2rzVPxt
         nbQGzQtuL9T3rIzIOmz16DlXDhBMkDODPt8TbxjotO9D9H/71uoj/8QH9aYM4oE7hr0O
         znvrkgBHl9AyT3YIaruUKQbc52QYmRba5dNlGSwilnu9ESSdajciTWABs3XBHJEU5jXo
         njWmfLTSZAzV/6JjQu/mr7cfE9oZo5KRHhckFyhWKYnrUItGEB86bxnnKtJ12wqziDga
         5Wgn7XRtCfurxkJgcGqEIdUkVBvbIBX4PV3boH00YrfNdV2FF5rm3ZSnFszNMjTxjHn6
         X5OA==
X-Gm-Message-State: AO0yUKVEkeId2CRBqTPOZKkeLaxvfgPhiwKhKjSnxZfhBrI6Bjz8uCd1
	qr7VBkSLD+fIx5GyCO4EjIw=
X-Google-Smtp-Source: AK7set/bea8R4a7pU7mw3gImSMnY5LW+aEE3W1TZxCFJ4/PKThhDxuyEH5F0EavmFGz6uhoskwGlow==
X-Received: by 2002:a5d:4e82:0:b0:2bf:d333:219d with SMTP id e2-20020a5d4e82000000b002bfd333219dmr1510512wru.17.1674813763430;
        Fri, 27 Jan 2023 02:02:43 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm3493858wrr.98.2023.01.27.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:02:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
Date: Fri, 27 Jan 2023 10:02:33 +0000
Message-Id: <20230127100236.3385154-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127100236.3385154-1-christianshewitt@gmail.com>
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020246_302461_931630B7 
X-CRM114-Status: GOOD (  12.32  )
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

For proper warm (re)boot from SD card the BPI-M5 board requires TFLASH_VDD_EN
and VDDIO_C pins to be switched to high impedance mode. This can be achieved
using OPEN_DRAIN instead of ACTIVE_HIGH to leave the GPIO pins in input mode
and retain high state (pin has the pull-up).

This change is inspired by meson-sm1-odroid.dtsi where OPEN_DRAIN has been
used to resolve similar problems with the Odroid C4 board (TF_IO in the C4
dts is the equivalent regulator).

Fixes 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 028220ed45ad..3c1267a7ffef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
