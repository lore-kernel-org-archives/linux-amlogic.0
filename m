Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA9BC3DA4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ6cnbVdfVxOgeDVkAuV6u8i1gzRF5shSH4irnLaR1k=; b=HpTrEXKhSWlIfy
	m/XuYd+cfvX+1W5eqycd76wI6yJN8FyWafCohdWBEMLB+bOTxKR1LE5QHflVHkrktX+f2NVePz9hy
	g1EHOa5GTDGT48YW3zQ4tn+DXci/HcvdVqEXc5/kZih7iq0XEJY/dDIVFUxKEx3JkZhdKdtJ/yHxV
	nIbarhOuJN8XPzzfBPF16AbOtUHZnURcJy96JOIfYhPX22u1pIVU7NtfaiEegTTOZVR+16/+CQ71r
	gG+wZ+2XdWMyNLP9QzKnlON6tuofu5aMYqhcDIuI8jHW/UchmJvRzZ6gdZDpht59kxgbKTKp5CoUJ
	QXyw/c1BYR2ilEtgipLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTRP3-000000089qP-24x6;
	Mon, 15 Jul 2024 19:30:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTRP0-000000089pk-0KHa
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jul 2024 19:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C71FCE10BF;
	Mon, 15 Jul 2024 19:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AEEC4AF0A;
	Mon, 15 Jul 2024 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721071823;
	bh=tGsUF26rthjSBOBNFtY5VI/KJK9SJct6xyHxzeNGIcE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vERtmmL1W5S/u1Jf/veSawCHamOAtTMmNGMq1V1sKzAqWs3SE+8G7gPVxQkKheRLX
	 MJDS+voZwuGaRu4KMYt36b8VCdF3j9V2RSxY7ZN0KEW4+QYDWKI9N58rnaulSrNyoZ
	 r6tdoyTR6sM84yArcvrbwRQ9JC2GnG9bEqDvkEZSb0qOGEQo9T59bxxVHLZLYvhsMA
	 kWh07SW1LzwKCS9TQwqRZHBVckNPGaainWN59/4mHIEb1mOfLHVSLAakB4RmLtNppd
	 epWZmJEru0uTD7FKwuz2Rn7B6hnk/h3v/VX7XmLRmgdFJHqYZfGuwOGC1Jn3+L7ZXb
	 GwUVZjy8yFocA==
Message-ID: <7db2d8ae07a9ef1a226dfd08a3f88f8a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-8-jbrunet@baylibre.com> <88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org> <1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 15 Jul 2024 12:30:21 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_123026_495414_06FCE04E 
X-CRM114-Status: GOOD (  28.12  )
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

Quoting Jerome Brunet (2024-07-11 02:01:16)
> On Wed 10 Jul 2024 at 15:49, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Jerome Brunet (2024-07-10 09:25:16)
> >> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> >> index e34a10b15593..5cc767d50e8f 100644
> >> --- a/drivers/reset/reset-meson.c
> >> +++ b/drivers/reset/reset-meson.c
> > [...]
> >> +
> >> +int devm_meson_rst_aux_register(struct device *dev,
> >> +                               struct regmap *map,
> >> +                               const char *adev_name)
> >> +{
> >> +       struct meson_reset_adev *raux;
> >> +       struct auxiliary_device *adev;
> >> +       int ret;
> >> +
> >> +       raux = kzalloc(sizeof(*raux), GFP_KERNEL);
> >> +       if (!raux)
> >> +               return -ENOMEM;
> >> +
> >> +       ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
> >
> > Do we expect more than one device with the same name? I wonder if the
> > IDA can be skipped.
> 
> I've wondered about that too.
> 
> I don't think it is the case right now but I'm not 100% sure.
> Since I spent time thinking about it, I thought it would just be safer (and
> relatively cheap) to put in and enough annoying debugging the
> expectation does not hold true.
> 
> I don't have a strong opinion on this. What do you prefer ?

I don't have a strong opinion either so it's fine to leave it there.

> >> diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
> >> new file mode 100644
> >> index 000000000000..8fdb02b18d8c
> >> --- /dev/null
> >> +++ b/include/soc/amlogic/meson-auxiliary-reset.h
> >> @@ -0,0 +1,23 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
> >> +#define __SOC_AMLOGIC_MESON_AUX_RESET_H
> >> +
> >> +#include <linux/err.h>
> >> +
> >> +struct device;
> >> +struct regmap;
> >> +
> >> +#ifdef CONFIG_RESET_MESON
> >> +int devm_meson_rst_aux_register(struct device *dev,
> >> +                               struct regmap *map,
> >> +                               const char *adev_name);
> >> +#else
> >> +static inline int devm_meson_rst_aux_register(struct device *dev,
> >> +                                             struct regmap *map,
> >> +                                             const char *adev_name)
> >> +{
> >> +       return -EOPNOTSUPP;
> >
> > Shouldn't this be 'return 0' so that the clk driver doesn't have to care
> > about the config?
> 
> I don't think the system (in general) would be able function without the reset
> driver, so the question is rather phylosophical.
> 
> Let's say it could, if this returns 0, consumers of the reset controller
> will defer indefinitely ... which is always a bit more difficult to sort
> out.
> 
> If it returns an error, the problem is pretty obvious, helping people
> solve it quickly.
> 
> Also the actual device we trying to register provides clocks and reset.
> It is not like the reset is an optional part we don't care about.
> 
> On this instance it starts from clock, but it could have been the other
> way around. Both are equally important.
> 
> I'd prefer if it returns an error when the registration can't even start.
> 

Ok. Fair enough.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
