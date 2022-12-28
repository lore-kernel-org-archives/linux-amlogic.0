Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0266CC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CSLSfypKzVidmfFSbpoS6MQ36OjTxSN5la08d2YRtc=; b=nWTLWIx4m/rix4
	ti21OpSBzVCd4tlW4ejP/6WfidJDmZPnQ7PGOwtitBpLvVvcdcckCO0tpbOjOtLd4U13TQp+zG8rZ
	GopSjsXIzN9MQBJNYW9VGujCKGuoqFTUBerB8b4gMI1fX22CsjYi4yMIZySy5yqniD6Dg3m6AOrph
	d8Bkk3kJGR+eitUQTHQe6Lt+cR2ZZa/NAjZuCth2VeY/e8AaJSAtirEbacly88lA7yVZyvQffcxkx
	Wic/T6dBKCs3w286e5zGGDpE8/Oz7a7/zypPxxeRaom6KAJ6prhzBQQcJG4EmHWXGd9QETOP9RLKf
	9uRfERPN/bWVf92Clsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATKP-003w79-Sf; Wed, 28 Dec 2022 10:06:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJu-003vjs-Nr; Wed, 28 Dec 2022 10:06:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id gv5-20020a17090b11c500b00223f01c73c3so16093270pjb.0;
        Wed, 28 Dec 2022 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPZOgVkNc1yONsD0VkYpHu5bVHn1CQCfORwR9EnOA3I=;
        b=WjJcMPv9WalAK0UfWzbf+FjC74rXkGd7zvR9C+aauyHcIUTg83ET0NPPfhMZ2z+bYW
         muU0+EZj4G5cJOZuc7K84cMNEGAJxKspOO7twzr1AJHxo1mskprstHGbvkkObJONslmZ
         dEyRT1Siz2dReg/3YiG0TipWKLhGeM9Qf206dwta6gxJ5EwkVOEqkVg1uRTsHUGlgrZi
         cFOGDQclToPnRRSsgksYCO4vn5L0Ax4N4IyPqS69WCwGil61sFaT5dZ3HHm7pWVYqld0
         PqXYr9FGk0P2mxr1fiz4XbNEnnyxOvx4JATu0LIgByrCiBR4tR5/Dz0obxOaJ4fh/Xyk
         2nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPZOgVkNc1yONsD0VkYpHu5bVHn1CQCfORwR9EnOA3I=;
        b=C6nH0KZvmNbyLUBwcLtLfMGImmIznbnbjgDW3FBA1dhUum6uYLTWJYllsESJVDbedv
         a0KpfFp93qpWMzx/7jnYV9b8kCLMyfARei11zzDK+FAHQF3azE75G2uw+X7QBtUuH0tv
         R/ikU6s113q6fE8bcOHhBbbS5U59ygH62ULB8HGKhim5OHTiTruJzQD1b6a3gNbLcoXn
         plV5+imiSbMtkjD0LBIhjHcy7idErG8zj5U3dICU7y54eaTLEDO1sXgrfpuD98E9ErdX
         LMBqZRmBxcHp2gqiCyJyZIJJqzH45qinGYbiGnz9y7xUQ7jcEA5mR+N6x3LeuroH5XZv
         /3yg==
X-Gm-Message-State: AFqh2krP/Sf8Is1eZ+hk2MXXIg16dHDGzB+uqWvdDmcLVTRMrkMCpb3q
	BjLyOkMARFSDIlVh5I/9M2o=
X-Google-Smtp-Source: AMrXdXvcf7QSIOwii5DQEnsuWcE70e8b9d+bU3dcARNCyDmO7VCBPvY6T7Y5zfT27y2z9/w3aruFeA==
X-Received: by 2002:a05:6a20:a687:b0:af:7cf6:1d4b with SMTP id ba7-20020a056a20a68700b000af7cf61d4bmr32717637pzb.23.1672221957637;
        Wed, 28 Dec 2022 02:05:57 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:57 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/11] arm64: dts: meson-sm1-odroid-c4: Used onboard usb hub reset on odroid c4
Date: Wed, 28 Dec 2022 10:03:18 +0000
Message-Id: <20221228100321.15949-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020558_964932_9A7EBE6D 
X-CRM114-Status: GOOD (  14.32  )
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

On Odroid c4 previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 8c30ce63686e..9b8230d6a9da 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -26,20 +26,19 @@ led-blue {
 	sound {
 		model = "ODROID-C4";
 	};
-};
 
-&gpio {
-	/*
-	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	hog-0 {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
+	usb {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub: hub@1 {
+			/* Via lab VL817-Q7 usb hub */
+			compatible = "vialab,usb2109";
+			reg = <1>;
+			vdd-supply = <&usb_pwr_en>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
