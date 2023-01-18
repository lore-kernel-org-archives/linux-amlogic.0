Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE3C004D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA34UaVSPgKuFQxC267F81ZK4ocb4eUMUCEMC+Bvnvo=; b=axROdd0mPZnQE+
	bkux+ZpO3pPxk49fpHHSFjrOOIcsXbu+esSM6Ig4AhqCe6hkMmPZgcbHUT9fgEnKSm5SbE5bBkIF+
	kokC7SmzjlBt/FQrdWK7ovz8UoLY9l4d4BGbLIH6NxPw1Dvt5WXgjqqMTAOGo2cbucLRPBP8SqghI
	J7ylyc1KWDoPLWTg/pRmiJHgvXDugb+xW1954RJEN8GP6UWyslB4wNxYBdjiFevNUMt+9P8ozOhTi
	liweZWGSeRST8xQcIyoxQFkQuGwGK1S9zlMmBkAViA/a763ZCvDma9R6PfVs+xltkRe2Q7/DZg5rx
	zFUkJuZI4NqIYMJiK8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0KA-00GtCG-9m; Wed, 18 Jan 2023 04:45:22 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0K7-00GtAK-Fu; Wed, 18 Jan 2023 04:45:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 200so19082800pfx.7;
        Tue, 17 Jan 2023 20:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqdFnWHjWAHKmuM+PoO/HnCy2n74on+Ymq3rYfqeAJE=;
        b=DlSEsi0KQ9JhYv/iu2q45d2JfoC8+2CKC7ECut2BUh35plePrVMWf4mebvkknGUrr5
         2pSFeKYmW65ZfjxlunY/SaR/XzEVnZNUk2w6uKzOJ0jRyNuERB5VAjFCiKHDKgoMFB6M
         duxipMvK5ckycVBRkseYba+l6G6zF5o8fcW9qqf8/0JKtBgK+T3Mx0toVEr+TcLg68zt
         tSx6hUgrL7MUPOQrBGjTmT4iM7gB4MDM/9VSsi9rOsHrz/WhgYHS2b9383b9mtHvJn4W
         4MBT8Jcou5EwffrVcWfbev08iHwYTuOL+qc9fV6ggSZNK83+TvGTHWz055RIGcoYCTWd
         wdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqdFnWHjWAHKmuM+PoO/HnCy2n74on+Ymq3rYfqeAJE=;
        b=BGfVYQmFpMUtCPdEgm8q8HfcGeEdCOXohjwgFCMMfrNP7BhC4/Z9sIF3p19RSH8tNR
         TmdYeYIjmDPe10fw8eXd6I3B3piGK0DoOJbeoyFZ7E+iTs6fJmMRpDx2lu8qtAeFAWrz
         +obu96Rz1E3fy9g110QadgXD0FulMxwmZBTCKPtp/9efmhHWOvcgwfC6wg7bmqpoKE1g
         B09YfBGA824kmGPj6rWhfS65KHnrrSRdDSCq4S5PqfbNM5vmb3J8hxc+rZFDtPS2pwZv
         8yTZjC/B31Qbj3MCs6kTCeD9cJWKQQs3mg0qmaCAs57zsx61U7npmhv3QpJiqImINaLz
         23bw==
X-Gm-Message-State: AFqh2kplelIiaoH2ZCEQYIIFuSGPk65SRCYK3URY+Tm+ZnJEiqSV4jfz
	Kswo8MWazt221oofBv9Fvg0fFnNJqVE=
X-Google-Smtp-Source: AMrXdXtUrZUrsaXEJ5PzpdHxzrcEgNit66ihCfMbac6SbFmNzLQthDYWpPzyAEQzHKJ0m6Ih7ikKqg==
X-Received: by 2002:a05:6a00:2354:b0:580:cf1a:f2b5 with SMTP id j20-20020a056a00235400b00580cf1af2b5mr8704552pfj.12.1674017118519;
        Tue, 17 Jan 2023 20:45:18 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:45:17 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: amlogic: Used onboard usb hub reset on odroid c4
Date: Wed, 18 Jan 2023 04:44:15 +0000
Message-Id: <20230118044418.875-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204519_556443_C85C3F35 
X-CRM114-Status: GOOD (  16.94  )
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

USB hub is combination of USB 2.0 and USB 3.0 root hub so
use peer-hub node to link then.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: - fix the compatible string.
    - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++++++++-------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 8c30ce63686e..d04768a66bfe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -26,20 +26,30 @@ led-blue {
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
+	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
+	usb-hub {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 2.0 hub on port 1 */
+		hub_2_0: hub@1 {
+			compatible = "usb2109,2817";
+			reg = <1>;
+			peer-hub = <&hub_3_0>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_5v>;
+		};
+
+		/* 3.1 hub on port 4 */
+		hub_3_0: hub@2 {
+			compatible = "usb2109,817";
+			reg = <2>;
+			peer-hub = <&hub_2_0>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_5v>;
+		};
 	};
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
