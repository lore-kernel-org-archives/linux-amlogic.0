Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526ADC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181A060F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 181A060F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5i/XAh6QJFt9bZ9fjKyzCJVJ+CjYTNQ7hHql1eyOkqo=; b=OMDpdjKwx45JFv
	OJrXxwYnjmmgdL+khFwT8uE8eba9SUBk3nwOz4m2u1exKSTpbTNRW+yZlazsLEFqTutql+X8rzw2U
	tp4jaPtKQt49pLxyMsMIMaf5Jp1W4RTUIJkYLBKFqAbzH+awJstsTkoYbcLs06JDcP6upqGqbAT5l
	5OOROuWLx3KOqS8XjWQKO9nMZjJhwpf/svEvLO/IaMgcl3JqMgbKnFkN5V/vIlAD2dwMnBWxnvlFm
	qBMAAtY6PFltfUqTQiYrxM7Yy2hAY7oCSIk1yaEHp6iU7LbgJRKeaH94rucQLIq3ET6sKcPN0w7di
	Y//dqyIcYBSm8oqcM5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqYL-0015Gg-Dl; Tue, 17 Aug 2021 04:18:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqY3-00158v-OK; Tue, 17 Aug 2021 04:18:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so2857933pjr.1; 
 Mon, 16 Aug 2021 21:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpxBu92wuMGjuu73ePdt2ALcCgck/seakH/934m3wMk=;
 b=n5HdRhWN5TbSsnCX5eXDbIAbobwmKyo+CHqfdwkqrdHQnVLWXT8u+L8nIGHr/ECqzb
 LnEjs3TlTcURBN1F1O4OnGvtU9DhfM16sEj1b9HqXw4SBXTIimi/6pKKRuVvJz0RX65o
 wC7lDDVsPali39wzzZaYD6xBKsF+3meHaUR9BFSo8QlGS41AWghmEocachcYu+qygeDD
 ugY8xvQggKaURnuY5a3tr9/6uw1apcJav2Tb8OBA+lu/NLi6TlsmACO6bVzj0KVzDQQF
 huxwClnFDfmTO2ppMM8PEXUxM4vSXdvTFzQJz8cwQ9PxSLg8O4rOq+IUeau3DRAlenF+
 M++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpxBu92wuMGjuu73ePdt2ALcCgck/seakH/934m3wMk=;
 b=uEcSGycavoIEkutXLuG3C7Y+CWNJ8XyORNZfFzBML9temuHPtuUFgzgEsi5qchE8nP
 DTlHwT2Ei7xw4gNE/zxsfenKi+M3UX/cPbiousm2YezoioTs+IMvw+6vSR3d699QYEdv
 aDfOSQlR0Y2Ori23/M7HiuCps6YOiVLWKlsbEpy2bi2Isz/h/Blkxhlw3xVJtKBEKVPa
 EmLTK0SpW1KmLbLbL1GXZZmSQG0nZNL+6B0xtWyxoT5G9alBTgZJFh/dL06DppakA5Q6
 xUN5dcqgE9dLTB7bW/TryngFiudR6l+AtQnsGOJ6ApE1GDmKMoq4rVz5htv1VUrywG2W
 m4Pg==
X-Gm-Message-State: AOAM531GlXFNVFi1sLCtV1NspHILKwfVKRnobrkn/QYSvkgK75fd66jF
 lsQdzWM8jErYsBr8LyudTnDPFYGF5TL3EA==
X-Google-Smtp-Source: ABdhPJx9t0wz2w+3ZEoqQyOMi/HcbFuDmHp37FDbVUWs25k7cQkfmZM1eB4P53YnrNBeune7MzcWuA==
X-Received: by 2002:a17:90b:4b45:: with SMTP id
 mi5mr1498660pjb.43.1629173879025; 
 Mon, 16 Aug 2021 21:17:59 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:17:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCHv3 3/6] arm64: dts: amlogic: odroidc2: Fix the chip enable
 signal for usb power
Date: Tue, 17 Aug 2021 09:45:37 +0530
Message-Id: <20210817041548.1276-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817041548.1276-1-linux.amoon@gmail.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211759_837990_76E47519 
X-CRM114-Status: GOOD (  11.22  )
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

Fix the chip enable signal changing from Active High to Active Low
to enable input power to USB power. Also updated signal name as per
the schematics.

Fixes: 5a0803bd5ae2 ("ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2:
Fix the typo: shematics -> schematics
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..3f4f16a5dedd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -38,12 +38,11 @@ usb_otg_pwr: regulator-usb-pwrs {
 		regulator-max-microvolt = <5000000>;
 
 		/*
-		 * signal name from schematics: PWREN
+		 * signal name from schematics: PWREN - GPIOAO.BIT5
 		 */
-		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
+		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
 		/*
-		 * signal name from schematics: USB_POWER
+		 * signal name from schematics: USB_POWER - P5V0
 		 */
 		vin-supply = <&p5v0>;
 	};
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
