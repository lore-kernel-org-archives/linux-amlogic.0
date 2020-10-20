Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82101C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:05:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55B42225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxMg79FV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mNmo5w/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55B42225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O40v8WCulpYFSXZhVMByvjgnNshzoor0cO2QRCVYA7o=; b=kxMg79FV5JIgZEiOCbbCP+1K2Z
	gzjlKhWZuegdGH6Z2LXxlaM8/fH4m6K1j35meaPnC5Taz6QyfDR7ftLPoazF1EzYmxYRmeU2OPVdQ
	7H4nuXK5MGSfXNro12sOu6cLDlhKvpECJlYc5OeVdODGtpmssa3jpe2tC5O3bqMmmbabEO7eivFVA
	ga0m1qrEon9aPzxbwPBbGUKD/Nf5Y3faeRP5fE+U3wgn8/wvfCW7C1mi2Xlh8O/gyRBhRqP5+l6J3
	BnPVMO7poLJCV7tcQujnEjB3djHHcr3tV8xWFGp+voo/BhfVSsXrZ2q0IuuH3sKv9nsavljyGy6pZ
	jFOdFV4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUyoo-0000JY-2N; Tue, 20 Oct 2020 21:05:18 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUyok-0000I2-VG
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 21:05:16 +0000
Received: by mail-pg1-x543.google.com with SMTP id x13so93815pgp.7
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KXVypqIvWnOm3B7Hxv3T8P9PLe8J8qEwDDYcpNWBJmI=;
 b=mNmo5w/rhI4+sCLabieJMsk2bJo93p4+np03ewIAlGzSRYgfdOUl0RtWtyypTrka4i
 UsEt+XxPuMD+Y7OpZoEXjpXV8ZPhkCrDd80mS3bQI4u4vrXTvDUlknPaEg2uGQoyHTJH
 ZfY7B1mXby5TgNI7/tDTcufkkMpWv06v9SRgdzFzIJwKQLKD+Q57ynnPMCNfkfzJcA1j
 GtiVyLNdCgO91hongi2Fcrjbv61wf8T7Zt5m6nL7YY5pPj58L3vNg2HoFl7XQloSMxw+
 xpV0AiEMkOn5Fqgp/OX7/hWrB0SZM362D5rIZ8EdstZMMZpH2tTxIt4VO13udbLxRjum
 vt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KXVypqIvWnOm3B7Hxv3T8P9PLe8J8qEwDDYcpNWBJmI=;
 b=p7PREwEafjUURatz2JYytFZ3inM/aB2CJPp3fbetDJQWoJGq+LtV4lT83K73wTXuPE
 ip/wuvIu0rCEV2ttXzsC8dbOF1YURPTpJBI9C8PFyMFiKKIktt07feIlpITVjnRcwrRt
 ZkTjUNzHWVogFAlkV3pDXfRcRok6wxEI5C+UrUuBobC5VWbrV/OJ4Yh7DFcnnTvmyJ3A
 dO0w+lvtGGa0iZ629PAdFvqklKk5M1ex6tYIrJawLB+jqP1KRkN+zg+oTzNNKINjOVms
 oiKFxkD46eD5n8FTA1g0a1R9BplqbVDyxFTudR2bnw7UjfcKZmPVXCdEzFyUYOBQA08e
 zMpA==
X-Gm-Message-State: AOAM532ApTAapywVNHZlREmHb3rvG2hiHeRgXy5HNtydHkGtMBI1RP4L
 XBe/TU/V0ie5zn7eoZA1FK5XGJTsrleB6CWi
X-Google-Smtp-Source: ABdhPJzovJFB6MxkbHYZQDR/ACXhNqvZVPpvDodify8tAX9jKGWkQGjvmPDNaBMWJcdswgtJyrhtug==
X-Received: by 2002:a63:fb50:: with SMTP id w16mr189536pgj.202.1603227912486; 
 Tue, 20 Oct 2020 14:05:12 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 20sm3036811pfh.219.2020.10.20.14.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 14:05:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] soc: amlogic: socinfo: build for specific arch
Date: Tue, 20 Oct 2020 14:05:10 -0700
Message-Id: <20201020210511.20184-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_170515_083014_062DEADE 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The MX driver only supports 32-bit ARM SoCs and the GX driver only
supports 64-bit SoCs.  Only build for the right architecture.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index 321c5e26a268..08a27d9cbc7f 100644
--- a/drivers/soc/amlogic/Kconfig
+++ b/drivers/soc/amlogic/Kconfig
@@ -19,7 +19,7 @@ config MESON_CLK_MEASURE
 
 config MESON_GX_SOCINFO
 	bool "Amlogic Meson GX SoC Information driver"
-	depends on ARCH_MESON || COMPILE_TEST
+	depends on (ARM64 && ARCH_MESON) || COMPILE_TEST
 	default ARCH_MESON
 	select SOC_BUS
 	help
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
