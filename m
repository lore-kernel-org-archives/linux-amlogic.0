Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B703C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCDDA20854
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JrWeMWJU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNvSL3ZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCDDA20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AajiInRB0A8FvOQcpmeF/tfI14fGS20i83Y+xFDNneE=; b=JrWeMWJUDtukqu
	mk40Z/R5zxYszYfQYKJzVb4l3TQHffqxl0Gal5Boir6a/tuROap6afV5ivc3BQDmtuYmkprEfoe8X
	rC+DJygDsxHkwzQG53sDaFe2xpVflOUS0ivEPL31Wu3d1gOoqYn/XYzs5zEm38NeK4gzq+p5ryOCu
	KCXZeqOsouq8t5P7zZuDNpccg9m4EzRw0AiuDC+8YbW0riZ69NYIFSaJF1Ihsb0UYvb4YZTOY73AG
	R1BzPJs4MKTRkAinVy9rIIh19L+ZT85XZnfhPlv3pwn1OqKlTigb0h227wHVvppga9m4saByh/4Gb
	3OrGNgrCGFxRhJu8C7EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6DQr-00024A-Ul; Fri, 06 Sep 2019 12:33:41 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6DQd-0001gz-GZ; Fri, 06 Sep 2019 12:33:28 +0000
Received: by mail-pf1-x441.google.com with SMTP id q21so4362356pfn.11;
 Fri, 06 Sep 2019 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1q69QNZwyCxZwRo3C/LHJfNu0oJxZkgoeKYpJf6LVDA=;
 b=BNvSL3ZAzGJGTokL2No8cyUTNZDT9TLKYOXlxXKNruvFhYssGfuEQ3aLx2wb9tCUCH
 PHEiprtHlcmHALDN+Z2UxkBm6fwd/Sh6O5GfDaLl5t/4UsgQ4UMt6GjfA1NNDYRznHkX
 CxUCbLZfyCDtEOy5GOxF82yE0F6NHMFfkQ3l+8EXYHw+FlQu45TrE+I1LEbID02ILP6k
 xS1Ov+EHQucQadlGMLtKHCwXpmKIFDLCcQvRRfw2G8HnxsRlfioA6uD4gtM+5t1CfA6Q
 tEAJnA4AmoTM6TTOFf6wh1ZdNZvLPPcAkyO4AWut2vrYYZsTKZZrATRqfutNsl8axAxz
 mQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1q69QNZwyCxZwRo3C/LHJfNu0oJxZkgoeKYpJf6LVDA=;
 b=A1u1VRDr0mq85vq2WsWKdV8OuzSh2OWwE9Ps5IB4oVgyTzxAphFF/l35u8S3QO5ZIt
 f9C0E9UyiaThx1V+VF0QauUA4Yh3ox67N7piFyZ3aUQfGmghCt04JtWulZDIoJQi1QdU
 Y+HEusZcrLL355b+CgbmHcGmsTfw1osRuX4RgqoQTDZHx8+XFuVgO52JQvmLikS4KKWN
 UdwMRe7YrhHsr93j9xl7CQaHBNaKtZ8m5VIYR6/6LwG2CgMMBoHQ34g84cjMSGnWx269
 PXNizj5Co7A8Tl6nK/FUTLmIrWu4KdqdvdLXnOyBXJfJ3l54qNsXRgULyzLDdtbiWzb5
 Mj/g==
X-Gm-Message-State: APjAAAXw/fcCQFgsmDqrInra/wmItsPCdqgSsMykuixiKLTmaeh8NlSn
 RPl8HKeO87laH6LKIOGXPMc=
X-Google-Smtp-Source: APXvYqxUij3K9fJKMk7ZoMDBdfQ/kF2Eu75kBlo9YQSPuiiSdwawYEpUrkHNhhBGqKO+v8oRXbr1oQ==
X-Received: by 2002:a65:654d:: with SMTP id a13mr7600875pgw.196.1567773206808; 
 Fri, 06 Sep 2019 05:33:26 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id h70sm4752933pgc.36.2019.09.06.05.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:33:26 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3-next 2/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to VDDIO_AO3V3 regulator
Date: Fri,  6 Sep 2019 12:32:58 +0000
Message-Id: <20190906123259.351-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906123259.351-1-linux.amoon@gmail.com>
References: <20190906123259.351-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_053327_576143_8FF86165 
X-CRM114-Status: GOOD (  11.82  )
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
index 9ea336c33d00..5624ff034659 100644
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
