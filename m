Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17887C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F102238C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjFmvwD+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bQ7dGF4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F102238C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kN6qB9/DbYla0rt3kkqdlH880ZLAG2J6KQZImlQVREg=; b=TjFmvwD++tbVAGX/xO33vHfEwD
	BG2gQLaMLnt1cvqtU/ry0ml4kxOprSKEhYdqv6Eh60iTOyCV8NKuGdVNNUKS570IVzDSfMfXd8Zj5
	FRdBxpsWj66gOxwAdeL01BkfPBW/TziWRE9iaZlK1Ktb28aG8S/UZhOUPGnoT1zTfzp+rfMQAtxIV
	IvrBwy+AGKYn8oOCotwcVwr2Nen6NDPxID4gghZzWuL8oyGn73IzhpHXDXk+pcFtKfUUSHZsiK1NP
	BfzObnuwDyBLJp6q1++rXMH4uywTf8pxEMbNvLjVXPlfLy9vSKKkJV0+H9dRowc/CW4XJsBFkBIc3
	UhjYNViA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgsp-0007fN-QV; Thu, 25 Jul 2019 16:46:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgpe-0004LY-7S
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:43:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id n4so51568192wrs.3
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HL6tNC1MlW3akGtx+AMGL8mhLl0b5KdwEXzBA1olynw=;
 b=bQ7dGF4/GETSRk7Zxfwp7MISu6N+Uo7a7AOaKwjW4la2iC9/MKPZnNwHeH8iNOJjXF
 iNBfvfa5+I8BIq5Cg1614q8atAZV8QQTuENlgmeaNIQalv4+SludkEG424/mRvI0xKVp
 IGv7BJi/nxa0ZzGkeYjdGd3G9BtlvY66s8b9mW9eZuZP3DJ+W7Jf6v5iJpBT/NAC6PnM
 JW6g6CK2mo5Y0C8mY1GXgTBUCrOAZXv88bbWct0M9sbubIUNdHQn6JPYpEUvv3YDreKV
 mPq3UlgFM4k7P9gwST2xWkcIbf1rCS8429FpxkQlFYflDpI5nDzhDM1t4OT6rCwER3/X
 WcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HL6tNC1MlW3akGtx+AMGL8mhLl0b5KdwEXzBA1olynw=;
 b=dxxpWzxH7JFHlDfNmZpkG+cLtfXeaxnhvF6AksPj0FZDdNwkg7HcnYFC0F5Ns5Mx1M
 Bp/DGhFxZvp5w976IVkPKtsjcjcc6OFvuihcyaXQ/Jy/AA9fPY+XSQyz64qQcuMvJ7pL
 3qUMJbDgMyqsYUPRVJHjFL9tuXBhxhZWzhg5NRWBQnqkcOqwauaBneNfd5Cg5KhE8N+z
 En7wk8QqbSsLVOrHzyoTx9FteznZMV/mGI9Y+sd3Nzo8e8blqx1Dz/lpn/kOJQXpLnE5
 iMpaapa+lsi1BuTihO1agOyJysBgMawJJiEQDRQmzpLQbmi/FoccyW4K8I/Ip7tAgloQ
 2BRw==
X-Gm-Message-State: APjAAAXUzhb2V/bnV4T85bKecHM06Ps5JFlR8HQVuN/gzDlwuzTdAZq5
 ZdxBHzybvEb+XZiCzJB+LSZfVA==
X-Google-Smtp-Source: APXvYqziqaxehvGhptJQJHJhlUdG9s1AlbNEI59Oi8lXFneY0m9KRDdfC69QZNhAgFK5gEZRUxBsxA==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr100672917wrv.228.1564072984787; 
 Thu, 25 Jul 2019 09:43:04 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
 by smtp.googlemail.com with ESMTPSA id 91sm103031727wrp.3.2019.07.25.09.43.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:43:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 6/8] clk: meson: clk-regmap: migrate to new parent
 description method
Date: Thu, 25 Jul 2019 18:42:36 +0200
Message-Id: <20190725164238.27991-7-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725164238.27991-1-amergnat@baylibre.com>
References: <20190725164238.27991-1-amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_094306_332857_5A1B393F 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This clock controller use the string comparison method to describe parent
relation between the clocks, which is not optimized.

Migrate to the new way by using .parent_hws where possible (ie. when
all clocks are local to the controller) and use .parent_data otherwise.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/axg.c        |  3 +++
 drivers/clk/meson/clk-regmap.h | 12 ++++++------
 drivers/clk/meson/g12a.c       |  6 ++++++
 drivers/clk/meson/gxbb.c       |  3 +++
 drivers/clk/meson/meson8b.c    |  3 +++
 5 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7a3d795cc614..13fc0006f63d 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1096,6 +1096,9 @@ static struct clk_regmap axg_gen_clk = {
 	},
 };
 
+#define MESON_GATE(_name, _reg, _bit) \
+	MESON_PCLK(_name, _reg, _bit, &axg_clk81.hw)
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(axg_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(axg_audio_locker, HHI_GCLK_MPEG0, 2);
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index 1dd0abe3ba91..c4a39604cffd 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -111,7 +111,7 @@ clk_get_regmap_mux_data(struct clk_regmap *clk)
 extern const struct clk_ops clk_regmap_mux_ops;
 extern const struct clk_ops clk_regmap_mux_ro_ops;
 
-#define __MESON_GATE(_name, _reg, _bit, _ops)				\
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
 struct clk_regmap _name = {						\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
@@ -120,15 +120,15 @@ struct clk_regmap _name = {						\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = #_name,						\
 		.ops = _ops,						\
-		.parent_names = (const char *[]){ "clk81" },		\
+		.parent_hws = (const struct clk_hw *[]) { _pname },	\
 		.num_parents = 1,					\
 		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
 	},								\
 }
 
-#define MESON_GATE(_name, _reg, _bit)	\
-	__MESON_GATE(_name, _reg, _bit, &clk_regmap_gate_ops)
+#define MESON_PCLK(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
 
-#define MESON_GATE_RO(_name, _reg, _bit)	\
-	__MESON_GATE(_name, _reg, _bit, &clk_regmap_gate_ro_ops)
+#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
 #endif /* __CLK_REGMAP_H */
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 8cc7f5acf7ab..a8f706de811b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3325,6 +3325,12 @@ static struct clk_regmap g12a_ts = {
 	},
 };
 
+#define MESON_GATE(_name, _reg, _bit) \
+	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw)
+
+#define MESON_GATE_RO(_name, _reg, _bit) \
+	MESON_PCLK_RO(_name, _reg, _bit, &g12a_clk81.hw)
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
 static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 67e466356d4b..7cfb998eeb3e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2587,6 +2587,9 @@ static struct clk_regmap gxbb_gen_clk = {
 	},
 };
 
+#define MESON_GATE(_name, _reg, _bit) \
+	MESON_PCLK(_name, _reg, _bit, &gxbb_clk81.hw)
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index b30279a5bfcc..67e6691e080c 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2564,6 +2564,9 @@ static struct clk_regmap meson8b_cts_i958 = {
 	},
 };
 
+#define MESON_GATE(_name, _reg, _bit) \
+	MESON_PCLK(_name, _reg, _bit, &meson8b_clk81.hw)
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
