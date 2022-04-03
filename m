Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6CFC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Apr 2022 02:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/3XJ1cFGDZhdICTpWvy/6/wABRsfyMsmKOfCKHv9CU=; b=QL5luS3DWYq1g/
	uVFwrSAijg5ckhxdreOLasN73kGK7myX8GHiVE0/NiKDWBfwZz8JxJd8y/3OiwEVFJYiPUS9lNu+b
	33DPeostwA6/1lowoPTNwEwDO3twA9PZeqI0h54aVmdW3qUdj72OyxiVBryxKdbNfy472eo3YeTF3
	z1m6qcecfHtaEHB7OzKHgd7gjmBvtXBPf7EgLQgXxUqY1x03dO/96A0TX7yOmjsxTruF86OtgGxmk
	bFCRrpSA0Q6BfH7WQQhaSCUm6UxednTaj1ynFRhoZntwBr1e3EKa1ZdPaD60jZIJ9CP0cEH6FOLMr
	0zK9JlQuVM6acmFFf9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1napld-00ASQw-6m; Sun, 03 Apr 2022 02:15:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1napla-00ASPP-G6; Sun, 03 Apr 2022 02:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A006FB80B54;
 Sun,  3 Apr 2022 02:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1296C340EE;
 Sun,  3 Apr 2022 02:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648952094;
 bh=sqYLDU+fwXFcPGJInHBWfYzYzKNM+vXb4OU6AqfFR5Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=F1X32ELEee+RI/dSMDPAySBSdLkKwiVKCHLwRK5n527vp3R5wQkhrWukmjZxAJlP2
 G5E8CV1QceJf6wlLaBr8GkYxgSSo4DblLao4ucsvUTOlUCqXCuwAn08wJc/2TCQIWx
 xu+/uC8oWHvbnAscyks5cgG3RW9t68reBjvRU4Bnb6Jj98dxOGlgJe4q4XqUGhPcAB
 P1spjwFMZ2cDzwUey3p6CwFZa8Sf14FWslTuDb317mGx2qudxtihxOWVe6HLyTHYvM
 BjALABzcu1IioUMsOFmHw7UA4djoZsrEAZLEIkWP1G2w17PNsYP5NkKvgoorj+GmIX
 3XcLieuQlXJXA==
MIME-Version: 1.0
In-Reply-To: <20220401122839.nn74rtftvzgjqjrg@houat>
References: <20220325161144.1901695-4-maxime@cerno.tech>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat> <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat> <YkXCGlrok0niwlyg@atomide.com>
 <20220331153134.h3alp24hzquajkly@houat> <YkXeGS5zaovOaEzp@atomide.com>
 <20220331215818.F11BEC340F0@smtp.kernel.org>
 <20220401122839.nn74rtftvzgjqjrg@houat>
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
From: Stephen Boyd <sboyd@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
To: Maxime Ripard <maxime@cerno.tech>
Date: Sat, 02 Apr 2022 19:14:51 -0700
User-Agent: alot/0.10
Message-Id: <20220403021453.F1296C340EE@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_191458_727599_097632AF 
X-CRM114-Status: GOOD (  14.88  )
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

Quoting Maxime Ripard (2022-04-01 05:28:39)
> Hi,
> 
> On Thu, Mar 31, 2022 at 02:58:17PM -0700, Stephen Boyd wrote:
> > 
> > I don't think clk_put() dropping a range request is very important right
> > now. If this isn't fixed tomorrow then we should revert out this patch
> > so systems can boot -rc1 and try to fix it in parallel.
> 
> Yeah, it can definitely be reverted. I'm not so sure that the issue is
> with this patch itself though but more that it now triggers a fault
> reliably.
> 

I don't see a revert sent yet so I'll send one now.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
