Return-Path: <SRS0=LORm=7X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BEC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 13:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0444A206F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 13:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BcTKGjOO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UQYFZcj9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0444A206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2T6Rz8nmwYx4dgoxbjO867/cRBtuN1bQkYd4TH0EdZo=; b=BcTKGjOOnYEHKOytykhNKiSRmY
	5iDceCv0DGxo3MxeJcyAfygaxtUMY/iwiKdrwX/TkOlprVXQcDv6CvxrGzTLYzPnI/ISLZOhqoN6X
	4bJxgOzgmrOV34OUPDuG8J56mxtmD5rFqJbDe01CAmcVi1nv4D4gtkUkPaZHCbkmt4AEwVGZE5Yay
	54Rt+6/bLibz0t2bKeH3z8wj17PMvsG71yZmq8Wjsq0Kw4A5ht6X/OAexhKMwrPlp6lGWC/tV+bhE
	kVfcIa+OumEatafHDqWxOtkukvj+wWSavd0n4lz/ntDIsyrysvIcyFdUhvXuKsrqnj5wi4Yi+8yOG
	Wo0wYr9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj0UK-0007Xi-V3; Wed, 10 Jun 2020 13:09:52 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj0UH-0007X2-5T
 for linux-amlogic@lists.infradead.org; Wed, 10 Jun 2020 13:09:51 +0000
Received: by mail-ej1-x641.google.com with SMTP id n24so2534101ejd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2020 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=hN4wVu7c1HZmNsRAprCKs7uo3bA/4E5kOO/AWz4PAB4=;
 b=UQYFZcj9mxtPTw97Es6oj/OR2iUlY5qrWDFvHpq+VMTee2QWT4CLG91bil7g+DNOKx
 l42eEyiPdTPNNWDIoPNk92GG2j+9fXAGij9RGHwrBITksWgbiVYw5wh8YJ0dJXUI6mDQ
 2bw5QharfQ0PkAald8DvcQLnahJJ5HVACQzJHNqWklEjILxX0+eBMSDfYEAwXl/VlspO
 Oi9qb8oDP5tdGz0apkqlG2sSxkM4o8YqMPfufdz0MQCFxmpZ448b0L0Y0wwaQx3SiyKa
 PodYSusNWy31wlSxvBNYKeaQxBDQ/EwKkM3apQgvVYtyBW0GX7c01SpdjNplstjh4tv0
 xa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=hN4wVu7c1HZmNsRAprCKs7uo3bA/4E5kOO/AWz4PAB4=;
 b=BHjw+upaDAMakKfBTA7dJZLqsj93zAGRt9IRZbinWLcfo/TTBjoosevjCWtLA/whDy
 oUY3+4DEO6+cW7swL83Vg8blEYqzFxa2C+6fvSp56A389JCLZnrRFLTwBaCiRwjgv3Xs
 G0lTNSTUMdPkSPAvuLb0AYi0AGvuWAW4zaRk3jEFpYN7RgzvMHVoBRUdj31MLLiikI6C
 CdT89UvPqK+e0NWMY7mYBa6jul8Z4JDJ5xKlsddPzRn/9CPUv03CQx+/kj96W+v43ym4
 tFlcuCfbkMJWIb4qqCs1bUbBSY8GzWyofUi7OAY8BYchSeBmL2gGHUdItHA3+WrGmdDb
 R42g==
X-Gm-Message-State: AOAM532rYQqiAVsYoHGievC4eiFFBEQ4XVKK+GPHBUkdy+g1KltvrDag
 PT/06wR0K8P8SQVjWFr0UhjZkQ==
X-Google-Smtp-Source: ABdhPJwFedDlbzm+dYX6gyNm93Xyr1Jcg5woX1Qp7tJ8WSlNK7uiPvjIAx6Ib7uFiK7cAaMr2dIeUA==
X-Received: by 2002:a17:906:68c5:: with SMTP id
 y5mr3246267ejr.436.1591794585380; 
 Wed, 10 Jun 2020 06:09:45 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id ox27sm15373147ejb.101.2020.06.10.06.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 06:09:43 -0700 (PDT)
References: <20200610041329.12948-1-hhk7734@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: hhk7734@gmail.com, linus.walleij@linaro.org, khilman@baylibre.com
Subject: Re: [PATCH] pinctrl: meson: fix drive strength register and bit
 calculation
In-reply-to: <20200610041329.12948-1-hhk7734@gmail.com>
Date: Wed, 10 Jun 2020 15:09:42 +0200
Message-ID: <1jo8prnk2x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_060949_231637_9396E334 
X-CRM114-Status: GOOD (  15.78  )
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


On Wed 10 Jun 2020 at 06:13, hhk7734@gmail.com wrote:

> From: Hyeonki Hong <hhk7734@gmail.com>
>
> If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
> registers. However, when register and bit were calculated, the first
> register defined in the bank was used, and the bit was calculated based
> on the first pin. This causes problems in setting the driving strength.
>
> Solved the problem by changing the bit using a mask and selecting the
> next register when the bit exceeds 15.

This fixes the case of GPIOX on g12 which goes up to 18 yes but the same
problem will happen again a if bank ever goes past 31 pins. In such case
the problem would apply to all reg types.

I would prefer if it was solved in a more generic fashion, like defining
a "stride" table with the values of each reg type. This table can common
to all aml SoCs for now but eventually it probably need to be SoC
specific.

This would allow to :
A) handle the case you are reporting in a generic (future proof) way
B) remove the weird "bit = bit << 1;" calc in place in the get/set of
the drive strengh pinconf

>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index bbc919bef2bf..ef66239b7df5 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
>
>  	*reg = desc->reg * 4;
>  	*bit = desc->bit + pin - bank->first;
> +
> +	if (reg_type == REG_DS) {
> +		if (*bit > 15) {
> +			*bit &= 0xf;
> +			*reg += 4;
> +		}
> +	}
>  }
>
>  static int meson_get_groups_count(struct pinctrl_dev *pcdev)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
