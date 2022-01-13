Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7682EC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 04:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHBIgbMT0MGk2fwBtjgUDiGlZU7LiuGR9BBKnYWUZeA=; b=J2Mgc3hlzE7HSU
	aOvHKxRKXX338UZPddU0h7MdTzNUu8ngapoBb0VafKmByuUNitYA5DixXl+WHxm4Y4xHr+DjZvUHC
	ePRhouzeQYScv7rRv5+sI3nyva2DmtfF2myVm3LPQPPjhVVm6BBjEP/fsii8qLRjudPxe+V79lvLf
	ISO5LYlwjBY108XkgehyZF/heqXEkUBD/1X1/DkKT7J3rIJbGmgAfb62MLkjCR0TF0vHwaABCWo/v
	qrxEqOOLpgXPXE0EzvIL3YzJE01Eml2d/lDa3MGVWqMe+GKfPeRW+0sx+0DU4MqEMzBzOiZpxk5fT
	RKEzelCNWYWPREVy6AOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7rhN-004aN8-NH; Thu, 13 Jan 2022 04:26:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7rYk-004WqP-Hv; Thu, 13 Jan 2022 04:18:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id b13so18498310edn.0;
 Wed, 12 Jan 2022 20:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=77eABsbCU3dP1bKLZ3G94phln3owatljgGCcc6O8QoU=;
 b=ZVbhEzdH3jiYjDcsZqLq7E3IHGPYUd9KOeRnSnWzPr9awuxeQfhmqb5v5aISHeXEVs
 HMbj49kclfWx/i5Anoxswd9OVzGWQHqnqPAL5j1cq/ZHAN99q6KRgMPZuZ72ViV5r06F
 XnFP+iiDkOedTsXX3NrzreLfhZdH/zXiQtVXRrUG0jdL8+kJPDPDn3DNQe3Wz85t3ym4
 fAuZDrsecz3ertQP+mNBeGZa/kdS/OjpHy6ihXA8vQa0lYdyAS/H3dkVBzbvOATUgmzX
 znZoYN0yBuU1VCchMBz9qUIGzGL2n3SvBsaa98uO7cx11DyNMxDJ/9GK4sqi0GW+APRd
 878g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=77eABsbCU3dP1bKLZ3G94phln3owatljgGCcc6O8QoU=;
 b=dvkwsC3EfuU2ptawMZwmxmgThdYcXjvsfG3ve0EwBB5gKXOCB2nMEu9ymSCyiiDG4/
 9xISxZHEIAJTAAMKm2ARL8gq5Pps2qXNikNbrFVXRAjYEG80pm+vtRieHSTDr+8D6Mm0
 OwDnO9Ku2yx9uiPoxmYRj1X096xqOdFybJ4cocwxmerbnzXCavWQPMwyhyeID1Ety3hP
 V5p9BHRZz0dZMBPRcs73ZxBn3+FWQnxR5CZIUAgGX4ETWVZUG9PNDWZnObfjdMJlZwC3
 mZtJhgSpjTzebCUzdg4DGCeum3iBcgJJnKVNcUoiv/LTQDLyr2pNGPszd6lJCeFdPVq2
 63Ig==
X-Gm-Message-State: AOAM530xEOk7PnTXIMpt6N9dw1Iv9HZmRJEd1cJezQ7WWce9F96VB5yc
 JBZ8Io5sSwZUh2vfh17vvUE=
X-Google-Smtp-Source: ABdhPJxxqqxrczJGaeFkFoP2CvjQ6KUb+AYG/R0qYf0sCbOQG6VHmmkkIBWefBG63r0tI4h6hBrlXw==
X-Received: by 2002:a17:907:9810:: with SMTP id
 ji16mr2187826ejc.202.1642047476657; 
 Wed, 12 Jan 2022 20:17:56 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id eb14sm651822edb.16.2022.01.12.20.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:17:56 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 3/3] arm64: dts: meson: remove Broadcom WiFi/BT nodes from
 Khadas VIM1
Date: Thu, 13 Jan 2022 04:17:46 +0000
Message-Id: <20220113041746.16040-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113041746.16040-1-christianshewitt@gmail.com>
References: <20220113041746.16040-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_201758_674202_5AAED36D 
X-CRM114-Status: GOOD (  10.31  )
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

The Broadcom WiFi/BT SDIO nodes are now inherited from the P212 common dtsi
so we can remove them from the VIM1 board dts.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 6ab1cc125b96..108232a5aa2e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -217,25 +217,6 @@
 	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
 };
 
-&sd_emmc_a {
-	max-frequency = <100000000>;
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
-&uart_A {
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
-		max-speed = <2000000>;
-		clocks = <&wifi32k>;
-		clock-names = "lpo";
-	};
-};
-
 /* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */
 &uart_AO {
 	status = "okay";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
