Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EDDC48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573A761469
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573A761469
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3FUR0Duo48dKws5PXdYXETuwGi5gAQFmVFqT/lsAM8=; b=JGd5CHQREd6Mql
	dt52vs9Xi3ZzJaOQ7x/uZ+A2L+zm+p6IbafbMjxdJ7E000cw2xwOES7fpq9PawnrRAL05HPCONQFs
	uFMvcwIwp5yyktlCbpIgqJf6+3ATIBieOF3XONvswWKjKgiHhC2ishSF/aYr3vRKC1b1ZKRu5HahK
	pHc3IRG+2agGaDQHSxhMj+mJX0/3HaTKIedwMqmzu2KUq3ZPzRyoGpgQlYShxg9rLjg4xq2gOSHal
	SQouN1G0s+ZB/S11S1dP1scVN9wsjLD4CISx6wXkjynHpd76dxJH3uKIRq2DWLtSl0hT6Wn20PKSf
	YxLKzhSPcAeViPQfQDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxdRu-006Fct-5E; Sun, 27 Jun 2021 22:40:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxdRr-006FbS-GK; Sun, 27 Jun 2021 22:40:21 +0000
Received: by mail-ed1-x531.google.com with SMTP id i5so22700570eds.1;
 Sun, 27 Jun 2021 15:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slZufKqFz802FONUtf3n7bSuBW3tmbUsPHVs2VZ3Gpo=;
 b=SazL/ovzGjBiHJSJupDWYJeQNxRVlPb5+n/A+KqsCEeC5RJETZVjm/4mgLrooh9Lis
 8K8Bj+EQ+YWkSwlZRGAYlEPLSfjgfQvCujONP/rFvbRb6skQc5pNX20RXLQLd09kinKc
 FVNjy69epxNbFTa7fmIdnEsRe/b+tnzHilil8qeSGBsTCshAZvc+nbCcxzvLKDQtyjSS
 xmkEIUHgSUh3+QSCoJyV3GONRvWIsDjNFqoMlqGcjSsl2TJFH4Udej3WFde02aC2ZfFX
 /Bo8yh1ofynHaIhLRYQ4WQlKDYTctK9epnsYJYUY0ye89Mfn+MGMTKpexXGmYf6dRSsN
 punA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slZufKqFz802FONUtf3n7bSuBW3tmbUsPHVs2VZ3Gpo=;
 b=ZUcn4hNU1liHMhkrGAe6UtsfpsXLkPlo5kBueRxw1EiM5AGbXiDfl3RX2s2zACCLXJ
 hMHQ31mlRWRK4E4/GE/PkjnqibhkBYcsnnIo1UNBD9xRuOhIIeHfBwN+oOYMezO1ZHgD
 cJ7jGOJAIxpmsS2ClZB9XzeX39uGju7DDBi5t2vSjPRYi1+3whhXev801JPJLTpoWVms
 Z95HVqxLudu/v7qiqsXgr6THqjQFnQyy10Db4NBDNhsvCJbsJCJOab+K0hofpmXAa9i8
 Fr2K2s/rDBDGwhBwEBLbOJNLbcGelqZXZv1kZGJAUInt3c8rjKZ7j4Yzs8jyM7fDXLO6
 6foQ==
X-Gm-Message-State: AOAM530WYst5YBDcJMyCxDs4mGurdotNxUmFRJOqNlvmB5B+AkLbhN7L
 LJNOAai7cYNXSmNrszht6YI=
X-Google-Smtp-Source: ABdhPJzt1v9sSB4xUUvLiesCnMrJogU+eJY3qTDriqZKqVfH0fvh3LB3+vQc4Emf2P62YNJ38JVMWA==
X-Received: by 2002:aa7:d554:: with SMTP id u20mr4057983edr.50.1624833617828; 
 Sun, 27 Jun 2021 15:40:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-bd64-8b00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:bd64:8b00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id jz27sm6048861ejc.33.2021.06.27.15.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 15:40:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
Date: Mon, 28 Jun 2021 00:39:56 +0200
Message-Id: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_154019_602576_D2A248A3 
X-CRM114-Status: GOOD (  15.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
up to approx. 3GHz.
This however causes a problem, because these rates require BIT(31) to
be usable. Unfortunately this is not the case with clk_ops.round_rate
on 32-bit systems. BIT(31) is reserved for the sign (+ or -).

clk_ops.determine_rate does not suffer from this limitation. It uses
an int to signal any errors and can then take all available 32 bits for
the clock rate.

Changes since v1 from [0]:
- reworked the first patch so the the existing
  divider_{ro_}round_rate_parent implementations are using the new
  divider_{ro_}determine_rate implementations to avoid code duplication
  (thanks Jerome for the suggestion)
- added a patch to switch the default clk_divider_{ro_}ops to use
  .determine_rate instead of .round_rate as suggested by Jerome
  (thanks)
- dropped a patch for the Meson PLL ops as these are independent from
  the divider patches and Jerome has applied that one directly (thanks)
- added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
- dropped the RFC prefix

Changes since v2 from [1]:
- Added Jerome's Reviewed-by to patches 1 and 2 (thank you!)
- fixed typo in the cover letter (availble -> available)


[0] https://patchwork.kernel.org/project/linux-clk/cover/20210517203724.1006254-1-martin.blumenstingl@googlemail.com/
[1] https://patchwork.kernel.org/project/linux-clk/cover/20210524103733.554878-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  clk: divider: Add re-usable determine_rate implementations
  clk: divider: Switch from .round_rate to .determine_rate by default
  clk: meson: regmap: switch to determine_rate for the dividers

 drivers/clk/clk-divider.c      | 93 +++++++++++++++++++++++++---------
 drivers/clk/meson/clk-regmap.c | 19 ++++---
 include/linux/clk-provider.h   |  6 +++
 3 files changed, 85 insertions(+), 33 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
