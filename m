Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98487C4646D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B032133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aolztyzy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hW14fZOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B032133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQq7k50xxj6uEQSE8P8QinkkAG5rGwJZwO4oJodau+M=; b=aolztyzytX9kYA
	g5pvNpsbHOFruuJTqRJID4YxcdVssD1GbDCz2wVUaeC3T3TsQmcGnjw6uVtmUJCz1hyB0I4t9qphL
	+73u5u6yB3ZUQZhyy/9vce3Myf0wiqFXZ5W47wCIS5AVn3Dhrgsz0DXkdlUfIZXD6cSpSwxHwzQHb
	pH0B4BhHMFIXaspNiW2c09UCcmIrL+TytnNu0xXEJPcDX9FxYPVM19j4CZLsQi+HIosp6Z99jt9IA
	V9+6S6hRQJMg2FMZ55DpAOzdpwlayNStwFaH+6TIAQ2Y/JR+hWBYtehBk0rItarZJb4P+9eQfKUsH
	v3iDpL9QBU3H1i4hyM1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhttk-0002hn-QV; Mon, 01 Jul 2019 10:51:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqS-0006jX-UT
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id f9so13231603wre.12
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8sM/HnNuJjRWY+rt2JMg/RY9zhPGzYFwgmUvpAZUJI=;
 b=hW14fZOPSzk6UX/QjIdp3cq3rhVDpryRuT/4AdMSNpLtZHSS5SN5YM2X2oMMRRozGE
 W9qD1uFpQfXRcVBWnjTDSZa9AX3vBIcABnI7Oo8txFe5N7z91+Qhjo/3wdh/6HoX25Wz
 0TZWhPmIPjR0buoDyq9glGNxHHqbufpOb1HcNTCsFrNI4khqEAmUGARsH2SqN4mSM6oy
 ybdJ0gyn9ryE1sgfh4+DiYye5IXkYRqele3wb1oyFb7Ld/sEyoa6an7LT+/amfb83e0f
 +FXdJBqK7bZCw53gkkeLkKw2zO5syGWsbA15ONVA7OSrD7pgFX7Ipgklg12pIgxzQ8G3
 HX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8sM/HnNuJjRWY+rt2JMg/RY9zhPGzYFwgmUvpAZUJI=;
 b=qiv7pUW1JuAJApgD+7e8+Y1OaLlvDt1PnNaSEOtgUXReeGXZvetcJwAD4I2CjZAx+K
 JuRph5WaRt/erZ3993Riiuww3YuWD39LGUgoXjl50MLXXArpfrgImCIFTcryP7hAMkJ2
 TvYPuqc5C0v57RzAumlbPbJYlUaJIj/Vav1MSbAxQglJprpsQ0WiB8ADibRsinrOj+EJ
 aX+RLdE/wtKny6tNgoHk//WG3ec6m6Ehu84RJwimntGhcKFVgfhMPWa7BbY4LRTlun6v
 yrs62VccJqENgQLIiqwlMFmqA2B01VVsUHDBnvCTFdYMciYkhUSHTidiTtxIgZyQnWd5
 W3Zw==
X-Gm-Message-State: APjAAAURiN9B70R1EDzndxZWaYIeVaOYcjpEVI552zUpSiSU74PABRPz
 UH96YUzSttBCA3ldOp0CwKik7A==
X-Google-Smtp-Source: APXvYqyvZrofC8pt/Phh7KaZcgrbDtY8HT8ZChdGn4dtfDOnaLItYIGb8JCn6KtB2wj5NvFsw8KwFw==
X-Received: by 2002:adf:fbcf:: with SMTP id d15mr20030929wrs.50.1561978055347; 
 Mon, 01 Jul 2019 03:47:35 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC 10/11] dt-bindings: arm: amlogic: add SEI Robotics SEI610
 bindings
Date: Mon,  1 Jul 2019 12:47:04 +0200
Message-Id: <20190701104705.18271-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034737_065477_F6341FA6 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the compatible for the Amlogic SM1 Based SEI610 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0b419fd0bac2..ebf707165d73 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -143,5 +143,7 @@ properties:
 
       - description: Boards with the Amlogic Meson SM1 S905X3 SoC
         items:
+          - enum:
+              - seirobotics,sei610
           - const: amlogic,sm1
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
