Return-Path: <SRS0=nS3V=JR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9767C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 15:20:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C4761154
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 15:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C4761154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kf6j8MrkoMRa3kOraqjzyC+HgQkFzKzg6XIsAL5ygCo=; b=EEjgK9ersx7ZCgHBKmAwdKK1g
	2V2ab7SoORWMmWgzkCsBU8ewqTyOpWVgiFmA4yaRSEIu8OiADrhGOdyyLeDcC5MVigoINeNPuHiXH
	zF6wmuF7j2ARB56OVcgQM9q1IcE9769W+YKEBdHSMf8IVRpBntNeXVqJFvprfqMQIhGzN1vQVC+Xx
	6Nz52Y015fxNUE+gS8k1Q6vyVDU8cp0MKgnqe5U15/lfqXsTXlgb06xVJ/BCXxT76JoKza9N4iqAh
	o3Vi1C0wnvkWS6e6y0lbBdv5HZw2cLD04QIYfMPGnnf1+/wJKKjKuXmXJY0snaT1Kfif6QyR7FpbK
	P7716ArNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsAV-00CSNw-Fs; Tue, 20 Apr 2021 15:20:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsAS-00CSMx-ON
 for linux-amlogic@desiato.infradead.org; Tue, 20 Apr 2021 15:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=22YXfrzIvJI/e0g2j0aYDyGRkNGq51wKgMJOLCS1QVw=; b=hAuRe3r2PYoONYbn7S6Owde5I5
 TpyxerDP1yhKqoeE/RUi9bUa6uKfNbhE4aAtVwa7TngMJeL7eSIq3qKPJSb8odVqfIQ9NUBj9Jh6C
 qx/8QRbcViNghDzXMXpEJgLAVEBD6I5yrGPjhxNRgYU5HTzCB4SA0NNf+YB5HgeVGaAs/456wVz95
 RdTkImOR3t0rBi9m/zZOWG5s3gNLyh5ZoipZeebrXJhFQsrQ+SDzDfYf8Gef65uVRLF+2IOh0t4xG
 ywSwGwjx5Mmy5Mc6A0DswnvHNP6A+jMX0FQDxxQ5ZZLPGAV+LNf2czFr73T/14k99UAsnNhWvsRbt
 NgBmqvBQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsAN-00CEHD-IJ
 for linux-amlogic@lists.infradead.org; Tue, 20 Apr 2021 15:19:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e5so9360757wrg.7
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Apr 2021 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22YXfrzIvJI/e0g2j0aYDyGRkNGq51wKgMJOLCS1QVw=;
 b=O61+oMWcADefXaQH2XclZbsr8Gd7B9uLWxTfxX0HtcSO9lbF4+LkcGS0iIhDDh61be
 Z8oPcqd/CUqGkbr9KwpjSNpjMGm9Xc9TriI8pehb0SW2S0TRqn7erkeJjTFBS4cJlqxK
 pNcKkTRE71jn+HJrb/nPm0hoGEYJCLsuAiHH/YaP+MkVtO3NIaBt7M7c9eHfnGImLqMt
 Czv9TFOQgwdHlwcGkvbyaQfCPC0PDwBZ3Rb1aB7i8jO+QreDfqaM/DyI3kEtduKOeWfL
 AYh174xTlv8ExB69UMRkOBXLMhtyswnGm4rADX5Tlo9naPUH15Taa8l1N2KngHJMV5px
 R4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=22YXfrzIvJI/e0g2j0aYDyGRkNGq51wKgMJOLCS1QVw=;
 b=tE4dWcSEy3jd6NlyDyR1Qbx0xOwhl6vWwj03yhn8Z+w3588QKg7Kk38EKg02ujkPWn
 IhHAs7lxxj5r8JN0W9SM/pLRZ5evu9D4He06nElOnnjF4TOtx+9l4uP/i72IB0Ypu8as
 oCleZ4TKxnouujljUWekmcWEJXmaPTZCGRFDelAc6ZlF5ic/d1pUNKfJZCAhn5CPm6Bx
 o2veoqICp7MaJptKsMXVNQXV7OxBxjI38DS4VIHQ5s0mcgeuhwuEUFrGcfB2lzNyfkX2
 4O5qm+v3Zk99wsac3sGVtu4gICDmvrUD9K3jaGMo1XDIkYX2cCqRND0CWD4E1iBYiOqs
 J3ug==
X-Gm-Message-State: AOAM530A1b5UmlUyABbLFXshGj/kku6FuBy2HSmw+UIG1Cjpmec8xe70
 P9nRcdxxnvkm68UVHAKNG1byYA==
X-Google-Smtp-Source: ABdhPJyYBtbYLuNyS+ppFk55wLeiEgofP4BmVUU7O9xG8j+pYW7WvxoWIH4KP4AuNd0cwIk7oMLsug==
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr21440298wrg.42.1618931993723; 
 Tue, 20 Apr 2021 08:19:53 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b4:316d:263e:1360?
 ([2a01:e0a:90c:e290:b4:316d:263e:1360])
 by smtp.gmail.com with ESMTPSA id h10sm13764777wrt.40.2021.04.20.08.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:19:53 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
 <cbea511c-5d5c-8c59-f91f-fedc8eec1e39@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0821533b-9e6a-237e-3845-741e82de4ed9@baylibre.com>
Date: Tue, 20 Apr 2021 17:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cbea511c-5d5c-8c59-f91f-fedc8eec1e39@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_081955_711771_36DA9EBB 
X-CRM114-Status: GOOD (  27.43  )
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

On 20/04/2021 17:13, Hans Verkuil wrote:
> On 16/04/2021 13:38, Neil Armstrong wrote:
>> On 16/04/2021 11:58, Laurent Pinchart wrote:
>>> Hi Neil,
>>>
>>> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
>>>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
>>>>
>>>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
>>>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
>>>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
>>>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
>>>
>>> If we can't trust the CEC config bit, would it be better to not use it
>>> at all, and instead let each platform glue logic tell whether to enable
>>> CEC or not ?
>>
>> Actually, the CEC config bit is right, the HW exists and should be functional, but
>> this bit doesn't tell if the CEC signal is connected to something.
>>
>> This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
>> umbrella.
>>
>> The first attempt was by Hans using DT, but adding a property in DT for a vendor
>> specific compatible doesn't make sense. Another idea would be to describe the
>> CEC signal endpoint like we do for video signal, but I think this is out of scope and
>> this solution is much simpler and straightforward, and it's more an exception than
>> a general use case to solve.
> 
> While a DT property might not make sense in this particular case, I still
> believe that it is a perfectly valid approach in general: whether or not
> the CEC pin is connected is at the hardware level decision, it is not
> something that software can detect. If the designer of the board didn't
> connect it, then the only place you can define that is in the device tree.

Agreed, we need to define a smart way to declare CEC bus relationship in DT, the side
effect would be to handle this particular case.

> 
> Anyway, for meson I am fine with this solution. At least it prevents creating
> a non-functioning cec device. So for this series:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks,

Applying this serie to drm-misc-next

Neil

> 
> Regards,
> 
> 	Hans
> 
>>
>> Neil
>>
>>>
>>>> Jernej Skrabec (1):
>>>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>>>>     driver
>>>>
>>>> Neil Armstrong (1):
>>>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
>>>>
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>>>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>>>>  include/drm/bridge/dw_hdmi.h              | 2 ++
>>>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
