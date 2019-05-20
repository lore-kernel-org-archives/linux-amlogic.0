Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FF6C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EBD216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="COVlwUFf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E1AMWXuy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7EBD216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrDC0Bs5iXe73YfP6AW96mq9bsshx/N1nhrPKeZqGxY=; b=COVlwUFfH1aq0R
	Tq5JFMBYubyzSNlC9vXs8xNGJvA63M/CduKiw9hxIzFKyXuVvGSH6RoMbQ7+7l5N4s0cmjFenvMXH
	fql6um4N9FoFsxVOOMMtLsUsQLCoU85Qs5Vry0pjzvQA/a9/SMHZ+qUKoHbAfXKJl/BFi53GBXvOm
	u/MRScFQxLTXxc1tMvgGgbT55uVEXXNfinTnMH8Tg6JSv4YMamxQIM/jT0Zjd7ujrdji5mTy/bRx9
	oFwDx1tlofdiQXfxGIlng60U0wpCehnsYNxBCTKcH6UXQKgI1+/rOY8a0Z4eu0m1C92WysJgGeHG8
	t+Nq6vn97emudmlhpSmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjUU-0003qg-Mh; Mon, 20 May 2019 14:42:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjTg-0002p9-2e
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:41:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id w8so14930818wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1us822oM0AhXAzcfAqzMQ3a5bieM7q3ASmOGadOuJBc=;
 b=E1AMWXuy38k5enWVyxUIT/ZFjHFZOcLT7CtTfUN1RC08MO3lMPdlB9MZH6gbDpwXD5
 sIKnvw6Pt9WOWPtKKFY5ZZBINljbEiv3mIAs3Zhvs18xzREQM10TX32ptwEB12C4QqgY
 wQ4lwYft+xHb2ElPch/aLITUutJEdMrtuT37fdrqAKdcI2c5c79ymYkeg45++A6eV93b
 JHs+yVdektui4T0pIf5OS1mtK+6pKlECHlMbVhcw/HI8lRo17pkA79XTzmrAuaPNECpq
 O4TXt98WUPh9rzKjCQ5u6chtmr6HTFHcyANC1+0he2BUvbUwG18Rs6RReBGUMJ+J+z7o
 LJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1us822oM0AhXAzcfAqzMQ3a5bieM7q3ASmOGadOuJBc=;
 b=t5eyPA4GNLxvB5fngQi3JuUqohRpS2YpKkxQtiT38eFKNTKpM4ktSqMSB8eC165dBL
 KeGkN8hs3IE1sTfXfvWbk1tZTJGlV+quqWmHupTgtN3lVVibyEIyX0AW73YUBUgG2rO1
 MCv0HRJODqTiUCs75zl3b7DT8vczoYmpKCZV8c7HU4izLTozyJB98F5hlRxaC6Edd51T
 vouG5oTmVnQOl97u7GehL73DfxAJANv6NMR63rKKdcfNEwwntYUby8wbtGYYANwc+a9I
 hWxXjAQUBXVGhFh7YCEiks7cHsECH/iVR+znHYYsrDGe/PyXxi5uZqxIWlYltdLCHRpW
 Hy+A==
X-Gm-Message-State: APjAAAUfCLRJCn9uNxxoFNY7cjX0mdpcCkvbF5y8Rnwk+S2kTRB+GibF
 bYh08pDqUafCiLfCiF7CxC6QEy+nbEVJlA==
X-Google-Smtp-Source: APXvYqzBMSwJalhz2Y3RNdF8Ya61WL0sUiZ27ozMXzLdu3QUKt9tpH6yOyRHK1BjUf1IUkGmcdgesw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr7135680wrv.268.1558363282687; 
 Mon, 20 May 2019 07:41:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:41:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH 3/5] dt-bindings: gpio: meson-gxl-gpio: update with SPDX
 Licence identifier
Date: Mon, 20 May 2019 16:41:06 +0200
Message-Id: <20190520144108.3787-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_074124_274394_F1434A23 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: linux-gpio@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/gpio/meson-gxl-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
index 01f2a2abd35e..62417358f55b 100644
--- a/include/dt-bindings/gpio/meson-gxl-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxl-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson GXL SoCs
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef _DT_BINDINGS_MESON_GXL_GPIO_H
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
