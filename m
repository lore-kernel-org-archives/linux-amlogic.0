Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2B3C47247
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 16:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847DA206A4
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 16:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrqX0G8r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pCbw8Q2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847DA206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YHY71ozWWjz/uL16WK+AHCtoEwojExR9TSlVoqjGm8o=; b=hrqX0G8rUlRojwlfbOwGYIr53B
	sdhi7ye3T1UKXm56ET/BdSwyXBjz/5hXeaNrkPrJfnRzcd+WzO3+qqZgWCQZ9mBPVRONv3rp8x2i2
	iXTJqaa+4PiwpwoyGg/AnFWBBFcN+rwGGtGs88U/8YX+2e46GMq8iTmVpYXvPr8/6D+ZsS49nf+SA
	0iaJdD++YOw+bdjZRZRC/3EtIu53QO8wnqhWxD0PdKxfn/gQAGYNNFlLnsJ8zhzonl3NLZoq2GaQy
	xHDRb9YPQp3tuoNA2v/+jwbDaBrP78IYZ/6iERXmdkN+QHGefWqpQTjjRw5TTgh0hb/EwfdMnFvrM
	IM3WDZmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW058-0007BA-Ap; Tue, 05 May 2020 16:06:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW04y-00072M-Mg
 for linux-amlogic@lists.infradead.org; Tue, 05 May 2020 16:05:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id j5so2624337wrq.2
 for <linux-amlogic@lists.infradead.org>; Tue, 05 May 2020 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=njl+I1KZR8dAJRFqU7HOVFmyMwpktP+Payzdk7cqiZo=;
 b=pCbw8Q2Djt96EsEtPl4Xwf9WOgp+W7CXvZgaxdqcpirmNYjSYs2lAQfYP/qBeN/imW
 qVMnYbtAIPWG5WvEXKrE3XH56YcQ5PblSP5dxSicG19C+Fm9IHnOwcV3lDboZ/rahDZX
 KaV7vV6svD+bncNQN5UeWvAx1zaJqLFE+x33f58dhDIhxEQ+WgOKmPKT3J6RZ8o0i06h
 kf7BZ1v3yDpTlV6C7mQTqSZbNF8qq3GoMgdq9JlBFZzbejBN6FDDzVfxn08kDc2K1pZP
 dwfSr/9J/i1UZKnhFzYWvndqFjCsIHYjOlxrqmpfh+pStSpfhfIEGQUBA5z85DMujbZr
 MQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=njl+I1KZR8dAJRFqU7HOVFmyMwpktP+Payzdk7cqiZo=;
 b=NZZoiHpqZWG8BBKV2JsKBj7BbZOS4G2uRWOBLA7QsxIZfwM+VvNV9tJocnLU+lm3z0
 Swi+bBk0Eg4TBQvZtFzk/ElER2dno6KA/800AhZ/UI8uZatiug3uGM5FpSy92D6MH76m
 q6Kgz+g9+kxQCKrXbO0vfwXjdOIu4tfeUrgRKwSrtSk9BAQGcv42XI1wvnUuHsff1RjJ
 We9UKTnZdC4OMcHo+37ub+NZrwiHCiKgtvXU+zlBlo/gMurgrv/LjGmDuRBlGcUzTOyr
 jDdNNAyoRe2XlLeDr08f8zXC0M62sQ6zy1/rMT95/aFaM5xZa2NSgxNOyWuCSd2/24Zt
 gdCA==
X-Gm-Message-State: AGi0PuZXbibnsKCG+iYp00+CTKcqKitgkY5Dhn2yiZqYxxLM5Zne7E13
 1PdwTT74YYV/Q9Yooq5a7XusxA==
X-Google-Smtp-Source: APiQypLoB4fjwTQJDOAaK7x/BgWoRefOlMYzgeBPm4DGbTUjdPo8UYmkhAaAStq6Y7TclKEt1oNfMQ==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr4240620wrt.270.1588694754820; 
 Tue, 05 May 2020 09:05:54 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id l19sm4636869wmj.14.2020.05.05.09.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:05:54 -0700 (PDT)
References: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
 <20200428210229.703309-3-martin.blumenstingl@googlemail.com>
 <1jlfmdi9uw.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFoEh8qKYFONo1SHnvwhDwjUa5bMnnT1Kbu8=4rd=T-8Kg@mail.gmail.com>
 <1jh7x1i3hj.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFq_USCNNps3s4+C_1hriycrxtRMKJvnPFcP59CZmLXbGw@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v6 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
In-reply-to: <CAPDyKFq_USCNNps3s4+C_1hriycrxtRMKJvnPFcP59CZmLXbGw@mail.gmail.com>
Date: Tue, 05 May 2020 18:05:53 +0200
Message-ID: <1j1rnygye6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_090556_735666_35A10B7B 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: DTML <devicetree@vger.kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Anand Moon <linux.amoon@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 05 May 2020 at 10:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:

> [...]
>
>> >> > +
>> >> > +     return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> >> > +                                        onecell_data);
>> >>
>> >> I think registering a provider for a module that does not provide clocks
>> >> to any other device is a bit overkill.
>> >>
>> >> I understand the matter is getting the per-user clk* pointer.
>> >> Since this is the module registering the clock, you can use clk_hw->clk
>> >> to get it.
>> >>
>> >> Once you have the clk* of the leaf clocks, you don't even need to keep
>> >> track of the clk_hw* since you are using devm_
>> >>
>> >> Afterward, we should propably discuss with Stephen if something should
>> >> be added in CCF to get a struct clk* from struct clk_hw*.
>> >>
>> >
>> > [...]
>> >
>> > Hmm.
>> >
>> > I am not sure the above is a good idea, at all. Unless, I am
>> > misunderstanding your point, which may be the case.
>> >
>> > I think above "shortcuts" could lead to abuse of the clock framework
>> > and its internal data structures. When going forward, this could make
>> > it unnecessary harder to maintain the clock framework.
>> >
>> > I know, it's not my responsibility, but from my experience with MMC
>> > and SDIO interfaces, is that those have been too easy abuse - since
>> > most of the data structures and interfaces have been exported. Now,
>> > it's hard to roll back that, if you see what I mean.
>>
>> Indeed, it worth clarifying this first.
>>
>> With clk_register deprecated in favor of clk_hw_register, we are likely
>> to see that case rise elsewhere.
>>
>
> So, according to the separate discussion [1], I think we can let
> Martin decide what option to implement at this point.
>
> 1. Implement the "clk_hw_get_clk()" approach. The preferred option,
> but requires wider changes of the clock subsystem as well.
>
> 2. Keep the existing approach, with devm_clk_get(). I am fine with
> this as well, we can always switch to 1) later on.

I have a problem with this approach.
The dt-bindings would include "#clock-cells = <1>" for a device that
does not actually provide and only needs it has a temporary work around.
Those bindings are supposed to be stable ...

I have proposed 2 other short term solutions, let's see how it goes

>
> [...]
>
> Kind regards
> Uffe
>
> [1]
> https://www.spinics.net/lists/linux-clk/msg48373.html


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
