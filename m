Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921D0C48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 14:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6574C21670
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 14:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VR6Il/Ta";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8is5qvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6574C21670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qz0pHX6A9wcsx0UQVLNbFrYTte2/FQ2HsolI61cFbN4=; b=VR6Il/TakMcgCEssgzfQXO8Low
	oIOOkITl0vuBtE8Dso1mqFWiicE7xIfQZmQ66AXX+z+Qs5RcZrNo1+hKQq9bTpVL5FIqh1gDvwSSi
	+Qle20x6xze0pTcrPMjXX6fu23nh1RMWRLPj5+chRMeyZmR54H+TljgkzUQh6krl8ASd5JvTX4rGk
	A6DD53/+agWhAUrgXa8My2xiirrVBFBTyTIlFsrbNtywWYxIEkbX77xlV6bT7eXf/D6lyJXqLorHR
	de8fjKu0jj4/JA/7CkJkIpn6goNZcDKed7JHzFUEQNmK4ActvOJF7jwMmLAuIz1jNWozzObBV2Kyu
	wbt8aaPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg9Cs-0002Jo-PM; Wed, 26 Jun 2019 14:47:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg9Cc-000268-3S
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 14:47:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so2408636wma.1
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hAqxSgIO55AtglPI4y9BMkAp6zehdCTsbn3850+kcK0=;
 b=I8is5qvOAbLHl5EvFgLyy6VfBkaCh78I963eZv4LlCwEHuFftdH5VYymmJ56ufEkH7
 Ne5caOrsKs50/vTXTnqXhvRQ8AUKSbinHooiUBjR2biuImVAaklvSvFYlLPkttdKfpv2
 9htGRaVoWfz8COa8Bk4aACr9vxKAAKfEy5m5QPGkbqsmZTPwuO7srXB7vnd63Gm2ZZ5e
 Vi/8EPpMOaQ1sa5w7FrdM7OAsrKDHagF/xIW1pI+SC6Z8N/+2gOX310++nbDMowMXr1C
 fn1OMkHe8nMTwefqtH0RM3BdzsblLHSz1HK2ZzmLY90un4jLlWYuEeiNmbMrK9SLx4hG
 XASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hAqxSgIO55AtglPI4y9BMkAp6zehdCTsbn3850+kcK0=;
 b=RaOekYiZL1KsqSeMWcrv9nRtc+cRRQ9Lk8blwnGORedhWoo45o5rxMwx+ImTsFi+IR
 HA6tNZzjbkxUbDUYxFDrshb3bxU0fNiMrAtFV/CgX2maPsJP22bVqD4JL6RyKdJRQxTN
 L/JYHR7gR5h5FezRpfhWyQ5Kak8Ag05C1/Bur3IKfSTpjvhVLu4NOfmBp5WfOQjeHkMs
 ILO0vJeYFhNs7bfXBvCw2L8Dr88gmLnSE8aNiz9U6293WE1XEYZKt+9QvXoD+Iqsr++V
 A8KLqQ/208aFi3jIRX64zUT0hO2Ey8U1KJSu1UQsYHne5tkPJgvjg9HQJUz2mxPk0wMo
 aPsQ==
X-Gm-Message-State: APjAAAUY96DjhpkO9Nvxr1B+1DnkqvkW1F+VUeediqhClx8C9l6qU5LW
 knCpNUpovBTpkKItf9C4jA6exw==
X-Google-Smtp-Source: APXvYqzFn1J2DobNkC71K50j6OXadDRPvFyrzJW3kirwyhVhH9CJnQFidK8oV7luu39N/S+p3lh2+A==
X-Received: by 2002:a1c:c145:: with SMTP id r66mr2995522wmf.139.1561560432149; 
 Wed, 26 Jun 2019 07:47:12 -0700 (PDT)
Received: from mai.imgcgcw.net (26.92.130.77.rev.sfr.net. [77.130.92.26])
 by smtp.gmail.com with ESMTPSA id h84sm2718557wmf.43.2019.06.26.07.47.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 07:47:11 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 01/25] clocksource/drivers/timer-meson6: Update with SPDX
 Licence identifier
Date: Wed, 26 Jun 2019 16:46:27 +0200
Message-Id: <20190626144651.16742-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_074714_216576_149D7A3C 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, linux-kernel@vger.kernel.org,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

Comply with the licensing rules defined in the documentation.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-meson6.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-meson6.c b/drivers/clocksource/timer-meson6.c
index 84bd9479c3f8..9e8b467c71da 100644
--- a/drivers/clocksource/timer-meson6.c
+++ b/drivers/clocksource/timer-meson6.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Amlogic Meson6 SoCs timer handling.
  *
  * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
  *
  * Based on code from Amlogic, Inc
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/bitfield.h>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
