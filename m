Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4B0C28CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E7020866
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NmwjcVVI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SAmYe+PC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E7020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XximKhlIugXq0o8U+d80gqfPwPu2sftHq6TCYI6NCgE=; b=NmwjcVVIlQFbgP
	oB+DBNBq/UXBCta+BZUKaZQLQLRoBawCujT7Xnl/BO80R58jaWiMhspYQbJ/XKfiK+B/YWdJfBF7x
	6kpNx6QLV4RGvwtDHNXvScFNvbhQkq9tl2X5twcALZUQ/5GIbbWgFtXAs1ATq6tHhyEa7AvYuq/cc
	fLVvawOdfrZiVat44UlHo1K2bmHEkcskMKM3IkZfKTVHQ7Ygmx+bBto3GLXKoTgOAkx5pnha9udoM
	HGxVS1yT6loQE7aEw5RJA9/Bou84NrEl8ixxwfviwmRQ6yZlYxuq/haqZwb/CcuJff60w3/xYi5Di
	DnTa3MrwV566nRIHFaUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYWf5-0007kh-BB; Wed, 05 Jun 2019 14:13:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYWew-0007c2-OQ
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 14:12:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id p11so14805307wre.7
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AycgXSGYqUAjsITGUjnhQpci5ICfquB/aTQgTSexg/Y=;
 b=SAmYe+PChAGdpz3sq/wSWM30WEDKfSGzSN7aCEWwBeVVYwBTaYCsR8tqJy2F6mPhTx
 UEEXrL7JujXQ6vElMFOuTPhlaA+BpBXz+2W1+aalkZh0k6taPWsHfWnYHGk7aAxSEbhT
 LAjZNa1A1Fh6k9NaRNQGCpDiwd+CFSbmT8UB45Ry5bQjWLFCt2M1NcfMwMDX2rvdSo+P
 GHZ/6io8pmjRFt1qxRcfPHuUZCj+xdzR+vt0Mb5u14YyACdNpab0HYjEGCpcJyJlwyAS
 ZpWMHVaNsjXy5tt7nssu3TvOObOZt70/I6DejgUIR5PHEzNv5qHOEyq0RoZRM79oLKyh
 UOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AycgXSGYqUAjsITGUjnhQpci5ICfquB/aTQgTSexg/Y=;
 b=Q004Vv1O+I7Hxwxd4+M5ZaV45ok21lb/L4iz4Y4WSHb64XHrcOBd7vBP6Cmt8mFlJv
 YqIzu1GUx654OjgSNFuOOfRJ0hTL0Xd4mQWBZAFVPyIUtb7ej2l9g3jdtVIDGk2LFLAS
 d5J7oOVI/NXsst+qH6uYXoK0UaKEImgr8P5zrVGPpaaszw9i78D8tPUL9jPUnUq94OPI
 MwsbbUxN1IODPe9QfAEF3Xo7UVll+HN9iIByP1SEynX6pFe9y+aUuVtIB5qKBQ/Q4Q+v
 ZxmbHjIolkfd2hx2+7Bb1XeTGfFL7j7iZh5d+lyK6CP+9icrDom9DWMLODg91BTLBAt3
 WYJQ==
X-Gm-Message-State: APjAAAWF4Jne8GvPS78u2NCD5wAhsKwiMUqXafn8cr1eM6k1sdayEiFE
 eJobaRcD3r1Hfst4BoLybCuBbg==
X-Google-Smtp-Source: APXvYqwt/qL/+dVCADHJ7VzKOX6wFacIr8smg4S+3JxBM+1fYpsjKCJgyKEX+SxU7TlspnyF/Abntg==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr12845013wrw.138.1559743976264; 
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/meson: fix primary plane disabling
Date: Wed,  5 Jun 2019 16:12:51 +0200
Message-Id: <20190605141253.24165-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_071258_793826_A3182340 
X-CRM114-Status: UNSURE (   7.25  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The primary plane disabling logic is broken on all supported Amlogic
SoCs, and the G12A primary plane disable register write is wrong.

This patchset solves thse issues, and has been tested with the Baylibre
ffmpeg-drm tool and modetest.

Neil Armstrong (2):
  drm/meson: fix primary plane disabling
  drm/meson: fix G12A primary plane disabling

 drivers/gpu/drm/meson/meson_crtc.c  | 6 ++----
 drivers/gpu/drm/meson/meson_plane.c | 8 +++++---
 drivers/gpu/drm/meson/meson_viu.c   | 3 +--
 3 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
