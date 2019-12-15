Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C61C43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:02:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CE424673
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4DmfeH7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EdMEfomi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CE424673
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzGNQSvTrFgyAgRNhDlo16DPWWpEQKrTM4WfeBcAnR8=; b=Z4DmfeH7mjuUCh
	zb+geUN8DWaojh+4uSIlSaGZwWeSXPpbQ039nH8VCYpk1PXXoIQsk7EL7q6SkXXdvNQ2PBAUZgpHQ
	oyveNBFhwQse9fFkzb/TUNHVRVaHVlT9Q93cqs064a3EG3Dp3XfYLGgQ3Zkr0+XHgaJQ1JPQqWufr
	/qNj54Ufy8bczXohSW6nDT9AIVMAQczrfhesCvwQtIVgX4gehR+0oN2eA16OLT0lrZrE7Z8GBgBdD
	xwYsLBBi5yavwnvvSMPvEWAFde/Wx7JyNESlRWwCikZdV+uAjsZN/+1x2c5dMo3WZvJgyL2wwhC00
	nXbWB+fxCcurAaIvcZqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igb23-0007zE-9D; Sun, 15 Dec 2019 21:02:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igb1r-0007nS-KR; Sun, 15 Dec 2019 21:02:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3so4825952wru.3;
 Sun, 15 Dec 2019 13:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gHIa9kqk84t33T9/NR0KW4i+WbdOUW3zGPJ6/IWE5o=;
 b=EdMEfomij+fA1v4b/Yor6lscI3NPOuQmskR5Fr1gAOqyq5dbnCqVnM4yIIEtgkWAku
 EW4kz6sHZIwfrf/X1Y/uXzcuWcaS/m5ukjlM+f0sPTwKyWthLe5RKObOyDdacAoQ6iOV
 jDBbUqupMO0Bk+5UwEw4vCAI7QrBxmfjOp3n5KHnUkRmMhS99a+slIp74029MYHP8zmk
 R05TuKtLVIJwPF5FRrhw1XJF301yoURMYqgtBvsCAVGcpxlgBMBSjVjTZuywFsSuIDxj
 f6DfoCT7iZM+pVHl6DIQr3qo3nxoKCL4LTvc3a5AfroEXdwPs8TW7A0eKfsf8swGHYHn
 9qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gHIa9kqk84t33T9/NR0KW4i+WbdOUW3zGPJ6/IWE5o=;
 b=L+G/3MIiDL0zbwDmKisy2EqF0OVW3fjGbxdwSCf3DjAFO350OJz+/Bhpbj7b/akJjl
 U2SCsQwguN2PoGco57rzfD8t0I6EqsSU5VOL69e3oTdI+M3ExkXWC7zfI/XPmLBRJ4Yz
 G8armfH2QbWUGlwZ2Un0ErZXDVa4lo0MQTpC3ndHzGKcWkP24IrDP7pcJK8oaCeWYLNz
 fVbaK2QhxYhvRwt04dzwVrMrDwQIztWmNLbnZMmjaej6QCesZY1tmMoYKI3X5QIt0nxB
 Zowm/jLRcQgoAs9gPRtVioXqLcgVg0HiT+OI5odhhIcNplPAfVUvfAxFy9Tqj4XYXsbX
 3OWA==
X-Gm-Message-State: APjAAAWqlqztgogbKB+qlYZULL9z3NMDKW7q9yxOuaoMyqVl48C53/n1
 u2M4UpFa9ELZaeb5aPdwCY7SWoIh
X-Google-Smtp-Source: APXvYqwgM/b7u1mLXpFZdVCEUisopxkubQb3HOxGH/WKnOjGP69jUA3GLe0OxIjfyI4giLcKZXVjTA==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr26014162wru.344.1576443733657; 
 Sun, 15 Dec 2019 13:02:13 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1370FCC00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:370f:cc00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm19565645wrp.93.2019.12.15.13.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 13:02:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH 1/1] clk: meson: meson8b: make the CCF use the glitch-free
 "mali" mux
Date: Sun, 15 Dec 2019 22:01:53 +0100
Message-Id: <20191215210153.1449067-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
References: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_130215_665939_8FC5B0C5 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Mali clock tree should not be updated while the clock is running.
Enforce this by setting CLK_SET_RATE_GATE on the "mali_0" and "mali_1"
gates. This makes the CCF switch to the "mali_1" tree when "mali_0" is
currently active and vice versa which is exactly what the vendor driver
does when updating the frequency of the mali clock.

This fixes a potential hang when changing the GPU frequency at runtime.

Fixes: 74e1f2521f16ff ("clk: meson: meson8b: add the GPU clock tree")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 3408297bff65..6b13084eebf5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1838,7 +1838,7 @@ static struct clk_regmap meson8b_mali_0 = {
 			&meson8b_mali_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1893,7 +1893,7 @@ static struct clk_regmap meson8b_mali_1 = {
 			&meson8b_mali_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
