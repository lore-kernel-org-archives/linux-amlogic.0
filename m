Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE868C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Jul 2022 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwiuYSj0k0KEvq2w36Wfb3Xdge8Xrxz4LDD8EjivaEo=; b=iQqLynWIs3Suae
	8h6uNmtq4yZVskkV6WwQDQrJH9giPd4DfqQpZh4+3k97Hd6YaxO5in7benzqZI0tHTJ7caDUz/mzE
	GtpuF83JxzgImd70ezBO8x0X3OwVjnuabXWm6+hEh6wkkxSdfHPBTdnvS6xsZe7AuAmFXGETwDONX
	wlbioBV75Iyu1OUt7cAK+h4fD2GzRhp5k0osfnDisA9tegrPBffXiB4fST9SlbNWVau2mq9VGhekN
	X5QTtIV0TxQsCWzMnTLlVwAyUzy7NLfNXjBehdVEgRhOIwGltYys6qxlzC/E7/1hpHfBnAJkgTMSl
	vaYfIkFBQNVhyvkIgAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFHP-004mBr-Fw; Fri, 15 Jul 2022 06:58:27 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFHK-004m8U-W8
	for linux-amlogic@lists.infradead.org; Fri, 15 Jul 2022 06:58:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id p6so4707731ljc.8
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Jul 2022 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BJwazGQZJW/uLVik//axHOH23W4pKtSA8Q3XriyhUmc=;
        b=aqTX5lyeo4zyOGbJuWS5PtHeQ51cfrngS7PkLm7m/+0HuBKQ/6W8/f6IgIv74WR8AE
         ZNePrO60SD/ZtXxyb3aROTEjXizmcOMAJRoI31uqS9mqZqg63SpmjqHDjV3BoyfxTvFZ
         e+qYfxrvZv3wBPKGcysWj1ibjttxnHpmovkQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BJwazGQZJW/uLVik//axHOH23W4pKtSA8Q3XriyhUmc=;
        b=7bGjEpiIkIao9QebIwdyVVgYyLvDtP1hdm/vhOJo7jwFfIEbjmQ60wbrWHskJGVnu/
         SbsP+LAMyBoSMfNTopHbRVqxDF330z4MbKQzLGRWSpDf2xSle1eKNFGLmiQBFoj72NVC
         KBDyydo/scmkzxJxA0bchCh69PYXH8sIjRJUtTwXDTcFI6O/mqAzI7WKxE6qGlpYVN4A
         +4kYyfd/KG0GPkwpqydKq6vgxY0e/y7XC/MhUw4LTe1qUccu8IUb+OBlGqZiL3CwwU4A
         5hu+980lblORdH5PKYVu64pfRQ6O6pO+5ym6TpYfr+cKMknMJ8JDomEFBRSrkPCtgf9A
         sswA==
X-Gm-Message-State: AJIora+5+ChUjvMoKPNzoUVf7ZcL+MUJwB1JplKuWWH/aA1c8DzvVtEV
	/9czuJCY4V5GnbWZH/CGBuzSPP0clUFzrwiOelIUIX/RwJpywmgJ
X-Google-Smtp-Source: AGRyM1sa5jZmcE2eFhomUSTWVzfgAAUu2l+24idODbu3F3KQ3MUjG1kstqYjoDAdosvLrZc4+kMIQVhMcdzT23yE02M=
X-Received: by 2002:a2e:b88b:0:b0:25d:a15a:bba9 with SMTP id
 r11-20020a2eb88b000000b0025da15abba9mr1507486ljp.357.1657868296471; Thu, 14
 Jul 2022 23:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220707101423.90106-1-jbrunet@baylibre.com> <CACdvmAjz9EzeapjATa0aOnRURYgS7NSZRE=uUAuc4X+2otG5EA@mail.gmail.com>
In-Reply-To: <CACdvmAjz9EzeapjATa0aOnRURYgS7NSZRE=uUAuc4X+2otG5EA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Fri, 15 Jul 2022 02:58:04 -0400
Message-ID: <CACdvmAjjgnLzipU7-A+RFjiqh3ijBaJ9gGcRzCHF_NxYevGu9w@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Erico Nunes <nunes.erico@gmail.com>, netdev@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Qi Duan <qi.duan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_235823_059771_0CADB582 
X-CRM114-Status: GOOD (  53.73  )
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

On Wed, Jul 13, 2022 at 5:24 AM Da Xue <da@lessconfused.com> wrote:
>
> On Thu, Jul 7, 2022 at 6:14 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> > For some reason, poking MAC_CTRL_REG a second time, even with the same
> > value, causes problem on a dwmac 3.70a.
> >
> > This problem happens on all the Amlogic SoCs, on link up, when the RMII
> > 10/100 internal interface is used. The problem does not happen on boards
> > using the external RGMII 10/100/1000 interface. Initially we suspected the
> > PHY to be the problem but after a lot of testing, the problem seems to be
> > coming from the MAC controller.
> >
> > > meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
> > > meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
> > > meson8b-dwmac c9410000.ethernet: PTP uses main clock
> > > meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
> > > meson8b-dwmac c9410000.ethernet:      DWMAC1000
> > > meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
> > > meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
> > > meson8b-dwmac c9410000.ethernet: COE Type 2
> > > meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
> > > meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
> > > meson8b-dwmac c9410000.ethernet: Normal descriptors
> > > meson8b-dwmac c9410000.ethernet: Ring mode enabled
> > > meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> >
> > The problem is not systematic. Its occurence is very random from 1/50 to
> > 1/2. It is fairly easy to detect by setting the kernel to boot over NFS and
> > possibly setting it to reboot automatically when reaching the prompt.
> >
> > When problem happens, the link is reported up by the PHY but no packet are
> > actually going out. DHCP requests eventually times out and the kernel reset
> > the interface. It may take several attempts but it will eventually work.
> >
> > > meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> > > Sending DHCP requests ...... timed out!
> > > meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
> > > IP-Config: Retrying forever (NFS root)...
> > > meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
> > > meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
> > > meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
> > > meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
> > > meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> > > Sending DHCP requests ...... timed out!
> > > meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
> > > IP-Config: Retrying forever (NFS root)...
> > > [...] 5 retries ...
> > > IP-Config: Retrying forever (NFS root)...
> > > meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
> > > meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
> > > meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
> > > meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
> > > meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> > > Sending DHCP requests ., OK
> > > IP-Config: Got DHCP answer from 10.1.1.1, my address is 10.1.3.229
> >
> > Of course the same problem happens when not using NFS and it fairly
> > difficult for IoT products to detect this situation and recover.
> >
> > The call to stmmac_mac_set() should be no-op in our case, the bits it sets
> > have already been set by an earlier call to stmmac_mac_set(). However
> > removing this call solves the problem. We have no idea why or what is the
> > actual problem.
> >
> > Even weirder, keeping the call to stmmac_mac_set() but inserting a
> > udelay(1) between writel() and stmmac_mac_set() solves the problem too.
> >
> > Suggested-by: Qi Duan <qi.duan@amlogic.com>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >
> >  Hi,
> >
> >  There is no intention to get this patch merged as it is.
> >  It is sent with the hope to get a better understanding of the issue
> >  and more testing.
> >
> >  The discussion on this issue initially started on this thread
> >  https://lore.kernel.org/all/CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com/
> >
> >  The patches previously proposed in this thread have not solved the
> >  problem.
> >
> >  The line removed in this patch should be a no-op when it comes to the
> >  value of MAC_CTRL_REG. So the change should make not a difference but
> >  it does. Testing result have been very good so far so there must be an
> >  unexpected consequence on the HW. I hope that someone with more
> >  knowledge on this controller will be able to shine some light on this.
> >
> >  Cheers
> >  Jerome
> >
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d1a7cf4567bc..3dca3cc61f39 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1072,7 +1072,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
> >
> >         writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
> >
> > -       stmmac_mac_set(priv, priv->ioaddr, true);
> >         if (phy && priv->dma_cap.eee) {
> >                 priv->eee_active = phy_init_eee(phy, 1) >= 0;
> >                 priv->eee_enabled = stmmac_eee_init(priv);
> > --
> > 2.36.1
> >
>
> We had a problem with GXL (S805X/S905X) where the ethernet interface
> would sometimes not come up. Before the 5.10 LTS, it was just a matter
> of bringing down and up (ip link set) the interface to fix the issue.
> With 5.15, 5.18, and 5.19, we would get "meson8b-dwmac
> c9410000.ethernet eth0: Reset adapter." No amount of link down ups can
> fix it anymore.

I realized that I did not add the ethernet reset in the device tree
that u-boot was passing to Linux. Sorry about the noise on this.

>
> When we get the "meson8b-dwmac c9410000.ethernet eth0: Reset
> adapter.", it affects traffic on the network switch. I have a ping
> going from two different devices on a GS108PP PoE network switch and
> it would go through the roof. When I remove the GXL board, everything
> comes back to normal.

Given that the reset fixes the ethernet issues, the hardware still
could be causing this but it is no longer long enough to notice.

>
> We would get randomized corruption when ethernet is brought up
> (successfully or not) about half the time. If it boots up without a
> problem, it remains super stable. I would run benchmarks for CPU, 3D,
> and ethernet for days without that glitch ever appearing. It seems to
> be determined at startup.

This is gone with ethernet reset in the device tree and the no
double-poke register change Jerome provided.

Best,
Da

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
