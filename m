Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47438C31E48
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C02C208C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tc0PYHTs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rUFa0q2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C02C208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoJypbiQnkjzngkjB2BX1cwnnL/z4WtIFIY6L0UQ9GY=; b=tc0PYHTsvdWxeR
	GgCmT6dB6LqtTmVEUgm+cE5Ehb4+220oQNYwl1uywLucjfKbXJMUaQAU0XVcui6lstyfYJDo6CWeM
	4Ufz+8pUJPYUOLYMckv3Mv+HvXcXa/vFkorsCW7Jia48TRSh7mUKd/mnJq1vcmi4zdraz7EmbnwGr
	DBRHYHvfz8yuUbICJav0xgk9ievchmHai2nXMppBjQHIgRUS/KGCNCHclDZ270Wnra2BT9jbiL74h
	avq4FfeTzAThum76OegKtugCU7IRpeadhYmOqQ51yasCOfoDS8Di/2OgiqHEkAHJemKq6C8M9Oc7G
	+o99tZIZs/Bk80hzm5uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbAIp-0006Wd-JU; Wed, 12 Jun 2019 20:57:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbAHf-0005PQ-DX; Wed, 12 Jun 2019 20:55:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id z23so7895041wma.4;
 Wed, 12 Jun 2019 13:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/gDKxCzkOGRMbdoCC0wOn2Sy/Yhww68pPHd5X9PQ/go=;
 b=rUFa0q2c0ueMNjFCD1Ac5K6Fk3nNqiUfkEeny7sxh9dWEiE47qRnzWq/iyJskI1FN6
 TkvKq+3i0BEq+hEvnmDXfmeMkxmbmaEeWY7Al9ZAMXzhvuIb9UTLv4OqgxxaucaebMeg
 HglMyVVyQVo1UvCHaN4eTBCMv6080H2AYZzxmGKwLBpLGuZLsdg+A3gDjedobRasNnVX
 oaNucyrsFv/jrfCh0Qim+CfblXfOK1UP/F3mfsKW+kk5Lq2GmcyG9an87uJWAmMbNQxx
 EI32FZJtuNT9y8crY9P8KETEaPvzZOjxyWZSv8f5bsUX3LIc4AyJBC6fj12cVvNpwplH
 F5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gDKxCzkOGRMbdoCC0wOn2Sy/Yhww68pPHd5X9PQ/go=;
 b=etCmHbBiSGiUlhgbHEKqHgP3/IEtpjrztzp+RTLCrXtfBYrqMNkpgWbvKhKiz924fz
 XBzV/BeP5wisxnn5R70xBAPM0BiP2cgBQb3ryiDr/t++2wcntZfaEhmifqtpC+1tI3by
 Le7Cl36IE6OtKwSHJiaZe0yM2QxjiX9Sy5ld2Un5QoT3IFr/RXI4W3VSa6pUE8FNOulV
 KH1eopn/qNb1G/yYxmUCfYau6extu7WOX0YvHOUm0WroD1/AYem//6ZWOp0NCYOGA+w+
 4vcvYQlUgcbWkqHBhD4mWK5DQTIukNOXstsvUDdGL6AyVHZYmLcCsa/ZqRDmq9JUGNmx
 Qnew==
X-Gm-Message-State: APjAAAVn18LNmBa5OizNWN4fJXeP5kBPwu2InqXWPm2vKQTJU9h2bUO2
 6uKwSbwbktQUg5b4Ulvmvq1Hyrhm
X-Google-Smtp-Source: APXvYqzcczDON40ZlWQv3oZhlUvn1FVQLcLqir1pA8IDNtA5z7hDUzg0Hn0fX1zXP3GmKNC7Wsrr/Q==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr820317wmh.76.1560372949589;
 Wed, 12 Jun 2019 13:55:49 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s7sm3445793wmc.2.2019.06.12.13.55.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 13:55:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 4/4] arm64: dts: meson: g12b: odroid-n2: add the Ethernet
 PHY reset line
Date: Wed, 12 Jun 2019 22:55:29 +0200
Message-Id: <20190612205529.19834-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612205529.19834-1-martin.blumenstingl@googlemail.com>
References: <20190612205529.19834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_135551_465868_32A4974B 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: andrew@lunn.ch, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 4146cd84989c..f911bbdc4e70 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -186,6 +186,10 @@
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
