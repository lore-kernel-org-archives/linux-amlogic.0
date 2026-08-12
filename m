Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C292C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 05:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBhZHHlVOi7+TSE2QvpkTkP5mjHtLsg6IMqJZ4Mwflo=; b=qXJnWmUA2N2pzd
	RFuSemABufxN23LHGZ+COMtuW1RVW1bir0YcD8POWCznhBfBJQd5PEsKVp/CFyz2HV8aIB60/JdRv
	T44Z0thvvdFFme4K6Xm5fcugkRN9VA/9c1hGfMB02yAProtYND7pCIK8qGie16697ky965hk4qV7E
	NegbC5iBa1HnwW83hmQ8Ht22LRZ1bJCoFf1MUEU7XKcUEyk8+JD+wfiEdIOmxZrCa8QdYRn7L9ut4
	Dx/891+7TxDe9NCZ+D3EZ3wQDG2sefwLot41n4eMFH14x6Ku32wxMH1sxq1zIExY2aB2kqgyzOnnH
	akcdP8TCffjac5ZdGy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1B8-0000000FQ5Z-2bNM;
	Wed, 12 Aug 2026 05:07:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1B7-0000000FQ5T-3QpX
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 05:07:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC32D600AE;
	Wed, 12 Aug 2026 05:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EDC1F000E9;
	Wed, 12 Aug 2026 05:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786511220;
	bh=utHsm6FG+U4VgEp01NBzjQkdxSyUSz3OrQhJ8WjPFcg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=LKbS0+QiHJlMhTXBXBqGyysX9+L1Ish/0Rj+hd5zxzsf9dJSvqVi5EQjAlIfQU3Rf
	 cPyrSika0j6jachHkyZRk5NgSex8RZCNh8qXbvDKHSJ9+PbRnrJkdV5DH6J3CO+UEu
	 TZWYIqjOS0XxIRp4ldUQZFLNGWZzuKOYbOSDxWn/5zl+uG94sD/LM+BK8IoUG/OCUz
	 dU3wV8ia0l0H6q4OcGbupita3Wq/8ufOGN8q9/r/NI/R8pyVUoSSWIqUVQnIfm1+GN
	 xLflqCynNi2aVGS5Z3ktyw3gNSsp8K/bfIiHoHygSurtHhdPgykNeCNW4tutem9+4f
	 i/wy8nxe+GIjg==
MIME-Version: 1.0
In-Reply-To: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
References: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: Amlogic clock changes for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Aug 2026 22:06:58 -0700
Message-ID: <178651121874.5862.15074147400142820342@lazor>
User-Agent: alot/0.12
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

Quoting Jerome Brunet (2026-07-31 07:39:15)
> Hi Stephen,
> 
> Here are the Amlogic clock changes for v7.3
> Nothing out of the ordinary, 1 fix for an old chip and 2 new controllers
> for a new chip.
> 
> Please Pull.
> 
> Cheers
> Jerome
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.3-1
> 
> for you to fetch changes up to 6f809ca8104b01dff31a20e91fa748b49fe2971f:
> 
>   clk: amlogic: Add A9 peripherals clock controller driver (2026-07-24 18:09:37 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
