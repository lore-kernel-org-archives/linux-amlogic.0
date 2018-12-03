Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97F2C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E15220848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tl+frHzj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V9y1fEFC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E15220848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myvzyk5rmPZmOD9pg2Lvtiq1lTLuoKmDacGpxIML3Zo=; b=tl+frHzjkTfe1o
	OgqajhYivYfq/xH79GNNT1LIlJKZFfwX4zoET5HBhOan3V9AUS88UGPbj81MhUwBdX8VyXO7BmtSL
	9AH8hHw37JqlO0x2saHy5TGQi1CN3gsLVFHUER+pI4ljNW52qM0P23HLIoURJIMWXdJa1GR9PyV2/
	JTzCLjhuWOONasFZ1j9FTZfBYnrC0F6K0BSZH/puQG9jGgQQLL72F0weyUxeYkr2H7gXXtDZTgATB
	Uo9+AbORlqUeI7iG16mwFUMz2cVOzpGrqP8uBnmsRSGaYICNFG/+DS9/XM6DeonQ9KKLJMTmd6RgB
	+bsWqCqptVc9+MjiU7fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTrqK-00050Y-DA; Mon, 03 Dec 2018 17:17:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrqF-0004xA-JM
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:17:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so7465916wmd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
 b=V9y1fEFCuD2h5uN7uD+DaVzIvzU86Lx4yzK6uxuJuZvEHPQcbmWNar7+BPBFt0RiPs
 uRKiBU5QQRJban/13TYK4baJkz4fVotz/nrqAvbhsmi+pAnPuBFjeCsYWCY8geeJ+ToC
 i4TyGm711cHH8ce5XBfJf+wRdW0oCYC9xcfOJAEt0RyO40tBskPSAefFQ3cBg0NT4pgB
 rXwt5U7kG/81STgqfrGTu+0khzDNlgDw/xlEulmgocf505qrCa04Z9l+MCPkFluTQhR4
 8NSmDGwm9W0gONByiN9txLhjn21d5IWDEMBbQQAlstFiLc/dr0DwMSirS6fKhYR3LqR4
 jnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
 b=Z8iZXjRnKSAI80viYCF3vmzVt2mWl1fCHSd5CXrLGSeeAlXk6+f2xzGYvxT90n4WBC
 lDa1ULtxR6DWznjpsvn+JWk4URN4RcezVuzezzmEoDxfwQl0aeB4dkIz6gcEslT5DqlJ
 tQZ0ix3mwZsZ5u2kQXxX5CHwJu8mDPtTA+bbqH3hy4oCIwgon1mPpbVyooHlsciD6TLJ
 jODwANGq8imeZ7TQbi+YwLoRcEbgHkorYcozZnbIrUx6qyqO2uZSJUmixdCUuVOLUtZa
 /4Ruq8dqU9IC46kuXuJ2vmTiC3xykGTZrCeB3IM0z41Zd1MPvJZb3Xw25G8gG/l7E4/h
 DcGw==
X-Gm-Message-State: AA+aEWaIH29bpv7mXg1qYm0E76e6xTvfrKdrkRaOt0eRX3TGBnjCKclH
 RMr7+eYJU74DbBd/lNB63BiUKg==
X-Google-Smtp-Source: AFSGD/V/bsrlHrXrvkgFoGA+uzecY9c85wUSZZyU7a47Du3yA4aU8OlPqQZ9CUrVa0WkhYEMFcJjwA==
X-Received: by 2002:a1c:588a:: with SMTP id
 m132-v6mr9040728wmb.85.1543857418700; 
 Mon, 03 Dec 2018 09:16:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 h203sm22494889wma.19.2018.12.03.09.16.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 09:16:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 2/3] dt-bindings: clk: meson: add main controller clock
 input
Date: Mon,  3 Dec 2018 18:16:39 +0100
Message-Id: <20181203171640.12110-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_091707_666133_28B27E34 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..a6871953bf04 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,9 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks : list of clock phandle, one for each entry clock-names.
+- clock-names : should contain the following:
+  * "xtal": the platform xtal
 
 - #clock-cells: should be 1.
 
@@ -31,6 +34,8 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
