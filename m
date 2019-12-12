Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EDAC43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 21:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86AF2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 21:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dbfB9ss8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tohT6lXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86AF2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKMmZ5g8n6FCOezkBH5Oxom151I/0FelC5QlwBcSVls=; b=dbfB9ss8K46Rbg
	uFNDmhrEc/S/J5P8fec8CPn/dzqo4S1vZ2+8/raoTc/oi9utA0AQz1nn0QB1KhaeZz6m+UczGV8O5
	Nqyxsk4l0FYeb9jH7LctfiCsl9QQ2eRqtML23yo+5HDwok7kXjgdmoa/Wvknmb4fPVgJHMFDGZD2O
	oM5a93dIJFS3YxdJch95PgVsiMNJ0eVan5uiqqOl5MPh/Kv/yr3zLH09Yng0oKdyjboKQYRgZpeui
	e9FWCDL276ig9CXtVDfBgZvxcPeWu10poqvZ+crgBLifwYFPa1RT16MWfPIbQvo7yxD5H/JoyZwey
	wmHJ3fvApIpyj2eVxg/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifW2m-0005bJ-RI; Thu, 12 Dec 2019 21:30:44 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifW2k-0005aO-1S
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 21:30:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id c14so4344315wrn.7
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 13:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ar3WGUfhwEDSSCq+9U1VZWrSE5XYUNVdZnayKnIhqMo=;
 b=tohT6lXBhBc2QJ3oUJgFUSmQ7INkSx6FdEKCFGb0sJVtpqkXC+tujNgxj/fj2RPgvC
 /ojbALCKFzuioc5m2Oc5vymHLHGEc1677h4HuhZrW9jfDHZOVEJgtMRcb3dSSvjHnkvu
 cnn2i2s9LuMyaFISELlYzr70zXQ+oHotcglIWaf7KuMdUj0mikYSoHWHeQMZE0a4gs3E
 c8MHuf4nOcEzqckIyTI7p0PVThKQ0grDjWKV7smF3qVSELFnMMsW1jxkx9ZEbrlwcHMV
 GeV3IATLxC5H7dJ0BUR96f3PGXYDZ6dqb0OpaIxx7YWvLonmEEpd2alYGb1eqgcvn1CG
 As8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ar3WGUfhwEDSSCq+9U1VZWrSE5XYUNVdZnayKnIhqMo=;
 b=Y5HU8CQ3GMNk/3YkIakQoZ9nJuEvHzKaZqHe4nKkzmktO/q8AIMeTj+trO2wlYC8WC
 HIg7PRy1/X0BPa6evBXqJakBqgWNDVyhp/F4P+PYtn5/LzdUYLV15JebuMlnnftFYBeT
 U2ZBeZEcN5mKIont4bI+L7asxF72pwWGREKq41VZOjRwU6F0Wi2BgPGN7uVWubig5kRf
 B4yyNmKvIdr8MqgX0hafKGUgR203WiB22WNTbaLpgKWkO2BbC3DCCFbdHteWBBNeylFY
 soccgfUOuUbSIL5LIYZ9tjYgj2yC8ppd+Lphk6dGn292jusG8beX7mYvCkTKfp2qde5p
 GVIQ==
X-Gm-Message-State: APjAAAUXfDSfjkAPOJYo2Se+RkNo/hXf1diXIEPiKXPulLhXwFONDG4/
 0mG31Iq1b4/YHEV6yqwLOZv5aw==
X-Google-Smtp-Source: APXvYqxdK6wPYL6bpRlBDpDABeuKHmVhx787FfsFi1e5hzInLniJKOGj9A9UNuqksGO6GoeLEepgOA==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr8247798wrm.151.1576186240242; 
 Thu, 12 Dec 2019 13:30:40 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca?
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id n8sm7605285wrx.42.2019.12.12.13.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 13:30:39 -0800 (PST)
Subject: Re: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
 <20191212145925.32123-4-glaroque@baylibre.com>
 <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <b923c0f0-3627-121a-fa4f-49bd0c40825b@baylibre.com>
Date: Thu, 12 Dec 2019 22:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_133042_224803_0BEB31AF 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,


thanks for review

On 12/12/19 8:57 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> (I don't know the specifics of this hardware but I have two general
> comments below)
>
> On Thu, Dec 12, 2019 at 4:00 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> +#define CECB_FUNC_CFG_REG              0xA0
>> +#define CECB_FUNC_CFG_MASK             GENMASK(6, 0)
>> +#define CECB_FUNC_CFG_CEC_ON           0x01
>> +#define CECB_FUNC_CFG_OTP_ON           0x02
>> +#define CECB_FUNC_CFG_AUTO_STANDBY     0x04
>> +#define CECB_FUNC_CFG_AUTO_POWER_ON    0x08
>> +#define CECB_FUNC_CFG_ALL              0x2f
>> +#define CECB_FUNC_CFG_NONE             0x0
>> +
>> +#define CECB_LOG_ADDR_REG      0xA4
>> +#define CECB_LOG_ADDR_MASK     GENMASK(22, 16)
> do these registers have some RTI_* prefix in the datasheet?
> that would make it easier to spot that these registers belong to AO /
> RTI (while all other registers belong to the CEC controller)

as i say register info come from amlogic BSP.

nothing in datasheet unfortunately. in amlogic code , this register are called AO_DEBUG_REG0 and AO_DEBUG_REG1 in amlogic BSP...

>
> [...]
>> +       if (ao_cec->regmap_ao_sysctrl)
>> +               ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>> +                                        CECB_LOG_ADDR_REG,
>> +                                         CECB_FUNC_CFG_MASK,
> why do we need to mask CECB_FUNC_CFG_MASK (from register 0xa0) in the
> CECB_LOG_ADDR_REG register (0xa4)?
good point, it's an error i will fix
>
>> +                                         logical_addr << CECB_LOG_ADDR_SHIFT);
> FIELD_PREP(CECB_FUNC_CFG_MASK, logical_addr) would make it consistent
> with the rest of the driver
> then you can also drop the #define CECB_LOG_ADDR_SHIFT
i will
>
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
