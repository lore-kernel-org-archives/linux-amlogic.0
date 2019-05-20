Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D8AC04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773C5216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aaie68km";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EeFetSQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 773C5216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B57E3SUXWMPXcaG3aEJGp7TyfiP43aVXFcXrYyVDJqk=; b=aaie68kmfv6NZS
	nEf6GVh/0q7ZK+P7JEpJbmyiuu6Lj/G41skzmHoN1It7ojZHbUX6jua28974SmxyPCaMDCIeodIAe
	xeRldTHceMKMKglcjSq2uJ1qDQNEhLznL6KhZ4qoPIIdiRASMf326cXSwG8lMhsbsyfDawxwlJMiy
	kHNFyXagttzfAKZpsxL5RxJZg6kvkzsl63H+7csDs/GepfH/UW9PamSJhNdJCHJm1XN3PNJGsLcXf
	/ODtt9hS3PoDTHoS+TigYUWZ4Bs05tprpQOw8qE5KVRYO6A8D5SlAPtP3q4bPsZ9p0JXel4XqJ2i/
	r4LgYamoiH0sC54uUYXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjUF-0003Xd-Ll; Mon, 20 May 2019 14:41:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjTf-0002oZ-K1
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:41:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id w8so14930777wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30PJ+hCzDjQrVZsjGcZ/FXod6I84WDUG4kPyRzhauWE=;
 b=EeFetSQar48eOERqadrJy/r1TMYWe3tvZZ9D73uAfTEe7xVlG9kEpGi8cKF+fZimcE
 vm0msi4QvsnBhRfGIWhN5NNnIwMhd93/3iJtEhj5AL3iIQrATygF4+gQuTFsMqLYlFLN
 K8lCV0yr+e+dSMqXTPM60wWxKOFL0s5xNJRlB/AXELJESu2AnSF2NWxHl/PjfcHkluhC
 BRI320Yx0G12ddsNFsbrCxYlX3WgQFy9wj/vrNsVbEp4AfInuuV5cspNpMkKwhQHM4DR
 PcO6080P3WqMfMpZxg0SuTR/h8UMnUQRpCWASqneD6F01V0xT4DLrhqhv9+ip0oEoCqT
 OwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30PJ+hCzDjQrVZsjGcZ/FXod6I84WDUG4kPyRzhauWE=;
 b=mEf2MUXXhMO+uDnj9scyGJGbEq2s9MXT4JKjrQ+NHxy//XuPAt4KwFiQRJp8HlBKwR
 NGLAky3oGxabveOw8jl6jd4+H8GUxNBD7SgduEEur+R1cCNgLuf+xEtfSu05oKV6sppU
 Ljz4qmBDqaM9Ra8LZwTN2EWaX9XaKkshvoBcrTZgjx1WocHObZ5wKqlh9zGNKriw8H2A
 QGegLvsAwyyWWIcyRdaW/gMWO6SpMpyv5vtxiedgWtR9g+0xRpmIm1wQUXi610ov6pp/
 +W23eCGjZ/qv/fetn8KH7TaZPZjEgFgyVDcJgFn96JLAWPf3+pCbhAJCDReO68R26vWz
 c4aw==
X-Gm-Message-State: APjAAAW+f5pW2RF4KYSHcfXQxo5p0wKbFYe5C8aRAlMY4pmpkwUZ+Akh
 vcP5rCi34VwSqT/QKTtsIMEwBA==
X-Google-Smtp-Source: APXvYqwy0QdFmLf4P0q3Gllfwk9oesu78IlGZ97TtHhp2ZY2oBw/SZe5fTVEuzIPvAu1zn35uG6lRA==
X-Received: by 2002:adf:c60e:: with SMTP id n14mr14278140wrg.255.1558363281892; 
 Mon, 20 May 2019 07:41:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:41:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH 2/5] dt-bindings: gpio: meson-gxbb-gpio: update with SPDX
 Licence identifier
Date: Mon, 20 May 2019 16:41:05 +0200
Message-Id: <20190520144108.3787-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_074123_748394_1B972189 
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
 include/dt-bindings/gpio/meson-gxbb-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-gxbb-gpio.h b/include/dt-bindings/gpio/meson-gxbb-gpio.h
index 43a68a1110f0..c93274d7e108 100644
--- a/include/dt-bindings/gpio/meson-gxbb-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxbb-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson GXBB SoCs
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
 
 #ifndef _DT_BINDINGS_MESON_GXBB_GPIO_H
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
