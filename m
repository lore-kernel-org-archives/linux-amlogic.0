Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7637AC43214
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F996610A0
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F996610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icEUy7zZ+fewxzxheIamVS+NddFvM2QkQIGMk/ulKMY=; b=MOKIAdpOg3ejFz
	rhc5DhcBEDS4jvVJjo0PMkST55lVTunblpwTu6LfPBbplnGchRqCsQ6rAeMgzL+wFjeES2QC84Hlf
	lswyQ/S2jMdUTULBH+mSsbu8xYXq/wWZJsLGzoFhWzJx5dfuactcaD4t54v+zwE7qsNfOnXiIonaT
	cz+zd6Lq0lPSM1QJ3Y5PI31yKmwS/e+A7P10ohtt7aaRIZUssEB9DeIFupXmmb0InXsIbTsp9sIUd
	iTDaLam7NMqF9PDQ7kxBjwFkko25JsaTFAm0w4kkE4W3g6gqhCE/o3jArDqw3M+NoSUgugXFq56/W
	R/9glBsjtX0CEYLTK+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLn60-009l7U-Ii; Thu, 02 Sep 2021 13:49:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLn5n-009l40-J6
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:49:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1501902wms.3
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oj4j/+RKPWZynb1QTKEYiXoK5GFx0DuIh0dsK+YOz70=;
 b=Q2Z7V5PgsCJ85ScYojuBJgHK46WzEFCDleMnYLwQ4pQnV/smerrBx8EXlxWwElHsII
 4cpj3+u5PI5T/KPeW7PzUon33Qsdr6RCOogPrrrTbyyuMiufJpvVrMUiNQlzKk3lwcMB
 QlMWnbWPDf6RgpUk3AsJUDSwW9yv2tzBUt7+14S6cvk9mqZfQ+4COlZ+zuvbBal4Lz/d
 JQnEman2NRmmwLH5QI4PnmRtR6QCDHuCHT3/UDgnGjF/jKo8x40HGeb1LAaN8CA2iwyr
 kyKgwhkP8MqwWn8Vmyv/tdWGJpZ73VLDV371iwCE8xtJrZPe9dvYhSJ0wkMWz5I/aQhv
 /HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oj4j/+RKPWZynb1QTKEYiXoK5GFx0DuIh0dsK+YOz70=;
 b=hTS7sQEXHKVSW1ut1AAEJvH54AgLauxK0BV/Xvicqv3KXYjfoZdR4bhq8r0eJpwP0O
 Oj7NM2eVo1pS6rICLyJw3tG4u2QTrgQOVdJCbEem30BmnqKtItmEcvEnSkkazAYy5x1+
 WJzGFU4Hpdj+fdHRFnpO9OVTi0f8TSWIwgCfCalSZ0/DfBJEqR+5erio+NUJXlXoRV5o
 HZxFAqfxa19djDz5DiESxULFW+O/w68PLWwK8OBalvRzHI6plUv4ddBWBdSz81lbg/1Z
 lJ7QvYQXF5sZShs423j5aJPSDJJ15p8b/Q4TCpWFuY323aIRXpcdwimzp8tdcWoDJ0JW
 n+8Q==
X-Gm-Message-State: AOAM530CuQm7TGDKdqLzlL6ZR9XZ7CMkRv+BABpwmnYyA4P/HRVPsDT8
 cdCYwUlsDXowt3eYQqd4p4esjA==
X-Google-Smtp-Source: ABdhPJzXWKeLkhVS1joNTc2NUQrEZ7RsSDad/Dyg9eBJNYQBgSa9vVh1As/lmTmZzAmztrcHAEMw2A==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr3250388wmh.188.1630590562305; 
 Thu, 02 Sep 2021 06:49:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id z5sm1710162wmp.26.2021.09.02.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 06:49:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org,
	tglx@linutronix.de,
	jbrunet@baylibre.com
Cc: khilman@baylibre.com, lee.jones@linaro.org, saravanak@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] arm64: meson: remove MESON_IRQ_GPIO selection
Date: Thu,  2 Sep 2021 15:49:14 +0200
Message-Id: <20210902134914.176986-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902134914.176986-1-narmstrong@baylibre.com>
References: <20210902134914.176986-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; h=from:subject;
 bh=owkhlb4ciqjjQmULPQLOVbgzD27XBXXd7036af5Wvz8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhMNYVFMjvCnxnhaNrw0vw+U5deLnZE1I3QXIFVD07
 OWgHzauJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYTDWFQAKCRB33NvayMhJ0ei0D/
 94rKxPedZsvrnEc1oCh+9e2Dw+iN18I5LHLklE1zVH2UD3Z82MiEiSB4ug5WNxF1bqsTYsfofVHoZx
 xBAL1H19GKYK9UwFBvt7RNj+4ahjFRxDtKx+hN7nxYld2CjIdpqs0pvBiVabZNRtcRphQ3u/PgPu/q
 OAJPcxFD1B0qH2x8zwUc56KkQjjQ7PgdbNHHMnWQwSA9pFCzkPVvwmC2Wr0zQ8qW8wsIvHkG31MZO0
 MuvzmxPcTnRPI2rT/Mfz31cPNUe1OxfIKkdpYj5c044djZD75QNnRbUydkZODdhSwhZPlNGGXBdngA
 JIrikQ/2+MyhNjBYgadk8sjiLRs9RtJykemEjqEB1Xkhcxl0qXz3MWpk4nLWRm9AHWr3GxRQHTKGad
 r+K+UYpAzZaAinvsTzINzvX42P3A3Ll0oyVWeyXPJ1hVJfdXK2ZaQnXxs5f2+hcbxYVamwtetsSATk
 eD154UaAaJWFd0vHJvG1U8K6R6uZxC60Zdw5i/oXsw+yjjNkR7uY8k34iwM4K18ykg0iqGMPn8o9ke
 oCE05tqb0P9MMu8ghT+zWpwPwjQvRSUPZ6K7owPwNQv7N3Cx1bmx0zxTJkFDQ+wQH5rtYdAWj9zUOy
 mYlBMaeanC7iwARbjsxfJgrSfeNm3GJYvY0fObdhz9GzbKiY44RCoFirwvAg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_064923_681151_36C0A1B7 
X-CRM114-Status: GOOD (  12.04  )
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

Selecting MESON_IRQ_GPIO forces it as built-in, but we may need to build it
as a module, thus remove it here and let the "default ARCH_MESON" build as
built-in by default with the option to switch it to module.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b0ce18d4cc98..ff2d83fbbde1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -167,7 +167,6 @@ config ARCH_MEDIATEK
 config ARCH_MESON
 	bool "Amlogic Platforms"
 	select COMMON_CLK
-	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
