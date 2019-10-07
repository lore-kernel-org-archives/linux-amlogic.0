Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5255C47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86082084D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h2NrT6hB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwWpqvPJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A86082084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKUDBgijz9/Jq+Yi0djhGS6J9cGKl4eXYNgrGPsvamI=; b=h2NrT6hBYf1i1g
	yAskzoj7GUrtPCwwyqhlWub0KiEpXPnL1n68UiPCvCGNIh24vETz9UBxl2W3PqU2s6wtYmAsn3lki
	iTH2P/alQMGys6uisX42eey6zazue7/8gaMY30djO9fVukswyDGZnzOLNN3o3xFbT/TuvofBSQz9g
	WdtEda6tEP12S6bgbODW5BQ9vMIn6Q/uVk40hH4CRT5msOEPSOUGC+gjTpRk/zZ3hbS4FxC92kagV
	qdE2jg8qq0+S+2Gv5P3ZmURqwNnr8VMF7K9qjUDWWkglEi4jOFKtd1B7+VqGATF1m67u9SXZZG8Iz
	oc9k1bgxMccz4K9XfA6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHStf-0002A0-Kg; Mon, 07 Oct 2019 13:17:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHSt3-0001X5-IV; Mon, 07 Oct 2019 13:17:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id i32so901716pgl.10;
 Mon, 07 Oct 2019 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9wnC908x8Dc2ovfvaEIwhdZFAXDuGhcSt8cyx50jRo=;
 b=YwWpqvPJtwEpzVZMlfk5DEXF+OvWK+s+K9aWVNRyvA/uzd2w3N0n9BHxibOLIGgpCX
 9s8gt/Ru3gD0HTSBH79mBN6zJfcBsR1iQ19s1RSO5KuCIerBSnosMeqwsQYIRuBfTSXt
 j9T/Yz9zT2f7e2FZas6Li+b3i3O304LBu65wWHGUf3iPY9tpKo1A7BmKhE8d72L+DWyg
 eriv8XF4lneIamLiwQvSHqWgp1QOFDQLtjY2faLQJ7gARQ0Q4+tXv2n1rHX8XgwnEtBo
 OMWuoj+Nw7ehynSS3DSR1pNTu8PGFdRVBl9m3yZPZx6xSlPYFLILx+mxq+dAcu0Q6DBo
 smBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9wnC908x8Dc2ovfvaEIwhdZFAXDuGhcSt8cyx50jRo=;
 b=jRLzOVzrDwmQEviTBQmB+qI6MubLufAZ/QzToRuLJuKtoGGcjjVyK6KBaqDMgLeWRm
 ApDtWM4ATjfxRLFjxUGoBe+25PYzVgdEgV/N6wZr8mog5iJPH3Bh8nL5FV3I/+aaoApn
 0P1BIrv50o8Gurx0dBKvrIllUZCp6jXOuGI9LCJH5NmREhEuM04y3HjcWQ2yUbQmdOYt
 N36+2Ko1aop+NfzzDslfvv625x/YWamplgu+PkQmG+EBhjfU96PX+7qYpW0D4GMksXPh
 ViMvSX6+jCv77izNsGsClz/uELOrUCCTIPeqWIpQLGPPOGXZXluJZvz/7IGl1lXo7bqu
 7bnw==
X-Gm-Message-State: APjAAAUmPgYZ0ecWdxgtMM6LD2s/Z9IxRIoOLVb46MApG52pyb4q3NM/
 PqLzlVxq5m56bU8qn/UxUNM=
X-Google-Smtp-Source: APXvYqy6LK+V/L4wpvKfrkRzRZD8R95qPwJMkTBR0Y0ZiyfkdL06PzRvWTUvyg1QUlf2W/7+0HzEIw==
X-Received: by 2002:a17:90a:2744:: with SMTP id
 o62mr32896684pje.139.1570454236533; 
 Mon, 07 Oct 2019 06:17:16 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.138])
 by smtp.gmail.com with ESMTPSA id r186sm16938650pfr.40.2019.10.07.06.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:17:16 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [RFCv1 2/5] arm64: dts: meson: Add missing pwm control gpio signal
 for pwm-regulator
Date: Mon,  7 Oct 2019 13:16:46 +0000
Message-Id: <20191007131649.1768-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007131649.1768-1-linux.amoon@gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_061717_950457_42E729F3 
X-CRM114-Status: GOOD (  10.56  )
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

As per schematics add missing VDDCPUA_PWM and VDDCPUB_PWM
gpio signal use to enable/disable the pwm regulator for DVFS.

Fixes: d14734a04a8a (arm64: dts: meson-g12b-odroid-n2: enable DVFS)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index a9a661258886..66262a6ab3fe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -135,6 +135,8 @@
 
 		regulator-boot-on;
 		regulator-always-on;
+		/* VDDCPUA_PWM */
+		enable-gpios = <&gpio GPIOE_1 GPIO_ACTIVE_HIGH>;
 	};
 
 	vddcpu_b: regulator-vddcpu-b {
@@ -154,6 +156,8 @@
 
 		regulator-boot-on;
 		regulator-always-on;
+		/* VDDCPUB_PWM */
+		enable-gpios = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
 	};
 
 	hub_5v: regulator-hub_5v {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
