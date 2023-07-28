Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A48EC001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uii+PsF4+3UjpwpTAJ9zc8fF/Qh46VS4onVeKCJlAVY=; b=bYr45KCEAevYyh
	rJTvBWu9Yc35qtRcYFYTgdNHFlMlXMobOkB6FouIp6Td1hAH+8tmJ0HjXi8pd9YrE6PXg0lUgY8CV
	Y5Fe1kFR3rnA9uncVCqZxVXjWPmPjdIeZPHFHSXzZuN69CQ9OgcJJ1NLvjaNcdDoUe/eolFRt7K6v
	VCfvcNPVS4ZKzo4kNt4NXHPmhHjfywKxjtCBh3KaYm19LL3q6PCqMbPwctezteQt9CaaxQKQB79zK
	xQHtGTnC3hcWaFh4ImcRipITFLbXBMf6OxlnkBxIg2WT/8lC4L/9LVWIL5b5jqFUl5EkDy9n5q6HY
	NSxcqKjvXdwSVy/juPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPVy-003t96-0H;
	Fri, 28 Jul 2023 15:36:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPVv-003t8M-0l;
	Fri, 28 Jul 2023 15:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 910F062184;
	Fri, 28 Jul 2023 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD475C433C8;
	Fri, 28 Jul 2023 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690558582;
	bh=g4K5vq4lPyGBYhqgJJE0//L14vL/7BRJwDrh2+NOlqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0/2qOh9DNQM/zNi5r9udD62Tuu5Uosyrt7S4golN5beku3HBItbqx/hsmFGSsjso
	 /K78hYySn6CsOKCp40tUlRsYRNgEQR/ZSeR3x2gxM6/SvBC/W1YQyj7muSEibPxpt4
	 9fx5kaG5gptMsk367e7ditSVFDcX2XzKOQai8PgIupG70U0dRp3wNZW74zkoQPzZ/g
	 DdsyYULweQssqFoRfX7p2gW8o4eVxrtPtFqJjxOjm0Ib1hFQBJULx5RV4D8BgBxHCD
	 dMb7FJIYJfoGEcIG/KcIdeYFlcF4Pb77Kzu9Gez3zZTCGgrk3wvZLSiigrkx4o4R2s
	 S/qZhlXIcMYCQ==
Date: Fri, 28 Jul 2023 16:36:12 +0100
From: Will Deacon <will@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Simon Horman <simon.horman@corigine.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Wong Vee Khee <veekhee@apple.com>,
	Revanth Kumar Uppala <ruppala@nvidia.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock
 in fixed-link
Message-ID: <20230728153611.GH21718@willie-the-truck>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
 <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_083623_359428_71B1A366 
X-CRM114-Status: GOOD (  21.66  )
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

On Fri, Jul 28, 2023 at 04:22:19PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 27, 2023 at 01:36:45PM -0500, Andrew Halaney wrote:
> > I don't have any documentation for the registers here, and as you can
> > see I'm an amateur with respect to memory ordering based on my prior
> > comment.
> > 
> > But you:
> > 
> >     1. Read intf_reg_off into variable iface
> >     2. Write the RESET_SPEED for the appropriate mode to MAC_CTRL_REG
> >     3. wmb() to ensure that write goes through
> 
> I wonder about whether that wmb() is required. If the mapping is
> device-like rather than memory-like, the write should be committed
> before the read that regmap_update_bits() does according to the ARM
> memory model. Maybe a bit of information about where this barrier
> has come from would be good, and maybe getting it reviewed by the
> arm64 barrier specialist, Will Deacon. :)
> 
> wmb() is normally required to be paired with a rmb(), but we're not
> talking about system memory here, so I also wonder whether wmb() is
> the correct barrier to use.

Yes, I don't think wmb() is the right thing here. If you need to ensure
that the write to MAC_CTRL_REG has taken effect, then you'll need to go
through some device-specific sequence which probably involves reading
something back. If you just need things to arrive in order eventually,
the memory type already gives you that.

It's also worth pointing out that udelay() isn't necessarily ordered wrt
MMIO writes, so that usleep_range() might need some help as well.
Non-relaxed MMIO reads, however, _are_ ordered against a subsequent
udelay(), so if you add the readback then this might all work out.

I gave a (slightly dated) talk about some of this at ELC a while back:

https://www.youtube.com/watch?v=i6DayghhA8Q

which might help.

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
