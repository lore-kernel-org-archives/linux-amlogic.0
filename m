Return-Path: <SRS0=PYAY=4S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB9AC3F2D1
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 18:09:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87C421775
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 18:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHTwQ1Ku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1z7WLh4i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87C421775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JLrWP0r3qA0ZKCzlAdH/Qr5NCwVcce+GCLbx+KoCaa8=; b=EHTwQ1KuwVjMjm
	7YF/B0l4QaKqUrxq75ZDcYwvxYfItBx0m++Gykr1l14Ugw3Dz86YuR6sLubbvvNXAf3UbkHy0tK+m
	hAZ4MArnUuKc8dIEs3GbKTDU/IWZH/D6boa8KoQlGCdpdrWa1cywKxmmwps6P4Yf45lJkPsN2VpuZ
	tqVVAXZeOLYpOMAupJl4z573kCKKHRT9qyA6GOyHrRtF4K7rw8VuzXIUxs2OZGY+GPECPr3yzxaWM
	z3YHSwke2zu/mImwaDo83OficSfgYt+zQU1RPU6/1uMlDhrAFxh93I1wyKU+2xWktJT4BRxCLAXQO
	AVHPlB8lfJpGgL+1Sjqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8T1t-0000nb-BC; Sun, 01 Mar 2020 18:09:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8T1q-0000lm-5S
 for linux-amlogic@lists.infradead.org; Sun, 01 Mar 2020 18:09:28 +0000
Received: by mail-wm1-x342.google.com with SMTP id g83so6317690wme.1
 for <linux-amlogic@lists.infradead.org>; Sun, 01 Mar 2020 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ocl2tEnrB9QapZZcJw3x5yNEKWxMtw6T1vqRiiFhtp0=;
 b=1z7WLh4iB8ofEtSV3m5Pcap7lWPm5mJWSeskuAPDggHe9ZdbjWRsjYuAZInMaVg5ze
 DtvZvP3QHzpykJ/uK3dh18cDAUBOncLbMsl6zhhbz8JIGNqdn+e0vcBsrrcsRa4xPfiI
 2xJKxSjZT0DQjE3pF2p1p/n5bzqlehwUE4SFXogM2ieMsvvaHh49ieXNKhSjiFYXqFUo
 4i7uMlgLZg3MDAYQDlRPouWRPMdLvjKVw4mxuBKkhHhra9O1kI6Kcx8rMozAdMKsZvNU
 4TVlH9iuuNNBPQjqYZKPmDrQ1WB1vPoX0RqLAjOoTsyuEdjdFTUuRkawakHouKHR6mO2
 7P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=Ocl2tEnrB9QapZZcJw3x5yNEKWxMtw6T1vqRiiFhtp0=;
 b=WBg7kUDU3iJ09MXSaQT9dZC57n2WOz+FSwKgRSAGOqlP8qxBbkR5WfruatXpHM002c
 T8a5dOa+IRdDftJe0E9/Ya2BxIN5i9TX3R1y8iViNJiw+YIG+LAg6SDg1owo2kVrepc4
 aw23RZOMek1UWW1A8UzK9U2wR8zwclIZ+fM0PMtVQQKbyG5hctOz2aw0CdDqi+sB7Cu1
 nsr0Z+M4ivpPtHCM1OZJplBnes4VuuTmWm7CZdY3iyPZSICs4dCKb9il5tMu8H36qHv6
 Si5DfooxJQgwRFeTvEw6sKtz2jDZaECA0HMOCahz10+CNLv1DoqDT4AhS/ZxU3aHuvRw
 01xQ==
X-Gm-Message-State: ANhLgQ1jCRXFineaVQ3lBzDyL1+S6mbY7oTnkHzajLacGM7nmscjjeJB
 ybwGVS4q0YCOKqIQa8R/dFJczA==
X-Google-Smtp-Source: ADFU+vsLGMJ3qWeeSznHkFlj8lXrjemcKaTIxV6yQCaZHpgpuHbEKLHWbQlFczJXtRZ7tLTQrY7A+w==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr4786455wml.68.1583086161002; 
 Sun, 01 Mar 2020 10:09:21 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id m22sm11769578wmc.41.2020.03.01.10.09.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 10:09:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.6-rc
Date: Sun, 01 Mar 2020 19:09:18 +0100
Message-ID: <7hr1yc9cc1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_100926_226863_69A8F630 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 146033562e7e5d1c9aae9653986806664995f1d5:

  arm64: dts: meson: fix gxm-khadas-vim2 wifi (2020-03-01 09:59:34 -0800)

----------------------------------------------------------------
Amlogic fixes for v5.6-rc

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson: fix gxm-khadas-vim2 wifi

Geert Uytterhoeven (1):
      ARM: meson: Drop unneeded select of COMMON_CLK

Guillaume La Roque (1):
      arm64: dts: meson-sm1-sei610: add missing interrupt-names

 arch/arm/mach-meson/Kconfig                           | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts      | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
