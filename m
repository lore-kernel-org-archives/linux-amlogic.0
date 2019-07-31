Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65041C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 15:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C629206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 15:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnikAqXy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KYF9hpGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C629206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bOYIEetMQ5Wln/sJ3wPQ/CcRWG3SMCbSeLO0FCPPiGg=; b=jnikAqXyUV9iSah75U2pkCuAaT
	FTd36RjsM0txhvBBT6ovSY97GGX8WDMx48AiOWLcKxFT8TW2Ni9aamRSM5SqkffEXKcMmkRh+qPnN
	hmaPopedEmz9YAH8zDXXw43LZ9GxWeAX/Gq5on0/0IoDsKN8uCIzp9sEdxL4dVCuwKKmUJnv19RCZ
	eMMvDa/qm2zz6iAEyZdYGs6sM1Hg81HOagnjVwyQIfi3wBk5dtVEBVNRVG4Mdr6EM/g/euRdjsQ+m
	P7AeO8YbKfWN7+Q1vUi3LNRvjJb+7MrxNh87R9Azw4rFIAnCD4xzg7QPLCLHH3n9rWFnbVjtEhymt
	2a3zRJMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsqeI-0006EG-JV; Wed, 31 Jul 2019 15:36:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsqdc-0005Oq-Q6
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 15:35:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id 31so70222288wrm.1
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zwXMQFf4O72zRXvxhXDpjn4gC2DC6LZbFolWqJXYtrg=;
 b=KYF9hpGEUbp0s0D642XDycTGprN3nqCsZUHBJdEKiex/mFMiZiWZ5/jd45H50ptbNU
 gw8EOQxt0VEWOwPRO9cHC+8Ray13wzLmL2meqCrouR1exyscsJduepsVv0tVycyMKrAx
 og2pGcy/PFs9xB5pIxirKZzAjqQ0hmhI1FvPVk7wCeTN1b8iueOtfp9RDkH0HQq5AOqO
 BIsh5KY+3D+v4FETW04yDsEQrdHpBzqHuVwgLELR/iZMZZ12GTAcLO3jy8qP0z/lXN89
 pH+/vGjHdLe0f0U+b/34BBcYccDIKZpHm9TC2KQ8QAL/lNqMRJSWt0F//+Yg0kpY8hxP
 PrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zwXMQFf4O72zRXvxhXDpjn4gC2DC6LZbFolWqJXYtrg=;
 b=hiLzPg54brIrKEKJpKxWAxHIOXY7K1ZXRVJWzI2rN5I+TW+3HGWO00FLvZj+04RpOy
 Clz0x4q6vo5UzXUb6JPPlPdY2CUbxnVb5ZOKZCTpOCJ27XliyvheD31XZdyswvMMIT66
 QEcPx/osLg6gUiqOP0Kzv//71J4OhUXtK68KAgdKLI4uQ8egahvK/j/LNZzPApbTWJ5b
 Xz1n+QzFD+UldLGrWoOJDzUWZC5+Z3ETkAlS9UqFwhuhoDyMMsiv2g0bW85Pn9+AHnOi
 FqqQkfnmISMFFr/vmu2JWEihordlsx6TwHZ3ZQsDjoMf17/kivctmTpDWjF+SBZZxG9H
 /EYg==
X-Gm-Message-State: APjAAAWvAx0KsBFn7p6o0++fXsVjiqwuUbf0M2ciGCiCwLfN4KrQ95ck
 6ZkSkSWF02BJaVvllOybDs4rXQ==
X-Google-Smtp-Source: APXvYqzoxnNYY2vWzgJ9XlUvY8Co2H5qYLxlbwUS/OxtwDXdbJ0v1wfkv4b07TjdDvzHYrdxfIXyZQ==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr91580852wrp.277.1564587334955; 
 Wed, 31 Jul 2019 08:35:34 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i13sm62834396wrr.73.2019.07.31.08.35.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:35:34 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v2 3/6] arm64: dts: amlogic: g12: add temperature sensor
Date: Wed, 31 Jul 2019 17:35:26 +0200
Message-Id: <20190731153529.30159-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731153529.30159-1-glaroque@baylibre.com>
References: <20190731153529.30159-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_083536_856645_DB6AF02C 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add cpu and ddr temperature sensors for G12 Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 06e186ca41e3..7f862a3490fb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1353,6 +1353,28 @@
 				};
 			};
 
+			cpu_temp: temperature-sensor@34800 {
+				compatible = "amlogic,g12-cpu-thermal",
+					     "amlogic,g12-thermal";
+				reg = <0x0 0x34800 0x0 0x50>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				status = "okay";
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
+			ddr_temp: temperature-sensor@34c00 {
+				compatible = "amlogic,g12-ddr-thermal",
+					     "amlogic,g12-thermal";
+				reg = <0x0 0x34c00 0x0 0x50>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				status = "okay";
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
 			usb2_phy0: phy@36000 {
 				compatible = "amlogic,g12a-usb2-phy";
 				reg = <0x0 0x36000 0x0 0x2000>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
