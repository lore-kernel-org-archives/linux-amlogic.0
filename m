Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B853BC47247
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 19:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD29206FA
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 19:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWShu7mP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vI2sh5mo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD29206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wG8TqFA+fvRU6rogBuYTm5zm8Ows7QD0NSXb2ni4vY=; b=UWShu7mPQwD3u4
	LiKq6z1DBiK8nZlxcc1Jkp5UM6VJYsU9/sVoZFRc1dc5oumm/4FwmHXvqFgEbJSl0znzx78wif/TJ
	L+KrtZ6FB+r9AcyJstwmhYfo8IEl5cBDhXYdXnsFN+8dKXqfOJjgFYk9OONdeFC59Dy0cY5Sae5r0
	GuGkgx1bV5Px+b30McU6BHnpWOOPsVjxbJv+jvkKhPUMo7X+My5lLlZqmuh5vK7/Oqf7dHjWwTRo7
	DpC46z6TPgTISlZE3E26wEqHHEDJ8xJCqGgwqiDr8wlmROdZITqfTKs3D5MXjzUgy5i6ZPHSfTZ9/
	W0CKAzGzTZavicjqu7sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW2xP-00086z-FX; Tue, 05 May 2020 19:10:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW2xM-00086H-2n
 for linux-amlogic@lists.infradead.org; Tue, 05 May 2020 19:10:18 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4753A206FA;
 Tue,  5 May 2020 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588705815;
 bh=uxareK78vxmfIvFodQD+Oa38MY8vebhJp7PDQpQCksA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vI2sh5moGQUgayJgcTMxt0nnAkHsZObGmaao7WvLmAq7zcyyu0bjPghtnjHZ8B8Kr
 Wj5+qXiTSgLzcKGa/wR21tVzKN3XUR3/M9Wn9a1bK86WEJXDIuIg0BwEsrS+0kZ5Lr
 W9yf7YsyUw73HiSD/iBqUjNuPYAfXn8rQmsfwtcI=
MIME-Version: 1.0
In-Reply-To: <1j368egyie.fsf@starbuckisacylon.baylibre.com>
References: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
 <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
 <1j368egyie.fsf@starbuckisacylon.baylibre.com>
Subject: Re: clk: clk_register is deprecated
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ulf.hansson@linaro.org
Date: Tue, 05 May 2020 12:10:14 -0700
Message-ID: <158870581453.26370.15255632521260524214@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_121016_152854_E5F1BFCB 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-05-05 09:03:21)
> 
> On Mon 04 May 2020 at 19:16, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Jerome Brunet (2020-04-30 05:24:41)
> >> 
> >> If not, what would be the recommended way to get the "struct clk*" from
> >> a newly registered "struct clk_hw *" ? Should we add something new to
> >> clk-provider.h API ?
> >> 
> >
> > Yes we should add a clk_hw_get_clk() API that takes a device pointer and
> > a string name, mirroring the clk_get() API but cutting out the part
> > where we have to go through the provider to find it.
> 
> We will try to propose something for clk_hw_get_clk() soon.
> If we do so, could we "UN-deprecate" clk_register() and make it a
> wrapper around clk_hw_register() and clk_hw_get_clk() ?
> 
> It would make it easier on drivers which both register and use clocks.
> 
> To get a short term solution for Martin and his MMC driver:
> -  If the above wrapper is OK and we commit on doing it soon, would you
>    also be OK for martin to use clk_register() in his MMC driver (now) ?
> 
> -  If not, could we use clk_hw->clk until  we have clk_hw_get_clk() in
>    CCF ?

Using clk_hw->clk until we have clk_hw_get_clk() is fine for now.
Various drivers do that already and I hope that a simple coccinelle
script can figure out how to convert that to the new function.l Is it
much work to introduce this API now? I thought it would be fairly simple
to do it but I haven't looked deeply.

> 
> >
> > This is so that one day in "the future" we can remove hw->clk and make
> > that an internal detail that struct clk_hw can't see because we go
> > through the clk_hw::clk_core pointer instead.
> 
> Yes, I know it is your secret plan ... ;)
> 
> 

Hehe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
