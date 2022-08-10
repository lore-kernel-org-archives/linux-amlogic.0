Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B4C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb9bven8AblZcv5dR9qT+/I61basRTE0JT4tlDO/27Y=; b=11CAbnJ7snAdsd
	OI4cOP6rK1J53iBBacNJ3fMML64hi0XyEIw9oW2N1Az4ZFAXO0p7ZMFb6yiu0z5Miy8QkmoAKRptj
	+F/fGzk5LKP4qtY3qHJ7D7J8IT9lQ+fRkkfcenwyr3jBQ+U35kZDnEhFUxumhs6OBMWDsXHyeltr6
	bywKMDYtiAb+oQ7sIOPkHXFvWSqB8JL2FZTmN9BGf8HhsNOVJ6EZu34hJP7PJ4ZPg9GzMYvTu3FS3
	OwyJOAWJn6jzh7l2Ir45l+57QVN/pJLz3UIz8eJ4GPtlZiCvcYQz0rbjOpm9gQPHafVlSGgdJm1gK
	bC1WNWVDuq0tbLi4lxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhqX-00Ays0-Sq; Wed, 10 Aug 2022 09:17:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhqC-00Ayga-Rq
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 09:17:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so666933wms.5
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=tExeQAZyt5MFlaiu4qlfM352z/P0dnZTmeOuugjeqaU=;
        b=mgNyV9c+vdnPv+XFID7oQ0i2tPTJMIASQe9+elnHQ6x1HhRPuzzR4tt/827/Mlgl9h
         3WEzGcqtz/0wKqGez5AkDFx8/VnRMR+qHrG+u8sP7WO8PQKoY5uGONaGPfQnhbeh8woZ
         y1QesoLSVqVOWolv9IoNEL/G9oddJH7ADFI8+RJdvOyeNXxrOXha2P85dhdHR0vvPgJP
         IfkGiEe2PcEC/0/SHfYlO4x15wha4yrxivTJHBVXPueUr6gS567dw4FnXc7jE0rrjJzS
         AQEv1VeD6RCNPg9p6qrqrUx770AgVy9PwY4iHBs4ulcSAD/XA3BO0VelMiSyHrPGLemr
         yaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=tExeQAZyt5MFlaiu4qlfM352z/P0dnZTmeOuugjeqaU=;
        b=leEIV3tDEsYSgSg3LvHmX2pe9k2W7neLRGy6RMVOX2gmkcX6ubA9BIv2cnqT2JRdgx
         LDgZD+59X3Wkr7qllgfhTC1dU8lBvVX9WPInvhatTs4ivPKWehCXy1MTsN2JGEyPlebN
         Tacf+kWXlxpuXYPJTjkFrY7PZGewJVOhU0tEiMgEsNeWZIacOuffwwyCBQ0OXRq3TbVl
         HUC2R4lgnJ7iDDT/+QsnHDb99oMa5w7TUm0rWCFY23RHQBNg9wzkRqROsoeSqj++UHFf
         L2dojGq0Z4DpuyAIAcRvUH5lJ97B1g8o9vUMdMqNTECBSPkY/FGL9ajv8OrzAeihfV6a
         VGvA==
X-Gm-Message-State: ACgBeo3qEPL2VjVpj2GbeKq052lTfc9ytHkUwrttpe+fBcm+SuXeT2V2
	XY0a9ysY0pUHuNs7WC2eoT4vOg==
X-Google-Smtp-Source: AA6agR4t2lBqQNfP4gn3TT6t2Sq965NrqmDFsjDSN0d3zdGdmbD8xjT+TyQYUQ1prRTqyg8x3B0FWQ==
X-Received: by 2002:a1c:4b09:0:b0:3a2:ff2a:e543 with SMTP id y9-20020a1c4b09000000b003a2ff2ae543mr1673853wma.93.1660123036335;
        Wed, 10 Aug 2022 02:17:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb4c:4cd5:c6b6:8b12? ([2a01:e0a:982:cbb0:cb4c:4cd5:c6b6:8b12])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003a3278d5cafsm1697658wmk.28.2022.08.10.02.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 02:17:15 -0700 (PDT)
Message-ID: <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
Date: Wed, 10 Aug 2022 11:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Da Xue <da@libre.computer>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YvJ84qkuXdvVgXRm@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_021729_006688_5A80565D 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/08/2022 17:27, Mark Brown wrote:
> On Tue, Aug 09, 2022 at 05:20:19PM +0200, Neil Armstrong wrote:
>> At the end of a message, the HW gets a reset in meson_spicc_unprepare_transfer(),
>> this resets the SPICC_CONREG register and notably the value set by the
>> Common Clock Framework.
> 
>> This saves the datarate dividor value between message to keep the last
>> set value by the Common Clock Framework.
> 
> When you say the value set by the clock framework does that mean that
> the clock driver is adjusting hardware inside the SPI controller IP
> block which is then getting reset by the SPI driver without the SPI
> driver knowing about it?  That seems like a bad idea as you're finding
> here.

The SPI driver is explicitely triggering a reset at the end of each message
to get back to a clean HW state, but it does reset the content of the "legacy"
registers containing the power of 2 divider value, the new registers configuring
the new clock divider path (only on newer SoCs) doesn't get cleared.

> 
>> This didn't appear before commit 3e0cf4d3fc29 ("spi: meson-spicc: add a linear clock divider support")
>> because we recalculated and wrote the rate for each xfer.
> 
> Note that the rate might change per transfer.

It's taken in account, this case is when the rate doesn't change.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
