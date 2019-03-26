Return-Path: <SRS0=zyCZ=R5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2DFC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E017420828
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SFxqlu7P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yMfP04Gb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E017420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1Vr/VzaBv4Qo9eD2nTBdB1FLoVQcA19BxCmOxVUnAE=; b=SFxqlu7PzWQvVw
	ID04t3YVOI7LabD32mMsKe66tPUYsA4lRm51kwU9QmUVe815JPXpfOCXeelQceq8DhnlU1XbsiV4b
	ubKj7F0Q0o7k+KQVQdgdGvQly4H+CFwZBmSg2K80OIiQf/mgwbw1TgrjG3BNbr9aY16NuGUyUsVTO
	xSoBAmhaiiTf38dARWtNpQpQ61QkDz+B96I2ABfvmdDgouZ4GI58NgQtjNmaf+4kfh6fwwSdsUyE1
	ocvmgBJmJtSAVd+Nxc5Fg8QUpHyO6YVmKu+3q/ToqmgPTHfBUUsGzpgbpaWxf9+C84ZKcsx1dv+yQ
	cgIapi77XGbtmTZGuP6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8gto-0003UI-JR; Tue, 26 Mar 2019 07:53:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8gtf-0003Oj-Hu
 for linux-amlogic@lists.infradead.org; Tue, 26 Mar 2019 07:53:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so11471805wma.2
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Mar 2019 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=+P/pDctBzgqNCJzJAj22Bp6Ulq3f13aqe+jh+b1hejk=;
 b=yMfP04GbVCy1OCXi8Zh/Js4WKcX3FrUxZsa3NAiI7gwT7049iS6cPNwX+FGCuvPp7g
 rxJCzPMmuJZXf7IRPUfdm3acMrIcEFZ5OUjOUcwVi8Wh/XsSevMXoLWew3UA/pPeXWYg
 0ENNnYZJ+crDmYQunPgI2U6KbiB9o7r0KJGBKPUgp5m4VYO3GbrdlBIjgebVbWtx5BeW
 /2j0KqaiktKTH1sW4oET6+rA1OynfpaPPGnhZX5YPKZ/38lLlcS+Ssm9HEsGc2s/L0Of
 pyXsEPI+loD+cDcmq/8mNWBmFWDaDH1bJtJHNmQD864pzbeC+9ODIqTEWTlJQ3p1zJuv
 DS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+P/pDctBzgqNCJzJAj22Bp6Ulq3f13aqe+jh+b1hejk=;
 b=Uo6MyFgV5JuiMa5RaofxM4WDco1ZazWSguRdqDSyNnszud7C7BAK3h09aSQSGITXVK
 RINtr4VJvGeG89YE9IUKyLFTlcWnfy1/xJdRIyN/dPqywjA4GQG6p8PeEgP8seP4Bvzx
 jteOCgXc0a6I+UWZw1Dr79tXV0PRY6QMILbcESsEEtGb9S9fkfBuitt6xKR9klQZjsnr
 ldpadKmVMEtQ7SCptrBQbUSzhlcfdU0aBnlMhpeAPrkfz2VYI+miK/AJuluAOTi7h3AG
 7CunChpv9HORgayJgV4MRL/CQGHrO2uA4b7zwTRZs7Tz2OMyoqS8+UzUJ8l6AShesar2
 qa0g==
X-Gm-Message-State: APjAAAUPXHb1XaMAiG6vgp0NH+mM8XrVl6EItgzbqUMluQRXZX50kPgh
 /H4sVAiScJYXUDsy7tYrERnKjA==
X-Google-Smtp-Source: APXvYqyUOqJoh6ug291ipn/WEnZewgLcDELTWekaeWiEDLB0t9vPsF9eDBRiqM7vm7QU70dAASQyBQ==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr14139004wmc.68.1553586798375; 
 Tue, 26 Mar 2019 00:53:18 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id j11sm22170116wrw.85.2019.03.26.00.53.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 26 Mar 2019 00:53:17 -0700 (PDT)
Message-ID: <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 26 Mar 2019 08:53:15 +0100
In-Reply-To: <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_005323_745471_56B4D004 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 10:10 -0700, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-03-25 04:11:57)
> > @@ -138,6 +129,27 @@ static int mpll_set_rate(struct clk_hw *hw,
> >         return 0;
> >  }
> >  
> > +static void mpll_init(struct clk_hw *hw)
> > +{
> > +       struct clk_regmap *clk = to_clk_regmap(hw);
> > +       struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
> > +
> > +       if (mpll->init_count)
> > +               regmap_multi_reg_write(clk->map, mpll->init_regs,
> > +                                      mpll->init_count);
> > +
> > +       /* Enable the fractional part */
> > +       meson_parm_write(clk->map, &mpll->sdm_en, 1);
> > +
> > +       /* Set additional fractional part enable if required */
> > +       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> > +               meson_parm_write(clk->map, &mpll->ssen, 1);
> > +
> > +       /* Set the magic misc bit if required */
> > +       if (MESON_PARM_APPLICABLE(&mpll->misc))
> > +               meson_parm_write(clk->map, &mpll->misc, 1);
> > +}
> > +
> >  const struct clk_ops meson_clk_mpll_ro_ops = {
> >         .recalc_rate    = mpll_recalc_rate,
> >         .round_rate     = mpll_round_rate,
> > @@ -148,6 +160,7 @@ const struct clk_ops meson_clk_mpll_ops = {
> >         .recalc_rate    = mpll_recalc_rate,
> >         .round_rate     = mpll_round_rate,
> >         .set_rate       = mpll_set_rate,
> > +       .init           = mpll_init,
> 
> We actively discourage using init callbacks. Can you do this some other
> way?

Yes I'm aware of that but init it the right place to do this.
To be clear, this is not initializing the clock to some particular rate, the
rate is preserved.

It just applies the necessary settings that needs to be done only once to make
sure the clock is in working order and that the rate calculated is actually
accurate. 

> 
> >  };
> >  EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
> >  



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
