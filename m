Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373CC0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 05:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jmsdP2aW+PqTpA4wwFaVPl+TDy9Vo3y6wBIpSEfRkGQ=; b=CmEAJB85D1yZkZ
	pwqrxBm87hSwH2OrBNoGFhrAWD7EOGh+RxxxBO8FvXt71x6ILXoNQHp4k+4NQKzTbnoOtiXme+ZFg
	rYsYLUwHhTYxg5TfM9YiZk+r9MGXyJTbo5QuaD9MpwHk0+EIHoQUvSd7Pqa8Tu3JJnEi5hR2Rq6R1
	4SQVQsyOgNrFUFXp4pcan6tCh6+Pd3p4MQjX0Av3DYmVqb/IC1N1yCUJ9cEL16hnKA5CCVTjHSUi+
	xBv0kNVnX6b6DgpTdkXUqkBLV5CsUlsufG7j3YJCJO+c1SgymypZl9UPA14cJ2nfnhb4MiyBZaIfY
	0AOPhlo6vHr8nbFtkf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzIW-0056vu-2C;
	Wed, 19 Jul 2023 05:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzIV-0056vB-10;
	Wed, 19 Jul 2023 05:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ekLFtmXEMoC8k0OQiODEofz9GjmtN9os/zV/xDYll5c=; b=JqVPi6sO7nSBpaZCFaH/VKECCq
	zVmpr5+e2oeapAhWLZjUJgYJajfWXsJUcAz/C80n1PGw/XFVTF/Wd8OEfNGIj79IvV8gz85R1nNiH
	2BoYmZLovEUH51YW2jI8idbecaYNPiT9BUix3V4iqVmpUHCsRgTZFGvQZY9EvkldJ96igchMSg8Qt
	N+KLmh55cgPFZ1SEIBhH61OPZX7xVi+c9+7vMowfXk1XI74u2ebptfUmlnbFpvL8sctcqMbSW+Nru
	x5oAS/tFxH3MtuxI2L/LlRZtynue6XGHj8Yn13njCA0wkKThGpTnZLWf2SnpFeMrlIUZ1zXFT7zEK
	G899eucg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLXFJ-009REE-1P;
	Mon, 17 Jul 2023 23:06:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EC9C6131A;
	Mon, 17 Jul 2023 22:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590B3C433C7;
	Mon, 17 Jul 2023 22:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689634774;
	bh=enN5F2+0Je/0v6QMpoi/1qi66psAbjn2StPITSeJgBc=;
	h=From:To:Cc:Subject:Date:From;
	b=moozdmoa3scQHo00xU4ljARmocTwJJQoK+w9IiQPvov1X3YWaAaJ+cX/s1sopljXO
	 fwwDPLkNUDFzt9/0d+u84j+j03jJVWjf6BRyJoiXwo7s/RgvpJeXjxwVRB+1pNrzMV
	 fIOb55meeS0BQnUi4BxeOH+9L7JOaNZue7j3kW5j7ytqyoTFayKodFdhn5HwsGSYBA
	 mmd61rEzfsUU2CVH0pESz4MfGVD8pNjZAr9dri/E/mZx2LmaNbpMz9yHfEaa3pEGs6
	 xwecH9u4/RvzsmvTLJj+T9vKyXz7Mgt+/YgRj2YW9uayuE7tcjckAn9CyCStX5fTHQ
	 ZE9xumLQH3QvA==
Received: (nullmailer pid 3214522 invoked by uid 1000);
	Mon, 17 Jul 2023 22:56:28 -0000
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: meson: Drop unused includes
Date: Mon, 17 Jul 2023 16:56:23 -0600
Message-Id: <20230717225623.3214384-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

of_platform.h is not needed, so drop it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-meson/meson.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index de56e707c7aa..d3ae89dd84bb 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
  */
 
-#include <linux/of_platform.h>
 #include <asm/mach/arch.h>
 
 static const char * const meson_common_board_compat[] = {
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
