Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E902EC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B153F218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ib7MvNOZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O30c7noE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B153F218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KTEAjl/5moCuimdxgMhpydzSTUCrvGcqUMWOXa0TzCM=; b=Ib7MvNOZUnTnBk
	df58a7caZB6PN34MMwoR36s/I73rRb0zQ3QvSzsTcoiTnKI0o8V2qgJdjAs4jrBvn67CaYhBpJn8z
	LCMZRoRT5bX8AIIaVX938KQByIpZyIO6bldUoAOUPV2nxJS9uStTGutHV0iBc1EWHexLlnIJTbahC
	pXdgH9vaiTUOQlCa9KNkb1huPfPYCy58bb9AvRu8clLC+SVjKfWU7F4A5xmt8akJHf8SMYPlV9MZD
	uE6xWRxq5aJJNc2ndRy3sw+R+jsy/IadQE2HBQ2KjSvnUcaMfbfgJyvwuIiJ32JgVkHpeop1xCtCX
	5k2UEvRSAqNFt+hYNrGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9z1l-0008Px-FH; Fri, 29 Mar 2019 21:27:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9z1b-0008G6-3Z
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 21:26:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id y5so1592435plk.8
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TW0ju7hZTNFmTMZwr9V0KIytrCzQhHuXz7XVmbJdhRY=;
 b=O30c7noEcVRkd/z4OYoJpQ/MTgIV1cofFUzWgZVS+Y9jeWq6rQbQvHX4iV67tLC4De
 E6WlGhIcxH89bUGsoJQ6cQsudir0Mk4sS4uksbeqeY6noOZ2pVZEcyZArMOSa+gcIglw
 w1H24TOZp5d3OXK2KBhdRc3Me2LszftXIlE/YySmub2WgHAJsjr3NcwWG4XhrClqXpTS
 FN+SnBJjwSZeS+v1T6Fxa0JsSQn3IIDMzgXJTIr4u1bZaNPerSegMrYloFIRpwDNRELD
 YFaz7KFI7DrQy8vvZnnuzhkti3CZEw+WhbzxBIfO9vmPu94Mnphq98NA7Sg5dkpGELJq
 1y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=TW0ju7hZTNFmTMZwr9V0KIytrCzQhHuXz7XVmbJdhRY=;
 b=aOQ7kEGMYMwSJldXXebK6Wl+1kZB5jaGAKywVD3tEurfO1SArmkfsj0pRj27rfrSJT
 s5iFNhHuTZ574iyqcW/gmzosBGfDpmFTEHuvGIZ+yAyJnll8ihR7h0zgSA3vXonlV4Gy
 oBVTWPceK+7Mf/78hSqcIan7qFp9C3E4skQ0InY7zU6FPNAzNqMu5n7+jGkG8BY1vH3c
 S4xoXJJI1ifFPVLYTZ99jzzsd+FYWaKR1Bj2cbpLF0+2fEzgpZynNl+RK3xqXx3Et3Kj
 /3m9ppJGCGIZfdkv+BKJETyE4aka6A6jVxgZNwSXcsgEkekdJwtNBWagcGDK+HohpFDV
 eCAw==
X-Gm-Message-State: APjAAAXzSJ87PcbXbBYVueHj9CAARqpQngJcXPIM8Ogzpm6t06NqM4JD
 IUXDmu+PoUX46qCxBIm52YMhRQ==
X-Google-Smtp-Source: APXvYqxRQOF3iaY5zp+gKHw4esjRGX2fJCWPQOwbaDTUqFC+Pz2K8H9NYRccr1Kqcd1Me5JWHTClSQ==
X-Received: by 2002:a17:902:8606:: with SMTP id
 f6mr52793280plo.151.1553894814603; 
 Fri, 29 Mar 2019 14:26:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id j4sm4371152pfn.132.2019.03.29.14.26.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 14:26:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: defconfig: Amlogic updates for v5.2
Date: Fri, 29 Mar 2019 14:26:53 -0700
Message-ID: <7h4l7lwew2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_142655_152400_24FF568C 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-defconfig

for you to fetch changes up to 029da5e5266c113c533abac6f5a7ca5ffef02bf1:

  ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and eFuse drivers (2019-03-29 14:01:25 -0700)

----------------------------------------------------------------
ARM: defconfig: Amlogic updates for v5.2
- multi_v7_defconfig: enable the Amlogic Meson ADC and eFuse drivers

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and eFuse drivers

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
