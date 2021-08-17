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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC70C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A2B60F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63A2B60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyXsSsLgodLKRwpObVIgSX+tWNufFz5HFAa9YaC0Dz4=; b=r8uMYsT4GcTG1X
	vke0eXA5ed8eOI5rqaRoj92C0St+YQIYnDfsbvHH+rrMy3Iz1Y3zIIj/iuBL1wFqDwAcVGFc1vMrT
	gucdrNyBESQcFNDt1MIUEfqaA7escDvSo7sJE6XfBPOJyKpYxOTdXjduVYDdNjHnnl/PGUXXtzNjd
	oSQyL9x5YlbcY7iaN5Ng3oHxnYhVbZQpIcILkMkAfgkdzDzw0yzhtrVa2AU5Gta7UWWzviadEcVBR
	94DbRX1VYe0ZISt5UfVadhlHC0ACF08/Xn9Lhc7BXk2uwvvCv7dyDeeXv1ezHfHOpgnCkhETOvRXN
	sWbACMQnBinf4fFxBiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqYh-0015RB-3P; Tue, 17 Aug 2021 04:18:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqYG-0015Du-4j; Tue, 17 Aug 2021 04:18:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so4138430pjb.3; 
 Mon, 16 Aug 2021 21:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qmVeyhKiZb0zIqPGmwLOmayId0eC03bF22fmrGDOy0E=;
 b=jmymeSrHo7vr4RSmMpg+BEmhKUQli6sFp0rFo9D3+E89ww7eYY+HbdlJrUxWxftooa
 BFTOAVErFz90/swbCz5EBMx8JO63ei9tsXSZpZ8KiWT9Msp96N1CwKJ6V9v0NspRpX4v
 x2zRy0eZ1AZ2EZoNgGTQsnVVpjtMU8qkAasHRWpADvgiRj+KxQMW1ex0eEoYR2E7Cf/c
 ejupe1OeSlL73y7DCERI7g0OApZ9mJrizuwBmlLKj657fC4qxsYwGxuxhPnNZb1g3M9I
 UL/YkduJuvzi5nZSLfq6DUir/v8ABjrpKHo4Y21l7i2064zRNicPImwRrGrIGhqR64ah
 m0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmVeyhKiZb0zIqPGmwLOmayId0eC03bF22fmrGDOy0E=;
 b=ACoiun/rKCCWripCokYHDQjskFZKpRrJEyzaDKNMgsfLlqr0NFXWbpEOJu/OY6MML7
 gSKqjzDNnLid/4IIm3nu/DW3eptp6f5CFNQr2crgEloPGHuUK9H7KfIJdb9mXmSlNSeN
 Pf2R2eR/DM/G2gBqv2FIQkdGgd1ai/6B513QJh9r0u97+JacDC8scaXwOdjo4hHUc9yn
 DmuxZfR0dbH6E62j0o77Q35fVNHJpsLog8lLyHhFK3OCMpavqulm+vUSMtLQpC80uR85
 RmnJJOP4gzGluJwL3afw4K7lZvE1b0lPIccWjpYcf6mWIz0kAY9GdF2RaA1DM2HuyL1T
 7Jnw==
X-Gm-Message-State: AOAM532uba/y5AuJrBPFqrBSjEjtT5zKhvvpUflqmIb1uaGvBatAgcN6
 kJqmiaq2r7pJcKwViQ4g2R8bLigAprGTHw==
X-Google-Smtp-Source: ABdhPJzJKgheXvAVNXiCHRktmaDbDCjw9+UQXMmXIXMck1UzOs34Ekk2v5ohhN6ywg/uss/MLZ55fw==
X-Received: by 2002:a17:90a:ce0a:: with SMTP id
 f10mr1461562pju.71.1629173891353; 
 Mon, 16 Aug 2021 21:18:11 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:18:11 -0700 (PDT)
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
Subject: [PATCHv3 4/6] arm64: dts: amlogic: odroidc2: use vbus-supply for
 power source for usb nodes
Date: Tue, 17 Aug 2021 09:45:38 +0530
Message-Id: <20210817041548.1276-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817041548.1276-1-linux.amoon@gmail.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211812_237019_56B87046 
X-CRM114-Status: GOOD (  12.37  )
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

Use vbus-supply instead of phy-supply as power source for dwc2
nodes. Drop vbus-supply for usb0 node, as it will handle later.

Fixes: e841ec956e53 ("ARM64: dts: meson-gxbb-odroidc2:
       fix usb1 power supply")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch in this series.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 3f4f16a5dedd..01bbfc4c091e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -400,12 +400,10 @@ &uart_AO {
 
 &usb0_phy {
 	status = "disabled";
-	phy-supply = <&usb_otg_pwr>;
 };
 
 &usb1_phy {
 	status = "okay";
-	phy-supply = <&usb_otg_pwr>;
 };
 
 &usb0 {
@@ -414,4 +412,5 @@ &usb0 {
 
 &usb1 {
 	status = "okay";
+	vbus-supply = <&usb_otg_pwr>;
 };
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
