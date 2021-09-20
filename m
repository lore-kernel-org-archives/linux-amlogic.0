Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52DBC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:29:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B494B61077
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B494B61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wi5Fg+eGjbBoP+SOwVBp2B/UxsmI42r6Q7gqjri/hWY=; b=qsEXT9rm1NH1oKu+nnmX01B+eC
	DDK4BUKu6p0ESMwB8gBAz5WOddhu8Qe5XUDHFACGw3/zH05xN4Wrx/tB0TIECPxBXiDMcLP0BNkRy
	9oFfUZVDzbkfrmf/ipVHl8iwcldjbljYSeqM4CYqEhKOkIVXsxptAVmNzjFSUZmsWrEQIxWYggygF
	FT5Ml7KQ7sD6t0gRbevtpy1FcVdDsfAe91fegpZemoScnY504TVki5QpQeY69vCayLsutMr0SgGjt
	hktTvdWRQGDOWxvPdaOboh8A2bwFbGe6NkKXG6bhi6237PSpb3XUEzr9SrRE5yIo1jo3IejcFG5nA
	1/lccIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEfs-000vOa-CS; Mon, 20 Sep 2021 08:29:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEff-000vLh-1S
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 08:29:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id u18so25639246wrg.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NmwufkRm5QXP0RAh9pBbo8ktk5iDLTsqfPbzEqZPusQ=;
 b=ASztJaW6JLqDSrnzAc8sDk8rdLwza8sZQRFbsVufD7S6x99Hhl7BGV5YzttOZprJPR
 A6TbTopEIqMinlR87Ykkzakz5iZ/O/5AuzDw4YkrqTEzes8j1K5NNjA2QOw3sTxJDGo1
 XfwHT0hIyrbhKwUogGCw6ZC/OLu1RprMonZ9Yj7TzNFrcOJTTC+hFsqWWqbusTZVIns3
 HIrSkjQ1/g2BaOGHXjp7iU8kmma/vSYLuYp3Ba7eGXib4bCsmpcwJYXGuSMU8W/KojWX
 ehFVT2F7wWBmutG0rItwEPu77rY+Gr2IPyptA1Iz0a49hWLhllx3WS+WWU82s7eXfgZ+
 197Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NmwufkRm5QXP0RAh9pBbo8ktk5iDLTsqfPbzEqZPusQ=;
 b=gDjb9qlB8YSKrPgpOQYKnskGhdedmy4rk6TaeRZ3CKrqOIWahoCAw37FpdyOCjhDPX
 IQYBq6FH4M0TnR8XL3I2BSuoxs4sx4fYNJu3/C18Y9oANRnCQSK0o0DDG1ChjFYeRwMw
 gUS41XrLWAvSZuxPlEMBdS3IdkDkePKSpQdNbln4YnEcRbAMAKKwZQGKuwAHyesZQGNG
 u44p4MJLPlbPYNg+rULeypbGO2/xLIHTJENnNllNt+4RJQWgRkCFEpZauyLO26rpUV1f
 yEoqIberirq4Qt5ZUl9qYrkxJVv1ougUEbkj45Sdk3Y1yPMuMT7GpD4iEHbRK37vVFH1
 OTew==
X-Gm-Message-State: AOAM5324yG9/yY/uZ/iBlMr2f0m1awA/QkanZp6c1Fx/ceQNz9MP7NJx
 X5QvG93sMTDcdE10SkBirHO42Q==
X-Google-Smtp-Source: ABdhPJzuxaefHZvd38Fmw8Tt/MDEALuJp9Z/DsWNUXhTEtV7qyVR7JWj5ElkPT5QmeIyOw9MdlrDLw==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr803908wrd.181.1632126541068; 
 Mon, 20 Sep 2021 01:29:01 -0700 (PDT)
Received: from [172.20.10.7] ([37.169.24.17])
 by smtp.gmail.com with ESMTPSA id b16sm15249049wrp.82.2021.09.20.01.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 01:29:00 -0700 (PDT)
Subject: Re: [PATCHv2 0/3] Fix the pwm regulator supply properties
To: Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
References: <20210919202918.3556-1-linux.amoon@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9d759c05-c67f-1230-7f58-562dc9bb1224@baylibre.com>
Date: Mon, 20 Sep 2021 10:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_012903_127168_AB8ACB78 
X-CRM114-Status: GOOD (  12.42  )
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

Hi,


On 19/09/2021 22:29, Anand Moon wrote:
> Changes PWM supply properties help fix internal link of PWM to
> main 12V supply as per the shematics.
> 
> V1: https://lkml.org/lkml/2021/6/29/288
> 
> Thanks
> -Anand
> 
> Anand Moon (3):
>   arm64: dts: meson-g12a: Fix the pwm regulator supply properties
>   arm64: dts: meson-g12b: Fix the pwm regulator supply properties
>   arm64: dts: meson-sm1: Fix the pwm regulator supply properties
> 
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts       | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts         | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts      | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi   | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi        | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts   | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts  | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi       | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts        | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)

Thanks for fixing all the other boards !

I'll let a few days for Martin to review, but it's ok for me.

Neil


> 
> --
> 2.33.0
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
