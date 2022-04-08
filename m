Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DEC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aC9Kuag9nUBji0+WOYHUdq+YRVkWIoLfc8Xynl4vs2Q=; b=Pk7Qt3nmmGWgZR
	dcFC/axKX25HkrnGM0wnqsrIx3e0vDrWi8+Kq1P2k88aH0uMDUpEP6Gelo5GKRdCDQw/gmC7iooAv
	4w2U/xHxQB93qoY4T3S9l5RPspa/GbMCOBWMw6pB9VljB86jOOJ4jzMIwHjoHkaJalcaWn79by0C5
	ELiizH9dmMkkpU6k52E1CWDajQsNYyQHFuII199LEH5O3Y6MpBLCKeFGfQ8v+hR3v45eF4FIJrs0C
	+tp7lVOnzgVE/ReNmbNMPr53gscJ4OFyEgzrmX6dTlBkKBbt1MMFWfNtnQjEMENZ6hGyFlDxZFw16
	KpPZoXtxx8neBGni+lYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncitU-00FTWa-NZ; Fri, 08 Apr 2022 07:18:56 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncit3-00FTF3-6D; Fri, 08 Apr 2022 07:18:31 +0000
Received: by mail-vk1-f169.google.com with SMTP id d129so3791061vkh.13;
 Fri, 08 Apr 2022 00:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=d3gNHoy16ZlsDLV8bQepLcY1WMSrBsifmbORH9+6qxw=;
 b=is2hIzIB5YrdKZhgjnXVBAACp3y/BnjCm9k1oHDVJ8F3whoF1vFdot76XYmZcIOmRi
 SBn0qU2/1974J6PbnsJ/MvT65IsXdbmThQU4C2XfGsGpwVeiPcBUzCphHNaWm70ob/6z
 1UY8qHXHlgT1l5u00GnfV+X3gntTlZd+wX36TbOn/eQAVtCR9F6F8mKO+pARVzn9j0U7
 oNqUpL0lAyPing/okhWxH96MkprUxAEvwsE79J7WHRzACUqH3oT+zE4r/h7ymseX47bP
 RXxxc8+EuVuGLlWszKM3/y712KLV2Rb1Of7QqhSX1ueWMfqd7EkceJcSpB0BqhM1LVaw
 IAdg==
X-Gm-Message-State: AOAM533HolkAUZWbrPM2tUavcPCPo0s88r2zMMg3gyOxx/rFRXRN2usC
 g7lhlSE5/CQb8CMNd9FRGX/lsPIcT9UjmA==
X-Google-Smtp-Source: ABdhPJzzLYGGcbYkPBnOh+Iht5+vw2sHbKMmR9zzpwqhwOdFWGtY9y3qcDU+54oCzd0ZIM6g3gCkkw==
X-Received: by 2002:a1f:2b11:0:b0:345:210:d220 with SMTP id
 r17-20020a1f2b11000000b003450210d220mr2487724vkr.16.1649402306139; 
 Fri, 08 Apr 2022 00:18:26 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 f12-20020a67d88c000000b00327e1999c6fsm1274438vsj.7.2022.04.08.00.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:18:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id l21so2644728vsm.1;
 Fri, 08 Apr 2022 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6102:32c3:b0:325:c919:bef4 with SMTP id
 o3-20020a05610232c300b00325c919bef4mr5902203vss.60.1649402305499; Fri, 08 Apr
 2022 00:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com>
 <20220326102229.421718-3-tanure@linux.com>
 <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
In-Reply-To: <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 8 Apr 2022 08:18:14 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3WHCKmg3Fq5jPTY=PNjow2HdLkgFVLd9GQRuGg_q96=Q@mail.gmail.com>
Message-ID: <CAJX_Q+3WHCKmg3Fq5jPTY=PNjow2HdLkgFVLd9GQRuGg_q96=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_001829_281986_13743D18 
X-CRM114-Status: GOOD (  26.90  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 6, 2022 at 12:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 26/03/2022 11:22, Lucas Tanure wrote:
> > The duty cycle of 33% is less than the required
> > by the I2C specs for the LOW period of the SCL
> > clock.
> >
> > Move the duty cyle to 50% for 100Khz or lower
> > clocks, and (40% High SCL / 60% Low SCL) duty
> > cycle for clocks above 100Khz.
> >
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >   drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
> >   1 file changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> > index 4b4a5b2d77ab..b913ba20f06e 100644
> > --- a/drivers/i2c/busses/i2c-meson.c
> > +++ b/drivers/i2c/busses/i2c-meson.c
> > @@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
> >   static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> >   {
> >       unsigned long clk_rate = clk_get_rate(i2c->clk);
> > -     unsigned int div;
> > +     unsigned int div_h, div_l;
> >
> > -     div = DIV_ROUND_UP(clk_rate, freq);
> > -     div -= FILTER_DELAY;
> > -     div = DIV_ROUND_UP(div, i2c->data->div_factor);
> > +     if (freq <= 100000) {
>
> You should use I2C_MAX_STANDARD_MODE_FREQ instead here
>
> > +             div_h = DIV_ROUND_UP(clk_rate, freq);
> > +             div_l = DIV_ROUND_UP(div_h, 4);
> > +             div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> > +     } else {
> > +     /* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> > +      * minimum HIGH is least 0.6us.
> > +      * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> > +      * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> > +      * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> > +      * Duty = H/(H + L) = 2/5
> > +      */
>
> Please move the comment before the if()
>
> > +             div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> > +             div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> > +     }
> >
> >       /* clock divider has 12 bits */
> > -     if (div > GENMASK(11, 0)) {
> > +     if (div_h > GENMASK(11, 0)) {
> >               dev_err(i2c->dev, "requested bus frequency too low\n");
> > -             div = GENMASK(11, 0);
> > +             div_h = GENMASK(11, 0);
> > +     }
> > +     if (div_l > GENMASK(11, 0)) {
> > +             dev_err(i2c->dev, "requested bus frequency too low\n");
> > +             div_l = GENMASK(11, 0);
> >       }
> >
> >       meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> > -                        FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
> > +                        FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
> >
> >       meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> > -                        FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
> > +                        FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> > +
> > +
> > +     /* set SCL low delay */
> > +     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> > +                        (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);
>
> You could use FIELD_PREP() here
>
> >
> > -     /* Disable HIGH/LOW mode */
> > -     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> > +     /* Enable HIGH/LOW mode */
> > +     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
> >
> > -     dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> > -             clk_rate, freq, div);
> > +     dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> > +             clk_rate, freq, div_h, div_l);
> >   }
> >
> >   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)
>
> I looked at different amlogic downstream sources, and those match the recommended
> calculations.
>
> So with the legacy back for Meson6, it will be OK.
>
> Neil

Ok, I will do the modifications this weekend.
I only tested i2c3 and i2c_ao and will execute more measures and show
the results.

Thanks
Lucas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
