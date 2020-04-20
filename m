Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C07EC3815B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 08:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E8021D94
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 08:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwaegOSX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hTLGia7b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E8021D94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mM1zLTCyTTgYMEkmnw0V5259LK0a8IAn4HnBk/ToLdM=; b=EwaegOSX6l/CiH
	8Fmbdy8vx7S1fy6Hp+BUCmQ2BkWKNEXiyf6R6bDBLz5+DOJS08fmfSsc4UlypLQZXo9L7zJqjRuWV
	AHZuQnngrAMhi+9trbg9pV1fK72qQKMlIgq0jR2Cu/7erYXkGwr8ZcQ6T+zjbVap1tHZrk5Tjy18u
	AfjeVjPuDuR+lfXHPzeIwKZUVnYP1n49I/kxjvTHTa08UEg9b21Glira5/MxSNX189UODMquTspUt
	FJOEMuk6Z+h7FWw26uahdVlVc+dcN2XB/wKkTbqU4vi/9sfIDZsUjUaUinU4fuvMOMbXkSqd/jmZw
	TVeHO0xrpXi4a/V8gSaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQRM5-0008IG-BC; Mon, 20 Apr 2020 08:00:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQRLu-00083R-GP
 for linux-amlogic@lists.infradead.org; Mon, 20 Apr 2020 08:00:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id t14so10843324wrw.12
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2020 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+QeMSWD3PS086s3vwF3t/garbLCRMGAy7YurSuE4Kc=;
 b=hTLGia7bam5LZwHsqquFh8AymM6Ls/yjxGtl/hrZDunqN4uGsKNHdZ6O51cqaTHlUN
 BYNz1z1cbWKua9hrTYRPm3A7mut1msCAXNB703F1megHRsIopjDs2cIhcRhz6G++6Nr/
 J/IsnRBoNr7IOPpveEfTAOfIv9Qjqc12xELoq+aRps4wHEWo7AztMRlvwLdpiJOUhyA8
 XIEZS7Col4hxpVlQLXtIGF1+wOIAZRycl/EOYMVy4vzBIhb9F0mclmozxA1kwBtGGSA7
 CDj5v1n9e0Hqf/zaUlZWJsjhws2pdwplXtM5OoDvB9PD3kLZBRaPgPQB6sViOtf9toXC
 WYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+QeMSWD3PS086s3vwF3t/garbLCRMGAy7YurSuE4Kc=;
 b=M5Bbi3khZ49ETs14lU3CizbL4fl5N4fZ6dgE0yEBVAWgnhDEHXBO5WMuFHyXmmyioc
 2iWVK/UBOmz58Z9kZeQhqeQpEFriCTH0dioh9DFlbT6O339nwCkII4izUn5GMOsOSugR
 +LzbvhrPXlcQ6m00gNFsFiIGkeLzaEMqMqaTKVi21/Z4fpw8M0b+83C6P/KSPqY2ijAl
 dXTNfM372wcvX4FxEcEmRQqbuunLv0wb06wLj7FZjE3/GL/oDsmrf0M+HgqoZOj+RsPh
 d8laUaawkg5OdRWAqDcJ1tZv/x1YM0VXGqK4FoIftNr0y7iYMa0kctz+i36nvcIs/aWq
 43Pw==
X-Gm-Message-State: AGi0PuYgLrOIBCmVzYh09CicpQLbFVuZ+6Cv7mAE7W6QUWVs6qf6Lhlp
 +YT/1CTqw86ftQC2OjZWMjHq0Q==
X-Google-Smtp-Source: APiQypLDTl9EnBI31IMEjpSapxs/QYgBIADfuyt1egW7mLSxjpapQG5/JpIeV52Oh+uG14VKnbAC1g==
X-Received: by 2002:a5d:4092:: with SMTP id o18mr9493720wrp.227.1587369624021; 
 Mon, 20 Apr 2020 01:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 v10sm113256wrq.45.2020.04.20.01.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 01:00:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-g12: remove spurious blank line
Date: Mon, 20 Apr 2020 10:00:18 +0200
Message-Id: <20200420080018.11607-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_010026_542177_C992F26A 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove spurious blank line introduced in f12a463d2f43 but was not part
of the original patch at [1].

[1] http://lore.kernel.org/r/20200313090713.15147-3-narmstrong@baylibre.com

Fixes: f12a463d2f43 ("arm64: dts: meson-g12: add the SPIFC nodes")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 783e5a397f86..55d39020ec72 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -1,4 +1,3 @@
-
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (c) 2019 BayLibre, SAS
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
