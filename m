Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2A6C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCC821D7B
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZQgJcr8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sGEe0ZSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCC821D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MkbSekPJ9/aJJZlCd4dM6E1yOKAH+rox+jtThGGguGE=; b=rZQgJcr8VgFVAB5G+t61n4eJ2F
	+LVTwsQwcfC+kSBIgPjMpgqPxvxnwm82n4aaF6NR5mm/DFFlXEkGXrwjU5GmUJVDODkE+S64EME9e
	9oAC1y2RHqGCYspmcaRyfQsp1FWXsok/z+1ulvmk80EZcHYqtCEYGUqMsU5xTOQQwrl4/bNcuu4V6
	z9fG1F7g3VG0+wzXz0cYB/5eK55SrYC5RZBAfx05bAF1/g1k+6ebFYVuO5HYKXizRs8MkkP7ns9Q+
	lu+neFL3b1lAof0qktcsnHrjWeDSq+dTggc4OsR5u3ZE5dBHYEAUM+xIUQl1soZOnmTkpoT51hijw
	aduw3aBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGsE-0003pt-01; Wed, 21 Oct 2020 16:22:02 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGs7-0003mH-RF
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:21:57 +0000
Received: by mail-ej1-x643.google.com with SMTP id w27so180734ejb.3
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UI2P/yyao6EznjeZr1h9V5wwTm/lr2jsyR7CYvPpJn8=;
 b=sGEe0ZSsBq2hxXtN4AppUO1Zi4qpE8rjaTwX9Wi5YMoUpfkKpWDeC8/ptxqAH7PVfT
 W2Wm/iYiW8Gy1hphh3YxpoKfkJS4qpIFENQQtiX5j6O5Lu/vCGSyezztx/pWVwrbOR7y
 FEsYm1MaFmx0ioASrEdPyTgGZ8i49rzkz3JDUnjItBHliozJJrO7da0ibDypAqBVKKik
 fObm9XdOL1ZOsJRzednQvcOqJw1q34CsvIsayRX3amK+jvKt/S9StRra6V+I0s5WbUcj
 9LJORutEbazY+hbuHPmEtbhKBdvVkBNksZgc9QFUMkpkc3O6XisHdQ3W0kl0fKWKi+4M
 Wp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UI2P/yyao6EznjeZr1h9V5wwTm/lr2jsyR7CYvPpJn8=;
 b=F+P1cxY3YQgDg0CnRN8KjtowqMa9+yiHDeVH+YXN7rpsSreZkfUIyrqS2hBRHnChkF
 vBgB6PO51klDOPem4PhTimSGUaZCCBQVrp7+DOoKNjrphafT9WqNjKNvqHmN4xK/w6JZ
 B/m5y08dEFQcT+fo/F7r7m5iPSGhmmHFP5vzXMDz0zuqbYR50wugl2MoNqU842V5eRDL
 JJ52/6aoqmiX/oHE5u1x/nNq0LDIwOoBIpC3Lzj7IdENY+RtJFeeoEy+/vs8J578jzeJ
 z/j9+DwgX/CmnKspSS/ePv00W/5tpHTDSYAxym8xcdfkcLtnTbBz3uRGM8V0KdH8/lJa
 CxMg==
X-Gm-Message-State: AOAM533TlbpDZKWgj6R+AwQAJtHV8kxhKfXcTbS6bVM/7tCYM8OGxdos
 36Y864adJaOyyfzJNRvP56wMZQ==
X-Google-Smtp-Source: ABdhPJz01d9oIMCTPrSm5ZUKeD22XQbYSH9b+dNijavQFdQQWBxIif4CrZRFLBUmfLd4R+zYnk+Azg==
X-Received: by 2002:a17:907:2089:: with SMTP id
 pv9mr4460227ejb.427.1603297312942; 
 Wed, 21 Oct 2020 09:21:52 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 11sm2566667ejy.19.2020.10.21.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:21:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/3] clk: add api to get clk consumer from clk_hw
Date: Wed, 21 Oct 2020 18:21:44 +0200
Message-Id: <20201021162147.563655-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_122156_026988_DDB19BB6 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset a call in CCF to get "struct clk*" from "struct clk_hw*"

Changes since v1: [0]
* Add a con_id string to help keep track of the consumer
* Add devm variant:
 - Following our discussion on V1, I choose to have the dev as
   argument as most devm function do. However, as Stephen pointed out
   we don't expect this to differ from the one linked to clk_hw. In
   this case a warning is thrown.
* Add a first usage of this in the amlogic clock driver.

[0]: https://lore.kernel.org/r/20200519170440.294601-1-jbrunet@baylibre.com

Jerome Brunet (3):
  clk: avoid devm_clk_release name clash
  clk: add api to get clk consumer from clk_hw
  clk: meson: g12: drop use of __clk_lookup()

 drivers/clk/clk.c            | 73 +++++++++++++++++++++++++++++++++---
 drivers/clk/meson/g12a.c     | 68 ++++++++++++++++-----------------
 include/linux/clk-provider.h |  5 +++
 3 files changed, 104 insertions(+), 42 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
