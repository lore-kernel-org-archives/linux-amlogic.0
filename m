Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9565E77161
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2024 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuTV7DDyYilSZM4oaUBeTIh13EELcf7ujJzzDa03+a8=; b=nhHoKakPSjoiW5
	lcqigzNjeNiVdX7roaiZeM4seSmazCzluMnX0UYwryTaZb/P8O93gdQlLXQJsJFzGUE3eIh3Jf5Ie
	fQMUuq+W2YCggECq8kThjywl5l1B0NVVNTRELJ6D090iEnRw4PIwq8XcsTxqHmvA0orHowKEDD3vc
	z30UR4qrD9EFzWjPSEDcdmc1HJco6qMa+tJTDCK7W6npMWK197BOUqMNnKwtNw3btTW18Pmi2gmLR
	gf1xkQ3c26ECs3yjh87p9n8cEsMqbSES6/3DhAA63ydiiRir2JPnhS+Oj6RonFbKdrLXqU6AdINFz
	JRgJjs0FQKdpWS42zCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbSt-0000000AvpX-3rgf;
	Tue, 03 Dec 2024 22:33:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbRz-0000000AvhY-2WPS;
	Tue, 03 Dec 2024 22:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A5EC5C6DBA;
	Tue,  3 Dec 2024 22:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957ADC4CEDC;
	Tue,  3 Dec 2024 22:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733265178;
	bh=Bpvf6PT2sZ1szXiUwNXmHPoiyL0/w8E+wBOIB5MmOEk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X+hVtUmXnkjxybS5JhrS3ehCvzAbgpvf7j4evJfuNyWITgL3BhTr1L/wW2h1gsde9
	 MdhxOyc+UgPe0okIyWW2D5Uz3m+TXGItm4fLPp1IubXkl/KXka2D9D79ZgB7H/IFbb
	 CqvkltHyQNaL/RmVQ8ZX3i2PWHLij+yEZgME0ES0UAZOxKiYcDmaB+Fe2qoY7pOv/I
	 kqtmTgU+uCGNv6Gvz5UBbE2Gaz0jGHtF5vXC9WceJs6J7+vRu36h9HxATcQF6EmqUX
	 6fTZp+7sZ0Pv4LjmFxk7a4nE8bpErisdROU0u+QCysy/xcYkaQ5Gkw0tWjpLzdZL0H
	 qtX4o9OvZB+sg==
Message-ID: <c982c5061ea6b0d465dd8b7fefc59cc7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <dbb2de3c-cb29-4384-a00b-4fdedeab1a10@sirena.org.uk>
References: <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com> <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> <1jy1131kxz.fsf@starbuckisacylon.baylibre.com> <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com> <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org> <1jr06pkof6.fsf@starbuckisacylon.baylibre.com> <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org> <dbb2de3c-cb29-4384-a00b-4fdedeab1a10@sirena.org.uk>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 14:32:56 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_143259_677844_3632CDA2 
X-CRM114-Status: GOOD (  12.42  )
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

Quoting Mark Brown (2024-12-03 14:22:04)
> On Tue, Dec 03, 2024 at 12:15:48PM -0800, Stephen Boyd wrote:
> > Quoting Jerome Brunet (2024-12-03 03:15:41)
> 
> > > I suspect the the generic path is likely to trigger more discussion.
> > > I'd like to be able to finish this migration, instead of leaving half
> > > finished like it is now.
> 
> > Is the half finished migration a problem for this cycle? I was intending
> > to send the revert later this week and try again next cycle.
> 
> Yes, this patch was triggered by me reporting that multiple boards in my
> test farm have completely broken audio with defconfig. 

I thought that commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert
reset implementation") was sufficient to fix the problem. Is that
incorrect?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
