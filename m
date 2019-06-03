Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7444AC28CC6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C64E28050
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgZIE8wD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NDatLUAT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C64E28050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HD/JF/orRqCh10QvRx+LXnv5AGq3/Wva+aXiHud4te0=; b=lgZIE8wDYhntCY
	7WOWG9uu3YEK3+jjL8WjgACvlMg2X3PST7t+rs2ik/qRshDNk9+uVdzohKB2prh5Xl+nqoe2iBYvA
	AP/tJWpXGlHmrUMHvv0HaCxKfavk4Sl8dcgfQTIJmZ7Bhw1gMb6s1Z8YTnP5XzaFGUYXk6Y6CWBzI
	ltHi/wFsyCQgDHA3/gOYotrh3mQKSM1ZoAjsXlPEq/d7YrzNOI33UtM0V89YzDsJfwVrVCYs2VEdw
	icYQ+zCwQk5HEALh0+9wZXjCDvGVsL4BhixG67Mqdn7qCXvIxa3JhbB0AFynTrliRGD9UPGM3zYWm
	s7bpL3XOK4Ivd0lZv4sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjfb-0002oE-VD; Mon, 03 Jun 2019 09:54:23 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjZI-0007zo-Tr
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 09:47:55 +0000
Received: by mail-wm1-x342.google.com with SMTP id g135so7246119wme.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySITkoSpV5tz/0UidgwrcEdFJZVNdmdPr2B7jtp9jvc=;
 b=NDatLUATUjuiUD4hERuG9znRQfMuTUCAU4ggEVOIBP+FgVSRJt3WZaY0RrGa7Dwvb1
 tPXdCBOtf0m2SVVhC/s51PZUQLWyTn//g+w5QgkbouvAEZZfvo/hYS0Qvxc9mY1N3RDl
 12CLAjcT2rNrEYGTTAfmXLf/b4PMau58fO8Tf1EJrQQRkioz3g1D42ztA9XxEOAFB+W/
 su2WX/nD5EDsKD8vv14foqsrzziZLg0rVZSxVTe2nVknHPJXLy1BppZQLalDKIXavP16
 72N48w4vbmtGK60MSJzcw8yI8w33mpxO9I6dUgQOrevlX7znnciyGipSUQ3j2jUt1vHw
 bNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySITkoSpV5tz/0UidgwrcEdFJZVNdmdPr2B7jtp9jvc=;
 b=Ztq3pFTe1FsZvR4kSAq6lJJr+XKLdAF+SSRyBzxnkwkCfnlKlkTotttpRmlmCe+Gze
 S6MAYAqvzQxUveK4ik9tGs9eBSBNU70wn7r6gBhynYWOFEV9Y1H2Q841NFrEr9p6hiAu
 iU36gZ6QsDwZKx9se2/TRGkUI95eWrCyH+ZaJEsbnW39Yr9bjd8Q1cwGP2y1olTIwKl5
 gaieqe1QGAyr9mSxc1FyrGqtZwfCYAlI1CRflecRDrTRDtaXJkWMxsI66G5TTCq0rFMZ
 thheciSYbEOvU407bqJTr0k0Psmlo8dMfMUB+e3A1hklXkWVqBbsvGcCsmIZkqBAa9nZ
 l9vw==
X-Gm-Message-State: APjAAAXya4MCyq7GecYnsNljE4bERC2WKrTzID7voMy8voJlgOQ/Nh0b
 hMWLsM6KJKbMWgYkswD5lqkq0Q==
X-Google-Smtp-Source: APXvYqyFQyOwq3NatVmnOTvLBdiP1Y15tNjKDOOA5BlWh3lX91HYLp+dMM229VRYhDYAQ5xrcfOheQ==
X-Received: by 2002:a1c:b046:: with SMTP id z67mr1498018wme.49.1559555271273; 
 Mon, 03 Jun 2019 02:47:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm11235375wrh.86.2019.06.03.02.47.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 02:47:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/4] arm64: dts: meson-g12a-x96-max: bump bluetooth bus speed
 to 2Mbaud/s
Date: Mon,  3 Jun 2019 11:47:40 +0200
Message-Id: <20190603094740.12255-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603094740.12255-1-narmstrong@baylibre.com>
References: <20190603094740.12255-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_024753_313331_A9234E82 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setting to 2Mbaud/s is the nominal bus speed for common usages.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index aa9da5de5c2d..300c29dad49f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -206,6 +206,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
 		clocks = <&wifi32k>;
 		clock-names = "lpo";
 	};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
