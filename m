Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1646C11F68
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 12:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87CDD613E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 12:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87CDD613E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTpOfNQr7lc8iPMwZHoHV/k8BmT/zhh2LIV4xp0/QdU=; b=NQHL0EyQy6BZyP
	8d+S4Gn0MP4bIA2YbGWVGOnADB+Isf42+nuO5tRs9p+++cimNkrBUFF86DNs9uqE5VLafrTGBGyQS
	GlS4+RhW5/pv9QNGpD+31UxOfO3oyMSKy3NI8hHzxmiaNfzHEnvOoNvoj5mi7LIxgdjd1wA0yG+F5
	Pbg3ej1CzwPn7qcaNcgQam8nQpca0guka/7zfNzF/bh1JMl8Jpe4qrSPcgYZqDqkLDpy54rdQfPjz
	MA5quz/inVRXIlS0Y5zZKvJ5u7G1Gf/nHvDH0shtwqBgnuRvM6lJPyaH6vi3zxDXuDk25uDGxx1pe
	2gsFJ3Noz3Ha/7Ifdwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyCiQ-00AnlX-5h; Tue, 29 Jun 2021 12:19:46 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyCiD-00AnjX-61; Tue, 29 Jun 2021 12:19:34 +0000
Received: by mail-pg1-x529.google.com with SMTP id u14so11857904pga.11;
 Tue, 29 Jun 2021 05:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbbWX3kzjiR8qd3C6tMA1iMcCJEbQrwW1wisqFEE6eo=;
 b=CiwrAGbBBkL09wtznxor+hUawt4GMD+TAkpbAhW9CEWWlP9Ru2jLMxVNUPAvfBChCv
 rYDOPDhCo5wSXqKraUIZLSKSglwd8WEurGvSpIHkP/spzMrtsm0GSPE23P/TonQ52Z/4
 qNZCTzkIVPBTyj6O1mcJbB/0Xc47w00n4H/53wgV+SvHjINdH21anWu7snAwjeS0qHWX
 +UcZJEMaUyEKk3pnGwX8HPnFCJAR5kr9tiLGEFRs+qOKTfPhr7SS8mgmHrSdNaZN7kBV
 ZBGFIzQ3efamjm7nk8QP2gCZ3TXsb8T02S/1pdavlqdD5w+S4Q2iwN4ABMIKqHOIcNUs
 c4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbbWX3kzjiR8qd3C6tMA1iMcCJEbQrwW1wisqFEE6eo=;
 b=h5mJjQ0Z8HnWPVDRoFKnxRFTdfsNoJHzifEX6EMWPepodc0+Aj9S1Kc77BCUiMiRvw
 eUFmZ91roYkPhiwuCUIOSipLs9nRKDNqdBo5p90naXl7C2xGKPJ4YVh+gyDho1UMabjq
 Di63zX0qlVweyIRdBKEnMdBntOSxksFp4Ddo+wuBzA0PWAucgEylHdY7Au0ly/0dbAwn
 xpHVcCHggLAJVEbZBLoqck+47XRORmg0cMpCPHnbeY/F9DQtqLyZSNX9e9gQbxBI4lRu
 MG/gPAZpbmXa+/EAWrKHEljn42y/9DW91Iqmh3rQeUkpqAWMzqioAOS4aCEbHrYZHldj
 kzLA==
X-Gm-Message-State: AOAM532E9Z2PQccUp4fpobMXlxOfRCYltmdgwDv2m91AY9MVrzjjtOQs
 6xgmzxO4XxP5umjMgIMa5lchObNWq3E=
X-Google-Smtp-Source: ABdhPJwgEWD9yoqfctTRjncqD3b1L4F/TJFDXJAVBNMjtgkexqbPnBFFhHtf1MWe8URlnVLgjXJmSA==
X-Received: by 2002:a63:df0f:: with SMTP id u15mr327288pgg.57.1624969171830;
 Tue, 29 Jun 2021 05:19:31 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.37])
 by smtp.gmail.com with ESMTPSA id gg5sm8314730pjb.42.2021.06.29.05.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:19:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv1] arm64: amlogic: Fix the pwm regulator supply property in
 node
Date: Tue, 29 Jun 2021 12:18:47 +0000
Message-Id: <20210629121848.6527-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_051933_308491_22FDF326 
X-CRM114-Status: GOOD (  11.81  )
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

On enable CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
Changes help link VDDCPU_A and VDDCPU_B pwm regulator to 12V regulator
supply instead of dummy regulator.

[    4.147196] VDDCPU_A: will resolve supply early: pwm
[    4.147216] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply from device tree
[    4.147227] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply property in node /regulator-vddcpu-a failed
[    4.147258] VDDCPU_A: supplied by regulator-dummy
[    4.147288] regulator-dummy: could not add device link regulator.12: -ENOENT
[    4.147353] VDDCPU_A: 721 <--> 1022 mV at 871 mV, enabled
[    4.152014] VDDCPU_B: will resolve supply early: pwm
[    4.152035] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply from device tree
[    4.152047] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply property in node /regulator-vddcpu-b failed
[    4.152079] VDDCPU_B: supplied by regulator-dummy
[    4.152108] regulator-dummy: could not add device link regulator.13: -ENOENT

Fixes: d14734a04a8a ("arm64: dts: meson-g12b-odroid-n2: enable DVFS")

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 344573e157a7..4f33820aba1f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -130,7 +130,7 @@ vddcpu_a: regulator-vddcpu-a {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;
 
-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;
 
 		pwms = <&pwm_ab 0 1250 0>;
 		pwm-dutycycle-range = <100 0>;
@@ -149,7 +149,7 @@ vddcpu_b: regulator-vddcpu-b {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;
 
-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;
 
 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
