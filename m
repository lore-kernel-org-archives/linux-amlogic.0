Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1846AC04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 11:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9EE20989
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 11:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KIC3CjWN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sK17qvKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9EE20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/AFME+09ILWSv6RO2L5L9xu4qYlwmH35nhkj1gGl3Q=; b=KIC3CjWN5xkYlg
	Wax2BYm9MkALQzzWw7SfFhI7iNFtx3mlxM8aiiXRZAYEsQTEsb6Hr40mLlXHScDem+1qH8ilk0ost
	2CCNg02D0hPkCmmppp0JOcO6PMyptqKVR1099UMxlsjSBioT6bFJr5bcNNQeCFMZmoF8iP83WFy2K
	LzO35Z/BqrXvoBTapY0MRQQqWnbn/dSijMTzv22I69yiuWXImOCpMg3D3SM18Z4QRq8qcAPnAE3bn
	0GRSaZqVBlLCgrzypUfp0d+x3sYkcvSQcMJpDj9I188wiH3oIugyOjuOHbeRiGfv8LltCad6KpXwV
	QhZJ4KKLm16xbqYC7MoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOh9K-0004vw-MR; Thu, 09 May 2019 11:23:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOh9G-0004vW-LT
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 11:23:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id d12so2498842wrm.8
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QbQVmm5kTPfjwTeheDAImVCSFxDl7nBIwz2lP0tNHF0=;
 b=sK17qvKkXDx4s64pSQNjCngs9OQU52XPrp+gxv4lRk3v8d4mOoIZXVq3Vaarimmlrq
 AOD/w2G5QKINRXCfKMncOcuBu/q+Cx7MK8g1DqFrjzhCh5eewnzXQMzfhaV4xNP4bwY3
 WwjWuxkzk5zDCsy28TQg2hOJ76iS5oHwuDZC8ikEPHdBxtDDJaxQ2P0CGB1wq+M7SEdE
 4WskH5xwUQp3d2G+zChI3dgbcQzbaM57PIGQr1CXrzR9huJ/bYOp3pVa0wWdw0scY7ru
 5KI0u1/3rjHfExx162bvTfZxXt2MX6IGmHkQbVg5TUqG7Z2QHOhNvX+rxJ2zYew8k0Ja
 fChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QbQVmm5kTPfjwTeheDAImVCSFxDl7nBIwz2lP0tNHF0=;
 b=ZkeOAAExi8m3YSIGl5+wY6+XnzwRXPBOKQcsaJXKlt1x6ODzla4gbKbELLSear8v8u
 Km0K2WHlaQjS2DrFHvHIejqonqhGXchv8fMP7HtNUc4V5j+vGEstsNXv+0X4gEUcVgt7
 vtlJ+8q6bk4wQ0A06uwea3FcigQKyx+LFchrWnd39ywojvM6g4kjETVLhiBAbMDMMLpy
 bvSA6ejNb4fAv53eW0s09BthDP9Paqk2NoCf4r/RhXyCjcDyC7AziCFkP5IRMZX9ZC4H
 LTSXF9DTpCSkanI08WCtQJAXRMWPkvDk4/lWqr1L4+kFuG/LJQ8RdpWlE+iuzb1M3Ewz
 xprQ==
X-Gm-Message-State: APjAAAUNBEV9fSKqvpE6Qd3iYwhAyGYx+iT1qJyR7p6ppRTTtZ89yju+
 cUtyI9olQYu9tjoRBgPt8/LZWQ==
X-Google-Smtp-Source: APXvYqwjmio7MmarVn6V+z0/UE3KJNGuVdLA7K6Ckein2WdmuT9vo+z7y8Y4Yugc0VmrpR+bH8NFOw==
X-Received: by 2002:a5d:5501:: with SMTP id b1mr2534545wrv.196.1557401016591; 
 Thu, 09 May 2019 04:23:36 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a?
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id p17sm2274853wrg.92.2019.05.09.04.23.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 04:23:35 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] pinctrl: meson: add support of
 drive-strength-microamp
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-6-glaroque@baylibre.com>
 <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <4e44984f-eb76-87d1-e458-506bcccf1500@baylibre.com>
Date: Thu, 9 May 2019 13:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_042338_749605_F3EF706B 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi martin,


thanks for review, i will do a new series to remove err log on get_drive_strength

and integrate your comment


On 5/7/19 8:18 PM, Martin Blumenstingl wrote:
> On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>> drive-strength-microamp is a new feature needed for G12A SoC.
>> the default DS setting after boot is usually 500uA and it is not enough for
>> many functions. We need to be able to set the drive strength to reliably
>> enable things like MMC, I2C, etc ...
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> with the comments below addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 102 ++++++++++++++++++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.h |  18 ++++-
>>  2 files changed, 119 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index a216a7537564..3da867c13f47 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -219,12 +219,56 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>>         return 0;
>>  }
>>
>> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int ds_val;
> you can move ds_val to the line above
>
> [...]
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> I'm getting this on one of my Meson8m2 boards:
> $ # cat /sys/kernel/debug/pinctrl/c1109880.pinctrl-pinctrl-meson/pinconf-pins
> ...
> [  874.748531] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.755278] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.762086] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIOX_0): input bias disabled
> pin 1 (GPIOX_1): input bias disabled
> pin 2 (GPIOX_2): input bias disabled
> ...
>
> I believe we are not supposed to complain when getting the
> drive-strength when reg_ds is absent.
> all pre-G12A SoCs don't have reg_ds, so we don't need to error-out in
> that case (because that's perfectly valid)
>
> [...]
>> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 *drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> based on your previous explanation (that you want to inform the .dts
> author that he's doing something wrong) I'm happy with this error if
> Linus W. doesn't veto this.
>
>
> Regards
> Martin


Guillaume


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
