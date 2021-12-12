Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BDDC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00luhAKlPuf7cUsif7EbfOqFwRYdLW513eUJIbMeszs=; b=mWwa8nuiFx2jhY
	/nkSVSxxbryV6T/3vdOYBRQCjibNNU3SigIlmTqyEB1hjOZqZazpcerBXL/Cb5hiTPtmzEx9QSwej
	XNlIlS6eUvWCoFVpb8ZDCb9rxy9r5Qx2UOs080rwqFqoj5f/yPx4Lk28wa8LH/y6AbtcGKGBtWDJo
	PxiIuO0O1ey9t/u525nwC11AT00+tKnhgEbBGQoIK/c+JdN9PTPArs49rPgP3ZC9EaeXOQIzkVMwF
	hNPoQ7tbC3o5SIMhZHvd6ByB52HZRBn67wJj6Dpp9lsMsduUbfeEy8oSkTwTBj4/v9gsGnwCTvzCw
	O9+UEA6iqMYcGlR4m6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVJM-007BaB-Fs; Sun, 12 Dec 2021 20:19:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVJ8-007BVQ-QM
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:18:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id u1so23774030wru.13
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kai+38ffN8h6EE4lcs4yXb6aSJaYI4aKa/cyVHvav4Q=;
 b=OHrb0CxnEGkk+A0FoXgxBbPagJ81j5Ten47px24G2jb+maDurlEHjgEge7FYXYmyGS
 vAZjK6eqwOwXQMgL4HOkX32LXFko7oObZuntxT04IBYvncbvETDvrgut/2Ck0ya/qF5b
 wEJCszgJcjnQvC1g+BQuqVnx+nPuVsEOdGqsSWWuw+mlcGF5i75ggl2ZCoVQrB0WwKXB
 sg9JEQPLFXfczqomsq+vSYYrjjt1BwBjN07DpHhMHuhZDECdbbcG2yGsefN8EGvWK51T
 XYPfKlzbfFetMpwTdBnHOAtBLIT8kS0hX0IK7nttm0VjmtB9wZBt8V9TKKADBbjnEqCv
 ASRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kai+38ffN8h6EE4lcs4yXb6aSJaYI4aKa/cyVHvav4Q=;
 b=g/X0c9bHoOgTN+tUOGa7nM5wurPGCbEWFV+fax8wk+ZiHGlRX+qhLZjYbTAFv6yvZa
 f5Ek37Hq/AGw9aUFUgUvBcpRj88fsURIyBRFxHQSlgefS1xXbN3OI/GaxeOD0Hxykgb2
 zf12EsS2oXF8WO60wunL9VZ4ZDYZuQD3jWtjCzFRzFA3H03JApvI2ggfLrqe0nS8oadJ
 1D4jQMAnfTAhsH9XnnrgbXEzNTG1JO5JiDA+Sw6afPbiSSiH7jb5HFE6VgQzVEVtyuIS
 nZBD3PbdT8amGknVYTSjR6YLIQzXyLNrQ+FszoHNMQXNmGD8XUvkIw/YK/N6HPKwyOew
 OBvQ==
X-Gm-Message-State: AOAM531P5khSrwWUzmQ12HDi0NtOcGxgW7SZ2fNoybGMDqzfIN3/qQmR
 aVOECUI8DpBTlR91lV9fFEryYf3KAlQp7w==
X-Google-Smtp-Source: ABdhPJwRch+y3kMPJINftWfz71kXXxhOT6aJCL97WR9M4GQ2LHsTtE1wLvBDA8lqYqO4uUdxL+zKZw==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr27337627wrn.72.1639340331606; 
 Sun, 12 Dec 2021 12:18:51 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:18:51 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 0/3] usb: meson: fix shared reset control use
Date: Sun, 12 Dec 2021 21:18:41 +0100
Message-Id: <20211212201844.114949-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_121855_056333_69449DF4 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
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

changes since v4:
- call reset_control_rearm() after clk_prepare_enable() fails

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  phy: amlogic: meson8b-usb2: Use dev_err_probe()
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
