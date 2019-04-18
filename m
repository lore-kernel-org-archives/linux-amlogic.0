Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6069C10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728002054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0BFzn5Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBi18Tn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728002054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZkW1EmFd39MApUmQVJQXCyQnYYM9rr3AUDL2mECMpU=; b=n0BFzn5Yv8EAd3
	hQ+BnZqbyv9xjR1vtjYAm6wqOIJXLDbsU95oRMmebyI33Sz6bZtjw7HK3lKsw+mGeAvr+Uu5jRUCn
	J/Ug78xd8amJFvvpOULaHr6BrGLSA4O3iyPZhr97se3yFpsm3dKWrwhUiSrEAXE4+ePpGurXnsU4S
	J2485pczxJMgKqFmwGAdqYs4HSsFWJ22IHKD50P3uETuH9JBw0RWorFdn5ObuJBi04k5I+kTaZ1KU
	VE9D1KUsRaj6peXCbCir/gBu23K5J21M75FZrTPxdSyQOjDyTxsINYSS5BdIXIsoXeWn47jFmBcXc
	x3wPgl9erfwWmXEd6sJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHDhp-0000vy-RL; Thu, 18 Apr 2019 20:32:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHDhn-0000ve-8Q
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 20:32:24 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 869C1214C6;
 Thu, 18 Apr 2019 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555619542;
 bh=6AsPH5iyvIGfXDXCsgAUrXVj3RcDiK3cmlRoICT7AdI=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=EBi18Tn9XMAQ/Pfg270jZfslw/M0fcepdQDF/jCzHqmM1K9oTBbGtzLLWIVaJwhcX
 R0u8i5DVf11yD8BPdYxotKKBzwS1JUD72wf40cdPg1O2ZFDjQut6W5HYj97uwVneMT
 8twdl0wjLua1BF4XrX+iClu5PW8KJxDplUkhj1W4=
MIME-Version: 1.0
In-Reply-To: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
References: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: 2nd update for v5.2
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
Message-ID: <155561954176.15276.5102897303800246681@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Thu, 18 Apr 2019 13:32:21 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_133223_315806_C6896908 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-04-18 02:46:36)
> Dear clock maintainers,
> 
> Below is a request to pull another round of update for amlogic clocks.
> 
> The main purpose of this pull request is to add the g12a SoC family
> support in the axg audio clock controller driver. It applies on top of
> our previous PR.
> 

Thanks. Pulled into clk-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
