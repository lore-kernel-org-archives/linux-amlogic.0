Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A315C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53C220870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+wGtRN7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VCrGc7kU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C53C220870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbWcpTWYpiZ7gPKKnhCPhDNqRd5WNha8N+0pomu3lgY=; b=O+wGtRN7HIo0gT
	biy5s6ZWIiZx0gu+3YHnWAVjMMqROqKE19zv1vXheDBUoLjyUX0JbTeVccLpJmNMLZMFBVY725JI5
	htZfz/g5d43+2WsAyTizEKa9+p83Ta2AnURP9sb+9mZMG2G5sffKIKpygZEHajpJNKyRg9VgkToXv
	Ck64keVeMv+UL63AsBAClXnMu3Koat2jBdIPTWBLilLmZHDVLThwIeNsPZWcsD6SLbjz9AlQ2LOFX
	WlR++yXnhhJWiGkjf+tc5vuYQ9s8VQWe8jzxfUmvOe8YcE8OtnM+CQxCTxFr8mwHS2mOlnfIrgkVn
	aviUD3Z6kIRsjqidJ5LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MeF-0003Af-Qw; Mon, 25 Mar 2019 10:16:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MdE-0000wD-Je
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id k17so1432061wrx.10
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGh/bbaqKCOThumggThLrmBLJwz7e2gPGPo9vmyZO80=;
 b=VCrGc7kUfYbEsXw57eNOQBuESMeV7hUKZmhur24iWOCjJ50V48ECW2JvtLV4EDD3W2
 /Rpj6jo0wOT3y/H2apFAsA7wjj+WLRJbcPeRCPrIXSL3117rWHXnWEmJmH7n28s6AJ4q
 eYmgs/Wol7d3EUoh+1FaD5OilsO76Ees3oyw9hzwVF4aEQsVfcM6PWSszAtLV3QmDWZa
 rjOANiaWNewsRD18cIaYoXR4bKR8dmT/qXBOYfGNVgJwXaD3CqspR65rGowmfKwnXrUq
 t6urzobbXJkj2tggyiIxzpcAQ1yDwtS6AmXMifXLHYr9cx0Qz1OHvJiPt/hC4fdfuIPs
 RDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGh/bbaqKCOThumggThLrmBLJwz7e2gPGPo9vmyZO80=;
 b=Ts5GmCKdhZux9mZZog8pjGhWsz+xjDl2747fg6mQUsOpUkm+OO2WEjuqgXMEvAISLI
 tlxHOw9t+9z6jhKRCGG9UGvW2lT3kwIysVO50JH7pjpTR32dKXSX4C+a6SY7J7GI+K0J
 F7CuWb4Jd5PNcWGPLc5yvhRhJUTY09RXvF2FbEA378NaUrJfStSx/vk0MMkOVepuaeOL
 TmHck8AVbha0nO1a7HY1UzOaUO5W79OOAoN1r5A+bUM95wwGlVy1jcghMVGDf0M1Slnl
 xk4MZJnjgBT9jwWK/sTRnor08BdNAy1Qkz3k4OsUWwS4b2DRjdNVThL+g7GlS87PTOOq
 n1bQ==
X-Gm-Message-State: APjAAAXY5VL+Dye74RAkKudPzg4ObZ6VV17CgKyFgLVt/1+86mA2K7UT
 5IJacVgCnU95e/xgjoopQlLOzg==
X-Google-Smtp-Source: APXvYqxofpZWT8De35Lex7hD5td6XL5zU8jbsjN+raCsd5szalnxYOmVxw3xkD+0cKZLAXbE47+/9g==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr14381359wrq.209.1553508902317; 
 Mon, 25 Mar 2019 03:15:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.15.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:15:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 6/6] arm64: dts: meson-g12a-x96-max: Enable USB
Date: Mon, 25 Mar 2019 11:14:53 +0100
Message-Id: <20190325101453.3009-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031504_646803_21953FBB 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 and USB3 Host ports on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 0a6919523ba9..b5b88262c06a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -107,3 +107,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
