Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A41C001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0PDvtPUkRBpp9ods8g7U3D9WAvaVEUKk2B1aw1HvrY=; b=oW9bBJR6Kair37
	EoHxo7hu+ULHwFQ8DW3XNmDL510i04uVK/FVg873/1WIZouoPRRbaMR9x+EcjZesrPYWPD4ywEZmE
	5SWJnwV/+mY03PrRYRmFtaKYoWKANZkN7hKoSRA2HB0N9mBBL3woWRZ3FILov7h2FyABZOWJSKcm8
	jmBsqnbLXZsrnJcynw3jNBD3I6JrHjWSePOS44O4y/1Lxygi3hnUirpQuEwuKobfXz5lFIRlYoc65
	S3BG9WZJaYmPN4Uq/4t/oPHYAmgV63iTrJSL0g3urZPVKa9hghGYCciEIx6uDeP1fWImioym2W+4D
	hM9kK8gIsAXeLjQ5sAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTGE-004n5I-26;
	Fri, 28 Jul 2023 19:36:26 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTG9-004mpC-1K;
	Fri, 28 Jul 2023 19:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fPenveROvmLP9xK4bVQXMQSFpU0bLGq9l0utMcWGrfM=; b=S3P1XhiNI7tuydMrFHMGOtysw4
	y7VxJlfdAExXJizqj4Qwc25CAaVdYRwdYTPeALneag129u+mW6NnjT+T7k+1BVbMz+6GnQ6+zyvVC
	5D/9nWvpNBg6jeMWlTkQqS1v1Vjh6m0kkwvLLrcDyceBa4zN8zpSuc+kjysseEjfRfV+FRPavTh3I
	2bEi9qFHbGOxrV/B3SdL+Wi8gKML0mDxdC/hgbe7PHi4k2/FvVElp9vrZNON7d8E+42y6XEfwhOfh
	Z+s9pckqRxtpCUryeXfQx6shKLGrkvw7ZIZ02ie2f7et1TgNMLqrVWXt/zXpXur+ZGbxJDiZM4Cza
	KjzCUZCQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qPTDb-0007kx-2V;
	Fri, 28 Jul 2023 20:33:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qPTDW-0005B7-3J; Fri, 28 Jul 2023 20:33:38 +0100
Date: Fri, 28 Jul 2023 20:33:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Li <Frank.li@nxp.com>
Cc: Will Deacon <will@kernel.org>, Andrew Halaney <ahalaney@redhat.com>,
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
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock
 in fixed-link
Message-ID: <ZMQYEs9gULZmmijV@shell.armlinux.org.uk>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
 <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
 <20230728153611.GH21718@willie-the-truck>
 <ZMPs+sOIzWR0LmrP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMPs+sOIzWR0LmrP@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_123621_473547_71B046DF 
X-CRM114-Status: GOOD (  23.86  )
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

On Fri, Jul 28, 2023 at 12:29:46PM -0400, Frank Li wrote:
> On Fri, Jul 28, 2023 at 04:36:12PM +0100, Will Deacon wrote:
> > Yes, I don't think wmb() is the right thing here. If you need to ensure
> > that the write to MAC_CTRL_REG has taken effect, then you'll need to go
> > through some device-specific sequence which probably involves reading
> > something back. If you just need things to arrive in order eventually,
> > the memory type already gives you that.
> > 
> > It's also worth pointing out that udelay() isn't necessarily ordered wrt
> > MMIO writes, so that usleep_range() might need some help as well.
> 
> Hi Deacon:
> 
> Does it means below pattern will be problem?
> 
> 1.writel()
> 2.udelay()
> 3.writel()

Yes, it can be a problem - because the first write may take a while
to hit the hardware. It's been this way ever since PCI became a thing,
even on x86 hardware.

PCI posting rules are that writes can be posted into the various
bridges in the bus structure and forwarded on at some point later.
However, reads are not allowed to bypass writes - which means that if
one reads from a PCI device, the preceeding writes need to be flushed
out of the bridges _in the path to the device being read_.

So, if we take an example and apply it to PCI:

	writel()
	udelay(100)
	writel()
	readl()

The device could well see nothing for a while, and then two consecutive
writes and a read in quick succession.

> It may not wait enough time between 1 and 3. I think the above pattern
> is quite common in driver code.  I am not sure if usleep_range involve
> MMIO to get current counter, ARM may use cp15 to get local timer counter.

There are no guarantees, even on x86, that udelay() offers anything to
space device writes apart.

If this pattern is popular in drivers, and it's critical to the
drivers operation, then it's technically buggy - and it's been that way
for at least a couple of decades! One might get away with it (maybe the
hardware isn't delaying the writes?) but the kernel has never
guaranteed that writel(), udelay(), writel() will space the two writes
apart by the specified delay.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
