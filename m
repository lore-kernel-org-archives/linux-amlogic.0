Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D892C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3MNNYURn0zPr8GqdP+gob56MGEt81RhHdat8lYAo5vs=; b=wOdhac8udDBCeXf+SKlWY0qoRe
	bSSwm74lVEGpwn6W4Ec4saygBe893Ndvf3VRGq9Q2xfDzpSTBNAD9yHvVYKGv/lCS78/0UL33Wq9Z
	+jBAENLI3LRbh6DugeEJMkya1z/GuPRMIzpfw0OGXNa4F7RjGJIBgcDhBZj/y+ZV3O0eisj26j0RN
	uHDx8BL7xi/WY8ShOceX9/gC+I1aOgEr3eEv2SR35l089p1bDho+8kcLZu54WUnlFS3wDDJ9HtWgX
	+U4/jSjFyWsZ1OutOUR4mq3gxpfL5baJn1EhdFH6W0/Knj5le912k2EK/3yaeAEig2riqczz7AbTh
	c3aejbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7vzi-005B62-OJ; Thu, 13 Jan 2022 09:02:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7vzf-005B5Q-VI
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 09:02:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id h10so8853791wrb.1
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jan 2022 01:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvIRpPQbSiGEWcyGLRNm1cOz7dWNqNhVDRO3kvqdmic=;
 b=i9chsycbkxS3dsX9hlusZTcpusfTcFDGa4ZlGLLnqccPqhMQBhqWKcSLXGvNuweZma
 +xOAxqjTZMxJHQfwEq9qriWV3TjEy4OIUX/vE8soq38dP04V2WAE3mKQOaZg8Siq+3nN
 lU56t59IPEAGjCJmMBf4xETm6M9BZNw1Y4l+UvTWJsiQHsLIwvVRHFQJwmG8W9iwJ6uZ
 hsj6aPGMrNqOoFmEA6zAMdmzWtZnohlbPplwBo+C7cHBdPj+TIUNIYgK2InW4/FpgIm1
 MRvZrdIqhXVQWHqstlhXzw66zEaQ6SwtGKynFtjGv8EJxSIwJDD/SZouYIt8hwPbVl2k
 0jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cvIRpPQbSiGEWcyGLRNm1cOz7dWNqNhVDRO3kvqdmic=;
 b=aQz85o9yWK+T2DNO/NI2DpKyFBb6bGm05wIovTVRHLuIBNBk3qJp7LRzLuycQ/3wmw
 ikzABtxykn+fIlzrgeG5FlGtlPrOXhokeQyi4PM9of/lL97DzBFprfvOEtGC9H5oa10l
 ylk9/O0AJB7iNjjuDHqQ54g3dm3tcTaO62SUKnLnf6gv/HWNs3JMZxsbZ3jhMVzCtO/Z
 j89zqutCso6yyCYAhZG50vjfOUYrMKnbmYRWB1UknEcTgUa9OGGzQKt9O52E4M7bcjmF
 uacl7MdeQXWSPZiWkb/HtEVIc9MrOLwixDQmInK3Luum7Wlwpp37+8E3iE6Dnp8BgGsC
 IQHA==
X-Gm-Message-State: AOAM530vCjvLm2tJLaOxIyAtSBsrSf0XOSysSlrM8yuWljFhi9J6TkMd
 l9kxgnMK8FORxVf3payZncIkUgOCQucmbw==
X-Google-Smtp-Source: ABdhPJz3Qxo7jGkrIffVIIK9JY8KckOFxjqQOF2gVmHo1qQTo8PoG650BwP81rWXI/2IMFpum5YWOA==
X-Received: by 2002:a05:6000:4e:: with SMTP id
 k14mr2193148wrx.184.1642064522680; 
 Thu, 13 Jan 2022 01:02:02 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195?
 ([2001:861:44c0:66c0:bece:ab45:7469:4195])
 by smtp.gmail.com with ESMTPSA id s22sm6564501wmc.1.2022.01.13.01.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 01:02:02 -0800 (PST)
Subject: Re: [PATCH v2 0/3] meson-g12: add pwm and uart pin muxing options
To: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <20d3b8da-2a59-a95b-aced-b341093ea5dd@baylibre.com>
Date: Thu, 13 Jan 2022 10:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_010204_048623_3BFC2666 
X-CRM114-Status: GOOD (  14.52  )
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

On 12/01/2022 22:16, Gary Bisson wrote:
> This series adds a few pin muxing options needed for our HW platform (to
> be submitted soon).
> 
> 1- pwm_f: adding missing both GPIOZ_12 & GPIOA_11 options
>   -> tested GPIOA_11 as mipi display backlight
>   -> order for this patch is not alphabetical but follows doc order (to
> match current order)
> 2- uart_ao_b: adding both options for ao_b uart + its rts/cts pins
>   -> tested on custom hw too
> 
> Changes v1->v2:
> - rename uart_ao_b signals as suggested by Neil
> 
> Let me know if you have any questions.

Thanks, I'm waiting for Linus to pick the pinctrl patch and I'll apply the DT patches.

Thanks,
Neil

> 
> Regards,
> Gary
> 
> Gary Bisson (3):
>   pinctrl: meson-g12a: add more pwm_f options
>   arm64: dts: meson-g12-common: add more pwm_f options
>   arm64: dts: meson-g12-common: add uart_ao_b pins muxing
> 
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 43 +++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  6 ++-
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
