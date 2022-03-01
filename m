Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABCBC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 08:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGAKr+rK/wrIwi+5JtEXqtaCpvl0ndYYpSp+cmyqVss=; b=KDiR/x+KCwJe4Z
	PZ7+nX8LZmV0/dtUwl/+XO5ya9v+GEmCjHAc5H6UhgA1oTySt83B0dUYLNLCuCAi6axzn0i9TfuMF
	rJZCrORvwvaXS/UboVfK/Z7+opSnrcjOa41IqZMwVic5aTiAgJ3F/KpoKsSo2vwBFHM/RUdR6/2H0
	6u9zAAntm/xqEZC9FrgMWqP+jNhbsBUcmpScAivwOef7WcKZrUk6uFuYCPAIQlxZHuN2bPSyKaCa2
	ncwslnNa26zKTH9LKO+z76Nb/3jHe7h19M6UrdjU4cUx1FKheAbf1rBPugp0QA/R+1ft3ElFw/dat
	KNTtoQs0B5MgAVoWp74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOy2X-00Fdhi-Fh; Tue, 01 Mar 2022 08:39:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOy2U-00Fdf4-6u
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 08:39:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e10so1643580wro.13
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Mar 2022 00:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ys5RUn00UTk4/HM+/VQ1d9YYoz2PP5VEAgLxVeBItuo=;
 b=bsBXup8JXuMjq5m2R4LX5YZYwB4jv3c8gplZTEkaXEYlZDxabb+wInQkLSxBHDveUe
 EftLA3G/0WpO65ThsVXgcKSeLo5Fau9t2AheK+c6CajAO2uphaVq4QP2TyILrolSyDE5
 De18sMJRe1PnKmAsotxRKuLSdeDBYvhPkuunybLWLfnKhpec560dY78BjxUdj5Z4nFOG
 KIUDDgZxwSgCyiG1PrQbEChQV0bnSts9xk8M8CeB8LWFT4s/6JCWLRIAMvcZAgLi0anQ
 5B/OyXff9XWaQCMChL5HbyJaJG3YnDXNzxy1u9bmTaAhqjTZFVxfy0Mjtw5mBewuOjak
 /UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ys5RUn00UTk4/HM+/VQ1d9YYoz2PP5VEAgLxVeBItuo=;
 b=BAQx728LDs5MxWmIyGGiCU08RntOYII+ZByeEIKt8c/qKgb91OIlz1eHel8K31/DSJ
 4/kEAShGXt/8RO0gsyoc1qIB7t63gE09Uf5oMIiXikQuqo8pT+i7OkIGGkbJSydhNfsL
 TfXMa8mGalBm0ouosJ1+dVCCra8f9G6oFmvqxB7IJ+/8bBWTHGQ0oJsKVPdp8Uy6gC1m
 yJVE8O3PItZ0EaTgm1CotIfGu4fdoonkJhecOR5s26roA8stq1ufYJPYXYAbS5uhP3P2
 aDS9ulG3MSO1HKD2ljD9iy8+BbmBqLrsnyicP/wXym5WgkY2KFVaMuTRYIfRhAvKujL/
 5AnA==
X-Gm-Message-State: AOAM530a+9GQrxNZDjOVGDQvKasic5+5MS84XbUMThBockQX5dZ5RzMH
 HefoA+FUSn9AIee3/13TZDhKPw==
X-Google-Smtp-Source: ABdhPJyHAAq6QqkvDXe+8kSp+Zv0Q+HGeMEuNrHEz11ZtnWxrAxvw7R+lXq+tS3APcaKgFuL9J/7jQ==
X-Received: by 2002:a5d:6083:0:b0:1ef:761f:521f with SMTP id
 w3-20020a5d6083000000b001ef761f521fmr14275331wrt.238.1646123960395; 
 Tue, 01 Mar 2022 00:39:20 -0800 (PST)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 p190-20020a1c29c7000000b00381227166b2sm2488649wmp.41.2022.03.01.00.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:39:20 -0800 (PST)
Message-ID: <9c35b653-6cf4-a13e-ce7b-b186cf4b68f4@baylibre.com>
Date: Tue, 1 Mar 2022 09:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 0/2] Power: meson-s4: add s4 power domain driver
Content-Language: en-US
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jianxin.pan@amlogic.com
References: <20220301015849.827634-1-shunzhou.jiang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220301015849.827634-1-shunzhou.jiang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003922_317109_E5FAF941 
X-CRM114-Status: GOOD (  11.66  )
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

Hi,

On 01/03/2022 02:58, Shunzhou Jiang wrote:
> This patchset adds Power controller driver support for Meson-S4 SoC
> Likes Meson-A1, the power domains register only can access in secure world
> 
> Shunzhou Jiang (2):
>    dt-bindings: power: add Amlogic s4 power domains bindings
>    soc: s4: Add support for power domains controller
> 
>   .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>   drivers/soc/amlogic/meson-secure-pwrc.c       | 22 +++++++++++++++++++
>   include/dt-bindings/power/meson-s4-power.h    | 19 ++++++++++++++++
>   3 files changed, 43 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/power/meson-s4-power.h
> 
> 
> base-commit: 3448a018ded03ccd4093d6675f4a39eb2d1a18ef

I think you have an issue with your mail setup, you sent 5 times the same "[PATCH V5 0/2] Power: meson-s4: add s4 power domain driver" patchset.

Please fix it and maker it doesn't happen again.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
