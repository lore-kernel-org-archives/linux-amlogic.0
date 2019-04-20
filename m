Return-Path: <SRS0=+F2p=SW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630F5C282E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321C421855
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyPLS6oO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DkVfbgQv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 321C421855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEUR+gkp4OkkaCpN/P+6T/2IXndUUEaOWcF1EbOkuW4=; b=eyPLS6oO5T4acs
	/JijXsWogEEgkcstZSyugsfn46v8EKwYBANJU9/JL7WRa7c1v6Ztn+v8R1kKf3Y/pkws7oXl4ir4F
	UKj9vp6mcpP3GIKxep7DF6JPuZkB+YirKR6JZibxvGve+jvazo8RX0Hc1oDMk/lxMESGLqollV8aB
	Ii0XBa5vUqkHFbFgvsBeRQZl1dZimaSMV48fSB5oaht/cuIurDpmQ4Y0/aWx7cy/sibkW6UzKG5Ox
	tuQ1sjYbEU9yYtJMEcQdXiM7SakoTjHCWX0g0K0GNK/zv/lLnV23cL0g197yba8JscsZrIoGvQVF1
	PPNwbBuVxp7hxOGGzpsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHmNB-0006wO-6O; Sat, 20 Apr 2019 09:33:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHmN2-0006mL-3e; Sat, 20 Apr 2019 09:33:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id o12so6307732wrn.2;
 Sat, 20 Apr 2019 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sQ+tn26yoSTxpsC/FCAOuzkhs/vTmJv3gslqGviFWhE=;
 b=DkVfbgQvvjGuK8Az1uYDPffYw0jFhUcl1uDHsogv2Rv04vz3a2Ha7GWX2FRfzWD/ox
 pbnOIbslpKUFJXdvw5PL74GVtw40g6gPzQb7q25fdcWEW/sYKnLQjsfrozOiFzHqVn1S
 YgSpWncgsblFP8x4FqFO5LV8RIizrTt1p7mIXynsBq9CrNonUc8UHNgXGwM8dKsSQjmy
 gq562idPbg+kFBv3BOT3uBioX/evlN4I2YibH62hi6Ar2lbpt7hhcP8lkmW5J467JWPJ
 rIE1DjSn0+rvw9CZIKVJXAcocidaUQQa+4pHvAz6gLL6oWHwViOe8MfOWE+7qQxIiIOC
 oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sQ+tn26yoSTxpsC/FCAOuzkhs/vTmJv3gslqGviFWhE=;
 b=dXNlSYLnFj055fmcbB5NDRBThXEjw4GKGPsvFXHtAXBa7+4mbOak5ldIUZamzI4q1Q
 cOh4AQwnfpv58L5B4rjy9VetZMj2w+Io/iPQ1WNW2aVw94cj4s4jdHzgKPYMapEzYHhV
 o/vFKi00MtFD44VC7SVqW5j8u6KQB/Rxd3pyRO6eNxpCIoglxBN7IrOZjFekZvbVTsBa
 LK2P/sNZpIhWfNTBZFcyMdfBbctqwfsTLtuoFNRPhcw/uNYkLnTHUARaKBVrcf60b++o
 14gjEe60uVFvOLXxoHdzNv+u21zERBDoY4ioNSO3lMDtv8yb4VON5yopJUqgGqLzegwz
 Oa/w==
X-Gm-Message-State: APjAAAWYZetJfKGmxhBGwH0QSl5Mx8YvIoG/AKZmRLlLvSpnnOhyDPwd
 VlKm5REUaucUmLD3mUOQu2noyfeL
X-Google-Smtp-Source: APXvYqz44BVdQ6SIXDaTxW3Sxyrgkr340DMrA9/sYxJIqOgJDR+MEBnI+oqq4Oqs6aHOt1p+4l7XyQ==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr6365248wrp.129.1555752794023; 
 Sat, 20 Apr 2019 02:33:14 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0028C4739A57449001.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:28c4:739a:5744:9001])
 by smtp.googlemail.com with ESMTPSA id w11sm12858244wre.15.2019.04.20.02.33.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 02:33:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/2] ARM: dts: meson8: fix GPU interrupts and drop an
 undocumented property
Date: Sat, 20 Apr 2019 11:32:57 +0200
Message-Id: <20190420093258.2012-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
References: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_023316_145292_1BD4EE39 
X-CRM114-Status: GOOD (  11.12  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The interrupts in Amlogic's vendor kernel sources are all contiguous.
There are two typos leading to pp2 and pp4 as well as ppmmu2 and ppmmu4
incorrectly sharing the same interrupt line.
Fix this by using interrupt 170 for pp2 and 171 for ppmmu2.

Also drop the undocumented "switch-delay" which is a left-over from my
experiments with an early lima kernel driver when it was still
out-of-tree and required this property on Amlogic SoCs.

Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7ef442462ea4..40c11b6b217a 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -248,8 +248,8 @@
 				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
@@ -264,7 +264,6 @@
 			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
 			clock-names = "bus", "core";
 			operating-points-v2 = <&gpu_opp_table>;
-			switch-delay = <0xffff>;
 		};
 	};
 }; /* end of / */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
