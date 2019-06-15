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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8A9C31E47
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1279220861
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBijJ4Sq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fuKDebUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1279220861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7LpPRSi0Q96ABFw6Gr86w++JeznYwmhC0VBH/H9A1s=; b=nBijJ4Sq1PXeSf
	0PvJqOonbJHmd0AC04eane9PrPnDkcp09Bpq0SKyArDC5uPJoX9IAgUHaqq4mpjIy0d5BGKkssRnh
	ex8W38Xox848SIIU2KwENTtDa9ry6BxCswPFMsZJ8wHL4qQ03hLmNrQNp1aa3Wtm5duaOYvfZrgdL
	hKMatiPivOunSRNCFe4O+Q3iUkx+9k0hFy9MIX+sZnT4UumtmjhYYGhKe8r8oSHJcFILBTK3pQ4BP
	S2OwV8ri1dPaKoRSTClCvB4UKXbi5V13HDc2Pk1kwKcCavITpCqJvaJt6g1CdsYlW3qCmdvMGRNLm
	Apz+SnDsEddRcGBODq6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc66r-0002GZ-TP; Sat, 15 Jun 2019 10:40:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc65f-0008Ia-Nm; Sat, 15 Jun 2019 10:39:22 +0000
Received: by mail-wm1-x342.google.com with SMTP id u8so4597739wmm.1;
 Sat, 15 Jun 2019 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqWd/qVeeNGJLrkCP2JUFMQSQXMsBJtFqxofheHNWXk=;
 b=fuKDebUT8TsEdWgZzpehH53vOrTTqVVxivh6FDxX6NCHu8uJ/oiWb+z+jGtfWs3qIN
 ojtZXxPH9da+PV9kw1SCYbdBoFXvJv/EQAcEjdkptXXZD+HA8CTRjxeG5zJyxDSLAhDb
 ySEUTQK23Lbw/mKTb6LonhZG8qF3yF6wewmfyd0N81D6v9TO+nfIiTx0HIV70OPvs5CA
 EHihMrLkp605aEOvaU8r3sLgShlXeSuqHSM6ObZhBkSKwjvVA1dHxP/0RK54GqLUP3TB
 yLdfwXapp9nXbdjitlh4IWGBbKWeA9mYfePr2ClFHYIpOsqyRtZ4QEaj9OJcwuC71EI5
 taTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqWd/qVeeNGJLrkCP2JUFMQSQXMsBJtFqxofheHNWXk=;
 b=PWOQDVFUEbfOhmRqAF7qDZM1paxED/jf/2+RIrJuHVFNO2mbQeIbvoChGjyY+EUivo
 eJw+j+urJ4arZmAPyzcCSaX/44iWz6QciTp82rSX91vQNIIKDWX3Qx1H1H12046SOyFZ
 IsJMPyz5tECaWk6z/P6Bjj1Azr0lubwz0ymtiL2FVYmjlCS+M0X5p4xB+qxI/RE4azB8
 hzDilEj7pBZqd9kWDGru3QqbsEJydIc3imDNyduGTrWRnGMTkpkmPIQAW+rptf/BY0Sd
 Ck0G7dJ+w/AUX8LDsI52Hmj4lYbxRB2e6XQBAFKzBOa34AzklLZj41eykN0gJUTSz9Mc
 MH1g==
X-Gm-Message-State: APjAAAUjG3BYHddJTJwZB5Lh6iywSAdbt/56X1D4AJ4/yCmM+YjI21kq
 DoEPA9aQ1ZmBwyJIzLDA6CwCyySlGks=
X-Google-Smtp-Source: APXvYqwqvus05/JABsbGBZD+hMbcsTtFNC/JJ4BlBVVmPUhHLms3DAEG+Qg+dLV+L2PLpNGIoAmASQ==
X-Received: by 2002:a1c:7e90:: with SMTP id z138mr9645089wmc.128.1560595158121; 
 Sat, 15 Jun 2019 03:39:18 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id
 o126sm12209031wmo.31.2019.06.15.03.39.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:39:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v3 4/4] arm64: dts: meson: g12b: odroid-n2: add the Ethernet
 PHY reset line
Date: Sat, 15 Jun 2019 12:38:32 +0200
Message-Id: <20190615103832.5126-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
References: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_033919_887006_E473CA51 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: andrew@lunn.ch, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The reset line of the RTL8211F PHY is routed to the GPIOZ_15 pad.
Describe this in the device tree so the PHY framework can bring the PHY
into a known state when initializing it. GPIOZ_15 doesn't support
driving the output HIGH (to take the PHY out of reset, only output LOW
to reset the PHY is supported). The datasheet states it's an "3.3V input
tolerant open drain (OD) output pin". Instead there's a pull-up resistor
on the board to take the PHY out of reset. The GPIO itself will be set
to INPUT mode to take the PHY out of reset and LOW to reset the PHY,
which is achieved with the flags (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN).

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index c3e0735e6d9f..82b42c073c5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -250,6 +250,10 @@
 		/* Realtek RTL8211F (0x001cc916) */	
 		reg = <0>;
 		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
+		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
