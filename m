Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E4FC32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tXhATs1CNsYGgu0nfWapFCBPfTMQ1VABA9pTTzDjr38=; b=4HjpOCai2TwLX9sXtdT69E+m+N
	COukMncZB87dSu1C0Zk1bOJ03kV7sR9unZyBqCKXJIn7rgt6keNiPZXYwm0cO5RbcneP5Q/racNA8
	jAcYU4po1PMuGPTTMC1GXfX9xauEnhsBOBx5cFe6/isnbeHEZyG6Zkq6ffopPOSV7qSBIcCqBTf9S
	J43gQ25nvoVPkNlWSTW+2Sj4z9vJaK0u1cMoOTn0tsAiWV9s3UYrl9Jf4jMUpEz1vjUqPshJOYExR
	r4bOIeyBnVh1dKknr9uYQJJ7zRzlHAlfDbf7z3PrpLdtB7roJMeon7WidN4B5m/FoSZXoLJTUNEBn
	nM+fg38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9YJ-00CRhj-2j; Fri, 19 Aug 2022 21:29:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9YG-00CRfY-2K
	for linux-amlogic@lists.infradead.org; Fri, 19 Aug 2022 21:29:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52D4C6174E;
	Fri, 19 Aug 2022 21:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0DDC433C1;
	Fri, 19 Aug 2022 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660944550;
	bh=oXnqkKNX77eEWYg1qgAADW+U5n+LOAMrarjc331LG74=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=RPdlorGEN5D+a3fM4tazE2C2IW2JthYgNvoFUpb7EPqtXpx9LAHeIoLUXMCaD91Qc
	 rZNepwj1sAOAvDHG5+VlafexbuL6bUjutRkJ28lAHmkQrRE9nLEsJoGdHTpHVZLqLA
	 9eXQUWiN2d5/XlDOZOUBKIPMtuvrej3T4PtXJT+B9GJgoixjROYApTmm7RJNw1dUQ2
	 la7q7YD+nmwxypKCdcoVX/dL1reWg+w2jEtcqab3dAk8KLF7iCtpmfq5pkwJfR7nsA
	 3iP2nNArS/LbYgee9McvXWIQ4lSBPeomAIUaxuJ24erDyh5DCWMVE7FVErcBbIkJ0f
	 MidRLyBOhX3Fw==
MIME-Version: 1.0
In-Reply-To: <20220628141038.168383-1-windhl@126.com>
References: <20220628141038.168383-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
From: Stephen Boyd <sboyd@kernel.org>
To: jbrunet@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.co, mturquette@baylibre.com, narmstrong@baylibre.com, windhl@126.com
Date: Fri, 19 Aug 2022 14:29:08 -0700
User-Agent: alot/0.10
Message-Id: <20220819212910.AB0DDC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_142912_179670_C6F65901 
X-CRM114-Status: UNSURE (   7.68  )
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

Quoting Liang He (2022-06-28 07:10:38)
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
> 
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
