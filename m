Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB93C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E0A2070B
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="orqVdBaC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SJIyAPLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E0A2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9vc+oR3C9ZrEMQFkKrDhUtyKyJscJXRdDnWfyDoErc=; b=orqVdBaCRfOjnW
	77ZCYQzT0R91y1Q6/5TKZDWVyOHfXBN5ZpnudI5a6rthoKmhPqFv//1Dyq4DzI9qRyPkzYrxzKV2R
	13xRgrg9U5WnZ0CXbcF2a2GLjQt2UkyZKgpCsmuhBwkjuiGogadYtAbcUAPJX3r4rUqc9hn33tQ0n
	3jppf02ao3t9/1ey97P8HBm/9hcFrqDVKWFPjoxxEG6odKUE99k/3IKYxT/sg9Gr8BNi3hXVZ/E3x
	1FqGENvJwY1dp4JxPVHgRlvcEzWwCCYOOvpuVuqfSg0CSffEQDQBKZ3zEynZhUwgmeIv5oi+G8n1S
	gdQjIBkKAmeirSxOAp2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he4c3-0006yj-5G; Thu, 20 Jun 2019 21:28:55 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4c0-0006y8-5j
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 21:28:54 +0000
Received: by mail-pf1-x443.google.com with SMTP id 19so2387481pfa.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=/usBuInchiYIkwEINC5m7qI2XdY9h5Mq7M9FS6qjXCs=;
 b=SJIyAPLBhJlQowM14RD/peLXS/0YoDcTdl5W4u6mWKFY7oRNNeYT4Q5pJhhmSaMTNR
 KJ79e1Zedw10eV0fsBVpo8AFkDVZ+4JWnWi0AT1fO0swEtvXOFmSXkQ8ehAZ7y+izZLy
 4tOr1yJ0+8G2bXNX/2H0zukPC7g4+OzfZDGPMqguNCbijb4vvcw0SjcwyF/FnPbKxY8g
 poSWejekEDmCSLO/hxM99U0N+1bS8WQazl21iwdaOwbDGitdxBMui0eHQiT3V8lqu+zE
 dn1Ry9CH84dcJLYOoBxeJ9bUUVLXfjG6S8Hb6hvH+JrFhMuTl+wiVhnErMSvlH9OHFcA
 L5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=/usBuInchiYIkwEINC5m7qI2XdY9h5Mq7M9FS6qjXCs=;
 b=ug5n4mBRtdKyBGRB/t0Vrl1WGimZTUG5/p7ReV1rub1supU4QQCO8dRwi3Npzc04F6
 eI01K4TGe+B0PS+fblN4XV/RoD4LU7PmapPd6Loy38nS8j9MQxyMjVCv0X4oDR9e/UH9
 3jUZpshU5bDFWdfbzKN4HvoP4/e3rliQQg+DuxghfdWr01scCI5Kok4SzyJtpP6HSkwr
 O1vWGP+4G/K+kW+j0S4PqNj1NCBnniJi5KyF0YO6W9XoBcguw4wofcsm8zxpNjhvD/5v
 KPJn88XRBlv69pWl64zBGMq26MqmYafGCp4TyoA3rXB4tgvaXVfXWnBGt0AHUub5BoPD
 g5Qg==
X-Gm-Message-State: APjAAAU9tZ4UAv2DWyIHpjBqEkxEWOYG1fLQrzTr/EqFccUBcNkyLkWw
 ldnWAqYvfbU3GYTDaYYbV6aKlw==
X-Google-Smtp-Source: APXvYqy8N+WcXxQciDvLrtmoM55a2GQCBddWrnqNBsUsf3/2NW1H5U24nFsOKvDFD7duyi5xv/mBKQ==
X-Received: by 2002:a63:6f0b:: with SMTP id k11mr14459048pgc.342.1561066131167; 
 Thu, 20 Jun 2019 14:28:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id w16sm410689pfj.85.2019.06.20.14.28.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Jun 2019 14:28:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.2
Date: Thu, 20 Jun 2019 14:28:47 -0700
Message-ID: <7hr27oeyk0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_142852_247309_41DBCE4C 
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 26d65140e92a626e39c73c9abf769fd174bf5076:

  ARM: dts: meson8b: fix the operating voltage of the Mali GPU (2019-05-20 09:58:38 -0700)

----------------------------------------------------------------
ARM: dts: Amlogic fixes for v5.2-rc
- fix GPU interrupts and operating voltage

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson8: fix GPU interrupts and drop an undocumented property
      ARM: dts: meson8b: drop undocumented property from the Mali GPU node
      ARM: dts: meson8b: fix the operating voltage of the Mali GPU

 arch/arm/boot/dts/meson8.dtsi  |  5 ++---
 arch/arm/boot/dts/meson8b.dtsi | 11 +++++------
 2 files changed, 7 insertions(+), 9 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
