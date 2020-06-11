Return-Path: <SRS0=DoQu=7Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DD8C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2020 05:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C0E2074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2020 05:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYcIMaBZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+nqjy+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C0E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvCqWmrCTCiNrEoh3NZbGqkH6gHkClBRgLDV65lw7EQ=; b=eYcIMaBZeBwY5K
	lc4lHFJ9dqBgbroitiTTrsxN0GGN70InT7ZRzPT0n7rZJVNf1SfawweNYtlvucgiOB1XP94b5asNw
	O4o3oTL7s6cRjeS/eRl1m2fDlKrTInzOEVsOuP7feWhTeK0ksZn1av7lmbBd0YujPfncmHuJgLVer
	l8Ooba+Xelvax8XpvUOmSsXXvEkGwfNyKi3566/j3KVqQn39qp68ERzFEDnDr7PWHuqtPBo3cByK8
	pz3OArbssFrTUCPOIT9IUYg0vZcfVRC489gIMWP83UwoQDi1v0cUdBL3FOEcut2Xu3VuJ657y72L/
	HdA8+EatfAxZQhjZWONQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjFwo-00012M-OZ; Thu, 11 Jun 2020 05:40:18 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjFwc-0007v1-Lv; Thu, 11 Jun 2020 05:40:08 +0000
Received: by mail-pl1-x643.google.com with SMTP id k1so1801159pls.2;
 Wed, 10 Jun 2020 22:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N3UrA+L6fKKCkym6ASMJYc2jRNYVOVnvVJE5werYGnw=;
 b=d+nqjy+4dUFQIg+J7rUYD67mgnGPhyWqgBudPF6w+rSZlq/KfbJbVmdiKBinBCNo4e
 XqihGj7fGfpJUr9AKyRJuZsSPS4jAIVsR1RaqVH2ri3bGI96f1OqmAExijXBGJQFjeVZ
 5mDhEDzq4LQr9cpcqVVEZY2AhNa09dLlmdJtwIyyFwDLmBV+8JEU9VCN/CExVS6JJDH3
 p3rfO81wkPJOcva7I/m0r0SqGwAFOmvPF8pmNAgkn/TWFTgGlKhzeiuHYBhLFEs9fknD
 mH9D1QR0KZ8xgTFHImkXGpHF/YYlRi8ZUCQtZfZ9atnvpBYBI2w4YgNs+7KES9d0Hf3K
 gxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N3UrA+L6fKKCkym6ASMJYc2jRNYVOVnvVJE5werYGnw=;
 b=Ypvvlg1HJSpXNRQML9c73wTYJbY5Y0mOR1WmMVZ1yhEjbpv39lQiWs6DdVARe4/4SN
 +bBUHWyz5i4CHSfsF86CtIcD5IxTUMMYUV9ckXqX7JPvo4Sjanx+vuWIDkDdLQVy6ywc
 Gkqi3WlKR8WmwDSekX9KrIxU/zKzolzwkkHHPwE00mflJqhY1URoKqRej0lAT+gX7gMN
 ytLy4mO2/dBKDPa/UluUt1ciYmugg/gb0Lf5J8Ima3uiJy86+1l/sozpIwlBlX+ys6nX
 T9WFpD2+xhT1x9Bv+lUKL+VUG7UvpX0gyXXqBGlQmKyp8wHbOMewhHbUGUITTKI2rCNH
 C7+w==
X-Gm-Message-State: AOAM531xjL+PWqitm0ZT7pG0DYQXg2ws9lRnWV/fqRS2MfYr+c2amPcy
 mP9ji7OiHU2YDyLr2xwKBEA=
X-Google-Smtp-Source: ABdhPJy15V32sZVFTROxJJwV3ePEVFwMYm9dYGuNHyquDslsLMT4bbOHF9vhKYSZ75x5MpfJBaampg==
X-Received: by 2002:a17:902:9346:: with SMTP id
 g6mr5772701plp.19.1591854005732; 
 Wed, 10 Jun 2020 22:40:05 -0700 (PDT)
Received: from home-desktop ([114.204.138.55])
 by smtp.gmail.com with ESMTPSA id s1sm1392337pjp.14.2020.06.10.22.40.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 22:40:04 -0700 (PDT)
Date: Thu, 11 Jun 2020 14:40:00 +0900
From: Hyeonki Hong <hhk7734@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, khilman@baylibre.com
Subject: [PATCH] pinctrl: meson: fix drive strength register and bit
 calculation
Message-ID: <20200611053958.GA3687@home-desktop>
References: <20200610041329.12948-1-hhk7734@gmail.com>
 <1jo8prnk2x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jo8prnk2x.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_224006_743493_6CB687A0 
X-CRM114-Status: GOOD (  22.89  )
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jun 10, 2020 at 03:09:42PM +0200, Jerome Brunet wrote:
> 
> On Wed 10 Jun 2020 at 06:13, hhk7734@gmail.com wrote:
> 
> > From: Hyeonki Hong <hhk7734@gmail.com>
> >
> > If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
> > registers. However, when register and bit were calculated, the first
> > register defined in the bank was used, and the bit was calculated based
> > on the first pin. This causes problems in setting the driving strength.
> >
> > Solved the problem by changing the bit using a mask and selecting the
> > next register when the bit exceeds 15.
> 
> This fixes the case of GPIOX on g12 which goes up to 18 yes but the same
> problem will happen again a if bank ever goes past 31 pins. In such case
> the problem would apply to all reg types.
> 
> I would prefer if it was solved in a more generic fashion, like defining
> a "stride" table with the values of each reg type. This table can common
> to all aml SoCs for now but eventually it probably need to be SoC
> specific.
> 
> This would allow to :
> A) handle the case you are reporting in a generic (future proof) way
> B) remove the weird "bit = bit << 1;" calc in place in the get/set of
> the drive strengh pinconf

If all amlogic SoC has same register style, I think the code below is fine.

static const unsigned int meson_bit_strides[] = {
	0, 0, 0, 0, 0, 1, 0
};

static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
				   enum meson_reg_type reg_type,
				   unsigned int *reg, unsigned int *bit)
{
	struct meson_reg_desc *desc = &bank->regs[reg_type];

	*bit = (desc->bit + pin - bank->first) << meson_bit_strides[reg_type];
	*reg = (desc->reg + (*bit / 32)) * 4;
	*bit &= 0x1f;
}

How about this?

> >
> > Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> > ---
> >  drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> > index bbc919bef2bf..ef66239b7df5 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> > @@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
> >
> >  	*reg = desc->reg * 4;
> >  	*bit = desc->bit + pin - bank->first;
> > +
> > +	if (reg_type == REG_DS) {
> > +		if (*bit > 15) {
> > +			*bit &= 0xf;
> > +			*reg += 4;
> > +		}
> > +	}
> >  }
> >
> >  static int meson_get_groups_count(struct pinctrl_dev *pcdev)
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
