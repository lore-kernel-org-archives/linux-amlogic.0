Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD61C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 18:48:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105A42085B
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 18:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w2JViJm5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wfyVNimS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105A42085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8f+ngKucZZ4fA5VyDBGts6VMB5Yzq8x43r/h1azzFQ=; b=w2JViJm5elqqy7nvW1ZIQ7xv0i
	4kwB/lnheEFZ6PAO6etAx4c38QeLzwIQgnzJWYJ4N4P/VNblEh6PSwDIttV1ZDSFVKYJXpsQD9dBl
	ayXDln57Fd+9veImHaylUYeTR50fIqz/TN4LSTJOrbP6kSiEcWIJyy166R5IbkzaPSSBH0VC782OU
	haxvEPTWaNpW8gTXMS8JKvlwlMiLpLIQKGsdBBM1/xl9x4CGAF5XdSwNOdQc1ahxQd0FFEk21NRK2
	JtbDY3L7jeVRE/z9fC5J+L0bUQ2xRYk9w4kseSk6xYlyymCK4gwMeMmdqTvOER6q2A+kz+RuW72h4
	MUQV/siA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX7XE-0005qk-9m; Mon, 26 Oct 2020 18:48:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX7XA-0005pO-Ko
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 18:47:57 +0000
Received: by mail-pl1-x641.google.com with SMTP id f21so813854plr.5
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmXFDnNMVMPDv4pMNaOk4nwtehUNz0/Q2zFukXCE+cI=;
 b=wfyVNimSxLMH8y8y3Vv7iB8gxowuoHuQDki16Cmbtrp2AJONCa8yGPtiKjj4cSAV2U
 YdcKi89XNEM2RD/L/9C8czYcgfiTQAnKKVaqjD4dgxQvY2ezdeUgj9esquVAFqd7090X
 4eQvjWkMWy/S67Ktf3aPwYdPjBHHgcheknEbX6w+PsDbHHfI2aNQxdchvuUGh8X8KOUq
 4eM+Z1cB7k0FPBnkeobv65ueMoY3SlV9blVGn4vbDPngI67E5QyfDvh1dgxW+WEIV+Vh
 lvhA5oRnWRjR9LLk1IT4wMedNy8Kj6vv1p/+i0uVsdKxLj/2Fa/kHYIaB48/pJhVy30Y
 nYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmXFDnNMVMPDv4pMNaOk4nwtehUNz0/Q2zFukXCE+cI=;
 b=mHzfSM/zpv8faUx4Zo7BfATY/VfCWDSN2rCRpq8ihYyE6Iv8haFCMDpgpho8fsD6kf
 LobSwkRQXFXE8zQ03gFvoy55EEuqk239ulj8/AhptQspADn/LjAeNAp0tAOFIbrPMZ3A
 YpMMqR+YHa2Y5nMn7kItQJsFZMfv8xoQrD+yOEP5VJuCf4YWsbjzhzwAKintx+WrQ58Z
 EasBxbMMs5DsWs6gq4K3K8x3P3C8u3+pB5GVQvtrvjqCbZxB3sAJmKhj8z4l0VNs50D7
 HAfilX5oCEtnwUcJeVQAwEK+LB5GRRP2Sqw3n0/7T6XiqHVAmRqX8HjIsvB2Hh5E8DBa
 CxcQ==
X-Gm-Message-State: AOAM532A4Z2aZ++avM+q2N6ZA56L7VZpSkZd1ZofzaQ/DeM5tmmw7FiJ
 XlOzd4q+UqEmQB83Bq9XP8mnk1sH8K2zUlRM
X-Google-Smtp-Source: ABdhPJy49YPHd2wf9JvJIvrRBJDHszBaxzXQBvy+ZLOMD5ef+NGHWSCov1WGmAUVBR+uyQltx+DDiA==
X-Received: by 2002:a17:90b:b97:: with SMTP id
 bd23mr17249604pjb.12.1603738070155; 
 Mon, 26 Oct 2020 11:47:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e2sm13360161pjw.13.2020.10.26.11.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:47:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v2] firmware: meson-sm: enable build as module
Date: Mon, 26 Oct 2020 11:47:48 -0700
Message-Id: <20201026184748.37028-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_144756_693447_8A933815 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable secure module driver as module.
Default remains built-in.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
v2: keep built-in as the default.

 drivers/firmware/meson/Kconfig    | 5 +++--
 drivers/firmware/meson/meson_sm.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index 2671dcd0ad92..f6f9d831ff8a 100644
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
+	default y
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
