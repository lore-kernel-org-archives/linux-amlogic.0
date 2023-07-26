Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0E4C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9H0UkByaWrqFuBV3GM8xIxc2bNgYiMGPmAxWd1R/OoE=; b=YjLZUk1FCFAUFy
	+lE04VpFIfxitvqpUddZlG+h76gBf3KQpkoEHOj6VaP3C5zpRfv9VmoNlpNpK78i1jy9TpExOPG45
	ZV2JpjW9FiKQ79uTkS0IKTOBFxDjZCpxlg2vuYso8HvWSlBgBBJMa74CG/taWJUaYvP/In8+/9n14
	+BK/3lqVFB5Yp9vckyLoHGcdChpxR9g3T+UraYsdrYsTUm0M40RKrd7RYs2sUCaORMunuZYv9QzpI
	qvt4s3RM0hn3+vbzNGeqzk7PXgbg+BMfuEVd8QwplbrKwAlDsKVX/BtDwaWtUqrbGRBPwXlNwF34y
	WDAwQJ4U7i9zuf6G8grQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjZU-00BJKV-0l;
	Wed, 26 Jul 2023 18:49:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjZP-00BJIk-0q
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jul 2023 18:49:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B54B661C7A;
	Wed, 26 Jul 2023 18:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DE0C433CA;
	Wed, 26 Jul 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690397350;
	bh=XdFk645Lqon2H3uVppM45pSJBgjEVLddchaTaKmfkmY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=um1IZLSV3HtBxhjlXgn5ZptnWzZhmL1bxDVJn51xTq0udKYimz7f+AnVL3Smh6Lx3
	 U/V+UCw1IXlpN1D0P3kOdA4KJi81OdyySNLTG2h3hDZhfdrErwPDXq8B+niXa9c7x0
	 X7z6lL69+eLJGWmaCc3eSJk3nYDiaBrF6mqkWqJotLdztt793qNRRae8bbYYEAY/BX
	 1Omin12eXGGFrMXKQc1sFezY4ql3nIqYHp/dl8/wcd+qUnpMAd3SeFiuaPEfnqgnID
	 1OFNe9ZMN0oDO/fLaIFL95GXJCQD8gPiEvp+BsfubRxVCMbgH8w4XzrzPL7Qfk8EDm
	 99UkHpLtO+xsQ==
Message-ID: <3eb8745cce66ee68c02ac54eaf6a8bcd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jwmyotql1.fsf@starbuckisacylon.baylibre.com>
References: <1jwmyotql1.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: Amlogic clock fixes for v6.5
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 26 Jul 2023 11:49:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_114911_337500_5FBE597D 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Quoting Jerome Brunet (2023-07-25 00:06:02)
> 
> Hi Stephen,
> 
> Here is a fix for a problem introduced in the last cycle.
> Please pull.
> 
> Cheers
> Jerome
> 
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v6.5-1
> 
> for you to fetch changes up to 6e2acbfe59b83043bc7ae1bb39fac4fc9dcd5a18:
> 
>   clk: meson: change usleep_range() to udelay() for atomic context (2023-07-11 11:35:42 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
