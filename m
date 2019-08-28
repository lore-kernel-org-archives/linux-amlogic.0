Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5E1C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A1620856
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ruAMGHaj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxXRp+dc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98A1620856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3vTJIfM6a/pixsLBKlJiE4OQWKz21KhgzTceeDj4Y4=; b=ruAMGHajUWeU5i
	gvrHpxgpTutPBAcOP+0/RNU8Xmw8ed1a/SBIjd50uXOdsOp6X8bSEdKDFwQbKpnxdAel+oxFNYfPo
	PGtYVboG2fFhDhr0/QHospDU/bmljBIUcO7qSjGagqeQ5fAC41Nlm5oHdocBlCQv0hlyowJhbGfic
	3TDZTRWU245IWbMkYPeYjU2X0fqoAKPJej0MG2XmH6g5lut5PoniNFtW6fCzui4Nh+uT97V5xqaVU
	Qvau6i2rcnOaM4VBXTZkZty/A5/Jsl7+c86KCDYrY1uAbzMFvG3FvcwUJQkKbNvj77hv/p1/zRwGX
	Rup1j3DOiC7BPLMN2sjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i34YL-0001CU-Rh; Wed, 28 Aug 2019 20:28:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i34Xd-0000Rk-V0; Wed, 28 Aug 2019 20:27:43 +0000
Received: by mail-pf1-x444.google.com with SMTP id w2so518621pfi.3;
 Wed, 28 Aug 2019 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3TaHXh40u3n0F6bWhwXE55sOEX1gdGCs8//Mjl/cgg=;
 b=pxXRp+dcAPOvuhrpBRPj5rojusM/4Vly9II1NcRAZGMd7ZusoIKA+YW6WSJQxQBcoF
 uAKGIOYaR8sm7NuchZcMQfS9fJGG0Qne5p2jRa1oZRpTSLu/BzMWQeLfBusjDeZYu9Cw
 3AYd5oZ3K4sy/FIqt1RpvROQ547qCJbZ9kIa1WwQIj82hGsg1dw6u3hscx6SqrWeKKuf
 Gw5+fQMtg3RshRohp4Aq5Gc2MySfbU0TdjUf6nZyalzleND/LJAXg0thhg/3bGVCK6Uc
 2hRBMlZtBc+6HxqiIf/xXfAZNOy3334VN5VL9joc+W3hz5p9VfFGO9VMTY7mNI2Dhb3Z
 C62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3TaHXh40u3n0F6bWhwXE55sOEX1gdGCs8//Mjl/cgg=;
 b=KlMiaRweONl+exSc9hvxN3eUl2nlvCVZLd/ABefvi+YLW0G+mwbS2X+6Y28jpk2uFc
 R63Khgcb20xSQMsQU0qQuReA4ZnnkzTn+rrSusK2rpw5IzHyoQWYpD3C5mhFIpCQ+H3T
 VId4Y4h77THFGsf9STdqa7tPxHXjf0Z3uZ4XVE2Nl7gEcRCZyXG0prLuaxpcegt2doXB
 zw9V/SvjUFvFYTALLh9Oso6ljN/JghqoRCzrpYSGHyejPvJkq3vHnGdBb83dGjD+1oPs
 0VW5hbdWN+Ty0C2o1QucPVW7VUakdnkq0c2RzFXhKes9fD6urZtQdBd27erXtkcQk2jL
 eWNw==
X-Gm-Message-State: APjAAAV+wIX2x92GHfgvDT20lU8WnnnlZVjmd2C3IuPtL1lcKuT3Fc5v
 cnA5/gxPqPgD/0uAdCHFi8E=
X-Google-Smtp-Source: APXvYqwqw9qfMbfRLhRue8n6CaEGwwbgj25iyHQoNwY/e/7uyTMd0ancltVyPHK2aj7xm/j3Lbz0zg==
X-Received: by 2002:a17:90a:5d98:: with SMTP id
 t24mr6082984pji.94.1567024061115; 
 Wed, 28 Aug 2019 13:27:41 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id g2sm253373pfq.88.2019.08.28.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 13:27:40 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv1 2/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to VDDIO_AO3V3 regulator
Date: Wed, 28 Aug 2019 20:27:22 +0000
Message-Id: <20190828202723.1145-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_132742_003109_3CE95116 
X-CRM114-Status: GOOD (  11.32  )
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

As per shematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
is supplied by VDDIO_AO3V3.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 98e742bf44c1..a078a1ee5004 100644
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
 
 		states = <3300000 0
 			  1800000 1>;
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
 
 	vddio_ao1v8: regulator-vddio-ao1v8 {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
