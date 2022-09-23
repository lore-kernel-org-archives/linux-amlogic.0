Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5388EECAAD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Sep 2022 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwBXJZ1+I9a2qbAwqSSO+0m7os7PwaENUmhCyPItWig=; b=WO7jeUaGxCPuUz
	I+pD8ARrTlEra9UjeImfWfIytLzNfNlabafCUQuCVhf/wu+6jjbdxOD+C0G/X7OMxrfOyVUOa3fvB
	PqssDDLg5RFqdDUr9kvwjU7Q3UpqNCrFmzpPJ7SGJdgAIW+9wBX5n5v3qjHLE68lqyy5glMHJP+tD
	+yysozWLvrcsuHkJxJLJp02ZaEbeQ3by93d5SC8wPFqPfGU0ZWf3NlUVG9gO/q2P4vj5ZO4eRSr58
	rYx/anzl3WKYPkiBiI1RWAfNVyIZSNFNF7G7Iu2CfW2KKp6SuGHqmM1U+b459ftAxK3UWwtbJgoHv
	MmmWAxYyHpweAHK8kWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obejI-003Cni-IO; Fri, 23 Sep 2022 09:12:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obejB-003Cim-0V
	for linux-amlogic@lists.infradead.org; Fri, 23 Sep 2022 09:12:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s14so17433929wro.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Sep 2022 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=yOhBcsSjO+MpzEhoe8MX0+hDz2sg0Smantc0+52tgkE=;
        b=NjlqivXbtpQ5CRPwvLVYTWRRKOozg7t6ougcXLcAl9rRG7ABs+TlL/HReI/tSZjG44
         fcO/MY/f7yRHW+LAdUucAa9lxh+knCGFWTqz0jszx/C/ZP6pvgBU3PInPUeY1/55oQtE
         6Owj1nMJglWOnZ89roBuak811ui20t0gErNDe/99puoK9nctXPdzM/5RpYFpidIPtl6p
         SxlAP7l95SC5jmdEfYViACDknDV+tDUhBfwBN5UMIlXWXz9737qkS9ukG3mVLVjG1BAp
         dXIdlRPYxRJrQ0iUJtIh/yD2+2/qwg97AQcWFBsR5S6zRXu/nO3ieFrkJof8DX7Ro9HG
         vJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=yOhBcsSjO+MpzEhoe8MX0+hDz2sg0Smantc0+52tgkE=;
        b=TeXWFdImEGOxMv6CPmbQFzt1Pn3gWF+tOFya+tPL4UkeuN1Hhu8QTgoiYKRYMPmh7E
         9LwTt3nxEXOHC4WXV2NfDcWs5TgsVUvjGKgjr33VsgWQLIJL+o/dnWmS25lXwCcQQIYg
         YwgVtNHY0nEYwN+ihppcrmQulEONQwAxBYU+eaf9HJAZj079UaTbtIPjWkwL0ZIVBCIF
         2TnKTwYsHxMDjncoVYQiUoyfeF2c9SsyXnQ8N4OlKEfYpIVrX6fIu6/YH7eY2Zwxcd52
         +2xsAiVXVp6KEWRFb4VCvgmuvD5S+wG5T9wMdzqojZxCWlidQQpcixMWEjPeE+JLQ4vK
         ooJQ==
X-Gm-Message-State: ACrzQf3sS2VZoUp5yVVU7w8c3taEV3zLMmMZZYNkWnrsQoJZJmRT7qzM
	U7vn0YPncnG5+ZjtRVHh1rtOrQ==
X-Google-Smtp-Source: AMsMyM4as+Pxy/mIXDrxTa6jW7JBFzmQns6zeg2+qRdsIpV8qVNxU+HJKLnue+tm/4+m4R+F/xlsIw==
X-Received: by 2002:a05:6000:1788:b0:22b:315b:450f with SMTP id e8-20020a056000178800b0022b315b450fmr4801695wrg.615.1663924324444;
        Fri, 23 Sep 2022 02:12:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5990:ddf8:daac:3833? ([2a01:e0a:982:cbb0:5990:ddf8:daac:3833])
        by smtp.gmail.com with ESMTPSA id az41-20020a05600c602900b003b492b30822sm2050892wmb.2.2022.09.23.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:12:03 -0700 (PDT)
Message-ID: <db3b3082-5278-7ed8-4322-2422cec227a5@linaro.org>
Date: Fri, 23 Sep 2022 11:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5.15 247/779] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Agner <stefan@agner.ch>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org
References: <20220815180337.130757997@linuxfoundation.org>
 <20220815180347.894058731@linuxfoundation.org>
 <892a917454bd0bbfe8a4d34a5170fe50@agner.ch>
 <685b64f60375b69c5c790286f1386be3@agner.ch> <YyBoACiWvW1UnfQA@kroah.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <YyBoACiWvW1UnfQA@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_021209_167221_0ECA9120 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Greg,

On 13/09/2022 13:22, Greg Kroah-Hartman wrote:
> On Mon, Sep 12, 2022 at 08:48:24PM +0200, Stefan Agner wrote:
>> On 2022-09-12 18:08, Stefan Agner wrote:
>>> On 2022-08-15 19:58, Greg Kroah-Hartman wrote:
>>>> From: Neil Armstrong <narmstrong@baylibre.com>
>>>>
>>>> [ Upstream commit 0af5e0b41110e2da872030395231ab19c45be931 ]
>>>>
>>>> This implements the necessary change to no more use the embedded
>>>> connector in dw-hdmi and use the dedicated bridge connector driver
>>>> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>>>>
>>>> The necessary connector properties are added to handle the same
>>>> functionalities as the embedded dw-hdmi connector, i.e. the HDR
>>>> metadata, the CEC notifier & other flags.
>>>>
>>>> The dw-hdmi output_port is set to 1 in order to look for a connector
>>>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>>>
>>> HDMI on ODROID-N2+ was working with v5.15.60, and stopped working with
>>> v5.15.61. Reverting this commit (and two dependent refcount leak) to be
>>> the culprit. Reverting just the refcount leaks is not enough to get HDMI
>>> working, so I assume it is this commit.
>>>
>>> I haven't investigated much beyond that, maybe its simple a case of a
>>> missing kernel configuration? DRM_DISPLAY_CONNECTOR is compiled, and the
>>> module display_connector is loaded, so that part seemed to have worked.
>>>
>>> Any ideas welcome.
>>>
>>> FWIW, I track the issue in the HAOS tracker at
>>> https://github.com/home-assistant/operating-system/issues/2120.
>>
>> It seems that backporting commit 7cd70656d128 ("drm/bridge:
>> display-connector: implement bus fmts callbacks") fixes the problem
>> without reverting this commit.
>>
>> @Greg, can we backport this commit as well?
> 
> sure, now queued up, thanks.

Backport of 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks") is still missing in 5.15-stable.

Thanks,
Neil

> 
> greg k-h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
