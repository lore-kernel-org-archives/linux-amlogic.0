Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A25DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdrS7RocePpfURiovjG4hFb2adf8mW5ETxf8iX2Euzg=; b=gxOCkoG39XVUS7
	bv56SpakhLJ2eZ4NVRj/RgI8Ngrr1eIYuhldex0nbXSO101gAG4OwidXH3/3d5RYkBY9sUddI2WmH
	C7l5IbbJO6rBA++3Fkfic50769kl4RIt8Hoq7ebojh/D6rnxcJ0OSpOJ4p4Xh1INq7J1exhv2fN6C
	N4ME6db445ynS/4xgJDvAayy61FnY9+poIeJ+fmX4+Hb+eLle4FkDMdNbkOlTwx6UZe5Qvfqzjf7u
	ovhb/TUcaldYQPCL4JwHMmbyeSJM3MyLla8QMItzF4QE3x3lHroe1PLk+SFvxsjhmltD053yIjGJs
	FGVlYbbinDgkmFYBhlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHeB-00DjQ8-L8; Mon, 04 Apr 2022 08:01:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHe8-00DjNX-Jf
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:01:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id h4so13091446wrc.13
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fchq955hbINLxP1mfvpxKWtqMLR29zfsjFGO0tToAUc=;
 b=3kCbDAxruWLN43MM2kRlB4Gp+rcWnHK1FlJNINZdCpVw9O5zlIrvIad52lO+tYJzIv
 xj/VH2a9SXY4/53T7yF8x/p7TtX18Bp58ouR6Kdphjc6OA6aInZhSIF0wklOprZfgjUu
 VolqyD+gBeRHMN09uVqYaH66HnemWGcVyJEYLFGPITL55dtYt9JToehywBwKCZQuqCsE
 J1yyv5mCGH8MYKKl1f0b4p9sfBv+tGrbyFjSgfI3sxlWUeA2bqi9VnTcrVsbBdu0HSNy
 CzhPFlKxpyqM+POwVHH3QqjZnJWklwkNbKm2mzmB9Fep3r2kanhWq0rH6oREg8YmblkW
 CVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fchq955hbINLxP1mfvpxKWtqMLR29zfsjFGO0tToAUc=;
 b=5IMbq9uXA0TRJ6BkRpzYgLFemhvfqiyAcUfKaSjC9X/oXluvjd3Xn9UMITiZkopH2t
 Pu6vbfkYgWREJj2vu5793RvHaXgPhnAeknjMsqIbQDxg+aoIyALY82fE9dwE+tOC39w1
 7qYnbAhQeD1K7nKS3Vk+1w4u/GIzERxJ6r5ayBTW+LKlNTWBiVCoeipxUqa1BEguVb65
 T6xUxhNR3jGumb4ZavpUsLO+fjg2BbydX3h6/g1C8BIgftPeSkGVK8IgxeplJmle7sf5
 XpWtwzFouFMaHyHOtarcSLwN/T7y1Q5rcWgVnnuPJ/4NeT39nsQbfWGh07GWXccSPlLq
 gCgQ==
X-Gm-Message-State: AOAM5306A3zokMsKSrGolB4IDANRdHMwPFmuDIk1EQSxyVwn12ESytKu
 1yiVYQNM5Sp3TmJRCQEB4o4bFA==
X-Google-Smtp-Source: ABdhPJw8Y+rzIATLf/wu5PrpGYSpAlB9L5KuCHMGGdLeH+iefS3uvrM9XgZfxeA/DFgCXhCdpQnV3Q==
X-Received: by 2002:a05:6000:156e:b0:206:1205:166c with SMTP id
 14-20020a056000156e00b002061205166cmr2588330wrz.37.1649059264921; 
 Mon, 04 Apr 2022 01:01:04 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b0038ce57d28a1sm8563313wmh.26.2022.04.04.01.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 01:01:04 -0700 (PDT)
Message-ID: <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
Date: Mon, 4 Apr 2022 10:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: en-US
To: tanure@linux.com, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vyacheslav Bocharov <adeep@lexina.in>
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_010108_707602_C5BCC88D 
X-CRM114-Status: GOOD (  15.12  )
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

On 29/03/2022 00:31, Lucas Tanure wrote:
> On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>>
>> Hi Lucas,
>>
>> Lucas Tanure <tanure@linux.com> writes:
>>
>>> The default duty cycle of 33% is less than the required
>>> by the I2C specs for the LOW period of the SCL clock.
>>>
>>> So, for 100Khz or less, use 50%H/50%L duty cycle, and
>>> for the clock above 100Khz, use 40%H/60%L duty cycle.
>>> That ensures the low period of SCL is always more than
>>> the minimum required by the specs at any given frequency.
>>
>> Thanks for the fixes!
>>
>> This is going to affect all SoCs, so ould you please summarize how your
>> changes were tested, and on which SoCs & boards?
>>
>> Thanks,
>>
>> Kevin
> 
> Hi,
> 
> I only tested against the vim3 board, measured the bus with a Saleae
> logic pro 16.
> The measurements were with 100k, 400k, and a few in-between frequencies.

Thanks, it's a great addition to have !

> 
> Is that enough?

A test on GXL/GXM (VIM1 or VIM2) & GXBB (Odroid-C2) devices is lacking before we
can merge this.

If I find some time, I'll have a try, but everyone is welcome testing this serie
and report if it still works fine for them.

Vyacheslav, do you think you can test on your JetHub devices ? it would validate GXL & AXG.

Neil

> 
> Thanks
> Lucas


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
