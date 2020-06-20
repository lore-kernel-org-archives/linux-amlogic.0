Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5C9C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:11:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB812396F
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsp+uXKa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YUUYjval"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB812396F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhstAnOiZM27X8GZJxKVW5TsCv6pJRIR+MQTKKcbVrg=; b=rsp+uXKayNyVe0
	EIxn63smoR0yXk9HsHajmCnoyKfB+vmOXAoJQJSnR2Fa5Myx/sBGUEHtVjQH87Yu0k8m6SjCJPDS9
	SMTdnJrKDOkJcjy/Fkh1+OoPMG8/cG5Lo8G+2b2JOYptQPGMngji+36ylkuRWD7jQhc+rPmKw6NZZ
	qEi1+QaNhWGsuA+f8/cSA6yQYYZtTkJDNwrSmt28dIXp3rWdsssCL6KZzsBJKDY1GgRKTOqcfakx0
	st9CX+Yj1uW4sQLTsVvK6HLoUjOKIo3cPVFLY4TDn9xu0T6QItIfvRf9BiP2ANahp5U/+gxpALrdC
	BN4mM+tnd7fjoLQsl4vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmg5Q-00009h-6T; Sat, 20 Jun 2020 16:11:20 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmg4V-0007ji-7t; Sat, 20 Jun 2020 16:10:24 +0000
Received: by mail-ej1-x643.google.com with SMTP id o15so13517842ejm.12;
 Sat, 20 Jun 2020 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orxvClwe2X1G6LLt220P18SzRHWKPs1DBn4J3ndLHzk=;
 b=YUUYjvalbkovpygqyDgaPEV7N9U2IPmmAXOai69kZglvy+h2R3uKIrIQee89/1FLRY
 GvTGfvbO0udWlLhVHtMvHntmxj2Rvh7lIYbj3KiDps+ylKwTBtSKynQz46m3sp5UddNJ
 LAZrq8LsQ6BQwT7KOqDe13dwbDo09+fdZO/6pO60GealIKm6TYZeSLnw5i4ZjLImW7ZN
 F9UTiwOujDit0cRM7zugBQhTTA1UkMfzfo0lt+Y9tbLK1n1eo0FytuNSe15isnoEV633
 zzJMug2C8hB3MP6wlogp3HXPtt2h9dIw9HMB3GvxvZOyUyov7hpx3s4/PFLkzPNA+I0K
 PRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orxvClwe2X1G6LLt220P18SzRHWKPs1DBn4J3ndLHzk=;
 b=XotWXVeAZL+4rpGJAZV7CB18nEeE0DYnHfgSl1WCfxBDFwuQABFVCjmWqoEnYLevpy
 hmZznJeQX1klT8Qe0f/pQSvUH8/A427xKdGKdPbI5tCdJ+vsx0Z7uNdEINy45sEaKaSK
 TlIR2XZc4GH5wFo2VdYTB83Sncj6K4k/Hj5LzXe6FEysTEHzo63xRxqwNj8re6wGNPRV
 7tUOpErwqeACF/zp1xt9WPaA4dtI6mwVwCmUlJ2TabMm1yYqADKJNZEMPsxvs9A2aLs4
 ZyUdvgUPdVPeghblgRw2XVD+AeeHVlpr+kk/UZmCG2e0d12SIasWBthFHf4lDLmuUpFM
 GdfA==
X-Gm-Message-State: AOAM532sUFNp4JB82GrH1OSaWIQSUIhNtljFB7iUywFsZKucLRuEVcSl
 FmJDiKrNu22aBH1ykKdAlvpJ7+YU
X-Google-Smtp-Source: ABdhPJwcmrBNH01zMxqTshJiUr2AslvrntLjBXS1qW9UDYE1kESSIvl+rlvq9nY/RaNdZ3eqKoAtow==
X-Received: by 2002:a17:906:e298:: with SMTP id
 gg24mr8377986ejb.120.1592669421795; 
 Sat, 20 Jun 2020 09:10:21 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a62sm8033207edf.38.2020.06.20.09.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:10:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: add power domain controller
Date: Sat, 20 Jun 2020 18:10:10 +0200
Message-Id: <20200620161010.23171-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
References: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_091023_282632_AF7F2337 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Meson8b SoCs have a power domain controller which can turn on/off
various register areas (such as: Ethernet, VPU, etc.).
Add the main "pwrc" controller and configure the Ethernet power domain.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index ba36168b9c1b..2069c57343e5 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/meson8-ddr-clkc.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
+#include <dt-bindings/power/meson8-power.h>
 #include <dt-bindings/reset/amlogic,meson8b-reset.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 #include "meson.dtsi"
@@ -433,6 +434,8 @@ &ethmac {
 
 	resets = <&reset RESET_ETHERNET>;
 	reset-names = "stmmaceth";
+
+	power-domains = <&pwrc PWRC_MESON8_ETHERNET_MEM_ID>;
 };
 
 &gpio_intc {
@@ -449,6 +452,30 @@ clkc: clock-controller {
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
+
+	pwrc: power-controller {
+		compatible = "amlogic,meson8b-pwrc";
+		#power-domain-cells = <1>;
+		amlogic,ao-sysctrl = <&pmu>;
+		resets = <&reset RESET_DBLK>,
+			 <&reset RESET_PIC_DC>,
+			 <&reset RESET_HDMI_APB>,
+			 <&reset RESET_HDMI_SYSTEM_RESET>,
+			 <&reset RESET_VENCI>,
+			 <&reset RESET_VENCP>,
+			 <&reset RESET_VDAC_4>,
+			 <&reset RESET_VENCL>,
+			 <&reset RESET_VIU>,
+			 <&reset RESET_VENC>,
+			 <&reset RESET_RDMA>;
+		reset-names = "dblk", "pic_dc", "hdmi_apb", "hdmi_system",
+			      "venci", "vencp", "vdac", "vencl", "viu",
+			      "venc", "rdma";
+		clocks = <&clkc CLKID_VPU>;
+		clock-names = "vpu";
+		assigned-clocks = <&clkc CLKID_VPU>;
+		assigned-clock-rates = <182142857>;
+	};
 };
 
 &hwrng {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
