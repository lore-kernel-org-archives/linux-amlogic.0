Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE4BC43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:02:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E4B2467F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 21:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iaZxX04b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mbTNiwGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E4B2467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlccIjvH5y5UHF/F10iMyniDi9gCs92K+S6nmFrnoD8=; b=iaZxX04bcbPWWI
	Ms9gHLtUtFBB7MtS1CPAhkfjcVXcGMHRhds7WvC3IoNVDyG7medYdRVecwRYTXuhQrICo0Ow6H11i
	p18zG+MqtmK0V/i/L9QIOx0t/uVhm+Ec3+DPfmVzC7pen5VP1AGLW5MrAJlN0cWPLRvmdmfWnLgMj
	OlLHUdpZhdOrXtMJhzmHZDzMJWlrjkhaCN8WkpwHcC0m8zrxLojbGq5bI6U+hhOnwbfvoJYVjLH6N
	PuH8iUGU+i1Jnu2Hmv5YD4zHY6X2vn4F6qGQ/JGAQB3u5RmT53hTHNlHLQSQtuJ0+LBPRiugZjCOF
	hB9V64qu5+9zne80XvGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igb1t-0007oB-8x; Sun, 15 Dec 2019 21:02:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igb1q-0007nR-Hw; Sun, 15 Dec 2019 21:02:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id b19so4529418wmj.4;
 Sun, 15 Dec 2019 13:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ev5ncFOZ6pn1RKGaLQHfd+wzEPLZWc48NhzIDiNBMKc=;
 b=mbTNiwGcGxLE8/AdKDrOeX57Uprrn9eqyB81r57F+OM3HGhuGvrgA36mxHrmlPRJba
 /X14+icOF2sMXk5Mqv6TthEzJrFbUyTbSvMh8DuRy7YeVKuBYTM67UNLMaODykgVD+CU
 92nj1crd5sSqmkJ48fbBs0Yt+R0zSa6cV4SSEbM/07aqpwAkn4hi11KoFOuV2knaFyOK
 A2QEgkmo6As7ho30gQBmWD3kTyRqXf9B3O9y+KyG3RffpFc1T0DMLCJ4bSQqNAMGyQhv
 g0egWnkhevjUEaPsbvLV84h5+D5HZboktSorhwu1x0BVMV1/LliPL0ozW4jX96DuOCF0
 oljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ev5ncFOZ6pn1RKGaLQHfd+wzEPLZWc48NhzIDiNBMKc=;
 b=YvxtQkOyc0Dy8gVagAMu9EivjFV611XYGloEIKsh8BDO7mv+5JxIUpy22QHPKCKWjq
 9w6ngHKsY7JGAiL8MUeQssBk79CWSM0dHVCM3TLSr0HqMytbxS0x3i4efKX8iwuDy2Gr
 FgX7PxaJVOhOUJUuw3NcHo1jykkxR3Ma+Y8AYaiUVB96oJ+OaD3GLlJjWnMDVHhCD5hd
 RbQla7LRlYImlmu+Q0ulSWMn8niGxS8R3SecE68poA0wUK1BTcTDv/0kvlfXMyz0NCR/
 JT2ZuI5jrL9cCOLTSd9UQvac5BUWiaolZinCjD+wff948v3a7VRv9sTfkZ/npMlLZVS1
 WlGg==
X-Gm-Message-State: APjAAAUIXnpT7bLwTkcpRjCBbsbNrd9eO0e3AykUQuT5VCkrTS21MOUf
 BH6tAFNNLsF7EKkA3IKZ0JPd2kne
X-Google-Smtp-Source: APXvYqy4zElZG4fJVBRHzoUncu70+64m8M5QJ/eiHjlk/oa09t06tGUW1wwLeUN7ztldupMxZzQZgw==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr25825846wmk.50.1576443732500; 
 Sun, 15 Dec 2019 13:02:12 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1370FCC00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:370f:cc00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm19565645wrp.93.2019.12.15.13.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 13:02:11 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH 0/1] clk: Meson8/8b/8m2: fix the mali clock flags
Date: Sun, 15 Dec 2019 22:01:52 +0100
Message-Id: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_130214_616363_722F89C1 
X-CRM114-Status: GOOD (  12.53  )
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

While playing with devfreq support for the lima driver I experienced
sporadic (random) system lockups. It turned out that this was in
certain cases when changing the mali clock.

The Amlogic vendor GPU platform driver (which is responsible for
changing the clock frequency) uses the following pattern when updating
the mali clock rate:
- at initialization: initialize the two mali_0 and mali_1 clock trees
  with a default setting and enable both clocks
- when changing the clock frequency:
-- set HHI_MALI_CLK_CNTL[31] to temporarily use the mali_1 clock output
-- update the mali_0 clock tree (set the mux, divider, etc.)
-- clear HHI_MALI_CLK_CNTL[31] to temporarily use the mali_0 clock
   output again

With the common clock framework we can even do better:
by setting CLK_SET_RATE_PARENT for the mali_0 and mali_1 output gates
we can force the common clock framework to update the "inactive" clock
and then switch to it's output.

I only tested this patch for a limited time only (approx. 2 hours).
So far I couldn't reproduce the sporadic system lockups with it.
However, broader testing would be great so I would like this to be
applied for -next.


Martin Blumenstingl (1):
  clk: meson: meson8b: make the CCF use the glitch-free "mali" mux

 drivers/clk/meson/meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
