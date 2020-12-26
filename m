Return-Path: <SRS0=tT5V=F6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F27C433DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A3A221E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A3A221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7fsGh6YlEVmJ4fPjE4K8LU7rpXpbRA1EFckjmbEVAx0=; b=Zi8jGIO9J3fuFdZRunhdv+2jT
	NVgh/vyIK3llswd36PQiC3uUpAHmRZZGrVh2ZbBcusBP+BV0R/uyOaGchv3zOyQQkNdlsli6V+maV
	diM52VWBRlEUguEgffXnzU95a2+5DT1SeWMlcqvItV8KcRhfCjYcEUgSTduTWxzn5+SFSWly99YN4
	oxw5AL7dsVQg5Qu45WC+Snxe2m3ZL0sAU9Dz3VszGOqKYiJGqBP+SiqU76NRSdNxr+mc6Oz5w0PSR
	gigaZS/RwSpZgzyFqRyjwCjj+RZkP0Sy5cN/UaSzTz+X5vhfclZjfCXasN7mPw4iQxvwEGbTQSORk
	1kPrdndVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt8Y1-0005aU-8G; Sat, 26 Dec 2020 12:19:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt8Xo-0005VD-88; Sat, 26 Dec 2020 12:19:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id cm17so5796760edb.4;
 Sat, 26 Dec 2020 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yL2fcbE5+ZP0jQqdAhaNB9vo2w/Z2fyL3TP12vjX7FU=;
 b=CckdE00RXIg+P0KXwsJ2zofSD+5xhSncRG6G+APdtZkMLB2RknEgvQ/HKJ+nlURq2F
 hn3yJQ4THduC7LanFchEBXYEVrNKq4a+T5RDsqY2atQm3mT2jvv5fqzugiq43TGpsmzw
 xh2vzap9jz3yBfykGOcAD9RAklebl/s5gxjqcuaxODBbokuQJM/8U8KdB50TsqOeBd3G
 9ic+Vl2tNLJrjL6yMxbYY1GTYipIR5gPa0bxWpx8zQWmQ+LQZ8oRYssW+gGLt/S4DXQb
 am28sItsBC2uhgqdFSsgQ3YAxY1PigWdShJBfo4JHyZn337c/70eqrLxJoLcxd7L9TWi
 8SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yL2fcbE5+ZP0jQqdAhaNB9vo2w/Z2fyL3TP12vjX7FU=;
 b=OZ4wzq58uya+hy4QYnbQ9M6apv0jPA/WMM7RPERnBHltHPAxKPNEtnl4KR2kzizKJc
 5W7G0WPNs/sF4L9RRT6ViYsbBKT6wv9VjtgXQ3Cxwd84bTY+qwiM+GUAeRiplTBWi0tP
 ksHdBNBUB+4eb0axMiJOBO45mhMyJwALTHxwGAYLVz9lLukgDh1okXGkKXluGOVdqyDj
 MyhcAcG0w5RTJ8OQBbFghNE8cEKYsAykj6jOAEDN6JdhPZJ/WzKKdS0ETw3OENUQPtDJ
 /l/HjHRC+zNyNULuKgmJMA56UW/AfonhagYtMCdUgvgcydJs3fCLr3OKQ099K7+8RM3j
 f6pA==
X-Gm-Message-State: AOAM532b6KCwTS0VcemB36OrUE5+AvTU1ELZKlg0bx9OQnhQpQoogN8D
 CMqJF1rGTtRFvLDMU5ts1AbCPUpM0TI=
X-Google-Smtp-Source: ABdhPJzsj81ND9dZvGlpw/Zntemt5voV2doEU3AM0Bu6D87Z1uIxXjmwFspZHh7RGGNPJXzYKGmjOA==
X-Received: by 2002:a05:6402:2207:: with SMTP id
 cq7mr34967288edb.310.1608985174842; 
 Sat, 26 Dec 2020 04:19:34 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137218200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3721:8200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j9sm33842662eds.66.2020.12.26.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 04:19:34 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 2/3] clk: meson: clk-pll: make "ret" a signed integer
Date: Sat, 26 Dec 2020 13:15:55 +0100
Message-Id: <20201226121556.975418-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_071936_367468_2394B73D 
X-CRM114-Status: GOOD (  13.59  )
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

The error codes returned by meson_clk_get_pll_settings() are all
negative. Make "ret" a signed integer in meson_clk_pll_set_rate() to
make it match with the clk_ops.set_rate API as well as the data type
returned by meson_clk_get_pll_settings().

Fixes: 8eed1db1adec6a ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-pll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9404609b5ebf..5b932976483f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -365,8 +365,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	unsigned int enabled, m, n, frac = 0, ret;
+	unsigned int enabled, m, n, frac = 0;
 	unsigned long old_rate;
+	int ret;
 
 	if (parent_rate == 0 || rate == 0)
 		return -EINVAL;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
