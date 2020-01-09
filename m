Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDFEC282DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC5F2072A
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JFg1iM8R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tuzZ+q5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC5F2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IH6toKC+HDxKjdeFfulOmsCgPw941HRkhk5Cx10g1vM=; b=JFg1iM8RkeeX+8
	tYApA3EkGcXUS/Xz5z0NjTNwNWhE1jRQu9w+OBhhFZBfkDXbtLWxcqB3oEDnvW0H5fsUmq26XCe+v
	zSAZvczuAH07Y6FH7Xc+b0Az/uLS3pibAjSTC4v/JrO+2JQt5EbA9YycdyWqZZjrVXLtYSxRGL1p1
	1bvWlrSJ0ekPlwkMnSXUKxCSrw9IgjOwqtHr48XOIB7p+I0AOEMoTUSUHPpW1Y1/3ZYah+lArh9KO
	aCVycZGhpLqfuBX7K1w+4lz3ig72GK/uOgJd7Vmccks3OLRiSFdh7ClEAqdsIkdO2FLGahuU79U5N
	6kJaHjSTU2D1F4V1r7Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcs0-0003ZR-LK; Thu, 09 Jan 2020 18:49:24 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcrv-0003YY-9g
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:49:22 +0000
Received: by mail-pg1-x543.google.com with SMTP id l24so3645251pgk.2
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2020 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=84EWLoF71yXkr+mW7/HZBjbWLb+AgGQGa+EUFEp055s=;
 b=tuzZ+q5KUpldnncxhnQ4zBiEBjzSSn0bF7AoWY2MKvGf2/jEfa1g9OhjSmRaFMv1CF
 IZ6lweALNoKOelKkUZZrkUAa8d5B4zQ9t6zBKpYp8VqeT66IXzauxyqxiaivk0higHdV
 heXR5kvlFAVkiWVVOhf01wIcw/9BPW9/qb3MSDUW3ldVNXSZnAl6Vgv5RtHcQY/Jb6uZ
 rWUMeCF9kcWegfcfF/KVSfa90WR/Z0fEOlcEuGRy0DNQJreRhDRwJno61u6qFWIAxGlX
 wFB6KupzN4RBnPZQ59d/ON5/XPDmxsx0QO2Cz4Sltv6veITZfwXpDJZjlNB5283qVTL1
 Axiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=84EWLoF71yXkr+mW7/HZBjbWLb+AgGQGa+EUFEp055s=;
 b=F4iFKT+MT/+kOaJ5I7ZqMmq8SWYy1cgtPw915wvbrrlMMORxq2grYzYLvoL5U981DL
 7DZlwmAGO5wzypwM6sa6sKM1vCDSAjjNw7i2Lqrscnmm+i9yJ2r7Jd04hy7u2Tv/nGzf
 0d+HnyzIeEkrmn8RjfdULGbFIxziBSBLEvIZpK8RF1EOCaWb+dd3J8JENmltwBjIp+R3
 3Kzyw+aiDAodA4HLQHDyyB4f+/g1NNE4QBDbgAFVlKnaF7emnSeTwsVILUZcTifodptt
 Ed9z+Mm0Uc0a9wxnk6yBvTrg39W0NI5gY53rSTtIycSlwqnPOyc8nbIUZWTHCg2zly9u
 N+1w==
X-Gm-Message-State: APjAAAWXo7psETXLz9xJwRvBEiR+e7jq6v+fAhIE0HnxcD3MXDxMHg89
 C7gs6HcE8ET9yQRON3JWtArUsg==
X-Google-Smtp-Source: APXvYqzpUMUZHn7sUHjJZmZVU+SDc2SqKpLJIv4uwWmmEA18OGIuUxR/+Z9SlWswcSYskDF/XydfGA==
X-Received: by 2002:a63:d543:: with SMTP id v3mr12530255pgi.285.1578595758789; 
 Thu, 09 Jan 2020 10:49:18 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a2sm8367089pgv.64.2020.01.09.10.49.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jan 2020 10:49:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.6
Date: Thu, 09 Jan 2020 10:49:17 -0800
Message-ID: <7hblrcea8i.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_104921_037355_78742249 
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[ sorry for the duplicate, this one has the right subject, and fixes the
  LAKML address ]

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 30388cc075720aa0af4f2cb5933afa1f8f39d313:

  arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt (2019-12-09 15:21:21 -0800)

----------------------------------------------------------------
arm-soc: Amlogic fixes for v5.5-rc

----------------------------------------------------------------
Guillaume La Roque (1):
      arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt

Kevin Hilman (1):
      arm64: dts: meson-sm1-sei610: gpio-keys: switch to IRQs

Martin Blumenstingl (4):
      ARM: dts: meson8: fix the size of the PMU registers
      soc: amlogic: meson-ee-pwrc: propagate PD provider registration errors
      soc: amlogic: meson-ee-pwrc: propagate errors from pm_genpd_init()
      dt-bindings: reset: meson8b: fix duplicate reset IDs

 arch/arm/boot/dts/meson8.dtsi                     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 28 ++++++++++++++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c               | 24 +++++++++++++++---------
 include/dt-bindings/reset/amlogic,meson8b-reset.h |  6 +++---
 4 files changed, 45 insertions(+), 15 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
