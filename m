Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC375C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/oSa++JTPFtI0gHKiLjl+NL9DlGSrfK3YF0A8X7j1k=; b=jToVl297M8N/QBTTOc4v29SUHB
	dNc+O5Cr17mHSdhySKqrojXfXiN/txE90/kpSksrTRpDbHWInR04W2vDLBYVWvKuIG4yhKT+UJv8W
	mPrJiRDaZOoOjLvknmeJ9G6bsvgd3BvBS6f2wunAAAwr6/KQtCUqxkcwAufpXAq3ocaEAWQ7ddSd9
	+KVwdshQe05ov5Ii/Qs/1JiqGmMCRZfl6L7aqaqze8fH0pHWSA7zp7T5K/HVpXEjnHgqGns6WRN+X
	mpl3LiG3odilulxdzTKYU8I07ErCf1NYPeHu16WLPog9fxn/cVcr91ji1QAB8z7nXX6VfMn/5cNMX
	uXh1mUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD4B-00Dg4A-08; Mon, 06 Mar 2023 15:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD2v-00DfJh-4U
	for linux-amlogic@bombadil.infradead.org; Mon, 06 Mar 2023 15:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=4jttNTsMYo3hO4zmFRMt6lMJ/dsTxQ98EZIAfYPHck8=; b=YcJFslPOu/C13zM5Uev45ZQWDa
	v66RvkYjMboMUJv7VUIxYDjQhkGJv3EwNDVp3xpfpsZZUEn3knpQeovugU0z5zENmSpbgr/L5AteN
	gCS2+TgUDdcU6rk4cAZj3JRcZipwqEjyuKV5OEnoiSbc7p94n/2IeFaGJCd5Njhbwng108mFzvbGb
	lftAXWW2v67Q5pTA29AGuwq2TPTsXhY0G6Rn1Ia9/DSG7YkwJ6IEvePgSpxMX2SgH77jbuzMwmvg6
	jHZGI24NF9wyEY1L5mtVbhDSc9UuJD2gkc2JpIW83DMWoddFWsL/IX8ggQps5liN3ur2ipva4mA8E
	VbXrKcgQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZBDy-00Gguc-2l
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Mar 2023 13:50:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id bx12so8850911wrb.11
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 05:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110597;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4jttNTsMYo3hO4zmFRMt6lMJ/dsTxQ98EZIAfYPHck8=;
        b=RcC4brTzUz+W2jOBplkTuiwHCsvXSckMpm3gt81QtV+tuX4kXk+sEpyAhEsrvyBtij
         yUSrw7I/kxyny+vei8JMAVj7HVC4qZW8KO5hme8Bl9s0HrsbpUqvnqSEipDou/xPap9c
         HRrdFu38BjYUFG1fDNbQBds/ndtGpZmPyNGuFz09POQcGf+IMi7Y5yVTq2yK62WxhW/d
         EGVA1y+ONOCTQsStRAu/y+vVqQAXJQRQ6HIGEeVDuDgHp1KUE86hoj/bqiQglpYQ96Ll
         +T7OIE/t1/qze9yeUjFBMwGQ3lsJPL/T2daCLccXlh/XrqXh6c2HRo3GGNYdOQM8Ik/0
         loVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110597;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jttNTsMYo3hO4zmFRMt6lMJ/dsTxQ98EZIAfYPHck8=;
        b=RAXJVzoRPcmPkPvKRlEtkPBj1cLkm17MFU3INvS42YlcdJPC2Lg2hDKlA2n3dNdvI7
         G1N+jYsUuO1+9iP2eNuoz/aztx/HcTms0k/ZBy0U1W4BRlZ4+78Ohc/Bfbqg/9eYS7qo
         b8gRvSMin/CECHD/BFDwUsYADg8nCL2nF9Z286yzsS9olUHmGYgHY07wc/Nn8YhTLB0S
         ZmtqJNxtNKRxiRbsR+fTfT7OXawyt425fZcX7jl36sS354UymZrtdCjzZ1A/nkG3UWqM
         ll0Ls9bAi/nz87kemPpyAf1J9kpw81kzwt3q07re59nO7dg31oRyWxlZJoOIW7CVuqSr
         kVrA==
X-Gm-Message-State: AO0yUKV6ZgCLskfN9Sn7z4sHxNtfYFCM79irdJlr+m1PUPU3hqKQCrBA
	y8X+/wnota+PGXmbVIub3Q1x1A==
X-Google-Smtp-Source: AK7set83efNzzJIPdS6ZaS0rm2KQxwFZZmA9X2pC+KVtPznDTxzOM6N0acKc02PI/7R7IdprelQF0A==
X-Received: by 2002:a5d:62c3:0:b0:2c5:5237:3b21 with SMTP id o3-20020a5d62c3000000b002c552373b21mr7941779wrv.69.1678110596959;
        Mon, 06 Mar 2023 05:49:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:cd23:1024:19b6:1a10? ([2a01:e0a:982:cbb0:cd23:1024:19b6:1a10])
        by smtp.gmail.com with ESMTPSA id j29-20020a5d6e5d000000b002c59f18674asm9902098wrz.22.2023.03.06.05.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:49:56 -0800 (PST)
Message-ID: <2d9e01df-0047-98bc-f1e7-fa860d92c254@linaro.org>
Date: Mon, 6 Mar 2023 14:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/3] meson: pinctrl: use CONFIG_PINCTRL_A1 with
 CONFIG_ARM
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Alexey Romanov <avromanov@sberdevices.ru>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-2-avromanov@sberdevices.ru>
 <CACRpkdbWubk3A3qYuYqDc4OBGP6T7TaKwFeW17CwAzPvttk=WQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdbWubk3A3qYuYqDc4OBGP6T7TaKwFeW17CwAzPvttk=WQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_134959_064428_0EA17047 
X-CRM114-Status: GOOD (  11.16  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On 06/03/2023 14:45, Linus Walleij wrote:
> On Wed, Feb 22, 2023 at 12:50 PM Alexey Romanov
> <avromanov@sberdevices.ru> wrote:
> 
>> Tested A1 pinctrl support for ARM and it works.
>>
>> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> 
> This patch applied to the pinctrl tree for v6.4.

Erf, this serie is something we would avoid, so no need to apply it for v6.4

> 
> Have you considered also adding || COMPILE_TEST?

It would be great to have || COMPILE_TEST for sure

Neil

> 
> Or does that break builds?
> 
> Yours,
> Linus Walleij


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
