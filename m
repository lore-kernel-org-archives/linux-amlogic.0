Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B21BC433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92CC221D7F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NwRJ75Zc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iv8+/tuw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92CC221D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7yjWTjz6URZbIEvFSwomId7i53IAB4iLsTcFAZi0F2o=; b=NwRJ75ZcefCi3a9EMYC3CADGQ6
	dMBf2vLI9cnv+hhcLrMK0/yZ/4MDGQLOfWbypCmBgA0+ebISHbVRdJ37N0lbaYXSoWrMMDHa9juUp
	9XebTxsA2hc4aQ1oAVR2gXiagm1nyFuNRFyP4wTitK6LBwO+epu9RQA3+v0aYkp4IFk902z8rK5Wc
	Cua3mjg8Z9q392tyzWdmpYqFLyW7SPonsIqNic10xurA78c/y3NEjl8gU5bLx2v0/5ZlE7HU315fA
	tYvq3xUQQp0qsbOk83tBXCBC1r4VsIBfclEwA5v0JU7KapFIcmwMYvkXMsh7bOreBG3kJVYqOH6XH
	3EfwqdpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUdzx-0008HV-6Z; Mon, 19 Oct 2020 22:51:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUdzs-0008G4-Bh
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 22:51:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id o9so564809plx.10
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 15:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TES4RnZyDRnLnNSOat+JFNMFuzHiPplLHhKuNZBwSHc=;
 b=iv8+/tuwOhzZRQ1/87SVuuo+zg7bEvZgIAl1o4vBYfW6tb+WkOr1iumbfxkup4gF8P
 9pu5CBidWdq8BwqvBHHI4UxnuUGwY8VPTE/hCJbcnXxnyBvq9HZjhBsU6s5aH5uYIZDe
 cZKj8i1269VhVoYwZmIRf2HuHQ4YlV6uY/izYwGuH6N7OCmRKy1O1Fu6q/6rVHmvex6z
 MgHfynNDtfTC85rCeNq9xtwTP+5RQNDKYRjeSf0b9LIRopv7diA3D75gjJoZS8H2qwDw
 NG6KVueh0uWJGgZ5wsFWWxOq+9HSiuRsOv86XXxErGjwE4D3NSU8UgnjrBeB+hGWlAwX
 Ikdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TES4RnZyDRnLnNSOat+JFNMFuzHiPplLHhKuNZBwSHc=;
 b=VILQV8coizEUU3WySF8l5zUHOqfL6BMSb+jcT2mORqyd3zrGdiIsZO4m6FDgMPzBSV
 2bTEo80zrQQVmjNfxUWmFIvFaRKFaJYwwZe8COjIbYOoQ/4JiiIb1mKS6vnwL8Ptkfgs
 enI+zEpuTSlwxSNycF1cPbUi0WUVNQ2IC4sDQrUVlunwYsOhvfJqv4bCnpqMzVE0RyGC
 FS0ftrP6HDUXjyHC/U31cnskqQxCM+YebcIbR4yyWi9SpbqCRAW1zXURFiz+4YYluNf1
 PNWDygvlQC7AFCj6wZt3AURnp/b8NFxypYfdDbgqF8Gd1xiMldZctmQ1n73o9h8NPF8B
 duUg==
X-Gm-Message-State: AOAM531B8ETnnJ1eEAnw3LwyE/QD0OfD4vaqjZ6ZcOyI9g2s2n5hPagy
 1pgGFJTX5w9E04r3w28AecJNqK0u+d8zc98c
X-Google-Smtp-Source: ABdhPJy6iJ9heES8cd4NwT4fuZK/3k6/6ssqKzuXYtWBpBqPGY6WNbJIBUMRJtA7ZtWsXL6LCLkfFw==
X-Received: by 2002:a17:90a:be05:: with SMTP id a5mr42908pjs.118.1603147878133; 
 Mon, 19 Oct 2020 15:51:18 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v65sm552399pgv.21.2020.10.19.15.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:51:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] firmware: meson-sm: enable build as module
Date: Mon, 19 Oct 2020 15:51:17 -0700
Message-Id: <20201019225117.15690-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_185120_446477_E305B323 
X-CRM114-Status: GOOD (  12.89  )
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

Enable secure module driver as module, and default to build as module.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/firmware/meson/Kconfig    | 5 +++--
 drivers/firmware/meson/meson_sm.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index 2671dcd0ad92..5726b073d426 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -3,8 +3,9 @@
 # Amlogic Secure Monitor driver
 #
 config MESON_SM
-	bool
-	default ARCH_MESON
+	tristate
+	depends on ARCH_MESON || COMPILE_TEST
+	default m
 	depends on ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 2854b56f6e0b..77aa5c6398aa 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -331,3 +331,4 @@ static struct platform_driver meson_sm_driver = {
 	},
 };
 module_platform_driver_probe(meson_sm_driver, meson_sm_probe);
+MODULE_LICENSE("GPL v2");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
