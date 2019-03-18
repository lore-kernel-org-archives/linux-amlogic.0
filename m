Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFCBC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB3C20879
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cLZmDhsn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wQB2iOYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB3C20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt7dCaI1KEMpqjgY54IOjYT025p14uaojhJH2Zq8PfQ=; b=cLZmDhsnDWj5Yq
	YKYUqTCD0Rw19LtWWz4HNMiBVidO2nbkonvB9A4NSFhD8/UUFnpxVUjKPkjAIiLFZHL+PBzScg1aL
	Qu/3NYuhbVFIcfy6D4GPvvVvgybtOo1RJ8yJmYB6rwBnmqeNalmU0fWjSGIhU6y6Od40lOl2f4BhJ
	qbIAfBiXZEMYD9ahXr6mXNdOfqTT875MI3ntCDTzwaeFsXtB5W6GIlvOppTlBmYDWo3M6f1Dq9JgB
	ailE8ugo2C31F3p09qxXxbfWqVY3vv4g1a5YSOTsC0KnoXDoGPKDSOAVfA+WmZl4ferGzi7CP773l
	UN3yU4U+IaZj7EZcs25g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p8y-00011q-8r; Mon, 18 Mar 2019 10:05:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8h-0007z3-JK
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id w2so16255917wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWvS9QxnFmdXHeokNJBgpYlCnjX8I5tKgKMXO5N+5pU=;
 b=wQB2iOYsrdwO3a7AdPyp8JrnfiSSUF22RMHTYOCjS9tyK07DzXX6IASMrqYXnrQNVy
 3X9LHor2cknXREwQ24Wt1qqE54PE2AWieema41QBqGJaWoc3kLxSS6h0Gy3EOVMtw3kV
 JN5wrp23jHI/W822CBU82kvi5T8ioYEGEsZiGVNyWCSEQBF1h6Po+bwRxqkDSPl/zGyO
 yi/39jY+F8hcDmMHrNkW06tBsnrebhLS2KJqQmNTVt90yckwqi6I92FxjHXWJXME8HUC
 GR/rWzKRm4w3+Xo367QY57fEQzqQFrtZa+U7GEtT+JlYz7HvEWU7WJxwHDHFhQ/Sid7J
 8bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWvS9QxnFmdXHeokNJBgpYlCnjX8I5tKgKMXO5N+5pU=;
 b=PBdUs04CzFSQs30su4mXOn8+qkxjhMh2i7hqilnXhBy8E3m7LvZ0Cupv85dSSj2hth
 F/W6b+V2FF2q2Xos7C39lmeOb3fCQZAnD51TKCR5aoH4jCwX9d0BB5ZObLPskAjW6Hzz
 RmVQVVdT52GoqOsP3UM2ravOWfX8b1nbPfsJ83hyBmVkk+VvPb+Y98Hl7TBllz/fxZoq
 zCgyfNutLULAxDuY/uR9+S7FXFAjiNDAyxKJI2iCa9ElG0I4z19P1DMxpaThtHOZ8MLz
 P/vyCrBKJb/fQidlPSHN0xkFE1mpAIM3BpO0Jjhz1QdYrX5VIn1tZK1Fajs7Z6fK1Tm7
 7WeA==
X-Gm-Message-State: APjAAAV42cfOwAT1xQ6eCMkWqDHcX2A55EJN69g4ytnozj/WekY4vhCZ
 OEGKylehXHUL5JZgBPn60c+ynA==
X-Google-Smtp-Source: APXvYqzi2PdGTcKwPJao/OW19AdYl7B3Arz3pwMvPZ5GfB65baLNEK0eKNlRPO1ypR8xwgY3Vb4FzA==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr10919218wre.327.1552903500946; 
 Mon, 18 Mar 2019 03:05:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 01/11] arm64: dts: meson-g12a-u200: add uart_AO pinctrl
Date: Mon, 18 Mar 2019 11:04:48 +0100
Message-Id: <20190318100458.5619-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030503_642429_BB12E5FB 
X-CRM114-Status: UNSURE (   9.76  )
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

Add pinctrl on the always-enabled debug UART AO.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c44dbdddf2cf..f2afd0bf3e28 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -25,5 +25,7 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
