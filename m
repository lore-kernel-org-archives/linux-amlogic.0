Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748DAC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 20:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FE220809
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 20:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9evE6jL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HFg2VdCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FE220809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OYOYUaSB3E963rKmANaeVWz3nxZHDv0ZfKiqq5mJXPg=; b=P9evE6jLdydnE4YxUxK0YS2H2r
	PN3nlMt9MR79JFFceij2Y49GkXeCWxWBi62jGV40xagcROGSPqPevS52NAJU7g/qA5yFNqGWYA696
	MTwU97W0hnWiY+7Pn/n3fVhmQwFRC1KFo7kfT61b1gYR2wBNrHBpvBdY1yhBdmQO93CRzAwRAUNy7
	1g6MSbveJ6z4F6PQd6C9DliRe9BJ78LUzSyxLKYHSufdr4IdFzjXzUyvT8UK1NYf0Wq56Ph6kjOIz
	mSu5YyN9zBaxnXimaacLnRosID3Kla/Hy25/SdCEtRrORBbXQqjyGnOWrJTEA6XHjzKzOkokm88se
	+lyVez8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX9F2-0002py-Ti; Mon, 26 Oct 2020 20:37:20 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX9Es-0002la-6A
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 20:37:11 +0000
Received: by mail-pj1-x1044.google.com with SMTP id k8so2092498pjd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 13:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gJsxrSn1ggR7Yn17KV0VJKAM2G+LzdUV6yeaNLJ4kfk=;
 b=HFg2VdCKpYuSdp/Rypp71b1ItZwNz1gkP3UbfZ/TvRiAFUJqUkZbHVx110TYXlPmDX
 Cj0r5+dy1FflvvTyu7YPE7K/0t3AVOqzC9pDv8kRyV9MLI75M8bQC3qPT8RopKfEF7D9
 Hd6e7C8SQQz33JSvhfyUYUmvBWYJKm0/EAoXF1j+XLf51CbsfcK18qtG8aCHdkYhBMLX
 k71WW0T/aeC4I98/2PWEirqpph17ZvaKzpOno1q/H1ctwDcM5N1uHiBfT3jNn8p4rMjd
 pn3vIEWq03ZyA2Tkp6JFgqqtvmev3NzirhXKs0+ikldfJrF+73BHvWT2ehCADQJsbTIl
 cUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gJsxrSn1ggR7Yn17KV0VJKAM2G+LzdUV6yeaNLJ4kfk=;
 b=LUiipfIyM5SvhZyDqy0NDWxJrw1V5i3BcaWmDhUnxNV9UUnSD3AoTHvThoCoA31kxy
 hU1Y1b3TDuDDeSWy0NCBA6+kX9aZkz1Vm0tKfbYDcWpZZrk8TmCVZ5GNwBAw41f11bpN
 1phNlYaU0hUhbbqCgWzmCtkMOBRb5OOHBgnL45FEhB2iAueiX65mYte63C2PNOO/kuu5
 b/JIcrHNqPjqJeVcAv+xwsYd8jVv7Kv0HArRDDb0tDXHLpN7wHdguAt3EYl2BK+8TF64
 jItCmLfqFTBSoz7uN/Jd5NGk8/R6XDvuO7Bo0UFhFDKiCatwip33vuA715qyJ2Nzjkpj
 IDzw==
X-Gm-Message-State: AOAM532aceY/tzEqMoogeiS75xZxWrfX8t2uEDXB1iL0qCjJjQD+GYqo
 IXtWD1fgo8K18p2sxMXIG7R88/bNgJgBIMgD
X-Google-Smtp-Source: ABdhPJwZjM8ApZhBl4q2MjlmJnSlHXjBMC4zueF3m/raga3DkYOZysnAVsrQACXrKcVCZop2FMuCVg==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr18452812pju.88.1603744627812; 
 Mon, 26 Oct 2020 13:37:07 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n2sm14004698pja.41.2020.10.26.13.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 13:37:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v3] firmware: meson-sm: enable build as module
Date: Mon, 26 Oct 2020 13:37:06 -0700
Message-Id: <20201026203706.39195-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_163710_241577_4D9758F0 
X-CRM114-Status: GOOD (  12.36  )
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
v3: tristate needs a description string in order to be selectable

 drivers/firmware/meson/Kconfig    | 5 +++--
 drivers/firmware/meson/meson_sm.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index 2671dcd0ad92..f2fdd3756648 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -3,8 +3,9 @@
 # Amlogic Secure Monitor driver
 #
 config MESON_SM
-	bool
-	default ARCH_MESON
+	tristate "Amlogic Secure Monitor driver"
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
