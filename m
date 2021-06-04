Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD83C07E94
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 10:40:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D548613B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 10:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D548613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=orzWFKrjCtHIOvWoo7+bDLmckjGq6n8qqGS2X5ccxO8=; b=gKYPOe8vSJFG1mpUyZcrjNBEqA
	fx+eaI8eiNTorMDo3m8Zo5lDl1oXnRedVJY0yDHUXjWxDzqIUz01GTT8gDEufrbqgiePk7+qiD8Vg
	sPCIWkPIwTcg5AQXh6lzjQL3s7tOlx7le04GtqbrbzGxxO5EfsOJwi4E8CjmICaPJb5Qhacjop8Tz
	iDhTEBTX6iz4egn5YyX0gdEYQzoyM+CiIjkyAHq4Cx1kAjNjYnu8w3pA6kF3WqFxzOCNRpMCcnC08
	4rZXswUXytWH+SLOrjJ3Eo47XxSoS8y6HMpToofp9J7L2A+EhTjv/ovrSz899Gwbt2mSW6DUcwBD/
	AcMQQR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp7Fg-00D1JL-TO; Fri, 04 Jun 2021 10:40:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6vL-00CvA4-Uw
 for linux-amlogic@lists.infradead.org; Fri, 04 Jun 2021 10:19:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id a11so6868580wrt.13
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jun 2021 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ziavbqWUEKiMtC7t1VjCERXgHXd+SAZbkk0wx19OWY=;
 b=AUmYpKUCqqVGkR1DU1J3h/uIiApIX+1iARiLeBsd7QAn0XFvm+gZT5xc9DaSZtULIm
 u0BXLbssp0yBgyf+pnDOSb/t1la/zL9BcIfdvHtDV0E42STBiWAJLS9nKeIqzhG58WtH
 RroFtgfVVxMLRxKH0IIAp+ongjmY4cgmnFE1aA3VFBiIv0JuJm7TnA9T058UNO0Y0dsL
 nHSDWD47A8DLryT97t6IdgiiA35M0jZCUU5Hwa3ru/jHoPnpDe7CBpXVr9AH0AFq4Ur+
 t5ClveGnOhzNasKZdH89SEOcUfoKZJEkA+F7dKRcZPIkEvkRHHShh8b5kBESyzhJpzOn
 hTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4ziavbqWUEKiMtC7t1VjCERXgHXd+SAZbkk0wx19OWY=;
 b=svrKZcFRHARSPkgZLhGoBHmHzdLpUXhJJYpSyP3AWTNCo+YvSuecKC518J8OxwrkDL
 6h8DCFArn8Nf++0jxZjt1sj909W6IquZ2xVHtJK8DZ5Cmn+ne7JKre8jSjYRWkpwmc2c
 QyyP8yxnDEiMqFTnO/pGdCViFwt9I3M6kQxYqmfGAF/+MVnnqSynpBZKTxva8GD/XXxX
 +uvT5Lf7A92YigCRgLpGHf5x7CIpLcskeunUuhzmI6KXSZAbAJ1w+F/XMX+3jMz1aEG1
 fxfUiH+RET/bpsD6AS2Lj78BU/Ko4qLAaabBGWHuUeulNi4LYKXcbh+DBC3ds0PRc32O
 SXPw==
X-Gm-Message-State: AOAM530tLcULTF+wf6p2kF65pl/6lxCxj7crr9D/OPsvaggjKuSAdl9F
 rybyFrFUqJa+8SXYDxYZVpr4mA==
X-Google-Smtp-Source: ABdhPJyZPtI4shQfAGMbh/07M+zranWNJi/sP7idE2MNMX+O8VKGf4UxO2fV62ARG2iaDO6Lb+0Gig==
X-Received: by 2002:a5d:5251:: with SMTP id k17mr3105093wrc.153.1622801970016; 
 Fri, 04 Jun 2021 03:19:30 -0700 (PDT)
Received: from [10.1.3.29] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q5sm6228890wrm.15.2021.06.04.03.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 03:19:29 -0700 (PDT)
Subject: Re: [PATCH 3/6] arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator
 gpio
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-4-narmstrong@baylibre.com>
 <CAFBinCB+SyCmxrjJLcuy=mLsChPZ9i_1TsaWkL3kuhPO1wGwWw@mail.gmail.com>
 <802340ba-edd1-d148-4c6b-e2eae9c2a096@baylibre.com>
 <CAFBinCAVeEVWVmpn11RWxuvYBpAVUj37R=U7ykv+YPUNYYTLMA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <353cb179-1ff6-9586-f6e8-e692b11d1e12@baylibre.com>
Date: Fri, 4 Jun 2021 12:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCAVeEVWVmpn11RWxuvYBpAVUj37R=U7ykv+YPUNYYTLMA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_031932_067322_CF899E0F 
X-CRM114-Status: GOOD (  15.81  )
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

On 04/06/2021 12:13, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jun 4, 2021 at 11:43 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> So I'll add:
>> +&vcc_5v {
>> +       gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
>> +       enable-active-high;
>> +};
>>
>> in odroid.dtsi instead in this patch.
> that sounds good to me
> 
>> Not sure what to do about the regulator-hub_5v.
> maybe dropping this regulator overall? we're using gpio-hogs elsewhere
> for the USB hub's reset line
> or dropping the gpio-hog and keeping this regulator to manage GPIOH_4

I'll drop it completely, it makes no sense to have a regulator for a HUB reset anyway.

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
