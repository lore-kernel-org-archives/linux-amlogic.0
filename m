Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899A6C47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438666138C
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 438666138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUm1zL6j4sWUQWOKbTCqP37ukGfWji5+HAICEOXPf0c=; b=OXl28ZvNAI97V2
	OI1qKLSuTUZdArUYMWlnBIy0doWtZUyCdrN8UeSQ+9V+cBGsmt457HtNbLVyUWHv8HlTAV+TyVkyT
	aPcikYxwGy/anveP2fjJsaqC9hJXgoOSOnnHHNrJ/yBuvRgU6Y/1UFTZ2jjIENWGQj2Al60hLSLsp
	LT1gOrCQpd53PYa8yOygLKLihbQtDRqNpsSWK9zWL4zNLpQzgZpJBEsinMCuYOoQY7HJI4WXYZ1Ku
	MMQcK+A4+9//fwz1lT5p1hedDRYsx4MpvvDNr1qc7WXAtJSYx7zUprJah/SpU7Ptm2668bl8SbCTm
	SUXkWA8KpZC3SbomqqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0Il-00FUXK-HP; Tue, 01 Jun 2021 09:03:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HY-00FTzs-JL
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so1422946wmh.4
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKDRJmHZMttlPazPpLKHDHRMGULieniEi0dVs1UUNhU=;
 b=l5wDNWXw4cqTBt4syqV9crdRJqm/REl/4kIxoAwrGT2c5hlrGMjnP355npzLeP50Zq
 jTqNdXtkXoOpVSFqdBhrhHSuHewM+Im1hYCTjgRAALIcozGVYrnZKjNjSfnX4m8ZAA+u
 BXSXvecZmDPHQRq5UPJRCWSFDsX6OtFNMmi7dFsPFTWvty+JTXaF/Dw6Hl9Wb7uwPu9Z
 7zlQX+ntkocvYsheYqDMZjUB1eUoDtoMv8s49HV9Nt6gbnTDGzIVXQrZjPLXCgizZU77
 5j+Wkvs+upMPD3ny3YrlYHGmjwdib2lA0e1VoKf9Scdop5nKvr/fQTrOq9mW85unHecW
 5WsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKDRJmHZMttlPazPpLKHDHRMGULieniEi0dVs1UUNhU=;
 b=EyVvU8E8vFGkBehtj61rYGfkyj0ALy5+WDTKIqzUgZeBy9PNBlS4NYKVR8ROGBCX3V
 b87WI61ailBV0mPsDVRouPzCHmEnSO1BY8Vwj0n7uEmwflBb67akyOg2qdHFuMwwfsV+
 tOY/Bwzi/cQP2Y8d3E+cMAluf1bmvkRMBIWlmDczSRJYqOFFWO+blG4NnD/qMWsRlvxK
 IU6uOpfqVQZQH/cjvKSVVo4OJG00MhlzdLrUQWGdpiTBtv8tZawmlRFLqoUCiaZdOSfS
 je3x5p/WemUMlBEeYqWcI0A1UmGxWthTptod5GRU8a9YzVUi+c+kXont8sWivgHUeiny
 N21g==
X-Gm-Message-State: AOAM533AXpcGLqO1YXsZoX9zuQe8fPmPaIpWLafA4zAmwak8MLY6/Pys
 n6FEP/hbIkfbqtVv39GOOKzpvg==
X-Google-Smtp-Source: ABdhPJwb0D1ljl9jqkDdlMD1b5Tt0ywJhK1NOqRLW4VGZkjTCrbHVE5tB/0Tvu1x4KA60a6ZfQWkEw==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr25126567wmc.127.1622538109884; 
 Tue, 01 Jun 2021 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/6] arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator gpio
Date: Tue,  1 Jun 2021 11:01:37 +0200
Message-Id: <20210601090140.261768-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; h=from:subject;
 bh=+HX1gg32b5nfI1HpsRVt78lcl7f9Y+0WlkxAc4RatNw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc7dRy4QVTV+uXHTDrPa6RSP+kH0/tRtz4WQN/f
 94GH8xyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3OwAKCRB33NvayMhJ0Ur8D/
 9qjOSWOCqqeI4U9sOTWJdg9pm0MuOZCQKdpX9HhKHeOvbMwATil8QLbSfDHuxtnEIUIfgnGNBdThD3
 /M6+2whxepZJnMAnxWcA5MVfNyZrB94dU6aI2AX9+sApZgvK9eFAZQQF2I6wXz5ExnkdfLJlDZaxlZ
 63GTj1HZ/HS2KKvx9jUaeq/bte2wJSJ23uWue1G0sc5+ZR3PkOJI60758wlNx3KsG05B+kprDxxrR9
 22E9U9CE5Hm7LUt8vzH34SAWx0egC/37ETqBABrQOSxKFVIBu47BuY+S8+bIgvWrOZetS9ssQMcoKZ
 qINDH8CXqzadkxIm7+NWsaV2tySZfB4e/yuwqqLymMCPRvHUcj//cbaRh1//0K9SjotV6ncWSzIWNi
 pvb6k6MBtBYUdu1Yl0K/hdwR4PBFKLQSYP90NROKZ/bXXsGkzMFYhvF6XPKi5iOQdBNZP5nREzNkEl
 hqAgQNyc0rLinvBd6bLHLiUkOuaVzWuH9H5rAyxES6ZJ9iB/LBy/z5MIIC+xUvfCZN5NNQOcE/pdoB
 5WAP9VgXY5EV05QnCHFKaHCoa+U3SEDakqCejIZQ76tiK0XjkyLsHCuE5nbZVJsbhALUzqFFTKdj/x
 tHeMjvOeZroDfTioxAx9eSxW+v0DE6B94V+pcCakQ+m0E02eeYARvaDiCmDg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020152_662132_5E83400C 
X-CRM114-Status: GOOD (  12.68  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As described in the Odroid-C4 schematics, the HUB_5V regulator is controlled
by GPIOH_8 and in Open Drain since this GPIO doesn't support Push-Pull.

Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 8c327c03d845..63695ea21b1c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -31,7 +31,7 @@ hub_5v: regulator-hub_5v {
 		vin-supply = <&vcc_5v>;
 
 		/* Connected to the Hub CHIPENABLE, LOW sets low power state */
-		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
