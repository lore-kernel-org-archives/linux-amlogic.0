Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06594C04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 11:25:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE0D20989
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 11:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GOeRKdtE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L/h96bMy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE0D20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buEWn2mzh0+Huywe+0lPmdDFHY/79+LXCV8hcQ0WLFc=; b=GOeRKdtESOrAzq
	8BkVVo9t4thF+cr22bqlgA6QfSoFdlrKkJyXyfgYKx2GZCUaDsse0rWHDgNASBXi1g/V851+tL6cJ
	zCB3fNu7rUVhny2pL6n0GtKbMsevF/l0jQPZ42rqK2Dwq0DE5c4iP3YtMx3AJgoOB5juDDAXVKnrz
	zJEcsbGRDP1/1sgxX8rhmkISey+uNwsmoZ1ShkCOzRU8g8Kc6Xg9a/Sw+ydFN8QdiFNFEv1HVKtPs
	qO0x35alOulsBGQ8OodZFk7ONKTVOJaJ/CG0xwK7vioXMxbXZMQHXuixcZ2wQpIuJrHaAxVLjAN7m
	CB3v9HRdQ4bDFgUC6J5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOhBD-0006lN-Rs; Thu, 09 May 2019 11:25:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOhBA-0006ke-U3
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 11:25:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id r4so2497724wro.10
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Qu8EFyx1RYwBMH9ABcsp970ZpeO13Jjnq3l+ZsRNLGc=;
 b=L/h96bMyP4sbfcIes0jd00888NxzJqfZrZyAIQk+hnercmv4rlnZBs1Ozw0nXgpQbH
 tHIaIe7AF0o/yekpCa3uhSI2FB34IFkmRKnrx8qztyD9W0mmHcNYUirjZAwPD77Zyys+
 bQigGcpAhNAaqn3J6gMNpmrfgL1U1eQeeD83Yhy9TxLsl2b0+NhTmqawG0DwqwOEse5O
 jZoIGkE1YbXPr4nkYHLgWJml1mJokBdlmqO100AkpaQW9gHvDEvSieYlsO0s9KHtcDwo
 +V4Px+FfauqUTn3ekAcP6Er12scd77+WYDvFae8j8CqLzeIr91KXkddsIrt4xIhjYGmc
 idrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Qu8EFyx1RYwBMH9ABcsp970ZpeO13Jjnq3l+ZsRNLGc=;
 b=rrc/+5riKp7QbZFwiikpbXJDz+UJTRu090XFFvqcEdxRdMxeHXn6zcAgt0IeyGk3lS
 v2F1743lfgOWDnGeyY/OOQ6exhfxwzuKVeBO1wVcK7kD1XS1rO1R/LiRBUwDq8h6AFBZ
 PRHgLtAgCslFxL8x11IT6BRXFjETOzDsmHSrE+xkbL4bKLhWPTig7l15Fmb2cSB+fCAz
 uWGhkY18T1/ygeeFPs+2Y42mDQoUAxvPX5/bkN4NR7EKiG4QrGKV5F5kNUhTlRJ/Ki50
 d86as8LpLobjxEUgFkGzw0y7IsVP+3Uta+usTJsppiDOiBSKblfTVqrmmv+U8PUm04zr
 o8Tw==
X-Gm-Message-State: APjAAAXwT4KgsIqnKN1W5ndPizMDFSRpEgfqDQN9DRFkpRzp412G2HC5
 d1Xp69TtFT9seyNAdZy79c1yWM+wXXw2yA==
X-Google-Smtp-Source: APXvYqxkgkcwMsgvY8OwH0/UFYR9RdwILD9DhHe3pbBmYXh3YTjihk194EhuB5bpA4dK8th2VPj0zw==
X-Received: by 2002:adf:9cc8:: with SMTP id h8mr2586136wre.308.1557401135633; 
 Thu, 09 May 2019 04:25:35 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a?
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id d6sm2079136wrp.9.2019.05.09.04.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 04:25:34 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-5-glaroque@baylibre.com>
 <CAFBinCBQSE7wh367Aa25zwtDphsx8Z_KGDTn8dcSCir6bLvq_A@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <c3246e0e-897f-4139-91da-5850a596c713@baylibre.com>
Date: Thu, 9 May 2019 13:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBQSE7wh367Aa25zwtDphsx8Z_KGDTn8dcSCir6bLvq_A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_042536_970511_6BE9929D 
X-CRM114-Status: GOOD (  20.39  )
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

hi Martin,

same as previous patch i will do a new serie with your comments.


On 5/7/19 7:53 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>> rework bias enable/disable part to prepare drive-strength integration
> if it was my patch I would add "no functional changes" at the end to
> make it explicit that this only changes the structure of the code.
>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> with the minor comments from below addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
>>  1 file changed, 48 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 96a4a72708e4..a216a7537564 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>>         return 0;
>>  }
>>
>> +static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>> +                                     unsigned int pin)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit = 0;
>> +       int ret;
>> +
>> +       ret = meson_get_bank(pc, pin, &bank);
>> +       if (ret)
>> +               return ret;
> add an empty line here to keep it consistent with the rest of the code
>
> [...]
>>  static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>>                              unsigned long *configs, unsigned num_configs)
>>  {
>>         struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>>         struct meson_bank *bank;
> bank is not read anymore (it's passed to meson_get_bank to set it, but
> then it's not read, which is probably why my compiler doesn't
> complain)
>
>>         enum pin_config_param param;
>> -       unsigned int reg, bit;
>>         int i, ret;
>>
>>         ret = meson_get_bank(pc, pin, &bank);
>> @@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>>
>>                 switch (param) {
>>                 case PIN_CONFIG_BIAS_DISABLE:
>> -                       dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
>> -
>> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
>> -                                              &bit);
>> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
>> -                                                BIT(bit), 0);
>> +                       ret = meson_pinconf_disable_bias(pc, pin);
>>                         if (ret)
>>                                 return ret;
>>                         break;
>>                 case PIN_CONFIG_BIAS_PULL_UP:
>> -                       dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
>> -
>> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
>> -                                              &reg, &bit);
>> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
>> -                                                BIT(bit), BIT(bit));
>> -                       if (ret)
>> -                               return ret;
>> -
>> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
>> -                       ret = regmap_update_bits(pc->reg_pull, reg,
>> -                                                BIT(bit), BIT(bit));
>> +                       ret = meson_pinconf_enable_bias(pc, pin, 1);
> use "true" instead of "1"?
>
>>                         if (ret)
>>                                 return ret;
>>                         break;
>>                 case PIN_CONFIG_BIAS_PULL_DOWN:
>> -                       dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
>> -
>> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
>> -                                              &reg, &bit);
>> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
>> -                                                BIT(bit), BIT(bit));
>> -                       if (ret)
>> -                               return ret;
>> -
>> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
>> -                       ret = regmap_update_bits(pc->reg_pull, reg,
>> -                                                BIT(bit), 0);
>> +                       ret = meson_pinconf_enable_bias(pc, pin, 0);
> use "false" instead of "0"?
>
> one overall comment: thank you for working on this!
> in my opinion it's a good preparation step to ensure that
> meson_pinconf_set is easy to understand even if we add more
> functionality here
>
>
> Regards
> Martin


guillaume


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
