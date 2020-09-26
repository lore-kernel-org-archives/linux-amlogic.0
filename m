Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A94FC4727C
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 00:41:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B412076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 00:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Duk8sevJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B412076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yx6zIc4lhPE46pulkhOBpbSKnoM1fK4jnMXm7Ze+QAA=; b=Duk8sevJvOGrjEpM+eHDSef+F
	PbvFCwnRjrzIAhbrt3zpLEnrXI++AHfODqqR8ROS3x78r9kQzK6jGimm9V/gLebiR80+/+wbobowp
	4ftxSxpSncNNNX/oY0HzEiov1Fgneilf32B7k3NhCGozRj7plwRPiYN/fVMS9PUWYZC2fSM3J9gjQ
	hETv8JurDQ/OXAqbn5Dc3OXEAFhZebdzG+XCNyVpdImJ7C7903tDR7mJ0nimBt2FVfWtXf9D8kXR2
	1lF7ndhBgH3sc88TjiNKOgK9jkzTiC7uTHMezWTPK+4m4hufCl2MOFkwOh+9QxQtmoP0iRjFRQAX9
	NoKJHpMLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLyHW-0004pN-Tt; Sat, 26 Sep 2020 00:41:42 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLyHU-0004oW-DZ; Sat, 26 Sep 2020 00:41:41 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kLyHJ-00GE3z-Mg; Sat, 26 Sep 2020 02:41:29 +0200
Date: Sat, 26 Sep 2020 02:41:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
Message-ID: <20200926004129.GC3850848@lunn.ch>
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925221403.GE3856392@lunn.ch>
 <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_204140_480162_9509F0C5 
X-CRM114-Status: GOOD (  23.21  )
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

> The reference code I linked tries to detect the RGMII interface mode.
> However, for each board we know the phy-mode as well as the RX and TX
> delay - so I'm not trying to port the RGMII interface detection part
> to the mainline driver.
> 
> on X96 Air (which I'm using for testing) Amlogic configures phy-mode
> "rgmii" with a 2ns TX delay provided by the MAC and 0ns RX delay
> anywhere (so I'm assuming that the board adds the 2ns RX delay)

Hi Martin

It would be unusual to have an asymmetric design in the PCB. So i
would try to prove that assumption. It could be the PHY driver is
broken, and although it is configured to use RGMII, it is actually
inserting a delay on RX. Also check if the PHY has any strapping.

> I am aware that the recommendation is to let the PHY generate the delay.
> For now I'm trying to get the same configuration working which is used
> by Amlogic's vendor kernel and u-boot.
> 
> > Is there any documentation as to what the calibration values mean?  I
> > would just hard code it to whatever means 0uS delay, and be done. The
> > only time the MAC needs to add delays is when the PHY is not capable
> > of doing it, and generally, they all are.

> This calibration is not the RGMII RX or TX delay - we have other
> registers for that and already know how to program these.

O.K. so maybe this is just fine tuning. Some PHYs also allow this.

> What I can say is that u-boot programs calibration value 0xf (the
> maximum value) on my X96 Air board. With this I cannot get Ethernet
> working - regardless of how I change the RX or TX delays.
> If I leave everything as-is (2ns TX delay generated by the MAC, 0ns RX
> delay, ...) and change the calibration value to 0x0 or 0x3 (the latter
> is set by the vendor kernel) then Ethernet starts working.

So there is just one calibration value? So it assumes the calibration
is symmetric for both RX and TX.

What PHY is it using?

https://dpaste.com/2WJF9EN suggests it is a RTL8211F.

This device does have stripping to set the default delay. Can you
check if there are pull ups on pins 24 and 25?

What i find interesting is in the driver is:

        ret = phy_modify_paged_changed(phydev, 0xd08, 0x11, RTL8211F_TX_DELAY,
                                       val_txdly);

        ret = phy_modify_paged_changed(phydev, 0xd08, 0x15, RTL8211F_RX_DELAY,
                                       val_rxdly);

Different registers, 0x11 vs 0x15. In the datasheets i found with
google, none describe any of these bits, but at least register 0x15 is
mentioned, where as register 0x11 is not.

Git blame shows you added this! Are you sure about this? It seems odd
they are in different registers.

     Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
