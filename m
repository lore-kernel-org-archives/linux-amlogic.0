Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976BDC43457
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:47:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47E3223FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:47:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KsW8/1Cl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XbinKz4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47E3223FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5N6Qzy3MDz5rVW4C3DKEv70A7DQ9ZEviyPGpAgzhn+s=; b=KsW8/1ClnTqfmPHXcugTKlSkjT
	ukfC53X6KLs8SaKMy/yBQO2MAkODe88ekb/W7PjlVx+CEaH8Rktfh6WQGX6vrB2ctZ8xLaAKoPNVz
	ZGhz+jpPNDJMvA/kftXqFgn95p6yVy+ELtsrerKHx7ZSpcteeU7V2Tkqt/Kmqcx263z0w+SPxPRo4
	2T1s/7BY7lAZuFQbK+3v+eml6gUgvjfQfSZOa3b646uy92D8+VdRvKbQQFwKA0DpvKQ/mCfbygf46
	JHU4ynLi3dAWDzitUmK1596ki4NTbaWLpbP/MJwAkQ/chKj23KCHOc4lg8L5F6de4w4NS0dOjwt2I
	p5yunV6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUdvj-0007jU-3b; Mon, 19 Oct 2020 22:47:03 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUdvc-0007hV-AE
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 22:46:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id e10so872273pfj.1
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 15:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utrWRRi4VOUNJm/4AqrjKO/JoEH65pTqnADpfw2kkH0=;
 b=XbinKz4ObwuCyqEyCDkdP+NVEx/bzmPpZRAFCPlWJOUh5la8CojEvx3Mf5v1LHWzXi
 Kj8TKVCFdm6GLCDARVzRbbUfWj7gnM+DjRylyd77sqX+LYrXiHYBH/Q67OffET/RBpjH
 AhF4BJomvcYZ8nreqVFgJJNBXr6Tz3IIzcclyj/YrC0Xoy1nEJR9ZdV/RLxeGAQamRyB
 2zYe4W82HTmzp9dvMz6eF3iVdRQyCoiquTbWwlmldVWicrVfatD+mB8WHnakwIqK0NHY
 mRtLNHw3Fw095p2PMSaK4NyaptsMxvLsZ48bvYBMW5J5BRLiuqUp4N2aTty3XWR9L1Lm
 nddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utrWRRi4VOUNJm/4AqrjKO/JoEH65pTqnADpfw2kkH0=;
 b=PDUvpQXZVzqdHlSwooSP5HUvxuvgGUaA70q76LNN9ShTv8ksmpMXYPip7qAkEjbc0V
 Cu+jgNDNsJrtFeMW2iU7BH5iKkhrL4e2URajXCJY94PCnqlcOrNaNWueOGNIoETpZyn3
 u/L9OiNo/kqqN9whRHFWM6eyzDjmIm0h9858bEwYQtFa0IAnQLVFQzJ3cMeGiwVEGYB2
 eCJIGvHXQKbTWC3g0KUJg4E3DczUM6gDm6cjBc4fobTH1qZdim7ND2rTbwGCm7Wp7XZY
 IFhy+au11ixhTYsNTM8e6dfJm6jtLedBrH+Z6YSWpaJWdmTq1Ih03QIH3yjoNCx0K5zq
 Aixw==
X-Gm-Message-State: AOAM530WH6pkp2xsoAnr0NnlI4K8yckpZ3b3RBXtgHsMPTBh37V/b29s
 R+kxB93xpkLX+vifMwW7CFDwmNs8G80z7utY
X-Google-Smtp-Source: ABdhPJzkLAmtgTxZYUC2Yh+9Zyzr3xdMj+ZDX8NIF/4tUIDU/S2JwbALxOdnekodUpikcCbtwZqE5g==
X-Received: by 2002:a05:6a00:1693:b029:155:abe5:caa2 with SMTP id
 k19-20020a056a001693b0290155abe5caa2mr1810103pfc.39.1603147612686; 
 Mon, 19 Oct 2020 15:46:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e19sm31924pff.34.2020.10.19.15.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:46:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] soc: mx-socinfo: only build for arm
Date: Mon, 19 Oct 2020 15:46:48 -0700
Message-Id: <20201019224649.14302-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_184656_489429_5A9A09DD 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This driver only supports 32-bit ARM SoCs.  Only build it for those.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index 321c5e26a268..2d7ee1397d59 100644
--- a/drivers/soc/amlogic/Kconfig
+++ b/drivers/soc/amlogic/Kconfig
@@ -63,7 +63,7 @@ config MESON_SECURE_PM_DOMAINS
 
 config MESON_MX_SOCINFO
 	bool "Amlogic Meson MX SoC Information driver"
-	depends on ARCH_MESON || COMPILE_TEST
+	depends on (ARM && ARCH_MESON) || COMPILE_TEST
 	default ARCH_MESON
 	select SOC_BUS
 	help
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
