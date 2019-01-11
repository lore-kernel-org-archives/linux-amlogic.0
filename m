Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254E8C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC132133F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIxxRDtm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Jy9hngyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC132133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFJlMMMWWfCiKG5nWhGcbt0mTevUvPYFRsHlC2GloZ8=; b=GIxxRDtmS+h1jo
	rzflRu+4a+ywb3pp8Ydp1F24esSFCM12j1/o0ZD4MQKf+TlDW3OTOHGtIuMItLEBHnk/yK3swKgcD
	bGyKzzAEiCOsbQb2y/l6jmL9G/1KX4paDuiQRqUsn4iwFACBuMpFfxiHGfkul9vHh5+6JIva2Zb2s
	jKiiXL7CVOD4jlBwzrQsp4Wjc0Wks3chl05Nx2o/yiYuXIBsa/vuHbU9vd6Lvqdo69prKRSIFSXwC
	D6gQYKRnqsbkZptpzeu+gFMx1ZGcWNlWJuVh+9ELH6AThKORCB+zLMlPWFTCWs5wNTFRbX+1nVe9W
	wt5nN2YVnOenBHUFDYdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghkSw-0006NX-2u; Fri, 11 Jan 2019 00:14:26 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghkSj-0006EE-EI
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:14:15 +0000
Received: by mail-pl1-x641.google.com with SMTP id u18so5913864plq.7
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RlyNJmh4No0SkRNKfsYkuijXsVwd4v2lCvL0JlZfoZ4=;
 b=Jy9hngyp29zXDoU66xxMfoHZOLjvAqwABp3sLeUxCFgyokz+eAnNqg0Wt5hrZNH/nO
 tUMSHNIbt50DI3UnexSDAMhotzI6cuGzB4/Qi66Uuc9tKgDAaHqBP9N3GTG0HBuGX82V
 WpA8Sxv6ggp5TA4mUATp8RJZQJXKkMwD19nQnxR+CaKOhvCdE7qEWJiZTmZ7zuQvhz0Z
 ir+Hz6BpbmFmua93gYvK1jw16MIPnQ/qre9xzyM+BWVtotI+rjUred/3niv8mVFbUm2p
 SeNO7xwOd4SAnFkTxXzigdbfjmzLYaBielVAR+HOwBAMJzDcXrlMyLqAN6bzPob89o2U
 EJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=RlyNJmh4No0SkRNKfsYkuijXsVwd4v2lCvL0JlZfoZ4=;
 b=Adq1tjhcXXzmMEWrOPEHKfoTxEHGvs4QDsqP6X4DJDYLe3E8BZzTmwS4tyDyRQobBl
 TTIRAl1k9ZSDAvFfnt2QsJ4vbXZrETe1H7R7MDCQE4R27CWJOW1fhEec/L4n+FVpnXN+
 JWlVT8eSxPD8Qu2yy2MwbM02KNX2NpBAeG3Nht5IrosmPwJRYgutmtIB6Jg6ap9UyFKZ
 +M1HXWd+3SGcphRaci22C6RHa4XF0FB9zsO8C5oX+kU1h73lDgr5FAd+RDpUJxtTrxXq
 CVexOScIWhXa5zaEbebvDGWh4T33pzbyebADjninbTrOcrD2MwkoLFvY9xnsdU5JJ1pq
 NWuQ==
X-Gm-Message-State: AJcUukeCworasi3f6tajgz5cKEl4kgGrtUkDD2yEt/NG7qpuV1UvU8Ix
 HwkMnydilaVXHUUmFIL/rkUryg==
X-Google-Smtp-Source: ALg8bN6p2ZwQHecHkD4DJ9BIAAnhjbSFpT7noF1jxCMkikmbZgU/y25G9OLaAR2KUt4ZewfAVxAAvQ==
X-Received: by 2002:a17:902:27a8:: with SMTP id
 d37mr12612641plb.182.1547165650942; 
 Thu, 10 Jan 2019 16:14:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id h9sm124389823pgd.53.2019.01.10.16.14.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:14:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.0-rc
Date: Thu, 10 Jan 2019 16:14:09 -0800
Message-ID: <7hzhs8qcdq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_161413_531456_78F25485 
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

A single fix for the early -rc.

This is actually one that I missed including in the defconfig updtes for
v5.0, and fixes the out-of-the box sound card support for the newly
added s400 board.

Kevin


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 19a220dd1e8a1b1d8e5e2f8f4a25313c4b02d527:

  arm64: defconfig: enable modules for amlogic s400 sound card (2019-01-08 15:27:50 -0800)

----------------------------------------------------------------
Amlogic DT fixes for v5.0-rc
- arm64: defconfig: enable modules for amlogic s400 sound card

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: defconfig: enable modules for amlogic s400 sound card

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
