Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4E2C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC6220815
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECaiVVxy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HQy04UfW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC6220815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Tn3+7SGYptDyJCyoTLZkjBTfxCCE4fTLmhtLfAYC0c=; b=ECaiVVxyZKr0xR
	LWSOjyGmoAo9GXRoamtEhNFZVdfq9S+2mVlF0K1++nT5t2RHJ6Z1GZhpLHSgn3INxaT9qq5k/nXa6
	p3dwQ5ZDOXxXE+RFPIQB1qn4cYAbjvLagFzHCJhVgXvyDYSP5ohOtOoqcf1c5o6x2qmqTUWeQS9RH
	h9mVLKgAXB+61mrXx47CIslIczAxYcfAm71sQMNSwcAx3LVATBrFoX6u5CIlVv7Ip5aM1/lUFFVZ6
	9jHT3sIdhDj+0Xh/gfePN9IsFBlQfBsN9YvDitFzHQJHF0yfio4QBEIH44oexFEVYXaimu6EziE9F
	YnnW9Ht1RZyZlQU10oHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVF5n-0006Cp-KY; Mon, 27 May 2019 12:51:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVF5j-0006C4-AQ
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:51:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id v22so8486412wml.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTM6dI5akQRWyNgshoI8vJ70uGaHk1NWByvSbK/496E=;
 b=HQy04UfWNW9dML5RFNiHSPiHWbiHch9VJA0/kr8ZsG5AJy4HW3qHLodnmxMOIWWWAM
 vkrZYEN/RVRTBumIpSbSXbRVMsqD0j0nzWNVa5JPu4cZbCECd2D5ZQ17PvS+f3+V6v/K
 0UwVysKMNwcaD+/4Q1OIOuElhaKFklzIIY9+29kp9HwvV8EI1FOQKSbdcfRpslJCW/+R
 1K5ihrCWppU6/L829dra29fnIKGhI+eXSBtLJsZYwtkLvonbTSjNLWLzuCLh4ncKIndh
 QDwmp3e4LykgL5uBnpaQ9xuDvQVqBQKrXsSYGNBNbxRe3omLNMKeGnmRsmVEiLJYquyR
 lhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTM6dI5akQRWyNgshoI8vJ70uGaHk1NWByvSbK/496E=;
 b=d//fgjVDTAF+eS1lwt71VFL+nnxV7fJdSFEYtXSi6nH7SuiFuDD0d2DuyI3Dg8m7O0
 0p082+3UgMPt/Msr4qFLh/+xN16P7WeaipHuzK+fSrcdpwfX9yawFLEMikUg5VUaeu9A
 1660sSEBFXj0CAp3O7LD2oIi8zHDjOzz+tu3Cu7JMyN8Uen2/cIN6NAz7jSk4o1B/QU6
 lLE9DsehK6LwnwZtEB2z5pBfoJhlb4RXd537Fu3t4FfQeaRMZKp+ehwMdAJShe89HEZi
 kAixjI9dwxeawRq567Em2nV4IMkUW4nMx3OsQwpwhCUySrjTrj86I78eFIH7wDLwinas
 xvMw==
X-Gm-Message-State: APjAAAU7ozZgyewxBQOBhQN9cO7Ccp8ghIfpdmtXm4qj6VTlJ1vNRcWI
 197SYflwAThmNPubbZvezGwFLg==
X-Google-Smtp-Source: APXvYqxiQ+nNr1phuOgLrd40qhnD2k4Qu4xZOHnd9BuI8akHep+S8GBmuTUWpWihkDwWS3NEQtK/2w==
X-Received: by 2002:a1c:1bc5:: with SMTP id b188mr9381743wmb.174.1558961461729; 
 Mon, 27 May 2019 05:51:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g127sm8911462wme.21.2019.05.27.05.51.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 05:51:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2] arm64: dts: meson: g12a: Add hwrng node
Date: Mon, 27 May 2019 14:50:59 +0200
Message-Id: <20190527125059.32010-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_055103_358056_1A2F595B 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A has the hwrng module at the end of an unknown
"EFUSE" bus.

The hwrng is not enabled on the vendor G12A DTs, but is enabled on
next generation SM1 SoC family sharing the exact same memory mapping.

Let's add the "EFUSE" bus and the hwrng node.

This hwrng has been checked with the rng-tools rngtest FIPS tool :
rngtest: starting FIPS tests...
rngtest: bits received from input: 1630240032
rngtest: FIPS 140-2 successes: 81436
rngtest: FIPS 140-2 failures: 76
rngtest: FIPS 140-2(2001-10-10) Monobit: 10
rngtest: FIPS 140-2(2001-10-10) Poker: 6
rngtest: FIPS 140-2(2001-10-10) Runs: 26
rngtest: FIPS 140-2(2001-10-10) Long run: 34
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=3.784; avg=5687.521; max=19073.486)Mibits/s
rngtest: FIPS tests speed: (min=47.684; avg=52.348; max=52.835)Mibits/s
rngtest: Program run time: 30000987 microseconds

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- fixes efuse bus size to 2000
- add @218 suffix to rng node name

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index cbd05e537cd2..881d0f9a2112 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -197,6 +197,19 @@
 				};
 			};
 
+			apb_efuse: bus@30000 {
+				compatible = "simple-bus";
+				reg = <0x0 0x30000 0x0 0x2000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x30000 0x0 0x2000>;
+
+				hwrng: rng@218 {
+					compatible = "amlogic,meson-rng";
+					reg = <0x0 0x218 0x0 0x4>;
+				};
+			};
+
 			periphs: bus@34400 {
 				compatible = "simple-bus";
 				reg = <0x0 0x34400 0x0 0x400>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
