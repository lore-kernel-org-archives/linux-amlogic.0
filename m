Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E74FC25B67
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8r6hXhvrL2c8nUhyvv6+MFUsDQQxtY/Lio4RnZmUA4=; b=ullFrgAX4DqDZM
	Gf1kLZwLdx04pi4ZJiJBZa7RKPqB78hHnCGrxGOsVcLRxaUY2Z5LYEm6n2IsvB+/LmvmZ7HY1xNyR
	c4FnS2/V8oLC563eV2oAoRFWskxkYumpLP1/cOAImJWtzyVY2Fs5+CdQlHn95d+ObtP67M1syh5ZI
	3HXNsO8PQbm2647vFVy2S2S/z3zB5O8b2/jy6EB5MuHjrZqGPFLDZ1bCQKUqE1TFNWWoan5eyTcfS
	N9wvsI4WNxiqJmQ1QcQ/2xtTm+CAG6KRwctwZarBh/4OvZtLewj8bQ9R7bIhEcVDOojVC6FSGKG7Q
	L2ibietDu4OdSWWuBbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJma-00G5qo-2S;
	Fri, 27 Oct 2023 10:09:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJmW-00G5pt-2A
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Oct 2023 10:09:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32dc918d454so1188052f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Oct 2023 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698401370; x=1699006170; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=eCgIckExqjVeeUki95cqbKKediAgvysu6tsWmmMNWo8=;
        b=dNiVNMTA5lggZJe8cND5XoqC3zAR36GboBaS4cmRfI4kCtUoZGO53vQu4pSpS7YqXI
         jHhYnO8BUoXR/tBQbC0ju3SY7+dK407ZYF3Q43EZwQWdAvgX5xtiN2tECPDL9oO+uvt7
         l+L5FRGT5yOUbSdspAtLw9PtzgScmoAG84P6PdN5yx5mLzEbeyDBTTpslnr49IdGSslv
         sVrAvaLYgFsepeJon8aVTsxdLTknhheDX0WrZnMhdO9Eo5JKylMi1zmJgn1FtUf/8ZG/
         ZQ6sova2C0TKLMfYqQSpTttIccDh3jKDDVqr75I1isKKlCbcjtcwhipGdE45C5sf2uGt
         vigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698401370; x=1699006170;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCgIckExqjVeeUki95cqbKKediAgvysu6tsWmmMNWo8=;
        b=lVbDxLacwdTb3ZGVwvovm5RGqxB58IJe5bJGCHF5ncmfSb7Fool642D1tzLa1PbCfw
         wEnS1UE63Ibm02iPtuplTmGvOmgwxHMOVMoelkdpY78xUbJmZ45mMrC7O4ronseVhOTK
         n/HdGwsVhauI1vQVCOoFvv3/IcT84zrIwxQmBy9Hu4KtFO+UW227q5OCyf3dWoD4A7mJ
         DOhlTXhdQM/mKUnXlDE6aE5o5dgq/DKRc/tjHv2qE+InG2qPoGSksoFzgbjEm344QbFx
         iErIxYCbAzAIc5h07MoluJ4stuslVtrYk0Ml8RJidssQ4PR5xjYjgzd2Vs+eLrCsCBo5
         zeKA==
X-Gm-Message-State: AOJu0YyizIaQNECcNE7H/adsW7nlTp0fqaODYXqX98LLPWSH98wSFuMJ
	aKDNQVxqCLvfn6MUSBiHcbrgqA==
X-Google-Smtp-Source: AGHT+IGa1T7lEat0slw/AwjDK1QpinPLfhfQndnxOfkNu0bsXcI3kQkBPm8CYqm1V9dqWxwRoE9W/Q==
X-Received: by 2002:a05:6000:b8d:b0:32d:9395:dec6 with SMTP id dl13-20020a0560000b8d00b0032d9395dec6mr1985532wrb.67.1698401370089;
        Fri, 27 Oct 2023 03:09:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:816f:104b:c6b3:b87d])
        by smtp.gmail.com with ESMTPSA id t11-20020a5d534b000000b0032da7454ebesm1413195wrv.79.2023.10.27.03.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:09:29 -0700 (PDT)
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
 <10dcc778-f165-407e-b765-760d277d5e35@salutedevices.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: George Stark <gnstark@salutedevices.com>, JunYi Zhao
 <junyi.zhao@amlogic.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Date: Fri, 27 Oct 2023 12:00:50 +0200
In-reply-to: <10dcc778-f165-407e-b765-760d277d5e35@salutedevices.com>
Message-ID: <1jzg041ina.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_030932_894589_1D7CB2E7 
X-CRM114-Status: GOOD (  14.93  )
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


On Mon 23 Oct 2023 at 23:07, George Stark <gnstark@salutedevices.com> wrote:

> Hello JunYi Zhao
>
> On 10/16/23 08:24, JunYi Zhao wrote:
>> From: "junyi.zhao" <junyi.zhao@amlogic.com>
>> Support PWM for S4 soc.
>> Now the PWM clock input is done in independent CLKCTRL registers.
>> And no more in the PWM registers.
>> PWM needs to obtain an external clock source.
>> Signed-off-by: junyi.zhao <junyi.zhao@amlogic.com>
>> ---
>> V2 -> V3:
>> Rebase and Review the latest upstream code again.
>> After reconstruction, stick to the previous code as much as possible.
>>   drivers/pwm/pwm-meson.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 25519cddc2a9..fe9fd75747c4 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -99,6 +99,7 @@ struct meson_pwm_channel {
>>   struct meson_pwm_data {
>>   	const char * const *parent_names;
>>   	unsigned int num_parents;
>> +	unsigned int extern_clk;
> may be bool extern_clk;
>>   };
>>     struct meson_pwm {
>> @@ -396,6 +397,10 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>>   	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
>>   };
>>   +static const struct meson_pwm_data pwm_s4_data = {
>> +	.extern_clk = true,
>> +};
>> +
>>   static const struct of_device_id meson_pwm_matches[] = {
>>   	{
>>   		.compatible = "amlogic,meson8b-pwm",
>> @@ -429,6 +434,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>>   		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>>   		.data = &pwm_g12a_ao_cd_data
>>   	},
>> +	{
>> +		.compatible = "amlogic,s4-pwm",
>> +		.data = &pwm_s4_data,
>> +	},
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, meson_pwm_matches);
>> @@ -451,6 +460,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
>>   		struct clk_parent_data div_parent = {}, gate_parent = {};
>>   		struct clk_init_data init = {};
>>   +		if (meson->data->extern_clk) {

Instead of hacking through the existing registration function, it be
much better to provide the clock registration function as on ops in dt data.

Also, as Neil pointed out on the v2 [1], the meaning of clkin0/1 is changed
on this SoC.
* On previous SoC, it was a reference to clock input the PWM block
  should select from the hard-coded list it has (should fix that
  someday)
* Now it is directly the input the PWM block must claim.

You need to update the bindings accordingly for the S4

[1]: https://lore.kernel.org/linux-amlogic/07581fb8-0cd9-5b76-6fa3-1d1a7353d944@baylibre.com

>> +			snprintf(name, sizeof(name), "clkin%u", i);
>> +			channel->clk = devm_clk_get(dev, name);
>> +			if (IS_ERR(channel->clk)) {
>> +				dev_err(meson->chip.dev, "can't get device clock\n");
>> +				return PTR_ERR(channel->clk);
>> +			}
>> +			continue;
>> +		}
>> +
>>   		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
>>     		init.name = name;
>> base-commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
