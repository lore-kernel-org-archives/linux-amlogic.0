Return-Path: <SRS0=vfsC=76=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C74C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 14:00:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254272070A
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 14:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITKWE1Zz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Go/+9ZBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254272070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m76sJQn1DJkOdTF8+X5fyqU6WRo1g0gd/2cbkR3miVY=; b=ITKWE1ZzlonYTkD/QqbDvFyj1T
	2v1ly233y27n5RIIo+2tsOVyAlVBEot+AKjJkWh87e5FXalJiB5jEXAqXN/GFZ1NsinhVY15HLPbV
	GMCotzbd6wrn7a61k0LstmTRA859f1kEOnSs7zRB09GGVA08c3P1fCmIo9Z/0XWRy0bavId9tv/oF
	DOH0SQLJZeETHemXReE5uYx58ON/U7fQXXFdGlfMsEmCC6v0XdaxC6RcRHrq+xs9YXWqMNgVLIE0W
	SjRGApOWTdpqfb8ZM8BVe6R6w2lLtUJKEOA2CKbhrp0mUaRJRqHUBrqtBSehyRtHQ2D1Ur1xvLTQf
	ffYI4BtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlYbR-0007Gv-9u; Wed, 17 Jun 2020 13:59:45 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlYbO-0007Fj-4N
 for linux-amlogic@lists.infradead.org; Wed, 17 Jun 2020 13:59:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id h5so2462704wrc.7
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2020 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=8bUOsv4bybXC/mQ3Hxos70tmB9QZ6NyHuFcpp79A5zQ=;
 b=Go/+9ZBYINQ9VUzlG0iy74ta2eMH67TuPQd2a+TF/sBt1oDLA9sLMJqB62Ar8RWkxk
 0sMcyp1Z7ffxSVOFPq5o3HwWy/I9Gh59I7ek3lR7TQUAdmVRbMN5vhgLZdSjm7TZVpRc
 TdGlYfUFt0+J7VmicXsaaErvjTwwzLmZuLC32D1hsM6QcsOcTG+TMIZR7FggXwksyxZy
 MHt6K4cZJCrH1l4XidjoTTls8O3VpQMIvnVQniuNSzyuG0wShjvJ5BWHOK6ct3vPBpHs
 s+8qg0dX1W7EV24+vVAci6qja8ItjS68bPV8pFuU4Ro/QYk2MddfUPU6veYTM1dyC3tC
 WiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=8bUOsv4bybXC/mQ3Hxos70tmB9QZ6NyHuFcpp79A5zQ=;
 b=YGEPFGkjQXlF9Cf2mEoWzqkmVW4QvMV2tw65xzIvvS41ETr7P+2/kDeY2PL0ucF/fK
 CLz8rBrTnTirkD5EGTVTQy6icN+aCvKtGgkvBxeHfBNDldYFzYoNfyTo+fpYRRJHToJN
 9/LKAYprsYc+RsMlZm/xgy2DEc3UMtGnr2ebSJDUi/URynSlqj6s+lGLf16JuFRZ4KbA
 KzHFV3lRP2pLUFIVn/img16XqzzzBdvuTvYjp4udB3TcXxYmzanuVJZzO44k/Xs552Lz
 cbdemvmazzlMBGR6ASt1tvzOpyI4OaOodzLSXm+N2XdSHloPx3he6XKspakyQzXwy60H
 1R0g==
X-Gm-Message-State: AOAM533mUTxudvA4fzMD8BC/n/3PQJAzvfcsHcQuoG92XOaRK+2EaAeG
 0/yaxMf6euTwGrgsz52PreBiLA==
X-Google-Smtp-Source: ABdhPJyZoDgBWJusMEybO4nVCF1jKe4N/ywOBHUQE8w7mWB2J38E0OeLsvstMXvxyC+4R8rFG2dxyA==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr8474999wrt.160.1592402377338; 
 Wed, 17 Jun 2020 06:59:37 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y132sm610312wmb.11.2020.06.17.06.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 06:59:36 -0700 (PDT)
References: <20200610041329.12948-1-hhk7734@gmail.com>
 <1jo8prnk2x.fsf@starbuckisacylon.baylibre.com>
 <20200611053958.GA3687@home-desktop>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Hyeonki Hong <hhk7734@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 khilman@baylibre.com
Subject: Re: [PATCH] pinctrl: meson: fix drive strength register and bit
 calculation
In-reply-to: <20200611053958.GA3687@home-desktop>
Date: Wed, 17 Jun 2020 15:59:35 +0200
Message-ID: <1jeeqd3i9k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_065942_182905_A23E73E5 
X-CRM114-Status: GOOD (  20.16  )
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


On Thu 11 Jun 2020 at 07:40, Hyeonki Hong <hhk7734@gmail.com> wrote:

> On Wed, Jun 10, 2020 at 03:09:42PM +0200, Jerome Brunet wrote:
>> 
>> On Wed 10 Jun 2020 at 06:13, hhk7734@gmail.com wrote:
>> 
>> > From: Hyeonki Hong <hhk7734@gmail.com>
>> >
>> > If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
>> > registers. However, when register and bit were calculated, the first
>> > register defined in the bank was used, and the bit was calculated based
>> > on the first pin. This causes problems in setting the driving strength.
>> >
>> > Solved the problem by changing the bit using a mask and selecting the
>> > next register when the bit exceeds 15.
>> 
>> This fixes the case of GPIOX on g12 which goes up to 18 yes but the same
>> problem will happen again a if bank ever goes past 31 pins. In such case
>> the problem would apply to all reg types.
>> 
>> I would prefer if it was solved in a more generic fashion, like defining
>> a "stride" table with the values of each reg type. This table can common
>> to all aml SoCs for now but eventually it probably need to be SoC
>> specific.
>> 
>> This would allow to :
>> A) handle the case you are reporting in a generic (future proof) way
>> B) remove the weird "bit = bit << 1;" calc in place in the get/set of
>> the drive strengh pinconf
>
> If all amlogic SoC has same register style, I think the code below is fine.
>
> static const unsigned int meson_bit_strides[] = {
> 	0, 0, 0, 0, 0, 1, 0
> };

 the table above is the shift, not the stride.
 Maybe 'width' is a better description
 I would prefer if it was { 1, 1, 1, 1, 1, 2, 1 } and adjust the caculation

A part from this, your proposition is exactly what I meant :) Thx

>
> static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
> 				   enum meson_reg_type reg_type,
> 				   unsigned int *reg, unsigned int *bit)
> {
> 	struct meson_reg_desc *desc = &bank->regs[reg_type];
>
> 	*bit = (desc->bit + pin - bank->first) << meson_bit_strides[reg_type];
> 	*reg = (desc->reg + (*bit / 32)) * 4;
> 	*bit &= 0x1f;
> }
>
> How about this?
>
>> >
>> > Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
>> > ---
>> >  drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> > index bbc919bef2bf..ef66239b7df5 100644
>> > --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> > +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> > @@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
>> >
>> >  	*reg = desc->reg * 4;
>> >  	*bit = desc->bit + pin - bank->first;
>> > +
>> > +	if (reg_type == REG_DS) {
>> > +		if (*bit > 15) {
>> > +			*bit &= 0xf;
>> > +			*reg += 4;
>> > +		}
>> > +	}
>> >  }
>> >
>> >  static int meson_get_groups_count(struct pinctrl_dev *pcdev)
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
