Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CB6C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:40:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5340C21783
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hDpX8dlb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdT8HQ33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5340C21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVihfRjpruvpl9klR8GjKqfnldXi/eqyh3d2fyc0dZM=; b=hDpX8dlb0WEcVf
	bpMzf272BKy+BgZNq9c2Gh4WN5RvSNYc+Ul0qhzCXfnvJrhQRGc/JdEwNo1Ml2V53MAj/4f48DXMY
	dlodvS5hSo3tRatwRle7O6JKw5LaV2VfRDl0CU0K4ky14LYTRCLhUdwQs4hwIwzqeaf7zZOdUaKg0
	cEy8L9bANmT6gzUYrZuBZmz8B7nOOndFuuzdFyUk19aMmg+buXIEjvmtciIx1rUWnBLxw/qGl81vX
	4novGbSWmifoMpH9KkCUuVhdj9u3QtX6SW3SYA2tnfBquVdSyIxMMKKf7fPzogsqQDSoMhvOq0fvG
	vNKsgywG7BBY3KW5nOpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFClb-0002kd-73; Tue, 01 Oct 2019 07:40:15 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFCko-0001p5-5Q; Tue, 01 Oct 2019 07:39:27 +0000
Received: by mail-pf1-x442.google.com with SMTP id y5so7303004pfo.4;
 Tue, 01 Oct 2019 00:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNc5aCo2FNNct4zlj4DcbJphk7+e/9lUuXxqxufNkHM=;
 b=CdT8HQ33dsPzUsXPrl2pUysW+nAUIfYSBw5M/dw2jbw9tTwfuq6w8ox0zRwcNwFPfh
 3NhFDaeIFn2/nMCZePcYXFKQveCrQAmIANCCb7D1qedvb1mdK5fFIh4TYxpK6OkkrvOw
 z74bDX8y0nmtWeAXMs+hT+g7PzWnsX+BEjA083HT1S7d9q/znrbZGixkTnHLhuRWDrUp
 2aJYPGjluhi3+ylADb+R2T7avwkxXhdbuU8rDVvO91rL2VL4mWWcdfW4lbC+258taKey
 vC/fb0cSxX6bTlVjWHEuJi8zgHk/iIeT2IGeqJmR7TQhMPLJj224om5QQhetW9vdfPRO
 u3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNc5aCo2FNNct4zlj4DcbJphk7+e/9lUuXxqxufNkHM=;
 b=iIw9Z0ONwV3kCD8p/mj4XB5mWspvfF0tqNrO+qORWSdQEI2OHynv8PD7eY+40zbtFu
 MA+Zwn10qkH6UHRhs4myegFr8i9ygvuo3Gc772aElnuMH9jMZ51wmMbZFChf/v3WfVpR
 eeLKtrTRYZPWmRqAKE4tDxrB6CRX5XpaPouyEzli1kWvwZq8XW3vrV10Rs0jvtCCIZ5M
 VGVSdpw+g7DKULkU+GXGurYRvGFwv6DS7EqUgWpP/6l3Gxt9oawiPGE26zm6Uf5AkTzH
 Ql6nQm2LHmXu/MnE6CuAS7xbBe8IFXXZfB7rbvP+sQszQJL5z0/tB13oxHrO9FiZkrEH
 b1eQ==
X-Gm-Message-State: APjAAAXuI6mus0w3Y25Ubn7nPSYcUuVopRRUzn4T1WgEldeH0PJCMwkn
 D8ZSfQfwojV5HWd+NlfjSx8=
X-Google-Smtp-Source: APXvYqwgtK/7jldY+PAliS3rvplMP8Emk6WfbG3i1Hz6v+88R0MQjrfRwFI6nYy3omOa+rOI8cd5lA==
X-Received: by 2002:a63:5144:: with SMTP id r4mr5888508pgl.339.1569915564230; 
 Tue, 01 Oct 2019 00:39:24 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.191])
 by smtp.gmail.com with ESMTPSA id g19sm23133024pgm.63.2019.10.01.00.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 00:39:23 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3 RESEND-next 2/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to VDDIO_AO3V3 regulator
Date: Tue,  1 Oct 2019 07:39:00 +0000
Message-Id: <20191001073901.372-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001073901.372-1-linux.amoon@gmail.com>
References: <20191001073901.372-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_003926_211937_FACC24ED 
X-CRM114-Status: GOOD (  11.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
is supplied by VDDIO_AO3V3.

While here, move the comment name with the signal name in the
schematics above the gpio property to make it consistent with other
regulators.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
changes from previous.
Patchv1
- Fix the typo.
- Add the comment as per Martin's suggestion.
- Added Martin's review tags
Patchv2
- Added missing Neil's Reviewed-by tags.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5adecdf3b175..2fcd512373a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -67,17 +67,19 @@
 	};
 
 	tflash_vdd: regulator-tflash_vdd {
-		/*
-		 * signal name from schematics: TFLASH_VDD_EN
-		 */
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
+		/*
+		 * signal name from schematics: TFLASH_VDD_EN
+		 */
 		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/* U16 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	tf_io: gpio-regulator-tf_io {
@@ -95,6 +97,8 @@
 
 		states = <3300000 0>,
 			 <1800000 1>;
+		/* U12/U13 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vcc1v8: regulator-vcc1v8 {
@@ -102,6 +106,9 @@
 		regulator-name = "VCC1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/* U18 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vcc3v3: regulator-vcc3v3 {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
