Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1B4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg6AG0Oqnt9a33Jg+NzAG01tMfyiDfnktXY3h99ShOg=; b=zt7i8vjqi5/YZH
	ysfQe2DiAZF4K45QQEaDelp2VYFnQ/0G2+XO1pMxhf32TLr9UbREPuP3tY8Jbn20JC+X/vaQEdUNr
	DP+TPhYyJ3M2nh/8DX/9sDwkLv5f+FpDEcfwWbDbc9HP9Cu0iVf0qXoF+N4WlekM/NoffPMd6Y+c5
	K4tY6bbq8403wNWuEVoNsWC0J5r5nBqpjvkow/BQT7UR1FulbSegdszzO4DMxSc156DqrpYigqCVv
	kdMqSpF9JTYMSOicowtitoXPG7oK+ENAWMUuFgssJ6WAGSGDU24HQwlRu4A7K9vfmSzo/7/ymcXBP
	RpcWwvRi0mrDPPUO8rZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNE2-00AGhZ-BC; Thu, 07 Apr 2022 08:10:42 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncN7Y-00ADsn-P6; Thu, 07 Apr 2022 08:04:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 52E458125;
 Thu,  7 Apr 2022 08:01:37 +0000 (UTC)
Date: Thu, 7 Apr 2022 11:03:58 +0300
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
Message-ID: <Yk6a7meIO+fV5J1D@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220407075356.lmqnax35cewiwh4k@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407075356.lmqnax35cewiwh4k@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_010400_906167_D61A9F50 
X-CRM114-Status: GOOD (  11.18  )
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

Hi,

* Maxime Ripard <maxime@cerno.tech> [220407 07:51]:
> I haven't been able to find an omap3 board or a qemu target that could
> help me debug this, but I fixed a few issues already that could fix omap
> as well.
> 
> Could you test today's
> https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes
> 
> And let me know if it works?

Yes sorry I've been meaning to try your fixes but had some file system
issues on my build box after a power cut while updating the system. All
good now though, I should be able to give it a try this afternoon.

Regards,

Tony


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
