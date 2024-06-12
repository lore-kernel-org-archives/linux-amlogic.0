Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85495C27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD6AARn26Fs8V0eESpdai4JOP8Kw895WM+Zqg0/nrrM=; b=bzxSLLwX9SAv1W
	+9an9W5RalIHrAGkc36fHvmrsWYDXdAty0+5hRRuGHqpvsdj4TuyOIaI8CzszyU8sZMZojaWEolU/
	9Dm9NtHjorWA+C2UAm8BC+qBfrdY6maQLn/s3URIgnUoWfrycRZ2qIfnSP6hcGHLw0FnzKa0Jxdc0
	XlBX9yJ9AWUrjAaSnEVQUzk+5rC3gmBUUxAhK2WnHV9iOZ7qkyXUJ4cbJ+OWQmA/t50xc0Qq35FUA
	dGZ5iN6Cn8NVlpofhp6yUx+VwlALUYndJ+OK6efwT+n+oOZQKrX49ceu/74Bjl9kthDoip0cmxII0
	UNTwjAtzPatTfA3qiyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ8f-0000000BeSf-1X93;
	Wed, 12 Jun 2024 08:15:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ8c-0000000BeR2-1d1r
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jun 2024 08:15:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52bc1acb9f0so2132736e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2024 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718180120; x=1718784920; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i7JgKL6b8AoADzVvoe4uoGCOL76aOnzRK1ZmUzoPt0=;
        b=mdPhs/PXSzNyEnDTyTA4grYpczvlC5OC0xrhfN6fpeSlqNDlr3SvUFNCXZgUVgLePj
         AUrodbxbaIPPEqgzG4ji1F42gqYZT4SJS2ND5/8KXSgXg1rVUjntfvCt3Lz5nxoLYOKi
         KXPM440YadLIcu91+ocHlWZJ1LFj7LIRLMgnOFDsyiaokhyvpIkDdMPkEAEpu1Zm0GSk
         w7OAArh2w34nC39BTXr1BTb5cJxvwXI6rakQSWEpuUre+KU+4Mb3Cvd8Jw7zhbW04KeI
         n+XCuv/4ljdW+d0sHtKWQ1JK5P/jqFJfcNYd1u97vFSF126dlLco9pVkzrO1S3SUQrXc
         HUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718180120; x=1718784920;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i7JgKL6b8AoADzVvoe4uoGCOL76aOnzRK1ZmUzoPt0=;
        b=W8hInUqcg1SkyxhSG1Afe6zTOC2hZwgvaZkJJgsbws0AKsBRfZWnZQ86S3ZH4lpX0y
         b7yFChkO01klkxiyhAk9GHwyKXc7k66a2r7VF/lnjVHDM/rcal4tCn2biXJ4dxbSAT5W
         MipdM+ZyVQAjRudO/GRwiGxQJAxkGfZ9v+V/UoJBSQETX0Xaqu86PLJiprTHGEC1HiV2
         hEiAjgHiAD8ZDKu+dO8GAnzlKW8TvT4O/9s3Bk4pxij2IGk02+/wuCSYP2jSkKDysECI
         Jq1ws5rWi2yae7qqbWOIL4YCl4hZu7fkzFoYzALWKVbcrr8sjW7L29XOZxSzb1KnhXsJ
         Tf+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHY48R/93zn6MYlNvBIkRMV7iAuF3zrmAeR6RYsAGPXtlYtAGU/+8Mrq9zH+zQQBJQ+eIHg7uxlEwUw0IvKU98zXGBGGhi0AwVJIcJfnoDPTQ=
X-Gm-Message-State: AOJu0YxWVbnCpEoVEaqVRWuxVkIHTsjN5kpCb0319ans5MbPtNHy6gEN
	8rirL2lx1PjS90BXhAJFIU42jdZIXOwXKBy9iqq2RnEIa0b0wkeyBBQMSWWV2Zk=
X-Google-Smtp-Source: AGHT+IGNH0ntu3rGfl1MqkI2eXzc0qzg5Mxlmb5NxjjgXhC4jOBw5TLIubZnIB6RoLfSBwtPdwuHiA==
X-Received: by 2002:a2e:7c19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ebfc92c231mr6922271fa.41.1718180120393;
        Wed, 12 Jun 2024 01:15:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9163:6ed9:3c9a:d6c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eefa07sm15947595e9.8.2024.06.12.01.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:15:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: <kelvin.zhang@amlogic.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,  Conor
 Dooley
 <conor+dt@kernel.org>,  <linux-pwm@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [DMARC error][DKIM error] [PATCH v7 1/2] pwm: meson: Add
 support for Amlogic S4 PWM
In-Reply-To: <ce3c2772-8e91-4fd3-b52e-2a35d5759664@salutedevices.com> (George
	Stark's message of "Wed, 5 Jun 2024 15:12:54 +0300")
References: <20240605-s4-pwm-v7-0-e822b271d7b0@amlogic.com>
	<20240605-s4-pwm-v7-1-e822b271d7b0@amlogic.com>
	<ce3c2772-8e91-4fd3-b52e-2a35d5759664@salutedevices.com>
Date: Wed, 12 Jun 2024 10:15:19 +0200
Message-ID: <1jikyek25k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_011522_454987_C8047815 
X-CRM114-Status: GOOD (  20.34  )
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

On Wed 05 Jun 2024 at 15:12, George Stark <gnstark@salutedevices.com> wrote:

> Hello Kelvin, Junyi
>
> On 6/5/24 05:44, Kelvin Zhang via B4 Relay wrote:
>> From: Junyi Zhao <junyi.zhao@amlogic.com>
>> Add support for Amlogic S4 PWM.
>> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
>> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
>> ---
>>   drivers/pwm/pwm-meson.c | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index b2f97dfb01bb..4f01847525b2 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -460,6 +460,34 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>>   	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>>   }
>>   +static void meson_pwm_s4_put_clk(void *data)
>> +{
>> +	struct clk *clk = data;
>> +
>> +	clk_put(clk);
>> +}
>> +
>> +static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
>> +{
>> +	struct device *dev = pwmchip_parent(chip);
>> +	struct device_node *np = dev->of_node;
>> +	struct meson_pwm *meson = to_meson_pwm(chip);
>> +	int i, ret;
>> +
>> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
>> +		meson->channels[i].clk = of_clk_get(np, i);
>> +		if (IS_ERR(meson->channels[i].clk)) {
>> +			ret = PTR_ERR(meson->channels[i].clk);
>> +			dev_err_probe(dev, ret, "Failed to get clk\n");
>> +			return ret;
>> +		}
>> +		devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>> +					 meson->channels[i].clk);
>
> devm_add_action_or_reset() result should be checked
>
>> +	}
>> +
>> +	return 0;
>> +}
>
> You can rewrite it a bit to always have a single allocation for devm node:
>
> static void meson_pwm_s4_put_clk(void *data)
> {
> 	struct meson_pwm *meson = data;
> 	int i;
>
> 	for (i = 0; i < MESON_NUM_PWMS; i++)
> 		clk_put(meson->channels[i].clk);
> }

This has already been discussed on v6.

This make the code un-necessarily complex and potentially put clock that
have not even been claimed.

>
> static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> {
> 	struct device *dev = pwmchip_parent(chip);
> 	struct device_node *np = dev->of_node;
> 	struct meson_pwm *meson = to_meson_pwm(chip);
> 	int i, ret;
>
> 	ret = devm_add_action(dev, meson_pwm_s4_put_clk, meson);
> 	if (ret)
> 		return ret;
>
> 	for (i = 0; i < MESON_NUM_PWMS; i++) {
> 		meson->channels[i].clk = of_clk_get(np, i);
> 		if (IS_ERR(meson->channels[i].clk)) {
> 			ret = PTR_ERR(meson->channels[i].clk);
> 			dev_err_probe(dev, ret, "Failed to get clk\n");
> 			return ret;
> 		}
> 	}
>
> 	return 0;
> }

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
