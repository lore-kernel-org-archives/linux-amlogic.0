Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08989C4743C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 17:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE76761400
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 17:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE76761400
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OXmjaZMHo93lxLN70pDQTUaX7KSedgJBMDxZN8PBDFQ=; b=agykgbBWCJz1qW
	Jgku3B/n26a8OYQvNcKPOZMd4OyBBAxgMt6IieByqLl+lQBXVHzN5Jld0ygR1lSlSiybREMFxl2rT
	gZWKKQrH1YwkkdTko35bFNz5gx4lF6S8bcWOPxTVovqtN44FVjwaDsk40CwwxnoD9rBzUTp0nnbCx
	Zu1niGPMiZqiol8Qhh0zNB/EclZfd1u0/lhTzxNoMuKSxM1xy56KR17SGQfqI43A043hetsTncL9e
	6VP0GUjEb49qYb6NbFM540ekgVNxseG8DYC1s9cOI1u37VCxbnJyZ+EmrVnbOgG/wQw+1Jro3PkpP
	pPsmhVhpqNUH/dSIBpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpDJg-00EXRG-Th; Fri, 04 Jun 2021 17:09:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpDJa-00EXPw-Sd; Fri, 04 Jun 2021 17:09:02 +0000
Received: by mail-ej1-x62b.google.com with SMTP id l1so15577322ejb.6;
 Fri, 04 Jun 2021 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoQ9gA8dbbWK1PtB4dCFVLRMGfxxHdj7P0i/xhgg55I=;
 b=vTUoh8iFX3WkURlZGhaLT4GCmDnGg2CBfohcDURDFZ8JOOKfDNWxGtN+siZlEUUCg8
 eOC+yekb2HorPEMH374VVAe8ep18bRtQUp/CNQxyifMSoI6iWViNQqwdCdGx7Jg8AQK6
 wtPbe3nXeWZBlZ8QJcEaZJZ3gX2A+DmTCODTu441hfpIs+uExsJGdZU82cZAd5W5/Kdl
 oBIP0W9Ww7QN9kvGEArtmMI9iCfEwZ10cC4OrR3NOj5cD0ZakkJvuvOF24nqWrGE5bZZ
 cvkdYzTGfYfACjRNkw5FixPCHtUTg2GeRMUkcmjHOlCXWHDb1Wj3aJG3MCq8s5SUbgep
 Ukfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoQ9gA8dbbWK1PtB4dCFVLRMGfxxHdj7P0i/xhgg55I=;
 b=KbAi7KHux32SWGydX0Fezk/7Mm8V9vipUHPn+0mAiDtDECosY+OWoFxB0S7ij3kM48
 4K54yXhs10ledFLXfBfkM+o/JkBAHfWo6wyQ3iZjnYrHCOOVNTSkv5VCElQOX+oVA0p4
 Wxnp6pg3SfMn9OaY0dgYmYCWaegF6v5DpjCu0zX0YpnHSiYImch6Eh3B13AyJKAUJq5D
 P5sfzOQBEjWpLI9HM9+U4v6FJA9agNXTLZ2RTBVk6nzM0uhqzjiaqkW04WBHEAZXqCB2
 mv1eJsxHV6kDlrecCjpaY4wy8orUrzRFD3BMq73pWKtYOimh/yNPvaTujpgd3jz6e0Rf
 Fs4g==
X-Gm-Message-State: AOAM5313x1A7frSS7F+jku9XeKFPtSVsT+QeQAe3ZNTYh7h3JCsajytl
 55bv4UaAdeXyaP0KTFsSGBhMvDnTAKw=
X-Google-Smtp-Source: ABdhPJw7lDvO1MHuloAiRRHK/9CSD4zYB4NRxtgEq0HCbXnurenuq1Ztwl46ypeON4Bk3azBqhh8vQ==
X-Received: by 2002:a17:906:6981:: with SMTP id
 i1mr5123333ejr.289.1622826537290; 
 Fri, 04 Jun 2021 10:08:57 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137127c00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:3712:7c00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q26sm3010663ejc.3.2021.06.04.10.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:08:56 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com, khilman@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes
Date: Fri,  4 Jun 2021 19:08:44 +0200
Message-Id: <20210604170844.2201229-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_100858_949244_7269491D 
X-CRM114-Status: GOOD (  11.31  )
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

The first UART controller in the "Everything-Else" power domain is
called uart_A. Unlike all other UARTs (which use a 64 byte fifo-size in
hardware) uart_A has a fifo-size of 128 bytes. This UART controller is
typically used for Bluetooth HCI.
The fifo-size of 128 bytes is valid from all SoCs from Meson6 (or
possibly even earlier) all the way up to the latest 64-bit ones.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 8bae6ed0abb2..bd0e864964e9 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -50,6 +50,7 @@ uart_A: serial@84c0 {
 				compatible = "amlogic,meson6-uart", "amlogic,meson-uart";
 				reg = <0x84c0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				fifo-size = <128>;
 				status = "disabled";
 			};
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
