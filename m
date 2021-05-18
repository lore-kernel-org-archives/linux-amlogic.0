Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CD7C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:34:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5327611B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5327611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ySkYV5D1CB3hyuxl9onfKmk5F8Jt7DILvWs3TF74ys=; b=R6+nvU7AkG0L4/GxDmKACWWlG
	2hY1zrgrG9URNwxBJT4e1fTjGKn8xLlmYS5e3Zey0JOQJKf8UwLfLF4+kA1KcgQ7+PlVB+3UKyFcq
	MydpePTJhTS3TxAdO1TAgGaO9tnydyERBihMDHAZ4NiO9kQ1Vucngj/Fd/JKwUnrmLPuG0N0th/0d
	ggcd6K3UvBUcCV+0Gjdfl0EgMtMRub/QfTQFsTa4MrDHzJ/KFLW/FntESAqxiW1F5y01om49h2ANX
	OjAPvh6OrOt/MJwV3Ovivr/m98JTdvIx5EzEfTPpOcILVfv81bIa7P/R80iV/2//nWf+809ESac+P
	YZggWARcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj6Pr-001pnV-6s; Tue, 18 May 2021 20:34:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj6Pm-001pn4-Vz; Tue, 18 May 2021 20:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VL0CiSI2cCMpvavhlqOGujTCEJkTFDfxgkJ3VFbEVN0=; b=hhxuLrXyCHhyD2PXLamK9iC+0L
 zrHC+D1x9PE3X4cKaMazAujIM105v6h09CT7Si9b1N30XLexK6yvwtjJjuJhFxsjQtmT/yWYMrsw0
 BQNvZp+bnzo8LaY4aXjiB0280xEIuzMQBp/sH7kI0jfM6Se/8m3f5waAPxlOb9QNETlmE9dx2uNLf
 jGeCGN9ynD8JCxI0rbrJeb7yv4Pj7iNjiJTR1OjSZjbpM0n5NjTLFNLeVi2Cl8YkM44l3Pw8t9nvL
 /NiQf6KbKDbu98T9GVPoOHPvbXUPXbM+CRZ38Qa8W6KBVcpHvKqqo9d4sdoXbsQQHNBfudzVZEBoM
 y1+hfl+w==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj6Pk-00Ex5u-35; Tue, 18 May 2021 20:34:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id t3so12758478edc.7;
 Tue, 18 May 2021 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VL0CiSI2cCMpvavhlqOGujTCEJkTFDfxgkJ3VFbEVN0=;
 b=tCf4kXKZGny3QAzUEQsa42a3Pz4W7zBX0TeOv1Q2bQcYu8GlWd4+5YNLmGj3m0cOcI
 lyiE/Qa1agYrgU9q/OTa7uhmSSWIJCkaF7ZaaRpA7lPNQDtw1gFB2gg3m7hB0skg7ZlM
 DIihpuethbuhsPuugQhEUpZYnDfwgrnoVl6te07kNgrYEKyKwq/DHUq1puu7Ddq214pt
 Evq2WkkaiYfzHt9dFHqJOXXfx8kSiEpC62vYZLQRwk1zw8Em3Del2yTPc2onTNzgsT7v
 NkXiwvA5VVTLTlo9upGkv1KzM4Xm4ML76CyRz+T8boS0L/rin+0/lYaqroVQCCp3e74e
 IoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VL0CiSI2cCMpvavhlqOGujTCEJkTFDfxgkJ3VFbEVN0=;
 b=kvY+OIdI4Lb21nv7una3OBuXwP16osKN02WkyMl6oilU8h/f2iGCiDt7gTCeMRrRIf
 6z09e+/t2w//CRg5cvYGw9QnkQVw2oEJ9s6ddtoa/GxxmBdaZzR/e8yP5oxMCWLsByFw
 W8h4oZJKToaEM8RbNJZ2Z3A15KZrbeQCJnNuH9/TRyeKjBDe478SVqClAX8t0gsiUkkV
 pkjdcwJFwT1+sLqi7SfCpoEtteoyxOMToi7hj6fukvYWnFpU8wlTZmpeLZ9K0HxbamQV
 2fXMU11bfEkBAsTs8/KdwjU1Tu/HFC7i7AUw1/aBkIhJLXMcED7neaYo2tN8ICM38Ayr
 k91w==
X-Gm-Message-State: AOAM530hjfmru4q3d03QA9AkBzB+ltBs/aommLLQQFZNsrSd7TTXriGn
 yv47/JJp4vCkQsWiaQ0sjW+jPmTRMKk2Oi+yDEc=
X-Google-Smtp-Source: ABdhPJxFsjBTmyqIIgerb2xmITvpZs23MeN0JixS8tgK6778SQkUt7m40fSCNQkRan58QA2fHYFlANPEyZx6nlUKHik=
X-Received: by 2002:a50:9346:: with SMTP id n6mr9158222eda.365.1621370041309; 
 Tue, 18 May 2021 13:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
 <1jtun01o5p.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtun01o5p.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 May 2021 22:33:50 +0200
Message-ID: <CAFBinCB+5bFH0LW4rqYGCiO-X-xmer67cp5kXpyU0d-OfxiOvw@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/3] clk: divider: Add re-usable determine_rate
 implementations
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_133404_172478_9897A541 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Jerome,

On Tue, May 18, 2021 at 9:44 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> > +                           const struct clk_div_table *table, u8 width,
> > +                           unsigned long flags, unsigned int val)
> > +{
> > +     int div;
> > +
> > +     div = _get_div(table, val, flags, width);
> > +
> > +     /* Even a read-only clock can propagate a rate change */
> > +     if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> > +             if (!req->best_parent_hw)
> > +                     return -EINVAL;
> > +
> > +             req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> > +                                                       req->rate * div);
> > +     }
> > +
> > +     req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(divider_ro_determine_rate);
>
> For a final version, could you factorize the code with the .round_rate()
> variant ? It would remove a bit of duplication.
my first idea was to basically let the new _determine_rate code just
forward all relevant parameters to _round_rate
however, I discarded that as it turned out to be less understandable
for me as parameters need to be mapped in both ways

while writing this mail I noticed that the opposite direction
(meaning: _round_rate forwards to _determine_rate) will probably work.
I'll give it a try in the next days
if you had anything else in mind then please let me know

> Maybe determine_rate() can also replace round_rate() in the generic
> divider ops ?
sure, I'll add that as a separate patch in this series
note to myself: testing can be done with the MMC drivers as we're
using the generic clk_divider_ops there


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
