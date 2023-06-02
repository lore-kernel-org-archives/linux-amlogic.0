Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB52EC7EE24
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eLLBHbRiKfVMV7+Zsc3mpWB8eimvr0wqEM0HqoCLh/k=; b=kGsXfQKk2GEDEv
	5LwaNzue04uiVa73bAx4VtKzAyncGeHjaNQkp0Uc/69EFXUrQwnjDqVuOQsFlYHtyfi0nd0v3R64b
	ydVWWWEkCSU8TwOVlIOVZIGMpeUR4wFM0sTOEzX6k0N2B6ki5Q76Dr5uDhJZ74SaR4EJye3DDW1q/
	b+BXQsL9EgopGx8b3zJLI6cCqqd1bFCU/sVPOUrGibeNuDzw8Jr9L0VLhRacs/cc+aiijqCs7FQJN
	3PSu9ThD1ks5FB5wtLVgeWJpqtyedS9azs5K/1TReIQxGwr4CkH7QN0cN6FJJ1afPEtezee0yFGCa
	0pQECtbLdFa2MICRiF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q54AB-006vAV-0T;
	Fri, 02 Jun 2023 12:45:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q54A8-006v9k-0D;
	Fri, 02 Jun 2023 12:45:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 700BA616D1;
	Fri,  2 Jun 2023 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ADDC433EF;
	Fri,  2 Jun 2023 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685709946;
	bh=5tsFEnVqyWViniqebIjKt9Ya28HTseKy3clt1psmZfY=;
	h=From:To:Cc:Subject:Date:From;
	b=O7//ivusxkzvhpdpQH02dhNTkRC0sOvOF+YB0GwZhXGeBCAxwHULuqQQ9EpYeA7Y7
	 HqqWMyv7IKFQe3LBqy6LE7meK3hQOkXI2u0n7KqpER8SIEKY3OpcxsZ8JqXHVK/mFQ
	 l4y9ojcLWGGvBnGtYeHIGYcZYjgBCydx/1IUBI6lJwHfCISxvWbVvGVOhMAR/nxe5l
	 YOqXBfenMxlami2rOk0x2hxi6TmMy2uVKFH+VoupA6dmdZ72/6C/x2A+EFO4j98FZn
	 dT1cOVWYEQtQms+qsyzg1s8YBmiRMoQUi97nkETQ7gauSh8kyFxpU1LCjBVDlMsnK1
	 TukFu1vyjOKpA==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Nicolas Belin <nbelin@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tom Rix <trix@redhat.com>,
	Carlo Caione <ccaione@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: venc: include linux/bitfield.h
Date: Fri,  2 Jun 2023 14:45:24 +0200
Message-Id: <20230602124539.894888-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_054548_145568_DEEFDA4D 
X-CRM114-Status: GOOD (  10.00  )
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

From: Arnd Bergmann <arnd@arndb.de>

Without this header, the use of FIELD_PREP() can cause a build failure:

drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]

Fixes: 51fc01a03442c ("drm/meson: venc: add ENCL encoder setup for MIPI-DSI output")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/meson/meson_venc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 2bdc2855e249b..3bf0d6e4fc30a 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/export.h>
 #include <linux/iopoll.h>
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
