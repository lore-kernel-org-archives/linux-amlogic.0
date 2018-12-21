Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D86C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD67021924
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNxHMzrA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n8+A7sZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD67021924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IrDcUrEBxDBeSFfKYSZ2wra99dBnxW2ObDViDyJPAU0=; b=kNxHMzrAi/i3yc
	cmBxxaWA1Goe4JWdwdMrNK+VsEO7wmKJNwkuo4xv/h6KRK7G7m+edJaatY1xvxI+MOddAv3gnX8/n
	WhG966m8J7o/GPFHSz8/ykaNyL8ri7p/yjLFLru0H8ocibqdZMFeQmIXUmBYRRkDatN4jit3Xm6s/
	IxChxwCwp/b02SUhfAWQF+Jjs781NJHnJ89VjGhJhWNqPZiwM/v6a/17QMb/dHBEhJetBskxOPyX1
	RkTJe2QO7lHF7RaLsAcntii7LD5IPQkm9jl83KZOmmHDADg/7oUJTrwoQ/IAtU3WmUYuAe1LRsS5F
	47tWgIPycOmYS9FX6JzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNGS-0000JE-8u; Fri, 21 Dec 2018 16:03:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNGN-0000Fx-54
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 16:03:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id t6so5775021wrr.12
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JuNbTUIJB2KQ1KWfbG11yHK+NOLYz3WFk+GRuq8n3EI=;
 b=n8+A7sZgm6byDFHH6PhGFRlLlxdUy7mWfeO4fkzYkjf5jDCAvbo5ZLGGdMZxaJ5Ee9
 03cjKQnkTPKjrvT8f23sG38aYPMvcFS5Mwyf+rQOFo6GYeNHBays80AUXv8HLWCICHES
 1jQjfV6iPSwg87KQm1U82D+Kn1g8hX2QKaCVyw0vzfAgNtU6a1Rg73JOjVxJ30QFN4NR
 pLRg/axgJTb591/wbgiJTmzaeEerLXBOaZH/DxymkoQfphe9ASFhm4J9f/vxgbdoDbKt
 y6/TSyWYon2HHcAkYXWHBhuDKuJYFWFp60kADFx+tJbmNDBhzE7JLijzFFT0hilyJTho
 NzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JuNbTUIJB2KQ1KWfbG11yHK+NOLYz3WFk+GRuq8n3EI=;
 b=n32vTD3h+uLFA0Bb0LLBhTyvrEv4uToP0DpuZiMmA1RI/a2Elz3dWfDbcoe2xLcWQ9
 Cr4lhdHCXwbC7AUJmNrdUYnVF0eacFbw/+ZwJwyM++ej1RvBigAv+43qTejg+WFGqLxz
 2GoMv9YSNXvjCka7vshsy4P7Oc+3gBgmSXsFbtJoHW6odUFDcdk+9avCPonxTHc2NAJF
 ObMKAMvDenjGu1P1fr3WaaU3+X7kDUKrfIFSaqNe7KQoqofhjZEER9H1aSxYVOVA0ssY
 Jjn7ahGJhsf/lQbdRzJS5gOCGY0SZc88NB1An504GIkxSMHxXWXbqrmTVsumgLI6nRat
 9Lmg==
X-Gm-Message-State: AJcUukdWJ7AOjM5f1Q2gwNHTmFaOi/F5fntJM+1IMI2S0g/f+i6KU2sG
 J8Us8i/qmz+s6ugVJxnsM1Ja9w==
X-Google-Smtp-Source: ALg8bN66cugOeyIXXAyYGeREaUNhYbEcLYQlXEO8zEo5Cv5NFj7Xoj2NDo4M/davvFY/SqFnX9xVhw==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr3104693wrt.43.1545408167111; 
 Fri, 21 Dec 2018 08:02:47 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 y138sm13044021wmc.16.2018.12.21.08.02.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 08:02:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 0/5] clk: meson: axg: add 32k clock generation
Date: Fri, 21 Dec 2018 17:02:34 +0100
Message-Id: <20181221160239.26265-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_080259_203290_A45E6836 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The goal of this patchset is to add the internal generation of the
32768Hz clock within the axg AO clock controller.

This was initially added has the CEC clock on gxbb. To properly
integrate it on the axg, a simpler 'dual divider' driver is added.
Then gxbb AO clock controller is reworked to use it. Finally the 32k
clock tree is added to the AXG.

This patchset *no longer* requires depends on this CCF change [0].
There is a work around in place until a solution gets merged in
the framework.

Changes since v1: [1]
 * Add work around for [0] in gxbb-aoclk

[0]: https://lkml.kernel.org/r/20181204163257.32085-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20181204165310.20806-1-jbrunet@baylibre.com

Jerome Brunet (5):
  dt-bindings: clk: meson: add ao slow clock path ids
  clk: meson: clean-up clock registration
  clk: meson: add dual divider clock driver
  clk: meson: gxbb-ao: replace cec-32k with the dual divider
  clk: meson: axg-ao: add 32k generation subtree

 drivers/clk/meson/Makefile              |   4 +-
 drivers/clk/meson/axg-aoclk.c           | 175 +++++++++++++++--
 drivers/clk/meson/axg-aoclk.h           |  13 +-
 drivers/clk/meson/clk-dualdiv.c         | 130 ++++++++++++
 drivers/clk/meson/clkc.h                |  19 ++
 drivers/clk/meson/gxbb-aoclk-32k.c      | 193 ------------------
 drivers/clk/meson/gxbb-aoclk.c          | 251 +++++++++++++++++++-----
 drivers/clk/meson/gxbb-aoclk.h          |  20 +-
 drivers/clk/meson/meson-aoclk.c         |  15 +-
 include/dt-bindings/clock/axg-aoclkc.h  |   7 +-
 include/dt-bindings/clock/gxbb-aoclkc.h |   7 +
 11 files changed, 540 insertions(+), 294 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.c
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
