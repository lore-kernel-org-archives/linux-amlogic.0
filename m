Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF5AECE582
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/XE6JGuytorPl55U0g01tsO7y1lFtBG25tQEmZjnHU=; b=2n7uCnZdH2iSkj
	Q1tD3gGJcyVjJjdeSY/0j57Rw/UDIg6ncqWLhbVUibOCvFnejvgGHo24lLPQfMnBd5DFpEQjSL12P
	41Fr3sLor4YRY6njtWos0mLIxUZBeQQ56wRLDC7o3h8PN6W5c9nl0ujuNCjkvPi4Bzk//fJ8Pw2a5
	ywdYDsGyF8aKoULpB3v/SMCin0vmoGrnYFhUNHiw2bn6sW1ZQrYRDxsntiqRYrlWkwaybX4hjSEQ0
	hwaXJ1yYouejw2XcQfXVfdoDfyRXt5R4FS7Ximr0z+2m+1nWp/M8JVc+4TKuoqBiYI99gwSuDxTmb
	Rux33te/gXYctuNtUxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snw7Q-00000004nR9-1yTx;
	Tue, 10 Sep 2024 08:21:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snw7I-00000004nOz-38uv
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 08:20:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1snw7C-00044f-3W; Tue, 10 Sep 2024 10:20:46 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1snw7A-006qsq-WA; Tue, 10 Sep 2024 10:20:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1snw7A-0001qu-32;
	Tue, 10 Sep 2024 10:20:44 +0200
Message-ID: <86eebdd7435ec1dc09765f4c4f8cb5ba8d20d785.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/9] reset: amlogic: convert driver to regmap
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jiucheng Xu
 <jiucheng.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 10:20:44 +0200
In-Reply-To: <1jfrqcrgab.fsf@starbuckisacylon.baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
	 <20240906-meson-rst-aux-v4-1-08824c3d108b@baylibre.com>
	 <984d928a37b3db11ae53c07da672ccae0d79734f.camel@pengutronix.de>
	 <1jfrqcrgab.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_012052_842683_425A92FE 
X-CRM114-Status: GOOD (  23.05  )
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

On Fr, 2024-09-06 at 16:46 +0200, Jerome Brunet wrote:
> On Fri 06 Sep 2024 at 16:19, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > On Fr, 2024-09-06 at 15:34 +0200, Jerome Brunet wrote:
[...]
> > > +static void meson_reset_offset_and_bit(struct meson_reset *data,
> > > +				       unsigned long id,
> > > +				       unsigned int *offset,
> > > +				       unsigned int *bit)
> > > +{
> > > +	unsigned int stride = regmap_get_reg_stride(data->map);
> > 
> > You know this is always 4. Having a #define for this (that is also used
> > to initialize regmap_config.reg_stride, and for now nr_resets, below)
> > instead of going through an exported function would allow the compiler
> > to optimize this all away:
> 
> Yes, for now. However, with the auxiliary you may get a regmap with
> different value. I've seen example with stride = 1. 
> 
> I'll admit is very unlikely but I does not really worth it considering
> how often we'll get through this and how difficult it will be to debug
> if stride ever get different.

Oh right, the aux regmap being passed in from the outside in a later
patch invalidates my point.

[...]
> > > @@ -48,25 +55,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
> > >  {
> > >  	struct meson_reset *data =
> > >  		container_of(rcdev, struct meson_reset, rcdev);
> > > -	unsigned int bank = id / BITS_PER_REG;
> > > -	unsigned int offset = id % BITS_PER_REG;
> > > -	void __iomem *reg_addr;
> > > -	unsigned long flags;
> > > -	u32 reg;
> > > +	unsigned int offset, bit;
> > >  
> > > -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
> > > +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> > > +	offset += data->param->level_offset;
> > >  
> > > -	spin_lock_irqsave(&data->lock, flags);
> > > -
> > > -	reg = readl(reg_addr);
> > > -	if (assert)
> > > -		writel(reg & ~BIT(offset), reg_addr);
> > > -	else
> > > -		writel(reg | BIT(offset), reg_addr);
> > > -
> > > -	spin_unlock_irqrestore(&data->lock, flags);
> > > -
> > > -	return 0;
> > > +	return regmap_update_bits(data->map, offset,
> > > +				  BIT(bit), assert ? 0 : BIT(bit));
> > 
> > Matter of taste, perhaps, but the BIT() could be moved into
> > meson_reset_offset_and_bit().
> 
> It's not really related to this particular patch which is about moving
> to regmap.
> 
> I can add it to another patch if you want

Either way is fine.


regards
Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
