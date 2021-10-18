Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833C1C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 07:50:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B76610A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 07:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B76610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5tzERwuKwicQrUJfdIquxbYOv1LRfh+OdyO8pjwPr8c=; b=b9DQpH0GN04m3FkoBSmSa2vuRH
	AtK65sWdypS/p8uKYzzLhrMXcXro49bZNj5vl6arzlc0cI2xaWpHdNs06y9HRv7bKrvjlMMiwvd9G
	LjAJIvV+rFq3pyIJxCu1+ECOELKiE87LVdFpfQExFQ8Q5jrcwGVWq76nXAuXK5OnOR2LuHxwUENl3
	Tg1Z/cMZ8epxOIk+RD4QS4dQ7DQpuxSby+1kcRfoPpgiraW2zHNVXnBSQ6B5mplQkm7qvJoW3aAQG
	d/1vX3jt3oTsmHQbopSRq1xWuEz7emisM6sQQU6jxsZjdYMZy1UKZoQxakFTRWktBqVENpc1fSPwe
	SEMqPWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNPG-00EVvu-Nl; Mon, 18 Oct 2021 07:50:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNPD-00EVu7-MF
 for linux-amlogic@lists.infradead.org; Mon, 18 Oct 2021 07:50:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso7679063wmb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Oct 2021 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T/qx6dvcDkO1aEfmrGOeAb9WXZdVZKpvlTMRbcmlbAg=;
 b=v2pQOhbcutTJ6Ai/KVzZj6lkpmfHXo+VLK9KyltkpnhAPqUqMH2p8q0GMh2PCXif7+
 +qTlYgBeKCX4qazwHZU2eB+u2auOcwfQSTWvqViCeWi3dS5A8K2boiGjewnvkffZroel
 oblW4qX8LRKJFsPG+zfaTvTwIUBuEaRhSnMAyT7W/vRYTbWBP5FEOM/Ge7oqnBfZPWiv
 ghTNXo9ahfQ3Xd5RBiTVEOOzuP/JE6uweRvIQjSYtzxTZwewSjYrWdpW4LimUBCZbseQ
 lh9HiBEqSmvFFNE8Gi9/LbbWgzuo/VC1T0adTfJPUrVm7s+r4041jV2k6PJmISMvTy01
 Utrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T/qx6dvcDkO1aEfmrGOeAb9WXZdVZKpvlTMRbcmlbAg=;
 b=E29+1eQ6S61tCiLXOCltm/lmsFo/kiHNihTcXJ47+SCZuDhdpRJuuqVLXRAJZr+CJB
 sRyC4P3xDYsZ0PPhtXhpU+qex+EXXVc+daXbgMEymAUUZ3AGh32w5t/Co/eONXE3JUyd
 CpZCGl7A5NeRApqlitUzwBxOEXC/QQXCkCK65h3n5Tt7XdCME3vGTP+BKsM8MbIXUyL0
 5xnUkbPlkeCUojhFLk3M9xb6KzKde2d/dkIofkABcFPX99X8XR6qEH1x8Z9TbkxyLovj
 tZQ1IxWl+BFqwk+tIu6MbVt+1dyZoXmXt2631NXchr0oeQbot4TyMGrjKCKPwu3UuZXL
 7Q2g==
X-Gm-Message-State: AOAM530QCxxIbMhzV5y2KegQ+rFn/ex9AWjuIujohR7xG3DPcTUk7zEY
 WMzwELPzRGNA8nx+iFPO9bjuE1BWjiI=
X-Google-Smtp-Source: ABdhPJwYyhnLt4aqI4jUYRQVzmEWl7fxodIOaaHM4325FF2WV3XJQPVTYW3pID+zVKG5yz0eTko1IQ==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr1938097wmk.9.1634543398107;
 Mon, 18 Oct 2021 00:49:58 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2dd7:d5eb:6e87:f924?
 ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id u2sm11453082wrr.35.2021.10.18.00.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:49:57 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-5-narmstrong@baylibre.com>
 <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9cba6fbf-a8f7-4831-5774-1e270932816d@baylibre.com>
Date: Mon, 18 Oct 2021 09:50:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_004959_766548_D83232C8 
X-CRM114-Status: GOOD (  25.72  )
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

On 16/10/2021 00:07, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This implements the necessary change to no more use the embedded
>> connector in dw-hdmi and use the dedicated bridge connector driver
>> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>>
>> The necessary connector properties are added to handle the same
>> functionalities as the embedded dw-hdmi connector, i.e. the HDR
>> metadata, the CEC notifier & other flags.
>>
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> another great piece which helps a lot with HDMI support for the 32-bit SoCs!
> I have one question below - but regardless of the answer there this gets my:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +       pdev = of_find_device_by_node(remote);
> I am wondering if we should use something like:
>     encoder_hdmi->cec_notifier_pdev
> 
>> +       if (pdev) {
>> +               struct cec_connector_info conn_info;
>> +               struct cec_notifier *notifier;
>> +
>> +               cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
>> +
>> +               notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
>> +               if (!notifier)
>> +                       return -ENOMEM;
>> +
>> +               meson_encoder_hdmi->cec_notifier = notifier;
>> +       }
> and then move this logic to meson_encoder_hdmi_attach()

We can't because we create the connector after the attach.

> This would be important if .detach() and .attach() can be called
> multiple times (for example during suspend and resume). But I am not
> sure if that's a supported use-case.

Attach for now will only be done once at probe, and detach only a remove,
we don't change the bridge chaining while suspend/resume, we only reset the
pipeline state and put the old state back when resuming.

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
