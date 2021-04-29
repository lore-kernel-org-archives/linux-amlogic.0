Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4133C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:38:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FE16135B
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FE16135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsuRrSJGpOoXBoPkuM0i57dq6Q7SuGzsrBHqo0LMs/g=; b=oP0vt/XTYSSnEAuzF5JAvCzZ8G
	t4Qj8Ynt9QkXPDf3MYt6X/lLX/1m8Sql0Wc4U5rTvXv/KCd3GG8Yb3mc7396ok3uj25Y64Btue3aX
	q96kuD4TSCGSWwc8kWDD4E9FDtB2T6J/T1OTBaTfMASb5o2SmccNcnzVIwN2mj9dLoPr9U2PzrLJT
	W9Vw0btEdu3YzyWsClaPI5ezxyYzgMou03FsdAjT968QMmEkEnmu5RtZ2D0awMW7krkMqoLYJzo1X
	QJVMwPxJk4Ey0Lvdl31S6DzQgnxPDsxmmT/n8YTnodVMaoWmGw/pDjGqyZa1ptRQM6U7rgwboHEVV
	KaSvuDhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2C9-005KhH-8o; Thu, 29 Apr 2021 08:38:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2C5-005KgJ-68
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 08:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=c4WPoZQIZ1kvkVufh+qEP9zP3pw5rW8jLhJq9sIj904=; b=YJbiSMsrgXH/R75ssI74LtY95K
 pd+QGO5ByDMVtQA1V2fnvvdgPo1BWUNHz1RKrz1szQCJ5nJ8wUN8j/jjS1jss+1ebTifRSiVdsds5
 FPHE1BKTQ6wyzBjalz0pKzkQTqxMhj7wgXpbGamFpAeQpnfQ8PEfHur1TNY2IMrSIB8P1WypLd0Fr
 l+7XGNobgxB3sKj6eLPkbmf0YVbhndgc/TH8W+0o+RDNk+Ir0Q+/YCzBfHQlSbFF5zBO+z0KHHD3v
 gBKolIgmniDCV+V2VZcdPqP4BC6dUxkXpSNqKPVErBjvzLYJkC/VMsDnxQyMI9jCL3fbI02S+QE4Y
 nGknTRsA==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2C1-000UfA-5o
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 08:38:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id e7so77465861edu.10
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4WPoZQIZ1kvkVufh+qEP9zP3pw5rW8jLhJq9sIj904=;
 b=IgozPNfcNZh3SwfuiOVHikpsuKvtyq7T9Za5Oh1Jszmvf4rzk1b73g0p1DgzEY09Nv
 mvt+HK76Hu85mdMLosxGGlK56/jynJd45gUlQmCdHXzKqe+WW9VpIlXezo1hRimAWler
 oTCZfhu0CWFOWi0VNIAtBVHaq/JhfNrwJb8Ejqh/vQJvnpr2AI/6aphYa0fO8PHXfLUa
 R9xydeBTmrwJb8pDMah7fXzrSpA789fMei0X5en2SGXgqTsu+xpeLCqJ6BjeCkkvLj3r
 l/7Wa8iLepHsi7PVNJopsuFldMBfBBx2GXg0EpIHVmuqx6P06UYeo9KsrW8RBHV4tp5n
 4d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4WPoZQIZ1kvkVufh+qEP9zP3pw5rW8jLhJq9sIj904=;
 b=Hn44lv+mIJZFXvujJLSBnuQb3dqht2i5X39W+X4KnWEu2A43NHvwbx7iImxFqHMiEg
 UT74NVKa1GTV7FjRBZ3JwsK2tXqHoVO+12KbzYKMtsEbG53+iccstCnSz7ohpz4QV+hQ
 6B3KRs61IL36TnJopNdF+K+In8hGrh/gpaXLG70gv3gavy1wuN5hUWrQFAg5cXkqR6FM
 OsEAM6/qsnVzFRqVUiOmc9ZdVzjs/lLo1cJtmu99tqZbCBo1ZjOfvX+pFOja0MlCtG4h
 2Wyj2oNcUIJCTL407VGoN925gY+N2/f0GrCGOg0I0RlXjB4rQQqoiOTkQSsYklQRUVT/
 p8yA==
X-Gm-Message-State: AOAM532e5Pn1XbegE0350PZbCeV6u9OrsTRB2Com+D9KZS+5GFdG8caL
 SBto4yzWGOtHl69nuCOvSmXGCA==
X-Google-Smtp-Source: ABdhPJw/uG7z0S3jYVdM8GLT8Zryvd2mD2Bcig9/CCVXyJhaEGwQUisy9MFDRZf0bsFixgvhhRhZiQ==
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr16596562edt.187.1619685517668; 
 Thu, 29 Apr 2021 01:38:37 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n10sm1387941ejg.124.2021.04.29.01.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:38:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH RESEND] arm64: meson: select COMMON_CLK
Date: Thu, 29 Apr 2021 10:38:23 +0200
Message-Id: <20210429083823.59546-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_013841_289119_66B9CA67 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

This fix the recent removal of clock drivers selection.
While it is not necessary to select the clock drivers themselves, we need
to select a proper implementation of the clock API, which for the meson, is
CCF

Fixes: ba66a25536dd ("arm64: meson: ship only the necessary clock controllers")
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cdfd5fed457f..a3fdffcd1ce8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -168,6 +168,7 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
+	select COMMON_CLK
 	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
