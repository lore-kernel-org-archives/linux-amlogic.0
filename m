Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87AFC2D0DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 11:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC56206CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 11:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GztsSiqp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EGpos4ez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC56206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pezbMaRSONqVALL9zS0N1qR1r+T7UC+gE/dJrW6cr8=; b=GztsSiqpri+eWa
	hX0/8v6CuLXaR141QRn2EhTFaHEOXQxz6vJgD2OYoK1Togvvec4fHiK7KFGqWRoUxHq4oPR2z6NMS
	+EkgHC+B39NufeVruYmaVo3WZH32FJZ3vM6B5nnWUwfIQMtZzdU0Zr7H23LNBlKdxixIyyhBuAe5c
	NGjTZxS1cJ0zuF3DwhjE1ppbphoviJuBB74eyStA6Z/NTqNsldw0jRI8H06ALLkz6MBF+WfKw7z3N
	PVg2SjZBTDv5BCvl3lZnR+jlUOe8QrQDLhZzbiQ4UjXp/PRZopPtaoDnqyCapHXuWA1I2sLAy+Mrs
	5S/L8L68Qc718UqP5o5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikRUm-00037g-7B; Thu, 26 Dec 2019 11:40:00 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikRUj-000370-7d; Thu, 26 Dec 2019 11:39:59 +0000
Received: by mail-ed1-x543.google.com with SMTP id r21so22388419edq.0;
 Thu, 26 Dec 2019 03:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnDpuMiYhSgWz3b9tcFVN297Eqx81qPSphtkpFW2YI4=;
 b=EGpos4ezfLlYKew+l/e4uJMp1Skke6cJfAC2hkFpwhvi2aSWglVSxO/Apd0kmsyYU4
 h/9hBvwkjpD1LWarE95HV5ZORSNeSM6HLaCuBjhLCwboFt4tF4LDm8Wq+K/4nhVTXkPW
 U+0pnY2U09Jy1xRZjZVbFDO0oJX2AUUEqzmciqjfqDuxrMPMP+iJDX00dXXhOb1MG22G
 Iea+7+idDyh1+Rw72NADm1grR8WLkGAFilun3oYBoPzH+v8h87Rwgj2sBt6hXG5jeJkI
 mVWFElZi0AHWt9mwfuEtHRWy3OavHY+pJ/Pr3wik7d+JhHAU2p+I4Be8MjzmEnv+PXSt
 crXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnDpuMiYhSgWz3b9tcFVN297Eqx81qPSphtkpFW2YI4=;
 b=WWv9DLC8vfzhLwXQhAK7NWgr9m5/4Ughd0t6f7TW3VoU5psYx/jXqUxgAUDw9aijX/
 TS9sw18jDNxJZbOkVnFt5VpGXJcU8FUM8CCNlbWCQWwlAzcqJ0gklFvaJ/vqsPiLdLTN
 MtKGuoeU57EesGiMUlz6i4hH0+Vi8y/TVtPIeii+KCPjstgPj/Cgh4XDDl7tlSZcMbfq
 lr0ohJKax94bgTeilEYaf2NPQM2GOkYbS+lcZorFPcjmu1eJLeA5BS8mskyHmn3kunMw
 vvTJepG987DgUSrnNaER4E6AJBSGOq4jZCJbNEbCtYIIHUJT64Wyd3eZUFG5uy/ML74d
 Sj5w==
X-Gm-Message-State: APjAAAXICO6cGD3WOvoVUzvPDE4jbXe22uEoewkIJhpafbOYGfslxMLj
 4x6E3PuAs6MSMgzDVyXc7JliBxEFTJS6aRFe8c8=
X-Google-Smtp-Source: APXvYqwnJ4hu5Maho1A6UkCjxWLgHWKDqj1W43SvfESp+qHnuiZUYYJ6rlO/+jx29OthsJx6Da6soJidQqqcVLjEI0s=
X-Received: by 2002:a17:906:e219:: with SMTP id
 gf25mr47257452ejb.51.1577360395212; 
 Thu, 26 Dec 2019 03:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
 <20191225005655.1502037-2-martin.blumenstingl@googlemail.com>
 <20191225150845.GA16671@lunn.ch>
 <CAFBinCA4X1e5_5nBiHmNiB40uJyr9Nm1b2VkF9NqM+wb7-1xmw@mail.gmail.com>
 <20191226105044.GC1480@lunn.ch>
In-Reply-To: <20191226105044.GC1480@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Dec 2019 12:39:44 +0100
Message-ID: <CAFBinCB8YQ-tuGBixO_85NFXDdrH5keDURFgri5tFLdrAwUJKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on
 Meson8b/8m2 SoCs
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_033957_301433_4113C203 
X-CRM114-Status: GOOD (  36.82  )
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

Hi Andrew,

On Thu, Dec 26, 2019 at 11:50 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > >       # RX and TX delays are added by the MAC when required
> > >       - rgmii
> > >
> > >       # RGMII with internal RX and TX delays provided by the PHY,
> > >       # the MAC should not add the RX or TX delays in this case
> > >       - rgmii-id
> > >
> > >       # RGMII with internal RX delay provided by the PHY, the MAC
> > >       # should not add an RX delay in this case
> > >       - rgmii-rxid
> > >
> > >       # RGMII with internal TX delay provided by the PHY, the MAC
> > >       # should not add an TX delay in this case
> > >       - rgmii-txid
> > >
> > > So ideally, you want the MAC to add no delay at all, and then use the
> > > correct phy-mode so the PHY adds the correct delay. This gives you the
> > > most flexibility in terms of PHY and PCB design. This does however
> > > require that the PHY implements the delay, which not all do.
> > these boards (with RGMII PHY) that I am aware of are using an RTL8211F
> > PHY which implements a 2ns PHY TX delay
>
> We need to be careful here...
>
> Earlier this year we got into a mess with a PHY driver wrongly
> implemented these delays. DT contained 'rgmii', but the PHY driver
> actually implemented rgmii-id'. Boards worked, because they actually
> needed rgmii-id. But then came along a board which really did need
> rgmii. We took the decision, maybe the wrong decision, to fix the PHY
> driver, and fixup DT files as we found boards which had the incorrect
> setting. We broke a lot of boards for a while and caused lots of
> people pain.
>
> You might have something which works, but i want to be sure it is
> actually correct, not two bugs cancelling each other out.
(wow, that sounds painful)

> You say the RTL8211F PHY implements a 2ns PHY TX delay. So in DT, do
> you have the phy-mode of 'rgmii-txid'? That would be the correct
> setting to say that the PHY provides only the TX delay.
yes, in my experiment (for which I did not send patches to the list
yet because we're discussing that part) I set phy-mode = "rgmii-txid";
this also makes the dwmac-meson8b driver ignore any TX delay on the MAC side

> > however, the 3.10 vendor kernel also supports Micrel RGMII (and RMII)
> > PHYs where I don't know if they implement a (configurable) TX delay.
> >
> > > Looking at patches 2 and 3, the phy-mode is set to rgmii. What you
> > > might actually need to do is set this to rgmii-txid, or maybe
> > > rgmii-id, once you have the MAC not inserting any delay.
> > please let us split this discussion:
> > 1) I believe that this patch is still correct and required whenever
> > the MAC *has to* generate the TX delay (one use-case could be the
> > Micrel PHYs I mentioned above)
>
> I think this patch splits into two parts. One is getting a 25MHz
> clock. That part i can agree with straight away. The second part is
> setting a 2ns TX delay. This we need to be careful of. What is the MAC
> actually doing after this patch? What is the configured RX delay? Does
> the driver explicitly configure the RX delay? To what?
good to see that we agree on the clock part!

the MAC is not capable of generating an RX delay (at least as far as I know).
to me this means that we are using the default on the PHY side (I
*assume* - but I have no proof - that this means the RX delay is
enabled, just like TX delay is enabled after a full chip reset)

> > 2) the correct phy-mode and where the TX delay is being generated. I
> > have tried "rgmii-txid" on my own Odroid-C1 and it's working fine
> > there. however, it's the only board with RGMII PHY that I have from
> > this generation of SoCs (and other testers are typically rare for this
> > platform, because it's an older SoC). so my idea was to use the same
> > settings as the 3.10 vendor kernel because these seem to be the "known
> > working" ones.
>
> Vendor kernels have the alternative of 'vendor crap' for a good
> reason. Just because it works does not mean it is correct.
yes, there's no general rule about the quality of vendor code
in my case I found Ethernet TX to be stable and close to Gbit/s speeds
on the vendor kernel while mainline was dropping packets and speeds
were worse
that still doesn't mean the vendor code is good, but from a user
perspective it's better than what we have in mainline

> > what do you think about 2)? my main concern is that this *could* break
> > Ethernet on other people's boards.
> > on the other hand I have no idea how likely that actually is.
>
> From what i understand, Ethernet is already broken? Or is it broken on
> just some boards?
it's mostly "broken" (high TX packet loss, slow TX speeds) for the two
supported boards with an RGMII PHY (meson8b-odroidc1.dts and
meson8m2-mxiii-plus.dts)
examples on the many ways it was broken will follow - feel free to
skip this part

before this patch we had:
input clock at 250MHz
|- m250_sel (inheriting the rate of the input clock because it's a mux)
   |- m250_div set to 1
      |- fixed_div_by_2 (outputting 125MHz for the RGMII TX clock)
together with a configured (but suspicious) TX delay of 4ns on the MAC
side in the board .dts
Transmitting ("sending") data via Ethernet has heavy packet loss and
far from Gbit/s speeds
(setting the TX delay on the MAC in this case to 2ns broke Ethernet
completely, even DHCP was failing)

after this patch we have:
input clock at 500MHz (double as before)
|- m250_sel (inheriting the rate of the input clock because it's a mux)
   |- m250_div set to 2
      |- fixed_div_by_2 (still outputting 125MHz for the RGMII TX clock)
with the old TX delay of 4ns on the MAC side there is still packet loss
updating the TX delay on the MAC side to 2ns (which is what the vendor
driver does) fixes the packet loss and transmit speeds

> The Micrel PHY driver can also control its clock skew, but it does it
> in an odd way, not via the phy-mode, but via additional
> properties. See the binding document.
I see, thank you for the hint

> What we normally say is make the MAC add no delays, and pass the
> correct configuration to the PHY so it adds the delay. But due to the
> strapping pin on the rtl8211f, we are in a bit of a grey area. I would
> suggest the MAC adds no delay, phy-mode is set to rmgii-id, the PHY
> driver adds TX delay in software, we assume the strapping pin is set
> to add RX delay, and we add a big fat comment in the DT.
>
> For the Micrel PHY, we do the same, plus add the vendor properties to
> configure the clock skew.
>
> But as i said, we are in a bit of a grey area. We can consider other
> options, but everything needs to be self consistent, between what the
> MAC is doing, what the PHY is doing, and what phy-mode is set to in
> DT.
do you think it's worth the effort to get clarification from Realtek
on the RX delay behavior (and whether there's a register to control
it)?
(when I previously asked them about interrupt support they answered
all my questions so we were able to confirm that it's implemented
properly upstream)
before this email I would have asked Realtek about the RX delay and
sent a patch updating rtl8211f_config_init (the
PHY_INTERFACE_MODE_RGMII_RXID and PHY_INTERFACE_MODE_RGMII_ID cases).

you mentioned that there was breakage earlier this year, so I'm not sure anymore
(that leaves me thinking: asking them is still useful to get out of
this grey area)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
