Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FB0C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpdGVAC4PJbjflR43eghjf7UD6dxzD15VlovJfTXpZk=; b=cO5aCU4+TQIYP0
	6pN8aYXoqYrrG0q/G96hYv4z7fRgcjkiih4dtDLb5+V04fXEPXGn6sZeAw8o1sD962ETZR8mOyucc
	MoSPEhN+jAdKn200wN6Q2PtMe5dAjemYBNg4/aFBYst7ThUE76aib72AN5ylA+u9KeRRtpAWB+RMB
	U9si7yMphK5YzXdBtM65OrfdRKPQQmifGk8Ve9x4EZUm5zC1CAWEMgVPDdYrtrUHgNYYjbvjiEFDH
	4b9Dh7ORL/YuzA5jV6rZWgYbEQ0y23m4IjvzOYRCpZ9dbRM7JnMdnG2nY/ZwRFrDg0GBSOvUVgQ3g
	KxolJmh/TffG50fWNcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZwI2-002fE6-JR; Thu, 31 Mar 2022 15:00:46 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZwI0-002fDP-Gs; Thu, 31 Mar 2022 15:00:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AA72380DB;
 Thu, 31 Mar 2022 14:58:34 +0000 (UTC)
Date: Thu, 31 Mar 2022 18:00:42 +0300
From: Tony Lindgren <tony@atomide.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <YkXCGlrok0niwlyg@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331095456.dyyxsiu2b3yw2vvs@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_080044_664433_245185C9 
X-CRM114-Status: GOOD (  12.41  )
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

* Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > It seems the dts assigned-clock-parents no longer works now?
> 
> That would make some kind of sense, __set_clk_parents calls clk_put on
> both the assigned clock and its parent.
> 
> Could you see what parent (and why?) it tries to enforce then?

It picks the other option available for the mux clock that only has
two options. No idea why, but if you have some debug patch in mind I
can give it a try.

> It looks like the gpt1_fck driver might favor another parent for that
> rate, which, if it's an invalid configuration, shouldn't really happen?

Hmm there's a gate clock and a mux clock, there's not really a rate
selection available here for the sources.

Regards,

Tony


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
