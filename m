Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB0C6FA82
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Sep 2022 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSbOsRQEVsnTbeEsYO8x7OcwuWvK1JemNcuC4YT4YfA=; b=IQIgIYNjfKNq/kjlPYlgzROuJK
	DCeJUXyW/m6jnBF2+fXHhnvgcm2tM/Caxn0pQmGrVdA9HejtYuGQce5h7LS/Y+U5QUxfr7c8/USY4
	6g264Z4UZ6lDmrTqGvIwVo+aJnEMSt2lJgd27NSnfxmxHioxk5i9qT+sCPrs+UPjO2nLUoGdGZAKM
	yAtcaGYoEi4nUnzUI1OqrzWmQChpKHO5wRds+RCvCqkvKyOHacBe3c6wh88eI/LmlwQvM4lKYSlM8
	LQFV9xBrrIeVYIqrKcu6Db/7hXt/4b9moPp6dhC0CVSQRHVXNBuYl0CoRayK0ZlEFJ8/t/nrwRVxp
	w12s4GhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf0v-003LL4-Lg; Fri, 23 Sep 2022 09:30:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf0s-003LIE-FH
	for linux-amlogic@lists.infradead.org; Fri, 23 Sep 2022 09:30:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id c11so19440865wrp.11
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Sep 2022 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=NsCaxjSsnAPb9dr7jfz45Z2k7us6uvI3bad+ssBYPRY=;
        b=kbAlmpgaEhf+5kfZd0SX24hWQBfs6lcGNXHiOLu0XLbPbbDq0VKm8G5TI+fPbE0Vm1
         JomapF/69N/+VHhQNzJckRo24YdeHtN2fRdvUhLT/DUjRZv7hny8rK4zUIZStUCYN2Bh
         wVUvQovR86bYYvrqW2XAIiCP7d2AszTLEftzWrTtOUP5E6SHsqL3tD+HHW6GfcIVPMzj
         Pes9Bk7HYpkTskt9vLb7QCAb6XvOl6dCcssaqJwfalDPtBykq8O7KdtEdTJEB9U9VfcR
         C4HRGXiUbojFb0hx6rCow34cFwi8wqHyx+P0OqGbC0ikFlnI/7iEt1nB82stw5N/CJpU
         RtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=NsCaxjSsnAPb9dr7jfz45Z2k7us6uvI3bad+ssBYPRY=;
        b=my0QNTQie2zaMZpLStN3L744dz2Agg5KeqY6dc4TbeU823vz92wUwnatRGKyBafzFq
         X4GLkvSbyXPBJK8duBsAeLos4TcvY2Z3CsfMrVBTEV9bhBYKH2T+ebaAz/RC0ScWFV1Q
         aQQ59yfl/0e/G9qksf746HP+SRVPDVKyKkkAhyLkrT/UR/MIs8qAOemYw64ZkpB79tMR
         Mm06zjwpYTpCO602gJV/EiYKMhrRclv0XemLPDP+dawMYAhQBjPM3ezblnbBmuOqXyCn
         oE5uTjBdxz7kNX7XVQvGLKOpOb4tsfqz+vZRArkDgoIjeL/TH04+KJJMpGgyc7zswUl0
         572g==
X-Gm-Message-State: ACrzQf2uE/0ZlEMTELkTBzj8qpsSpaeRFgL3LxQwcJiJmf4jMqCFPU5W
	ZaubnbnAiqU+AYqx/ItV9ygcDQ==
X-Google-Smtp-Source: AMsMyM44w6e4lTsfnYrmAUHtoedhrpX4y0mRP2LzWbfviDNNggw30fENEV3+xEJfkW3hyLy2wWMfFg==
X-Received: by 2002:a5d:53c8:0:b0:228:62ee:64cb with SMTP id a8-20020a5d53c8000000b0022862ee64cbmr4495871wrw.267.1663925423276;
        Fri, 23 Sep 2022 02:30:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5990:ddf8:daac:3833? ([2a01:e0a:982:cbb0:5990:ddf8:daac:3833])
        by smtp.gmail.com with ESMTPSA id r9-20020adff109000000b00229b76f872asm8619293wro.27.2022.09.23.02.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:30:22 -0700 (PDT)
Message-ID: <b9aa1178-5848-70fd-2dc1-9f36d845985e@linaro.org>
Date: Fri, 23 Sep 2022 11:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5.15 247/779] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org
References: <20220815180337.130757997@linuxfoundation.org>
 <20220815180347.894058731@linuxfoundation.org>
 <892a917454bd0bbfe8a4d34a5170fe50@agner.ch>
 <685b64f60375b69c5c790286f1386be3@agner.ch> <YyBoACiWvW1UnfQA@kroah.com>
 <db3b3082-5278-7ed8-4322-2422cec227a5@linaro.org>
 <Yy154kHD7PPtj05W@kroah.com>
Organization: Linaro Developer Services
In-Reply-To: <Yy154kHD7PPtj05W@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023026_567161_176DCC45 
X-CRM114-Status: GOOD (  16.13  )
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

Hi,

On 23/09/2022 11:18, Greg Kroah-Hartman wrote:
> On Fri, Sep 23, 2022 at 11:12:02AM +0200, Neil Armstrong wrote:
>> Hi Greg,
>>
>> On 13/09/2022 13:22, Greg Kroah-Hartman wrote:
>>> On Mon, Sep 12, 2022 at 08:48:24PM +0200, Stefan Agner wrote:
>>>> On 2022-09-12 18:08, Stefan Agner wrote:
>>>>> On 2022-08-15 19:58, Greg Kroah-Hartman wrote:
>>>>>> From: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>
>>>>>> [ Upstream commit 0af5e0b41110e2da872030395231ab19c45be931 ]
>>>>>>
>>>>>> This implements the necessary change to no more use the embedded
>>>>>> connector in dw-hdmi and use the dedicated bridge connector driver
>>>>>> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>>>>>>
>>>>>> The necessary connector properties are added to handle the same
>>>>>> functionalities as the embedded dw-hdmi connector, i.e. the HDR
>>>>>> metadata, the CEC notifier & other flags.
>>>>>>
>>>>>> The dw-hdmi output_port is set to 1 in order to look for a connector
>>>>>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>>>>>
>>>>> HDMI on ODROID-N2+ was working with v5.15.60, and stopped working with
>>>>> v5.15.61. Reverting this commit (and two dependent refcount leak) to be
>>>>> the culprit. Reverting just the refcount leaks is not enough to get HDMI
>>>>> working, so I assume it is this commit.
>>>>>
>>>>> I haven't investigated much beyond that, maybe its simple a case of a
>>>>> missing kernel configuration? DRM_DISPLAY_CONNECTOR is compiled, and the
>>>>> module display_connector is loaded, so that part seemed to have worked.
>>>>>
>>>>> Any ideas welcome.
>>>>>
>>>>> FWIW, I track the issue in the HAOS tracker at
>>>>> https://github.com/home-assistant/operating-system/issues/2120.
>>>>
>>>> It seems that backporting commit 7cd70656d128 ("drm/bridge:
>>>> display-connector: implement bus fmts callbacks") fixes the problem
>>>> without reverting this commit.
>>>>
>>>> @Greg, can we backport this commit as well?
>>>
>>> sure, now queued up, thanks.
>>
>> Backport of 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks") is still missing in 5.15-stable.
> 
> I see it in the 5.15.68 release as commit 590b4f10e3a4.
> 
> What am I missing?

Nothing, must be tired, was looking git log in the wrong path...

> 
> confused,

Sorry for the noise,
Neil

> 
> greg k-h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
