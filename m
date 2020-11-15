Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B41DC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 15:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE37B223C7
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 15:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D7j+dAnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE37B223C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ixVUZbgS3YfswngjKSJ5cKeIhR8qgiVsHaPlsh5O1E=; b=D7j+dAnhn24ryxuKkS3K7U3Ni
	QNgGYQY5RTNfa62jSZF7ZG2IE3u7o0AWB1en+Fj0vvSJ2wOVlthdCAn1OUYuNZAq+eVpNde0OENS0
	wl8EKihAxu0M3SFwX0ayImVps9SsXR6lvyBh68taXfFv2dLxLqSlPfZ0AOlU0x49wh7ifnyjjA+1w
	nBL1HOr4mfuzTqUSlfCM06pH3UG16PavoA7VDbXzmV8FC0GSHApKAhwX1BXf2BkORNOp5EaQxJ59n
	eMvoWBUayCa6g1CqhLdU3pO5SH58w8hYnpC/ZcLdL5MxTTa+jsO9ukboWixdCBNra1KoLyi0FPP54
	W7UufSxtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keK5x-0002NW-Pk; Sun, 15 Nov 2020 15:37:37 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keK5v-0002Mw-Jq; Sun, 15 Nov 2020 15:37:36 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1keK5j-007CBo-Gz; Sun, 15 Nov 2020 16:37:23 +0100
Date: Sun, 15 Nov 2020 16:37:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 1/4] dt-bindings: net: dwmac-meson: use
 picoseconds for the RGMII RX delay
Message-ID: <20201115153723.GA1701029@lunn.ch>
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
 <20201114200104.4148283-2-martin.blumenstingl@googlemail.com>
 <20201114223250.GI1480543@lunn.ch>
 <CAFBinCAmExHsCpP8hh_K6M6pg8SjoF1WNNj9fwSKR3dhgBGJdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAmExHsCpP8hh_K6M6pg8SjoF1WNNj9fwSKR3dhgBGJdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_103735_694099_F4E91F0E 
X-CRM114-Status: GOOD (  22.95  )
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
Cc: devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Nov 15, 2020 at 10:22:06AM +0100, Martin Blumenstingl wrote:
> Hi Andrew,
> 
> On Sat, Nov 14, 2020 at 11:32 PM Andrew Lunn <andrew@lunn.ch> wrote:
> [...]
> > > +        amlogic,rgmii-rx-delay-ps:
> > > +          default: 0
> > >            description:
> > >              The internal RGMII RX clock delay (provided by this IP block) in
> > > -            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
> > > +            picoseconds. When phy-mode is set to "rgmii" then the RX delay
> > >              should be explicitly configured. When the phy-mode is set to
> > >              either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
> > >              provided by the PHY. Any configuration is ignored when the
> > >              phy-mode is set to "rmii".
> >
> > Hi Martin
> >
> > I don't think the wording matches what the driver is actually doing:
> >
> >         if (dwmac->rx_delay_ns == 2)
> >                 rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
> >         else
> >                 rx_dly_config = 0;
> >
> >         switch (dwmac->phy_mode) {
> >         case PHY_INTERFACE_MODE_RGMII:
> >                 delay_config = tx_dly_config | rx_dly_config;
> >                 break;
> >         case PHY_INTERFACE_MODE_RGMII_RXID:
> >                 delay_config = tx_dly_config;
> >                 break;
> >         case PHY_INTERFACE_MODE_RGMII_TXID:
> >                 delay_config = rx_dly_config;
> >                 break;
> >         case PHY_INTERFACE_MODE_RGMII_ID:
> >         case PHY_INTERFACE_MODE_RMII:
> >                 delay_config = 0;
> >                 break;
> >
> > So rx_delay is used for both rgmii and rgmii-txid. The binding says
> > nothing about rgmii-txid.
> interesting point here. it's been like this before this patch. still I
> would like to understand what the proper way to fix it is so I can
> also include a fix for it:
> 1. should rgmii-txid not add any RX delay on the MAC side? that would
> mean for my board I will switch to phy-mode rgmii so the MAC applies
> both the RX and TX delays
> 2. update the documentation to clarify that rgmii-txid would also add
> the RX delay on the MAC side

Hi Martin

I would fix the documentation.

> that is a good point and also a bug with one of the previous patches
> I'll include a patch fixing this in v2

Thanks for looking at these.

       Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
