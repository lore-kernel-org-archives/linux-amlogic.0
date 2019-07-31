Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B24C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD81206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6wLU3bJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QFW/c3Wa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD81206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VSKdBcnVz/cgSsTD7MoHxrpFEtE+XJ0W3v1KWDcv90=; b=D6wLU3bJhP2W+8
	AC0SLt78E4KYDLH87rLcZn1DBMzzPV1OHg5HH3lreh/i0Fwzp77HXEZuvvWxKN6b6A8UyLDcTPwr0
	iHRBFLwR2e+tt65H1YPgOpLlJcwqhl6sFBZdis8X0XwdkCEiF5X5woKMv8ZqlcqPxb5l1RQ0/ECBJ
	EyuNRTujr/4hXsFTfW7MmI2Jfrf6yMy5N353ED1JfbY+JDyHbKjIh0l+vclgjlqaNahlmgzry3Zum
	os/qjRubClL4mxGNQP1A7llJf1FGPem2hAGkKtrZYqvZ8KiXsSWvDazDIBxCS0qZoabP9J5BMEBC0
	SNIO9ddQNzkVhynN04Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjuc-00052n-JT; Wed, 31 Jul 2019 08:24:42 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjuD-0004kL-UM
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:24:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id r1so68619883wrl.7
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=923Ja2WcpXT79P86aL3lNG+qbwOggNaCyX5ijNpRJ5o=;
 b=QFW/c3WauL5r/F0ZtnfrXqzpOqeu5eaCNKRUXuqJoeMRA8C58lPUBaC3Dk3vyAk7u2
 2mp5c6hjhvIyYLyIsmXtkNOAhXBwylr0QuMoYthx29CxnyrNuRZw6yqnUcVaa8u7kPOI
 3waHbd0gqvRrvXjBCOdUAlZ4yVWgv3YN8O0xFCvzHzpYSQO0tCjk36m+ZKCR7HzEFkX9
 3Z4WI8E0b2ssz6KAYgP4vvnO4q0PBwZh+W9fp5QuT+J6PmCD6FNgvyyvLxmsH7hRyCxO
 5zXrzDqbX78wnpbrEqu+XhSDEy4Aeji6tRxf4fc7lMg4xwT9LGrMKxQ2gmiXEm50r/1T
 EmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=923Ja2WcpXT79P86aL3lNG+qbwOggNaCyX5ijNpRJ5o=;
 b=TUFecAZP56Gd6igkIi8Bg0JU+YPrWqFAKaKHeowwk9vHku1FcONNoq75edU/z7F5Dq
 c7QaerQ3FZqFyKM5MiYsqvoPcJkBNQqSXnk+Z2XFWu6t16xEc7Kfneq22ra3/Pa1jrRd
 2xGKmx+gOdkDg86MCZSofDsRikAzsmu4p5l8zPOYiPkpQD9kDUoSMW1F3YS1qca0jlze
 xuNkWpdESsN62L7QL16p3prV9bknY4NL/IzzcOKDtz6QOJbVAQEBX1W4dQ+G+f6wKdMP
 yB5MO4ndiwozX/nC2THR1kUbdH1b8SK4pRsJvCU/VyOGnx0mawbO8m5x1qKkXGKL5Cua
 kGfg==
X-Gm-Message-State: APjAAAWzFY0lL9lx04JJozjjxkHfjZF6i6f4dXnKZorBX8H+n8YjfCoC
 tbD5/z/gUO5C3/K8ezvcP9hkRj4qb5Y=
X-Google-Smtp-Source: APXvYqyW+Kdgzx7xM0neb1lynMTW4xGwPPQq/J11QHkYCb0v1hPS9K5b4vVL8TRzTgh4ggvSdNM09A==
X-Received: by 2002:adf:de90:: with SMTP id w16mr35937106wrl.217.1564561455192; 
 Wed, 31 Jul 2019 01:24:15 -0700 (PDT)
Received: from localhost.localdomain ([185.49.42.196])
 by smtp.gmail.com with ESMTPSA id o3sm54597664wrs.59.2019.07.31.01.24.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:24:14 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] Rework secure-monitor driver
Date: Wed, 31 Jul 2019 09:23:35 +0100
Message-Id: <20190731082339.20163-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_012418_169317_B8B1B60D 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The secure-monitor driver is currently in really bad shape, not my 
proudest piece of code (thanks Jerome for pointing that out ;). I tried 
to rework it a bit to make it a bit more tolerable.

I needed to change a bit the APIs and consequently adapt the only user 
we have, that is the nvmem/efuses driver. To not break bisectability I 
added one single commit to change both the drivers.

The remaining commits are cosmetic and DTS/docs fixes.

Changelog:
- Changed patches order to not break bisect
- Removed non-functional changes (PATCH 1/5) of the nvmem driver
- Fix gxbb/gxl DTS

Carlo Caione (4):
  firmware: meson_sm: Mark chip struct as static const
  nvmem: meson-efuse: bindings: Add secure-monitor phandle
  arm64: dts: meson: Link nvmem and secure-monitor nodes
  firmware: meson_sm: Rework driver as a proper platform driver

 .../bindings/nvmem/amlogic-efuse.txt          |  6 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  1 +
 drivers/firmware/meson/meson_sm.c             | 96 +++++++++++++------
 drivers/nvmem/meson-efuse.c                   | 24 ++++-
 include/linux/firmware/meson/meson_sm.h       | 15 +--
 7 files changed, 104 insertions(+), 40 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
