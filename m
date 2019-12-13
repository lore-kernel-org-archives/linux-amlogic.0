Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C99C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 02:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057882073D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 02:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZYC9zkD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wkds8U+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057882073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQllyBCxDSZTAZAql2ntFlDkyHf8mNPmq6fUYm68gtY=; b=TZYC9zkD9k0NrK
	ABMZqyx62qJvyChIlmMFkQc7PsMfkvDuG5qxWaWSgcfo3keK5KPKD7HT8VBc4D1jJe++9P3Dr+Hee
	yWEDR8fwiCl2vMq5Sd15pcM1+0OWxfy9KoxHjkUvqmtcg1JOYkd2VXFgQOWsZKINE0VjnGeeOLQJl
	5YqPaTxRQvdzTh3WyALYRBtcwoY++Cv29yHFPUigXI5PHnTld2c1yUposN3lhRAXrQMQUQuFGby2k
	E6hJH+95vNIj4wmgevn/hyoJxtQM6y/tGXnFWMZzLszncom+lk5iq2g18O5uUPJyl+elME/Rx/eKw
	2l0oWID7sVATt6Sx6w8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifb6F-0001BM-DX; Fri, 13 Dec 2019 02:54:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifb6C-0001Ah-6k
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 02:54:38 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F2092073D;
 Fri, 13 Dec 2019 02:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576205675;
 bh=YT/KrD9drCHzLQDLApnDQvgJZf+lw9T1tg7LKWdDM3o=;
 h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
 b=wkds8U+kIoe9X5Ddcs6WPLIemyEHzHszzlZazYRFJfH53LIXrFStXArA/bF2uGVGP
 w3TaFhXyF0me4QoAXI05m/PxmFmbDrIUu6vYpaLycLNF3niGHtaUpT35BH+Z/RhCzu
 hjVVxVEUoD0y0+FMo1/GtqL5DzyN6XU+7dFyyETQ=
MIME-Version: 1.0
In-Reply-To: <20191203080805.104628-1-jbrunet@baylibre.com>
References: <20191203080805.104628-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] clk: walk orphan list on clock provider registration
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Thu, 12 Dec 2019 18:54:34 -0800
Message-Id: <20191213025435.7F2092073D@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_185436_270352_0A1CCFAB 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-12-03 00:08:05)
> So far, we walked the orphan list every time a new clock was registered
> in CCF. This was fine since the clocks were only referenced by name.
> 
> Now that the clock can be referenced through DT, it is not enough:
> * Controller A register first a reference clocks from controller B
>   through DT.
> * Controller B register all its clocks then register the provider.
> 
> Each time controller B registers a new clock, the orphan list is walked
> but it can't match since the provider is registered yet. When the
> provider is finally registered, the orphan list is not walked unless
> another clock is registered afterward.
> 
> This can lead to situation where some clocks remain orphaned even if
> the parent is available.
> 
> Walking the orphan list on provider registration solves the problem.
> 
> Reported-by: Jian Hu <jian.hu@amlogic.com>
> Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-fixes


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
