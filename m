Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9840C64E7B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40FA21D42
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yjaRGUbF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B1YbjTRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40FA21D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gL7jYdGo8lrfJ6n4MGvRP5Np/60ZJHhjan2JFsyRXE=; b=yjaRGUbFViOiyB3lMgH04o6Dvo
	iAR971bK2UYp1CMp4Q+3g6pr1PZFlRQFUsibcC9hStOTTy/Mg52IUKHOm5zSvWnu9XzbxeX+w6LZI
	urgC39aTkLXkCr64Zmc6N+OSFu0wBEJWpQ8J6zMWun8dohdjlkQOk5ncl2ai1YLL9fCbI8Y3ICc8y
	0B5TAPy6j1xEw+HXhqqftVmsWv6UJpAFuxtpSFRvzDfSTOdRvaxb7rWwvCQWU1Cgb8ryg4doXIDJb
	dc6O/6GUXmzZSfsgDzNc/hIAcA6s+2QaT03/IPncrAYhJpfK381eMQJ7Y+KjuREDSdYfR67lYawyo
	wNXYE1XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkAts-00017G-5n; Tue, 01 Dec 2020 19:01:20 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkAtp-00016X-SG
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 19:01:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id 23so4351247wrc.8
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=/1A6J8+RLm48YTOJpb4QYlNWmGZ+O1jQHGeFKlJp25E=;
 b=B1YbjTRs0XanOUXyptXmsSZgYuC0HYufuUpXd8zqOe++qesS/YgUcyLhMnO95l0/jY
 m5V/NfzEp+QU646WKFfyDzTLXFMHupEBMA5zakBS+BRlH39R8iftWau51PXfJuY8910A
 q2FAXCBd5OvfaccCBE9m7Djqch6c9+feQaqxinW7u8DXkoOJtdFMc4YQxAFa0ree5Lex
 byWEqt5vgTtCUIMeKJ3hVZCqHUJ0US44fMcfJ6KJzYer5EGd2hUQAh0oKiZinjWubnkf
 tUIPdGNAPeXmodiRRAvJbEppk/GhzeMWkz06i6suzUdwCwJShpulXqok/iSUf5sfbwzY
 ndfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/1A6J8+RLm48YTOJpb4QYlNWmGZ+O1jQHGeFKlJp25E=;
 b=oa8VZ+C4x2SJWRO/MTJxpvaanHmR19jHbjTu35JmrAW7rzUDtK8tqT8FvuImTQ96kY
 wr9OTmmLK/5Y3y2X2gxebYr3Hv5kTIlxvkCANtUyTsC2InCWYXe2JWnUzJjM0fftjown
 HuvdfeGpig9EnmEw4nqCGQaSDrCFqjVoQQkQjfepbXY6w8R0Seit1XpFWfIYwkqPFu7X
 xyhiJdIHl8qPtRWp4DKhljJ+opMNG0WoMiGFaagUnLl26rNSfJYav3i+T4r/A4hypV1A
 h6kpnN1CP2ajpHOoqL44Wya7TB+u7Mp1EYQiY1nagu2Cs4szRQDZguyMaZdSNBKJ16ou
 9hNA==
X-Gm-Message-State: AOAM532NwdeMpttZ+2zu8eR8PT52YYC8ojVvtM1fozwwkqzaR/oByDxz
 zl+JUWAkwVKGUoM5i/uNisRWgg==
X-Google-Smtp-Source: ABdhPJwSaBnvIOnpi6UID0dW6tSRk/e9h+ZqxfJb2aCutgMj/Terhs6TB0VH6S2ZP2VNPaeNnVHakA==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr5857607wrt.150.1606849275001; 
 Tue, 01 Dec 2020 11:01:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:40a4:a590:1da6:9599])
 by smtp.googlemail.com with ESMTPSA id 138sm887733wma.41.2020.12.01.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:01:14 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/3] usb: meson: fix shared reset control use
Date: Tue,  1 Dec 2020 20:00:57 +0100
Message-Id: <20201201190100.17831-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140117_968956_F519D311 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset fixes a usb suspend warning seen on the libretech-cc by
using reset_control_rearm() call of the reset framework API. 
This call allows a reset consummer to release the reset line even when 
just triggered so that it may be triggered again by other reset
consummers.

reset_control_(de)assert() calls are called, in some meson usb drivers, 
on a shared reset line when reset_control_reset has been used. This is not
allowed by the reset framework.

Finally the meson usb drivers are updated to use this new call, which
solves the suspend issue addressed by the previous reverted 
commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
use").

changes since v1: [1]
* Moved reset_control_rearm after clk_disable_unprepare to clean things up
in reverse order of initialization for phy: amlogic: meson drivers

IMPORTANT:
This patchset depends on this patch [2], it adds reset_control_rearm() call
to the reset framework API, it has been approved by the maintainer, and
will be applied to reset/next

There is currently an immutable branch with it [3]

[1]: https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylib
re.com/
[2]: https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/
[3]: git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  usb: dwc3: meson-g12a: fix shared reset control use
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
 drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
