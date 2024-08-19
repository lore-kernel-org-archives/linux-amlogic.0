Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4DC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3EpfX6gLKK9E/ZoCo/fltBBBo7qj47n7au81Dt+YSg=; b=DmmW9xmnWXXWo1
	r/bv2iY0aZgcGqrz6w8w/wS4bh8Y+cpD2yqRH48UssAPH+bRHrM171dB8xR9gqk5AZyKFgWDUYN15
	YGWqzD9Abr6z8KndPftx23XenEA8bnaR4stKUWLG5+HCnKDZePVW/m+3nH/GN3kN9ejf23lpuYayG
	znhOJAt0gKELMnDK2sgQJVprxZbDCt9dS8DqnHTpRW26X29nGwqC/S+MeikeeO4wBgorxUzesXbeI
	/xf2pBI1aPkwv07/rZEqwD7uV0a2SXPwW7dcJOZIu0YtKU+taDUmA9Sy9tAKJ+lnUTAVn3nlaaZ1v
	0pvYJdf/yiR5etp1V+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5QP-00000002DKP-3MRR;
	Mon, 19 Aug 2024 16:40:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5QM-00000002DIp-2Gvg
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:40:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff443so3460864a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724085604; x=1724690404; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLh1ABOmACJjGeaQQwCrzHZzMijH1c87qN+hdOaSDkU=;
        b=HQ5AzYu7h+CRjwiAzFD+2DWUwOiTpQB357GsSneDWAkpRFjxSsHgAi17me8cNHpct2
         bQANudwygk2b7WEx4x0tMM/aiFmt2xcd0nhpkwst8tHWiqiMiJ3Gq/lh3IOpotwswAbI
         BjkbguqH0GJHROu0G8BquLMcm8taHFCDJXi55Oe1uyzwd6dPZrsctK9pUVxMPlrHulSR
         m1eTkPvyhIv4uBgV++gx/h9cT/yAPZNePRxeHIt3kjI1BKgbx5HhAYrTWeFxEkb0xa5a
         /CthtexaY8E0L1l/z3cV02/BDb8EPVUgtd2sWhx+rLdGdKyjdpCetAL4K1rofpqXGn4d
         uTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085604; x=1724690404;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLh1ABOmACJjGeaQQwCrzHZzMijH1c87qN+hdOaSDkU=;
        b=K/wQJrYMQkHiat4H/UT3RQySa/mgkg4VRrUJfJkjiiVYtxdUWAluqorSS1EbItNdLi
         i4btoed2fR+qVm+QlbgyQY2+hTyFLQSYqn53IF3tku2mOn2iUo124hYPjpDUKDKhtZz1
         0+SaAgodDfjy4sYCVRBbReVL2niZ9SdPX0EqHeO6TNgE2t8QCWuAjPMdEhJy59cnfKVP
         O1OTVKWoKu0AOv/OveF9wVKhTsNuVdKuRbKYuZrNlyozZS7/gORUSmgBnA/U3+QVDYsK
         h+wqfyhowzzFWoKQeAB/u3cnzOUZK2idyu8dUZ1RvHGbtgTFuOd8NVb8C4gbgbAJisLs
         kJYA==
X-Forwarded-Encrypted: i=1; AJvYcCV3pfmchkHPnsEcN32bQPkNAuiV2NiuW+tqSKsDFpBPA3l08uyMgCaYhocjmwWUlaaAb7eWCSh9SYmCje4Y7MfajaYkEWnWMn7Al6cp3+rCzGo=
X-Gm-Message-State: AOJu0Yw3OqwsALarT9VmtmZjwjUlK0KUHZkYuLC+4Jv7ztwMxHFkLgvM
	0F9TG/OFa1Nfly6d8CVY5LH/qWNVK1N4GB8GSBsduQtU9vWErDJ+/TZJgNsI21I=
X-Google-Smtp-Source: AGHT+IEjMWa9M79IVLPR6gN4l2c9n59ko9vG22U11vCzOjCnsgrlvCivJJKeqjCLstcFqGUGSASwdQ==
X-Received: by 2002:a17:907:6d02:b0:a80:f747:30c4 with SMTP id a640c23a62f3a-a83928a6336mr732337866b.1.1724085603415;
        Mon, 19 Aug 2024 09:40:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db8f:43f4:9b2e:fb1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383946a7dsm655387366b.181.2024.08.19.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:40:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/9] reset: amlogic: add driver parameters
In-Reply-To: <614de1b0-fcaf-457c-9183-1f3cd7f91b38@linaro.org> (Neil
	Armstrong's message of "Mon, 19 Aug 2024 17:57:40 +0200")
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	<20240808102742.4095904-5-jbrunet@baylibre.com>
	<614de1b0-fcaf-457c-9183-1f3cd7f91b38@linaro.org>
Date: Mon, 19 Aug 2024 18:40:02 +0200
Message-ID: <1jzfp8wjod.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_094006_746231_127DAD61 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon 19 Aug 2024 at 17:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:

>> +	assert ^= data->param->level_low_reset;
>>     	return regmap_update_bits(data->map, offset,
>> -				  BIT(bit), assert ? 0 : BIT(bit));
>> +				  BIT(bit), assert ? BIT(bit) : 0);
>>   }
>>     static int meson_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
>>     static const struct meson_reset_param meson8b_param = {
>>   	.reg_count	= 8,
>> +	.reset_offset	= 0x0,
>>   	.level_offset	= 0x7c,
>> +	.level_low_reset = true,
>>   };
>>     static const struct meson_reset_param meson_a1_param = {
>>   	.reg_count	= 3,
>> +	.reset_offset	= 0x0,
>>   	.level_offset	= 0x40,
>> +	.level_low_reset = true,
>>   };
>>     static const struct meson_reset_param meson_s4_param = {
>>   	.reg_count	= 6,
>> +	.reset_offset	= 0x0,
>>   	.level_offset	= 0x40,
>> +	.level_low_reset = true,
>
> Just a comment, I would rather leave the "default" users of this driver with the default value
> and use level_high_reset = true for the clock ones

In every other place in the kernel, we specify that kind of thing if it
is acitve low. Your request make things up-side-down and harder to
follow IMO.

There is no 'default' user, there is the platform ones and auxiliary ones.
Platform ones tend to active low reset line. It is clearly shown above
and hard to miss when adding new platforms.

>
> Neil
>
>>   };
>>     static const struct of_device_id meson_reset_dt_ids[] = {

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
