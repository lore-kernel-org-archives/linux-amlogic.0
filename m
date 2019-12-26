Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADCEC2D0DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 10:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE312080D
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 10:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6ynzKBg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5ENSPtWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE312080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4aQqXl8Eo/mxE3gV1+JBbPiYSYotQosGbActlBp0GM=; b=d6ynzKBgDX6ioW
	b9SEkCfdvFE/GDKEVpxEpPepHM/FNg8QC1bBEVYrFr6mGEtLQLrc8YeN63HLntiKZl6qcfclO11cd
	wjz/MhHYdovcjLoVdpCXHMVl0jrML+NsuvKyuZgPJk1f9b2+UcKqVYsvMF3bkieV17KpUVR+e2EvQ
	lCNZUrvJgHRV3q77mykU+w3ulmcjim3ZzKwxmDiE+hEF55p1WIjgcgkJyP7HvDVJlsGQhBNFqbbUf
	R7vW9+bK5JUijlikVyrMYmp/WvzAx/ilqvCMK5OaIWFKCkr5tdyD9U/UJTOhBjm8JemQWblcisvZi
	QATv+E+LxT1ibim87nBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikQjO-0006AA-G2; Thu, 26 Dec 2019 10:51:02 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikQjL-00069T-RC; Thu, 26 Dec 2019 10:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WWQCvAOj9VPIiUVGyfQ33Wwo9TwBrEqStTy3iF0TRKI=; b=5ENSPtWuCLATBd8/kwa0/36DDH
 LgALFZw7cT3ojHPLSyxbRZynys24RXrvRE+4Hoa9l1gxwiTtzjWZ7v1ndSEl+oCZqWVHzg6NgsDfy
 toS1nInW/8n8kzoXlBewdmyw3zos4MOsbNjS5iw3G9T8kM6A4qeCczP0Bcz7SHQsSvNg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1ikQj6-00013d-GX; Thu, 26 Dec 2019 11:50:44 +0100
Date: Thu, 26 Dec 2019 11:50:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay
 on Meson8b/8m2 SoCs
Message-ID: <20191226105044.GC1480@lunn.ch>
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
 <20191225005655.1502037-2-martin.blumenstingl@googlemail.com>
 <20191225150845.GA16671@lunn.ch>
 <CAFBinCA4X1e5_5nBiHmNiB40uJyr9Nm1b2VkF9NqM+wb7-1xmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA4X1e5_5nBiHmNiB40uJyr9Nm1b2VkF9NqM+wb7-1xmw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_025059_878126_2CDB925D 
X-CRM114-Status: GOOD (  23.75  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linus.luessing@c0d3.blue,
 balbes-150@yandex.ru, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 ingrassia@epigenesys.com, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> >       # RX and TX delays are added by the MAC when required
> >       - rgmii
> >
> >       # RGMII with internal RX and TX delays provided by the PHY,
> >       # the MAC should not add the RX or TX delays in this case
> >       - rgmii-id
> >
> >       # RGMII with internal RX delay provided by the PHY, the MAC
> >       # should not add an RX delay in this case
> >       - rgmii-rxid
> >
> >       # RGMII with internal TX delay provided by the PHY, the MAC
> >       # should not add an TX delay in this case
> >       - rgmii-txid
> >
> > So ideally, you want the MAC to add no delay at all, and then use the
> > correct phy-mode so the PHY adds the correct delay. This gives you the
> > most flexibility in terms of PHY and PCB design. This does however
> > require that the PHY implements the delay, which not all do.
> these boards (with RGMII PHY) that I am aware of are using an RTL8211F
> PHY which implements a 2ns PHY TX delay

We need to be careful here...

Earlier this year we got into a mess with a PHY driver wrongly
implemented these delays. DT contained 'rgmii', but the PHY driver
actually implemented rgmii-id'. Boards worked, because they actually
needed rgmii-id. But then came along a board which really did need
rgmii. We took the decision, maybe the wrong decision, to fix the PHY
driver, and fixup DT files as we found boards which had the incorrect
setting. We broke a lot of boards for a while and caused lots of
people pain.

You might have something which works, but i want to be sure it is
actually correct, not two bugs cancelling each other out.

You say the RTL8211F PHY implements a 2ns PHY TX delay. So in DT, do
you have the phy-mode of 'rgmii-txid'? That would be the correct
setting to say that the PHY provides only the TX delay.

> however, the 3.10 vendor kernel also supports Micrel RGMII (and RMII)
> PHYs where I don't know if they implement a (configurable) TX delay.
> 
> > Looking at patches 2 and 3, the phy-mode is set to rgmii. What you
> > might actually need to do is set this to rgmii-txid, or maybe
> > rgmii-id, once you have the MAC not inserting any delay.
> please let us split this discussion:
> 1) I believe that this patch is still correct and required whenever
> the MAC *has to* generate the TX delay (one use-case could be the
> Micrel PHYs I mentioned above)

I think this patch splits into two parts. One is getting a 25MHz
clock. That part i can agree with straight away. The second part is
setting a 2ns TX delay. This we need to be careful of. What is the MAC
actually doing after this patch? What is the configured RX delay? Does
the driver explicitly configure the RX delay? To what?

If you look at the definitions above, if the phy-mode is rgmii, the
MAC is responsible for both RX and TX delay. 

> 2) the correct phy-mode and where the TX delay is being generated. I
> have tried "rgmii-txid" on my own Odroid-C1 and it's working fine
> there. however, it's the only board with RGMII PHY that I have from
> this generation of SoCs (and other testers are typically rare for this
> platform, because it's an older SoC). so my idea was to use the same
> settings as the 3.10 vendor kernel because these seem to be the "known
> working" ones.

Vendor kernels have the alternative of 'vendor crap' for a good
reason. Just because it works does not mean it is correct.

> what do you think about 2)? my main concern is that this *could* break
> Ethernet on other people's boards.
> on the other hand I have no idea how likely that actually is.

From what i understand, Ethernet is already broken? Or is it broken on
just some boards?

Looking at the function rtl8211f_config_init(), that PHY driver can
only control TX delays. RX delays are controlled by a strapping pin.

The Micrel PHY driver can also control its clock skew, but it does it
in an odd way, not via the phy-mode, but via additional
properties. See the binding document.

What we normally say is make the MAC add no delays, and pass the
correct configuration to the PHY so it adds the delay. But due to the
strapping pin on the rtl8211f, we are in a bit of a grey area. I would
suggest the MAC adds no delay, phy-mode is set to rmgii-id, the PHY
driver adds TX delay in software, we assume the strapping pin is set
to add RX delay, and we add a big fat comment in the DT.

For the Micrel PHY, we do the same, plus add the vendor properties to
configure the clock skew.

But as i said, we are in a bit of a grey area. We can consider other
options, but everything needs to be self consistent, between what the
MAC is doing, what the PHY is doing, and what phy-mode is set to in
DT.

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
