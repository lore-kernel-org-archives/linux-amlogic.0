Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A95C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DB3216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c1brWIXm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="COuaP2MB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DB3216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iFIf4ND5WDIN0yHVNASXfHilh+viTooqNAzgTAbGAmc=; b=c1brWIXm5ZcEFR
	rAnfDLWWzxoWZH8/FIZk3fW66XSgI59bsd+RhTnG+iMYWQdIwf/ylMe5zZPl5O3vXBCY9ysQ+CjjP
	HRpSVWIl3t/3jSYc2u1dylJ++8gXQRks92cLrpZT/LVRxi2UqVWG1Q3/GR0mOVLZEybxIJfHjU7GO
	avjD6hz/kF7dBr2pUGzl6x1ARS+1GWAE/GHQrzXz+CecZI9UgKTzZCHF6H4Y5umQPlJo9x/gzDG0x
	jBcajEZ+shWgWtNP6xzo6lmQKBpk1oTmCqVFIQJrAFOSegH6fbqmGBkREuoYJXUGBraoAyokQj011
	c4gHxR26r9zrCBRfxw9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSism-0002UG-SP; Mon, 20 May 2019 14:03:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSisj-0002TS-T9
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:03:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id d9so1800645wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4GPEWsqSGIyKcLWUOXlYrzt0kxAdz+VJbHUnZMff5l4=;
 b=COuaP2MBnNWmngBntTsQoeRBks/Mc7dW9Rx6RL9bbz9atupXmZyHVyM5CGPycOM/n6
 8xVcnEnPA/L9itDuEmkLpaKMoLR83F33ROmW0vYMgSmFL5werfREgUWBvnn9NH3XsKUP
 T7p8ES/4c276ThMeDFvFkRDy7+3D5GhEy5mhGGBsBofNwqgl+8Y8/wujjk9yGB0h3Gq3
 fBMZRKVvffi4KNCHTppYERrvhI8vDj5br3gY40RHGQD8B1Ia6/68CjrRj4/eoIqBdQum
 0h5X7UECzZQTBNgYqk2dmCC647QtPHtX51c0Vh09eXOX2+wx3KJ4iM9k06dtQvEXoEca
 lcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4GPEWsqSGIyKcLWUOXlYrzt0kxAdz+VJbHUnZMff5l4=;
 b=q7LLUELALrAJGq+LXVTUn+2WCMInusz2Az8pN9DOrQckFwTYaT9zUV0zChSOeu8yDe
 874abdb5/9Egf67bA2b+/g32IPPlUjwnQvI9RuKfvjAj6G9WXSVPSGQpuJokHvtR3XHS
 /po5IhWFqIpZDrYn7PKX/KYdW8rdtKhDZOc7e2OeEC4ol+2lXQHmEImlwD6VTsiSG/2w
 hGM6ckoVUuFZQWDXdMXQr3GTw9ylvUQ2ExZYq9jH2QQjaA9c81RuMcQAbSB38cL7A4gM
 9yRFd4VY1uov4KIMWohX1cNV+Q0vUsKoNcS75/e+SByFjWuI9SpXhAP6sTsDUpIdrC4O
 fPMA==
X-Gm-Message-State: APjAAAVY/QobSgpw9uD+GaUkRB0920IhbvqhPHdBKtoOTbyspDEjCU4T
 X/I9L98dp7fJ3lVc2NkmcZLMVQ==
X-Google-Smtp-Source: APXvYqxW2HOtstliXfUJp5IEyuxHFFP18XQUBF3m6AqmQies8+8zwfm7C97xqkPjFQbVAoamlJqbjw==
X-Received: by 2002:adf:e691:: with SMTP id r17mr27306891wrm.50.1558360992409; 
 Mon, 20 May 2019 07:03:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y8sm14051419wmi.8.2019.05.20.07.03.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:03:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tglx@linutronix.de,
	jason@lakedaemon.net,
	marc.zyngier@arm.com
Subject: [PATCH] irqchip: irq-meson-gpio: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:03:10 +0200
Message-Id: <20190520140310.29635-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_070314_040767_3F2C2837 
X-CRM114-Status: GOOD (  11.31  )
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/irqchip/irq-meson-gpio.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 7b531fd075b8..d83244ea0959 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Jerome Brunet <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- * The full GNU General Public License is included in this distribution
- * in the file called COPYING.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
