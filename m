Return-Path: <SRS0=FIcl=46=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE8EC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07E720746
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOHVq9d9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VeEpgcp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07E720746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4rk3Sqt0uTdcOai2MN2Kv9E5K99krzhYZqOwj3UKbc=; b=iOHVq9d98Zq4Ec
	SlVWmoywEwqy2oxqY8ARVgt0u/noYqLUw+5UNVGSroz97cADKso1bhXphEhnUxErueyE5yXKCGpLs
	Uh8CmTTpfn4nDScU8H/ORCxSrjksM6whH7kC+1iUR2XdekMJZc7c5ZtW+mpWuc6k0wSWFcEft5m9l
	4iFv6lcFoQYCxwWrLeKvx33ZCUbHZR3d36eUpySoP8EXCifzvLR0ONUBh5Cuz7hqkLvXmU+tVEiTe
	39iPJ77Pv7ND7ZuMehB2PB85Y4escdvjmRlXg3jN6FPmuc3cULqFN5cX3mpJ6QrH9iAbza8r/G6lA
	XfDhx4SA+o97GbKEdFlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgLm-0000qu-IW; Fri, 13 Mar 2020 09:11:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgHp-0003pQ-6D
 for linux-amlogic@lists.infradead.org; Fri, 13 Mar 2020 09:07:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id x11so6295474wrv.5
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2020 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HPMaT81MXCeebofnnf7zx0HVEbfvu9bFZLYLQmZDe4=;
 b=VeEpgcp6B7SCz97YksAWPlVAixQ9a1T2llnI8xmaAIqQWVuisecj1ExtzzyvhDYKNM
 zONGsxO4cTO0O891qd52BsaYjV8Tmc7P9OohTp3ZwOgF6r7cNP30MDODqLy7LYxXv+fU
 7WXw1rNmICnU4w1n4D6DQehhwBxR1iY5opur9vb4TsE4EDo/6CdWZJC/SAGZouNj+sco
 pKnfvceozF9c3esMmpUoPEZ1pJd65YVC4NUPxt1AxCX38ntIT/cSckmi5bALe3qluDxI
 TWRhDZH1lW5Hvh/aOwYr0xFdxxcVXyBIxu2ds74vHim4/9hR/vYZri672YWGRfqKZ1jj
 WU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HPMaT81MXCeebofnnf7zx0HVEbfvu9bFZLYLQmZDe4=;
 b=Dr0gF5Mp5ypDbYeue+ExQgPnx0VgSqjHkgUsu1KlZc9l0r9T/WIiRTrVWGEt9VYpaK
 4MsxewbKRTsCCkldAAG6JTo7WfhsUkqQK2QOabumQQ2R+t/zrZbrf+hWxUg4XW55Q0/n
 pCBwDWEpibtvq7yiOwFZwiJ2OyzeSPAcqB70xZxCBM2fAdOeFZZ/fPDQ5ViVKah/Bw32
 S+renFnQZ58N5rDxPc9Ixqngi7qYjZhY04y3IhuCjtuYBvRCiLVjhhIHGlQMo1OyVO5x
 YD24PPR6gREeygJLojk1JKmGUhwaDXGyDNr4AsFr3MI0ndl6CchGfgUGNVVlPa+xt4VB
 qfRA==
X-Gm-Message-State: ANhLgQ0Qkw/J9WfAGmh5ShwLbm/Ufrkf4nR4XrAwzYpFoSRugBveNGpZ
 QCDHwjq6xHW7ZyildtV2KvsDvA==
X-Google-Smtp-Source: ADFU+vtCUP2jexc1cRHOBRmdco0djB5phQgI4eSon4Q+TxQ5jXY0QSBxqsTqU+wd5RHjgAaSyI3+6A==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr16528447wrg.199.1584090439399; 
 Fri, 13 Mar 2020 02:07:19 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id i1sm61872399wrs.18.2020.03.13.02.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 02:07:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/4] arm64: dts: meson-g12: add the SPIFC nodes
Date: Fri, 13 Mar 2020 10:07:11 +0100
Message-Id: <20200313090713.15147-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200313090713.15147-1-narmstrong@baylibre.com>
References: <20200313090713.15147-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_020721_396767_576E09DE 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the controller and pinctrl nodes to enable the SPI Flash Controller
on the Amlogic G12A and compatible SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index d09efb86ec33..56a9f8eadf01 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -593,6 +593,17 @@
 						};
 					};
 
+					nor_pins: nor {
+						mux {
+							groups = "nor_d",
+							       "nor_q",
+							       "nor_c",
+							       "nor_cs";
+							function = "nor";
+							bias-disable;
+						};
+					};
+
 					pdm_din0_a_pins: pdm-din0-a {
 						mux {
 							groups = "pdm_din0_a";
@@ -2071,6 +2082,15 @@
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			spifc: spi@14000 {
+				compatible = "amlogic,meson-gxbb-spifc";
+				status = "disabled";
+				reg = <0x0 0x14000 0x0 0x80>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
+
 			pwm_ef: pwm@19000 {
 				compatible = "amlogic,meson-g12a-ee-pwm";
 				reg = <0x0 0x19000 0x0 0x20>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
