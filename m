Return-Path: <SRS0=Lu7g=T7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A9CC04AB6
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 May 2019 10:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF6A26780
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 May 2019 10:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AT4WQvzb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oqStfDIl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF6A26780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yHbx4WRuFCehk9SlLPnBeX1RkUxwXfQsvSxLFXLZkpk=; b=AT4WQvzbmzKIHx
	5LRV/fIxwntX1QTkSPAsFjBhZU82xjxzvvhZ12oMetjdkUk+sCUz8N3oB1EYhU0jCM7bu4HANovLX
	DcbB0KLgOuLjYVAbHA2Ya1/ft0oBYiLbLq+7qgeq3rKRE6AasY31b6VIIDrBe2PitwqTET57b4vsd
	3Y6dbCeDrxSEQ6QbMTs8Juw9NYhHKadBy1+0LLjfJnHVUyirK7C4ZMvzh5VbsK1UdICOTlpoMK1Dz
	Ly64WqVKJrJPGq7/5yM8e/eNsRRwk5CydHCOYLEQNCJdKN2WN6RTOqV1Timf14YYNRgBmPtPny33S
	/SytSvRxZ+7O72PIX9jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWeqm-00067e-AJ; Fri, 31 May 2019 10:33:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWeqe-0005z9-C2
 for linux-amlogic@lists.infradead.org; Fri, 31 May 2019 10:33:21 +0000
Received: by mail-wm1-x344.google.com with SMTP id 7so5602361wmo.2
 for <linux-amlogic@lists.infradead.org>; Fri, 31 May 2019 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByfPDgU22Z1U1XSrJRvjO9v2H1XpDQdjYxUHf9uqjyc=;
 b=oqStfDIlIvDhQcvg02CGqjgJ7Ao8oVncyoutW0cZjjWZ58BOJIESPVLfHcy1Z14EMG
 xEAxiq7yhKTu0YlXgoHnS5DqWjOrtmcOjkYtlo8sN85WUB5cpaLMYHaPAmVdBa1gYzl4
 3TdtYf/g2gLQfx4TkB6ZwxU5tAWDa875de3CK44we9z5lnWpAg3qLow3qvGZyw5fqByI
 anpgZCTe1MSQwrLWQN95Aut0KAj+F2NHlcWIwvI8QSqxoyAo6kt0Q7Ea7VZEK7STuA7y
 CaztDXWqWndS69y4O++k2U3ZO0XDlOC8Om/r1jB1ND2Lvb1tpftUFKO5Pgsvb2/KN+K8
 sxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByfPDgU22Z1U1XSrJRvjO9v2H1XpDQdjYxUHf9uqjyc=;
 b=aIKvf0446k30Z8wN2dY5LQMrhwQm6LyDy9NAfvAZU44uGwG6Xm/NQXcMNbVH99II4u
 GBHxXWrsINHX8tytWVjfE9f1YnJ/5eY5O5oXzzu92+c+3Nln/WG2O/UijihFMjPbv8K0
 lIVqahOBzeOpqzVAaZlTY54ltUnDjsJYASWC2kqC7fj74gr46BZACGxqAEdDOrnta6Oq
 KGU38Q6CLnEOdXtayiweAUTb3VG1Z1wn+udf9xnGush/OxvISqlt54U/tkYvw/OfOh1Q
 nLvxWme0ya61dxRWa9np23gokpPbrdAJi63i+SeDu3fNfmkjPrF/nsdEbYoo6HQDNBok
 0bVQ==
X-Gm-Message-State: APjAAAXPXN9r/egpwOzH/ggpIzNj8mYlOFP/Egttx1aYtNFM7Ki17bla
 E8NigSYvZT26tvRdnWEcuWHbTA==
X-Google-Smtp-Source: APXvYqzjri4jLx4G/XNJBs9hd4fjiKEFHxhfjCQjKElQHrV/S/VVwy5aVTcTRF646Me7ACF6VyIlqA==
X-Received: by 2002:a05:600c:22cc:: with SMTP id
 12mr5271222wmg.141.1559298798562; 
 Fri, 31 May 2019 03:33:18 -0700 (PDT)
Received: from bender.home (amarseille-652-1-291-131.w109-208.abo.wanadoo.fr.
 [109.208.94.131])
 by smtp.gmail.com with ESMTPSA id h14sm4038960wro.3.2019.05.31.03.33.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 May 2019 03:33:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org
Subject: [PATCH] media: platform: ao-cec-g12a: disable regmap fast_io for cec
 bus regmap
Date: Fri, 31 May 2019 12:33:15 +0200
Message-Id: <20190531103315.15166-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_033320_408175_33A12039 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-media@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With fast_io enabled, spinlock_irq is used for read/write operations,
thus leading to :
BUG: sleeping function called from invalid context at [snip]/ao-cec-g12a.c:379
 in_atomic(): 1, irqs_disabled(): 128, pid: 1451, name: irq/14-ff800280
[snip]
Call trace:
 dump_backtrace+0x0/0x180
 show_stack+0x14/0x1c
 dump_stack+0xa8/0xe0
 ___might_sleep+0xf4/0x104
 __might_sleep+0x4c/0x80
 meson_ao_cec_g12a_read+0x7c/0x164
 regmap_read+0x16c/0x1b0
 meson_ao_cec_g12a_irq_thread+0xcc/0x200
 irq_thread_fn+0x2c/0x60
 irq_thread+0x14c/0x1fc
 kthread+0x11c/0x12c
 ret_from_fork+0x10/0x18

Simply remove fast_io to use mutexes instead.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3620a1e310f5..ddfd060625da 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -415,7 +415,6 @@ static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
 	.reg_read = meson_ao_cec_g12a_read,
 	.reg_write = meson_ao_cec_g12a_write,
 	.max_register = 0xffff,
-	.fast_io = true,
 };
 
 static inline void
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
