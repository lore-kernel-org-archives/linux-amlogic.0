Return-Path: <SRS0=mclM=3L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4CAC2D0CE
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 00:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CBB21734
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 00:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIogaV0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKLC0q86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CBB21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Subject:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdFhFIBdX2SSEHReZZE2jLCM2onFnf7qpkdeZBpZZgI=; b=RIogaV0k/6fxF4
	/C5JdgEWX3SyS6GqxS6mN3aWIS9htOPAcv35GCbT5o1DFNjLPH1clEbzOHnB2Ne1RVKkgxq5/Mlr1
	dOY1ZwcUL4nG3rUYWUVfSrlxsOqcaH5cSYWgpqRECcxG71CpRYz2p4j+3wj7i1lyXVZlmJFmqHzIn
	gz9bEyrF4ipTh6UmiK6Jbg71N8uoiu8MRqgNWvBKrchvHtinaa0tt44GfNyenPhMTEDLsmt7IAzcL
	CHVMe3KWLloheuEqOJBVFxv3ZsKBGAoFBw0As4Of5TarVPcvrtnN1/KQ2DADGattgqggCV7LGhCMP
	xFbs6cGYDRq8TagYbfmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu3by-0006dl-Gr; Wed, 22 Jan 2020 00:11:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu3bt-0006dC-A6
 for linux-amlogic@lists.infradead.org; Wed, 22 Jan 2020 00:11:09 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C6B821734;
 Wed, 22 Jan 2020 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579651861;
 bh=vEaqaO0ZcgQH7QRTWO7WivXhD85tdQhgAO8L6q7FUzs=;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
 b=YKLC0q86QMjCp4RUxuzkhxpgzXzpPwMSQ03q5Ku+91131UdMYiV5ddfz6Jk4zB6Op
 OsgdFyBV8vQ9i+z3tpf6zDvuKYVEyaUkiDKlTDKtZUHfcrLIS+3K4oA18p+ZUvLdgC
 fQyFrcmfBlut70VdCaSiGL4bZK44bAEP3J3auPiw=
MIME-Version: 1.0
In-Reply-To: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
References: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL]: Amlogic clock updates for v5.6
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Tue, 21 Jan 2020 16:11:00 -0800
Message-Id: <20200122001101.9C6B821734@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_161105_380342_AB1B2112 
X-CRM114-Status: UNSURE (   8.88  )
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

Quoting Jerome Brunet (2020-01-10 08:11:42)
> Hi Stephen
> 
> Here are the updates for the amlogic clocks for this cycle.
> The bulk of it is a clean up of the 32bits SoC clock controllers by
> Martin.
> 
> Cheers
> Jerome
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.6-1
> 
> for you to fetch changes up to 64c76b31774db5a0c0ce8df13aef618912136e32:
> 
>   clk: clarify that clk_set_rate() does updates from top to bottom (2020-01-07 11:31:47 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
