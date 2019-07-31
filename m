Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D87C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7FF208E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P7ON+Qng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zEzqFVja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7FF208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLfHcR8xuQhektX6W+nkkTfOA8D/ne/j0h+rWhxJzF8=; b=P7ON+QngCeNGih
	D44EAI/AFXeRhCM2QUDHv1lkbkvTft+MFWLiE1vfzrAAz88GA/X3MSt1dJyOVp6UHgeGQnVBkjweL
	JvysU0x/WIWUDGKKh8cYR8X/Gtu3wGnlAVtBt7t20LzP3hKjX2K2NM7Z+rXNI1ffl7vlXPYWNAxJ3
	L1yU9fCeFeh4rkb+Ba+YKdqsPC3FkQ/+4oL1bkuYrxY2KU5vBZu9zj1sd+rq+5irqlQBdejBkElhS
	GF5R/Oc54bHADjZaUaVlT8HIB5UBN6FC0hEUpKswOV2oGnIMQRkPGbmxLhPQ3ER6Wa0XAe620E96c
	HHYaHGfXgqpR5lzvcPkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnxf-000675-T0; Wed, 31 Jul 2019 12:44:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsntr-0000Gd-55
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:40:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id 31so69545105wrm.1
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U87qbGqOizt6mcWi4ZafXpAVErJ10/2GJDrgCn/BFng=;
 b=zEzqFVja0Fqsg11qypzSTOGn9YUbHxrTCRpomYU2xnSk4RqosdMU3RsLKQ5IHrk01v
 gZa8uGmAP550xts1ob0QR4t+ujj6f6l4TPGUMJBTI1aXnFAHRLDITtONU9DDzGDNd6fH
 b9UA6re8oJh0ZuRd7oJljeKVy1nwM2wt9MzpO1rIUn6rSJcD8SKFHAT+zvtKXc8CrPSL
 Cw4OLEzT9m02WDlPC3JU4Wc9Y+o69mwLzcaIL3DBzErWh8oaqJOcNs1bZjxyGSYXOBNW
 Zs3wlfRxgPz3+Wv+dW7ILng2azVJyENzMtL3tbafMQGYvkRSgsAFFrpNh6hbT/q8W/gN
 0enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U87qbGqOizt6mcWi4ZafXpAVErJ10/2GJDrgCn/BFng=;
 b=hzPdQTLN+0EFKfXcWhhTiYLn+uN/ua49IAJJT2unr6iR/vL4Maxjw6kZhaqN97qozJ
 9t2engcDyLVkuMg5M/j3+nqCDUdzNDHffShNFyDLTrxMwO/X7IlKABMuDg6pnav0+eeT
 PaG4+rfZ/h7k373+1NTDgIA91zZMAQxoVjX08lbbnCs0GAVDSXNYvFIhuN9/m6nynnzr
 zA3tLALlR/4MO0K0GXQz9pBv/y4DUjJZsu6jnaZ3ez0J20FpcQOjTgLl8lGR/eyvOIaZ
 tEyO3km/poB3EJnRZN9T0kNazAgtg5ELcMMySZ1IQLm4+kNEFc5q7Qpy4sdNosiiES3l
 iEEw==
X-Gm-Message-State: APjAAAU/AdQFogdlEsX4HanJ9hCxZuk+y1ZtW3s/g3MLLUBErijcRTrZ
 gR3C9DRaVr7XCZn6R0OnLfYCOw==
X-Google-Smtp-Source: APXvYqwRvaDIRDg5/7CHt0j5vI443O9wSUNUp31+MGhBKdXuOhMOSbWoNqXVYU+B1ah5lM6/dpyi7Q==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr15513765wrq.329.1564576806822; 
 Wed, 31 Jul 2019 05:40:06 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x185sm62504271wmg.46.2019.07.31.05.40.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:40:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: arm: amlogic: add support for the Khadas VIM3
Date: Wed, 31 Jul 2019 14:39:58 +0200
Message-Id: <20190731124000.22072-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124000.22072-1-narmstrong@baylibre.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_054011_454512_EAAD91D3 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

The Khadas VIM3 uses the Amlogic S922X or A311S SoC, both based on the
Amlogic G12B SoC family, on a board with the same form factor as the
VIM/VIM2 models. It ships in two variants; basic and
pro which differ in RAM and eMMC size:

- 2GB (basic) or 4GB (pro) LPDDR4 RAM
- 16GB (basic) or 32GB (pro) eMMC 5.1 storage
- 16MB SPI flash
- 10/100/1000 Base-T Ethernet
- AP6398S Wireless (802.11 a/b/g/n/ac, BT5.0)
- HDMI 2.1 video
- 1x USB 2.0 + 1x USB 3.0 ports
- 1x USB-C (power) with USB 2.0 OTG
- 3x LED's (1x red, 1x blue, 1x white)
- 3x buttons (power, function, reset)
- IR receiver
- M2 socket with PCIe, USB, ADC & I2C
- 40pin GPIO Header
- 1x micro SD card slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index efa032d12402..04a2b0ef34c6 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -137,6 +137,8 @@ properties:
 
       - description: Boards with the Amlogic Meson G12B A311D SoC
         items:
+          - enum:
+              - khadas,vim3
           - const: amlogic,a311d
           - const: amlogic,g12b
 
@@ -144,6 +146,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-n2
+              - khadas,vim3
           - const: amlogic,s922x
           - const: amlogic,g12b
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
