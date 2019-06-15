Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548BC31E47
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058A320861
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T1LGcFoU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PQ/BYi21"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058A320861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGISZmlIOiRTfW3ikftHIa2NTRpMnDm+PMBYk3PATzc=; b=T1LGcFoUy7Aqj7
	kt5k5PZqCM2HnnMVmlQyfmsg41d8GCLtpEl83SEOie4/bYGsDAGf3v4g6E+4LyvPDBrnePTzF7mY4
	yjhlc8W07AfOrO5kpkrgh6RgkG5727sohmeuGPsutWc1B+mUTCc+NAXWJ+o75jFXFTotu7ANHTomZ
	2yDJe950jTCy7grWoio11ITVVpTP9SI6lArKdsgETefnrC7SRFWzE70inXld04PKkAc19AVNg7V7V
	U5VXccGRl/yd/dTB1LAkIJNajZ713UEk19yERP+jB7Gf2GFC/NrRst4gcy1x5OV4i26eUDV3L1abJ
	5J4HTZCANefiYq1LnA3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc6Ai-0003MH-Kf; Sat, 15 Jun 2019 10:44:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc6AI-0002sA-Hh; Sat, 15 Jun 2019 10:44:07 +0000
Received: by mail-wm1-x344.google.com with SMTP id a15so4743704wmj.5;
 Sat, 15 Jun 2019 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MlMxB1kkxmHmQmoUfndP7WEc3kmIml+FN9RGpOVU2A0=;
 b=PQ/BYi21UH6+Ssb5iH96mB8o+aNRXd2tJIOFhAfqxaQaYYiU2uI4IH2xGHAzu744l4
 C6tiY3gWFvycZKcoP0Jj8TM1Vponm6Oi+0j7JuG/7glC8uispNWXMWrz6gY30sw330g1
 iJ79DFPCtg7GmMhDoXdu5DGQFFMI9QismZbp0YrrTBhdrg3bKYjU5JLZryx85OWIjeUy
 h52lhJDAUqv5Xoy3yTBalyYnUVXJHq8s5TYQlhjJjlUrPXiSJb9gaWH9lE47TAdZu2/O
 TrqsQYUmolj/RCdi1/7zC1brF+7luIJyPkGaP9kgLVhSjl8Fq7ObHTk5jaw2jW81FMov
 aV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MlMxB1kkxmHmQmoUfndP7WEc3kmIml+FN9RGpOVU2A0=;
 b=iT0ZG705D0N+JMekQX5L2dsONDR8A7KlSHYv9Ix9Q++5HoXubmm6fEM7AG8fLjVpVb
 xoTomz9JPbL6Pypz/+YPiU0VKVKItGZPhcc1LnmWOTbykiD0DeKBVjVg52n945OElNe0
 qjFMoPDWDOzhfGlKXbkWeXBiy5qm9xBP9ujoU4tJiN7Hctdf6BY87fOYvQhrwmwXfQID
 +2b18BLQjGKDCH9XSme21/RY1zWUHodn6jb5ZBC8mxD1IBJXbcKU3pKyyuRPwtf40YLU
 V6YwwRnTjRtRRFjdKqPu5eATzGE33QNNseYtE18M+H1vWh61x/LrSEAyAuInyRGFFOIf
 wDBg==
X-Gm-Message-State: APjAAAX6siWZ9QrITIL/Hg4eMIMxyKT5x1F4gfkEzOJPY72OzBxrAla4
 Ikbv5/KrJuGjRlwiONSmoSHGne9fwNQ=
X-Google-Smtp-Source: APXvYqx6+Vnz65TOT8l4fd6YCoiZukdBu/ZU2e8kjlDhqiLJ6xa/48ufal7xACP07XTDnGHc15LVYQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr11435578wmc.47.1560595444894; 
 Sat, 15 Jun 2019 03:44:04 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id l12sm16761120wrb.81.2019.06.15.03.44.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:44:04 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 2/2] arm64: dts: meson: g12a: x96-max: add the Ethernet PHY
 interrupt line
Date: Sat, 15 Jun 2019 12:43:51 +0200
Message-Id: <20190615104351.6844-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
References: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_034406_581395_C6F3ADBB 
X-CRM114-Status: GOOD (  10.09  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

X96 Max has the PHY reset and interrupt lines are identical to the
Odroid-N2:
- GPIOZ_14 is the interrupt on X96 Max
- GPIOZ_15 is the reset line on X96 Max

Add GPIOZ_14 as PHY interrupt line on the X96 Max so we don't have to
poll for the PHY status.

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 3f9385553132..fe4013cca876 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -289,6 +289,10 @@
 		reset-assert-us = <10000>;
 		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
