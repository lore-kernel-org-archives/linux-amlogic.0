Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF88C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A06218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oXWeJF9+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wuVTeQ8V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A06218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cykBNp6jnaj6p6yWU6nwDfOErgo32eb0wIxEg7kZ4BI=; b=oXWeJF9+mn51LV
	z5+Dv58mUXu+aCgMeGu9SZZF3va0d2Pzdb7vpGAGcid1HcDA6mAoA3Ssf3zxiavUNuTLwD+zJzMDi
	iTPhX9rxy7tc1x7Z1ilBUqbYbntLy+gLY4NYEJlT5FfItW72DMICct0SDpZjfUt7pF0WLGAf8ojBV
	YyMT1G6UWkSRpkhH8ga1ouKbERN/jIj18oca6v9UKovG1/CWS5F8frS9q1kFHn17z+mohUlNKW5Nx
	FIkI3H1rG567sQDIbPvYmGi+4llVljPaugJ0MJAKvLUwsbC2ZeLlwM+n4F14zZKbhMnOMHoXV5WUr
	mf5xjInxgFXXTCEnlKXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9z2p-0000Mt-6x; Fri, 29 Mar 2019 21:28:11 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9z2f-0000Da-Cl
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 21:28:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id b12so1812016pgk.0
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 14:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4weMzVuDVAy/O/5vq6jenGauWrtb3QjD6TIwAFdALTQ=;
 b=wuVTeQ8V3JfMai0eSDGyA0JUUJaAXzNj2pBbLn5w1zuEfzlDZ6kZbqjqinWQhXWxrc
 Cc8imJu8KXv67BoCIuJZORqVOvdzjNpF7V9QL/Ct3JDZVeQz0LKzxQKwnViDBlVt/xT7
 zp6IGG8ewQklzzBGbwOx62yeVteJpHIkbIV5TeNXJ9JiT1qtZCF4d28aC84DxaHBwKvi
 KV01VZbp/yjgb6aFgRYy+OgeI4NvICFxnuvN0yRHYAdEaMmNod/uJNVEdTXQ8MrlCEMV
 1msi5M0nTm3ci82gJyaImJSk+oiMXgCXdvM7133fQaAteVEC6E4/SRLYzJp3pGcOYIbX
 rGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=4weMzVuDVAy/O/5vq6jenGauWrtb3QjD6TIwAFdALTQ=;
 b=XLbMDv11Kf/pb7TidxqazagUc9VWuJC7whTu8RtzWUtCzU2IhkcDJlK6+nr5qvkjcm
 eSKScNu3/vBfOSjkA+29ZJOwD7kpfRPm9V4Si14jF5tJSlanJT+Am0QB8/Rry7SeyFOL
 aMzDkZVmQB1ntWFTOraSkPZKoWvBEq1VTyCnUzA8Ewv433p68xys+Ee6u4dujK8NWRBw
 +0SSx2FugOg7rvs83/mgb0yQfybwoZGDn67LCGaNQSzjeQm7zM79bp9iQp/1ASNDh2fF
 Z7y1gg8GyjgbHfVyWI1aKkkPz+OCI70QCBKvJVdA/Y7nE+bWSoOqteKOdV89Eo07u7Cu
 7fKQ==
X-Gm-Message-State: APjAAAWOpHWIrZ5SrVrFldNK7UKiKO+hCLczfXfLTmvn1oTwsTT0++lH
 T9D1uLVB8dbhnZr3iqfNYxAfMsT3iFI=
X-Google-Smtp-Source: APXvYqz0xnLgEw1bTwnFgE+5jEuyMwaZ5Rc3yGRZCrOicah0djA8jaImYDYrdSIo5snMUL2w4MGaTg==
X-Received: by 2002:a62:ee03:: with SMTP id e3mr50110203pfi.241.1553894880833; 
 Fri, 29 Mar 2019 14:28:00 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id c3sm4895891pfo.2.2019.03.29.14.28.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 14:28:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: dts: Amlogic updates for v5.2
Date: Fri, 29 Mar 2019 14:27:59 -0700
Message-ID: <7hwokhv09s.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_142801_430581_77D5425B 
X-CRM114-Status: UNSURE (   8.46  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 07f9da2900674e8e7b15b090b878d8defe223277:

  ARM: dts: meson8b: odroidc1: add the GPIO line names (2019-03-29 13:59:02 -0700)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v5.2
 - add GPIO line names for odroid-c1 boards
 - support internal clock measure driver

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson8: add the internal clock measurer
      ARM: dts: meson8b: add the internal clock measurer
      ARM: dts: meson8b: odroidc1: add the GPIO line names

 arch/arm/boot/dts/meson8.dtsi          |  5 +++++
 arch/arm/boot/dts/meson8b-odroidc1.dts | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         |  5 +++++
 3 files changed, 62 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
