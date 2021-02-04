Return-Path: <SRS0=7Y9l=HG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A9BC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 19:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FD964F64
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 19:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FD964F64
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UoYY9X9KUbaYCLv7iLn4hwgPD45NqYDMZg44loa8kbM=; b=XXMGVWWN2hQFrVLVoB392+FwF
	A8kku466zOmC+dA3iL3s06z+weu/uewwQab3zM+1+TsIBGvxCB8Ele5pFD1RT8E0UQ8dcguJPB+eh
	StIoF2b/bIivfPXkrkcE+urXAzAZYT/JwBuHIn5YCVRVuY2AVCl+0B4a5RbzQjsTmp+hIczK+1lAl
	GIVEM2aMnNCb25YvoBsjmVK1qWkK/t8vYorAoAKca0y7BfpkzF9THv+punzZ++nOXmJHF5s9ww2Jn
	0fTEkLvE1Y+A9OlQP2phFtp23HIcUXJMAoHw/Ell62Cxub+iANwEa/MjCFk67zaGVI80M10NYcG+P
	2Y+jp5NQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7kPj-00019Q-Bc; Thu, 04 Feb 2021 19:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7kPh-00018O-2g
 for linux-amlogic@lists.infradead.org; Thu, 04 Feb 2021 19:35:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 902F164D9D;
 Thu,  4 Feb 2021 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612467335;
 bh=rpTGlNPN4SaEsNLDUz8Nh/DcPMib+Bvl0GPBdRiE9SE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MMrL+ZkLwz86W7B/zenctQKUHXcyVf6v1Ln35yCIwtZUloN4plBBGqtU+kslLT1O3
 63d2KqBRtJdqWkcgoOVd6FxWAnWWfMvOPJwWizhTsl8tKh/NSFsNM6kk5wXkcALni8
 tPHtIymtNjcOMGW+ztFQM0yb20482JoFfsZbIbwuvWj+mu+N+u4DX2rp7qSZQGHpCG
 6qaWA5ELO8+bm03POZeqlJbywTsdBaaGaud/THy94Mokp3RodM4JM2uA4csP78ggDi
 rOybXNEUQTAy4JZ3juVnO+y+aDebBAkOV5jwckvw/LWb+6IYV3JqW6YkT7uAIw6FrU
 XiCIwtRcxdIIg==
MIME-Version: 1.0
In-Reply-To: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
References: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.12
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 04 Feb 2021 11:35:34 -0800
Message-ID: <161246733428.76967.1992229901867655564@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_143537_201558_3730C84A 
X-CRM114-Status: UNSURE (   7.12  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2021-01-25 05:18:36)
> 
> Hi Stephen,
> 
> Here are the updates of the amlogic clocks for v5.12. Nothing out the
> ordinary. Please pull.
> 
> Thx.
> Cheers
> 
> Jerome
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.12-1
> 
> for you to fetch changes up to af57824425389adab637a2ae872ac488f50b5832:
> 
>   clk: meson: axg: Remove MIPI enable clock gate (2021-01-04 12:03:02 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
