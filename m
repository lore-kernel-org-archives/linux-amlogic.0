Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD43C61D9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztRjlwk9ZEEOF7hZAMncNKYS56AIRuAGxTTKFOK/KB4=; b=FkFQmH9e0sV0WK
	M5jhmG6dwqi7N/Oi5HAa8immnmCIypOUHJpxzUUv88vzcEOvBfz3OZdkmOuL0qzCHxJyfwbHPzl1k
	zHjeTe/qVU0EpAYQYisU75rFOD+J4tXjQVgkR5FVBdvaTn4+j0IQnasBXpE/Zry0REpb+EOFOxfqZ
	52ohnY5gYLl/JFVX93zGqaP8CGRIht27ftnhokkHIgh43K+8gPQ0yMfbzW/GGNeOKMfykgscsYxuR
	JSkMvyoOUJ9K0h2fB5ocnZp5HE5+joZzqoLrnLAXtApLyjsjsXWrdIOsxa2sK/f82r7Zk0+Zoiksm
	/1lTUBVmnVLgewREdIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rto-002oZ6-0s;
	Wed, 22 Nov 2023 18:24:32 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rtl-002oW0-2Q;
	Wed, 22 Nov 2023 18:24:31 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-28039ee1587so85185a91.2;
        Wed, 22 Nov 2023 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677468; x=1701282268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=JV0M3qy63yfpUP8yAbEFUcRjlrO2X4Z8Iq/gOtUuB8eShPlcgEw9WJHC7SOfEdwHGa
         cPawSKMe6lb1rE3UH2tT2nagC6q5NPoWU3WyxGapa/HYSpA8FqFKZrF5cNTXWPBmOkUD
         aWjwf2lFVtZtaDks53U8moK4MUjKq6w34YCNj0uBJfza9rCOqlMQwqiWA3QR/ye1iYxu
         WJncFc9pDZU9NEDC56hrcJbXJt4GFp1wV62s/Ao9UM89Jqloh4mROrYi2pdbgwQfjcPF
         NM6PN1wH1EMe5lAnWWaxLfyY60GlQ/hAMnPYBsWI6Np7VFqvYn2L+dDvah8sHj9mHUDL
         SOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677468; x=1701282268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=hhCZG8YIGB+fn77/q6RT+NAqGAtSN9ZxgmKCyfZhdBwG+Nm4k8IUihWNJgktvhhX1A
         jEGBfXVpOdObZ84IM6cYULkbU4ZR2Nci/HCUyUWJOwob1KXo6yrcKqLsvugn68WucgD7
         PYBv6G52JGvDp9aAKKW72oulKrZLdNbuOtD/p13PXguNfAxnXJE5uZJCox2jLqVqqBl8
         afrfBtGmJmPct9mBCWngaSAOfztYx2Mrx9lT9sgzixzEn5PRJOmCwhjBWrt3FIarTbpz
         LYv/73OTz7TRNMRdYFdGb+jnMYSJ8QFrJFsCkKJw1YwW2ixUPXqlKgxb+AEXkBqLk3L0
         Nvwg==
X-Gm-Message-State: AOJu0YyfEblhSfqlpq2uJpCrO2fV8jKhZ53XUeShJHowjHa/x99fleZ2
	JJXwbHx79Zc6WHjQ4bRnpfg=
X-Google-Smtp-Source: AGHT+IGS5KHFHXp/nc7YRlM8IKWltPPLo1UGYoMF2bslfzaQEcSItYt8gU4/7NQrm6qWPl4N2oI9Jg==
X-Received: by 2002:a17:90b:4d0e:b0:27f:f7e9:cad9 with SMTP id mw14-20020a17090b4d0e00b0027ff7e9cad9mr3347137pjb.36.1700677468567;
        Wed, 22 Nov 2023 10:24:28 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001cf6783fd41sm4897980plb.17.2023.11.22.10.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:28 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Wed, 22 Nov 2023 23:53:47 +0530
Message-ID: <20231122182351.63214-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122182351.63214-1-linux.amoon@gmail.com>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102429_800222_7432E504 
X-CRM114-Status: GOOD (  16.39  )
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

On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 91c9769fda20..9e671444eca6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
 		enable-active-high;
 	};
 
+	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
+	usb-hub {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 2.0 hub on port 1 */
+		hub_2_0: hub@1 {
+			compatible = "usb5e3,610";
+			reg = <1>;
+			peer-hub = <&hub_3_0>;
+			vdd-supply = <&usb_pwr_en>;
+		};
+
+		/* 3.0 hub on port 4 */
+		hub_3_0: hub@2 {
+			compatible = "usb5e3,620";
+			reg = <2>;
+			peer-hub = <&hub_2_0>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_5v>;
+		};
+	};
+
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "ODROID-N2";
@@ -234,18 +258,6 @@ &gpio {
 		"PIN_3",  /* GPIOX_17 */
 		"PIN_5",  /* GPIOX_18 */
 		"PIN_36"; /* GPIOX_19 */
-	/*
-	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub-hog {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &i2c3 {
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
