Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B42AC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSYpLKllB2Qpbm+r0UQdBYOlv1/OUqnW58iOGYUGIzQ=; b=Nvz3HS3uK37tjC
	l538dGPV9L6L0LLtMiBDSBqEplCPJHB9wdsZbNXKooeieVwmv7lkmZ5eNJRitNw41Imh+n5VMzK3i
	UBh3z6KktMK6yT6O3phl6Gv0mC11Rot9YVUepeWZQlcrfO8rDPK29tojTdqNE3QsoPjHw1mhGx+Vo
	LnIzav/Ynck7jnsYR4IRo9riSMhYXh2hNdh3vo8tfOIPAsKqPVOXk4VteUNd4RIUtxcRRFRxO/1Jn
	eGL8CsnmfKlFKPImXR86l1P67gtYbFyO/DTN2H/HY/2TS1OiIiyf1m8JviHBP7il6CpqRKrxbsAua
	RmPeQifpLU/+nHE8owpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYcF-00000003QWG-2AQk;
	Wed, 24 Apr 2024 09:08:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYcB-00000003QVC-1kfq
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 09:08:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41a442c9dcbso25889205e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Apr 2024 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713949708; x=1714554508; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=rvbtxxL0KA7+nw2JDrdSITHMot8lmC1r+u81WvHz+K8=;
        b=Ij8nJI60zpKk5iwpifULzHkmVK1KDInDJceD2po9iwrYM0cj8i02Ql0NK0lZaUSlFv
         /wCYA+H2jFR+Kv35usPlK0TXCBG0udDymCJzyXEftZzr+JV/peVEu2EzSnAl3r3eqkuU
         ZPPoivjk9IIVBt5VH4H3FmhuUnMFrrju85v89fEme7+hGG/jkLVBSkacdLfkXvqPDQN4
         ZhY7bA5uZLoLroYZQuELmETDZUGLh9cVi742YPs1Hr2kClhzEeSGmFqFgEuW9ABq1fnV
         ZjME58yh/x77wIOs9LBDILWy+Ggs1cXvQdPte/exb4FrINn1ZjATHLAI14u5rTKKdjJD
         14Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713949708; x=1714554508;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvbtxxL0KA7+nw2JDrdSITHMot8lmC1r+u81WvHz+K8=;
        b=uPb9eyjL8PjdElHbiB4Gl5SruuaWgn25YJDEWAbJQlY9/2s4gdqLc0pI8zj52yUvJP
         C82X+3AJj9PUR4dIun0ULj34ibkmLGPypzAg3xpFAFxWdIlu0nIyw8V12RWkDra+AIdn
         ekNNDrVZlUR6UGo9tZ13oKnHc1AM1InFDLqWpBva8jPSGgj6zaY4nAmj4W0wxZ8CT6uh
         F3FeKNhYQxpQi8RWSN4koVq7K45HPirEfUve7Ub9W3DzTiUopRqipMsEkj/cDrhztsUV
         t5mZkkqGHOICbYP7+LK6jLqimwRq9prrUrrF1pVHQdk4ubVY03Jeeev7h5jwG7gAPQ8z
         AXLg==
X-Forwarded-Encrypted: i=1; AJvYcCV6iR3exWPmIE/HfpNGUK1/uRyf2IxSiBFp12rGc9a/E7AIRyUH45kliPqA/SwE046VJ2cDeI6OUamO3GXnf0+2L46/9o/xDsdPKbbqx441850=
X-Gm-Message-State: AOJu0YzM5sA8zBdgKdylGszxhaMOV82szjSTFXhL9SifOc17/PHRlcBt
	QZTklPIO0Qerd6XKfzLGU/ljHW2Hfun1H8XDVDIaN7XWvr6iYheWtOadrnr/H0o=
X-Google-Smtp-Source: AGHT+IFezzal7JjWvHMGZYy61bCLzRhsiQD5U7WszFsfXL9gRrzNRJlTMjBSCQ2VYQubwKxlAGjtSw==
X-Received: by 2002:a05:600c:468d:b0:418:f307:4b82 with SMTP id p13-20020a05600c468d00b00418f3074b82mr1358453wmo.39.1713949708334;
        Wed, 24 Apr 2024 02:08:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ab48:1b7:631c:952a])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b0041b0d4e1c27sm987467wms.42.2024.04.24.02.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:08:27 -0700 (PDT)
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-3-gnstark@salutedevices.com>
 <1jv848ezzo.fsf@starbuckisacylon.baylibre.com>
 <4feb8fe3-af72-4483-87b2-30503328cfe2@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, u.kleine-koenig@pengutronix.de,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, thierry.reding@gmail.com,
 hkallweit1@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com, George Stark
 <gnstark@sberdevices.ru>, Dmitry Rokosov <ddrokosov@salutedevices.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: Re: [PATCH 2/2] pwm: meson: support meson A1 SoC family
Date: Wed, 24 Apr 2024 11:02:10 +0200
In-reply-to: <4feb8fe3-af72-4483-87b2-30503328cfe2@salutedevices.com>
Message-ID: <1jmspjf7qs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_020831_605881_5ED5939F 
X-CRM114-Status: GOOD (  26.56  )
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


On Wed 24 Apr 2024 at 02:00, George Stark <gnstark@salutedevices.com> wrote:

> Hello Jerome
>
> Thanks for the review
>
>
> On 4/23/24 20:35, Jerome Brunet wrote:
>> On Tue 23 Apr 2024 at 19:10, George Stark <gnstark@salutedevices.com>
>> wrote:
>> 
>>> From: George Stark <gnstark@sberdevices.ru>
>>>
>>> Add a compatible string and configuration for the meson A1 SoC family
>>> PWM. Additionally, provide an external clock initialization helper
>>> specifically designed for these PWM IPs.
>>>
>>> Signed-off-by: George Stark <gnstark@sberdevices.ru>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>>> ---
>>>   drivers/pwm/pwm-meson.c | 35 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>>> index ea96c5973488..529a541ba7b6 100644
>>> --- a/drivers/pwm/pwm-meson.c
>>> +++ b/drivers/pwm/pwm-meson.c
>>> @@ -462,6 +462,33 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>>>   	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>>>   }
>>>   +static int meson_pwm_init_channels_ext_clock(struct pwm_chip *chip)
>> That kind on naming (ext) is almost sure to clash with whatever comes
>> next.
>> Just use the name of the first SoC using the method, a1 for instance.
>
> It's true that pwm core in a1 s4, t7 etc is the same AFAWK.
> I just want to clarify your proposal:
> I add a1 compatible to the dt-bindings with s4 as fallback,
> t7 compatible will be added later in the same way.

If you know t7 is compatible as well, please add it to.

Other people (including from amlogic) have responded to thread around
the s4 pwm topic. You should probably Cc them of your future submission.

They may help test and review

>
> Here in the driver I don't mention a1 at all and use s4-centric naming e.g.:
>
> {
> 	.compatible = "amlogic,meson-s4-pwm",
> 	.data = &pwm_meson_s4_data
> },
> static const struct meson_pwm_data pwm_meson_s4_data = {
> 	.channels_init = meson_pwm_init_channels_s4,
> };
>
> right?
>
yes

>>> +{
>>> +	struct device *dev = pwmchip_parent(chip);
>>> +	struct meson_pwm *meson = to_meson_pwm(chip);
>>> +	struct meson_pwm_channel *channels = meson->channels;
>>> +	struct clk_bulk_data *clks = NULL;
>>> +	unsigned int i;
>>> +	int res;
>>> +
>>> +	res = devm_clk_bulk_get_all(dev, &clks);
>>> +	if (res < 0) {
>>> +		dev_err(dev, "can't get device clocks\n");
>>> +		return res;
>>> +	}
>> I don't think allocating the 'clk_bulk_data *clks' is necessary or safe.
>> We know exactly how many clocks we expect, there is no need for a get all.
>> 
>>> +
>>> +	if (res != MESON_NUM_PWMS) {
>>> +		dev_err(dev, "clock count must be %d, got %d\n",
>>> +			MESON_NUM_PWMS, res);
>>> +		return -EINVAL;
>>> +	}
>> ... and this only catches the problem after the fact.
>> It is probably convinient but not necessary.
>> 
>>> +
>>> +	for (i = 0; i < MESON_NUM_PWMS; i++)
>>> +		channels[i].clk = clks[i].clk;
>> channels[i].clk could be assigned directly of_clk_get() using clock
>> indexes. No extra allocation needed.
>
> if we use of_clk_get then we'll have to free the clock objects in the
> end. Could we use devm_clk_bulk_get instead?

Add the devm variant of of_clk_get() if you must.
Use devm_add_action_or_reset() otherwise

>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static const struct meson_pwm_data pwm_meson8b_data = {
>>>   	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>>> @@ -500,11 +527,19 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>>>   	.channels_init = meson_pwm_init_channels_meson8b_v2,
>>>   };
>>>   +static const struct meson_pwm_data pwm_meson_ext_clock_data = {
>>> +	.channels_init = meson_pwm_init_channels_ext_clock,
>>> +};
>>> +
>>>   static const struct of_device_id meson_pwm_matches[] = {
>>>   	{
>>>   		.compatible = "amlogic,meson8-pwm-v2",
>>>   		.data = &pwm_meson8_v2_data
>>>   	},
>>> +	{
>>> +		.compatible = "amlogic,meson-a1-pwm",
>>> +		.data = &pwm_meson_ext_clock_data
>>> +	},
>>>   	/* The following compatibles are obsolete */
>>>   	{
>>>   		.compatible = "amlogic,meson8b-pwm",
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
