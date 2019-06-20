Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D22FC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F97A2070B
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJb9lyJr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T7Cq03+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F97A2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYTkOQYvezGkvU0BpINmlMfkh/h+J/Lwb9OMT89IfOQ=; b=dJb9lyJrSi3LPT
	ZxzSdEKuU0MefWZw5Wau+ZvGEVpZ1fIP7+/9N+knVwBjcb6FDGyeE/0wbtNxeQloLKfHIPZJ4UX0X
	UyplwVa2ZoLjoT4XraeqsEGCqSvN4jWMbiTxAWq8tsF2QfAKUyI1Ue8sNFYasiqT16Fqhr7z6UDn3
	toysbcf69tyWcK1hklHBhxHWuugADX8zw/9xmwAIlrvvYjEv+Yj7jgHm1rYWYBzieW7qBjS/zX5LK
	rudCKmVu1MTHmPJMSV7Ha5R9W+GfFs/KFBbAgLFGUPcMO/dF9hIHstWiwWYPK7tXmySOV8BggG/W7
	jXjU4Su83RYMvppINHHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he4dn-0000MQ-MV; Thu, 20 Jun 2019 21:30:43 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4da-0000C1-90
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 21:30:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id s27so2252601pgl.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PSngLiKCARM8vfl1eyrBhYLURk7Q+qO0cLGvH0A3iVA=;
 b=T7Cq03+1uAfj55bksp6eGyDn4NFZ/RXX728L8E9GRbxq6u6fAiaV3n4yTMCdiKqPnt
 1w3nhDtqIMMV5Va4CVQlG1Uuo1QVmCuI1JtMVxvhQN6GsDXadnNM0Yr/Vz2uPXFLlMa5
 UyeX7PsNAJESXOSUxK0nZyjNeylX8KzJozht5V7DbMAenfYSJCRTxYYvqfWskNxn2Afj
 kz1/rSSgahx+gLNp5n3dzAxkDr1X4G/2Mtb1jjcToP6+153mRj1EnKydiord/jdvl8mD
 ppyOCAYWqrKiSSzF4xgLpkoD8y1JLsutA1SiohReeQfzX/Lg3T/cPdqOlosi1D/uvC0G
 ZZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=PSngLiKCARM8vfl1eyrBhYLURk7Q+qO0cLGvH0A3iVA=;
 b=tuhJ6x1YG0wcmKLARW2vkhDef0Pbjmdns1EvhjPbiFG2bbYJzGXcXsTEchEKWOc2sx
 5E2EwEOKRuyDdgkN9p1b6HimyYIz6jsnOPfGDJiV3cma1NxHiOIX0rC4COHkap6TDRZv
 +gu5L36rU/J/sr0fO/vJirlTAr3PeuYKypO+4RBPNYfvZIJscHCRQpPbCbZMAgtJlsnv
 ADrN/Ix5RrZz2inS2vUx1PqI2F92Z/jjwqwwvRQ13vf4GsQqBtjuA02xwBLj7f2KsV0/
 hIvUG/y+oa37Mqe3MqknFowsnHq6sulA8sWB6OmdSFxuUIRGOk93G/HwFXcKavHEARrl
 sh7A==
X-Gm-Message-State: APjAAAWFh14oXOUBCZDFYPWpKWXEXTW+ti21zQMFzqtQtiKOLiljA+ri
 kpBrieA7UosI3UidHWldUT8gMQ==
X-Google-Smtp-Source: APXvYqxLGSQfAF8f9kOYdADaXp2yg90LdmryXc18yWGDwh2lpCVpIT0kB4+qGTJUD2uTejoTPZqnsA==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr16662290pfe.236.1561066229088; 
 Thu, 20 Jun 2019 14:30:29 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id n89sm18722182pjc.0.2019.06.20.14.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Jun 2019 14:30:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] soc: Amlogic driver updates for v5.3
Date: Thu, 20 Jun 2019 14:30:27 -0700
Message-ID: <7hlfxweyh8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_143030_323987_95F797B3 
X-CRM114-Status: UNSURE (   8.80  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 9a98fdf5b6e635d9d9710f87e1da42aeab12ff0d:

  soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2 (2019-05-22 18:19:14 -0700)

----------------------------------------------------------------
soc: Amlogic driver updates for v5.3
- canvas: add support for Meson8*

----------------------------------------------------------------
Martin Blumenstingl (2):
      dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
      soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2

 Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt | 10 +++++++---
 drivers/soc/amlogic/meson-canvas.c                               | 14 +++++++++++++-
 2 files changed, 20 insertions(+), 4 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
