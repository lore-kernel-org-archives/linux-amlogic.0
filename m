Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00DDC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 14:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8624C207D8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 14:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="whuhGl86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8624C207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m+vcnazpYAGzzYG9bRgUdRxBLuLkSyEFX68Wbx4xYM8=; b=whuhGl86OF3hUnnxlqpP+QCzQ
	bNnvvGNNjaocuFOuixBF54MBE9+/C7AC5EZYNShL//jCBE8tFJaIObzUaBXvoNoLrNH4KR9IJd0as
	ddfA9zGfH+BRg9JPx/wDjwtxc9cfjlNmQ294sI33Llq+7lB3haHwixxESox50mag6ORJhhIErIR6z
	ckl+/YEilvN2ePrhGVfNaAsXNHfCrDvrnKcaPiPMVdNFdZm6Pm6gTENRjQu2HOF24Ft+Fiu4YcK1a
	oy82fhfaDSqhTr+l8Mor+Fn6fBgXOly/GY3Xia2PP8rRKEVXI7Y8DvfHzPCB1paL8RV88Nx4dxnjG
	MgWQ0aAng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMBS5-0002MZ-Ip; Sat, 26 Sep 2020 14:45:29 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMBS3-0002Ly-8V; Sat, 26 Sep 2020 14:45:28 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kMBRp-00GHdg-P1; Sat, 26 Sep 2020 16:45:13 +0200
Date: Sat, 26 Sep 2020 16:45:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
Message-ID: <20200926144513.GD3850848@lunn.ch>
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925221403.GE3856392@lunn.ch>
 <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
 <20200926004129.GC3850848@lunn.ch>
 <CAFBinCAc2-QV3E8P4gk+7Lq0ushH08UoZ0tQ8ACEoda-D8oaWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAc2-QV3E8P4gk+7Lq0ushH08UoZ0tQ8ACEoda-D8oaWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_104527_344175_EB8D1204 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> I checked this again for the vendor u-boot (where Ethernet is NOT
> working) as well as the Android kernel which this board was shipped
> with (where Ethernet is working)
> - in u-boot the MAC side adds a 2ns TX delay and the PHY side adds a
> 2ns RX delay

So that suggest there is nothing on the PCB. It is all down to MAC and
PHY adding delays.

> yes, there's only one calibration value
> the reference code is calculating the calibration setting for four
> configuration variants:
> - 2ns TX delay on the MAC side, no RX or TX delay on the PHY side, RGMII RX_CLK not inverted
> - 2ns TX delay on the MAC side, no RX or TX delay on the PHY side, RGMII RX_CLK inverted
> - 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII RX_CLK not inverted
> - 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII RX_CLK inverted
> 
> now that I'm writing this, could it be a calibration of the RX_CLK
> signal?

Yes, seems like it. Which of these four does it end up using? I'm
guessing the 3rd?

So i would forget about configuration clock inversion. Hard code it to
whatever works. It is not something you see other MAC/PHY combinations
allow to configure.

I think you said a value of 0x2 works. I wonder if that corresponds to
something slightly larger than 0ns if option 3 is being used?

> In the meantime Amlogic's "hacked" PHY driver is also using these registers: [0]
> So I assume that I'm doing the right thing in the Realtek PHY driver

Thanks for confirming this. No need to check for the resistors.

       Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
