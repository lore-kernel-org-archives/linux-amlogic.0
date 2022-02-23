Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789FCC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPBFe9XDrs+YhLUY/2ivCpKf++E5FLXok+PRO7ckomc=; b=HJvxM2YrAbMhZ7
	AuAlpQIVnHZVaZDhloBcqFa/FGL8KHcKk3ihajrkopPkwaSlrM+SCakahcvMiyYC0rR2/Z1YRHv8b
	LEJxnQmBwFfwNER2f7W3BXca3LqWM3e1iZg4EG5yNNtS6COCZr4aPnZ4TTZssGmyUwAdk39aioRbo
	2fEuLD8zLgsUaTPXXfC+OK25lTf9UQaw+qwKe05nRfjXq25YGK8gEesLcdqPmVwcsGPf9LpX1tgWl
	P7C34dBNSg09xCyDnfbYhone1PL07O+AgfiMZK2a1YUmAPgUS+Ybbc45rJZ9G4FIVBQPuz6a1eGSA
	D5D26UlVqGHFDvBbanLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtCP-00Ev60-5b; Wed, 23 Feb 2022 15:05:01 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMt6I-00EsWm-BQ
 for linux-amlogic@lists.infradead.org; Wed, 23 Feb 2022 14:58:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s24so38180567edr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Feb 2022 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H6CuaNKLLI2/1Qz4pat/xAVJ4Xn+Ipul0udW4Bn7T30=;
 b=bFsBi5tqY3Cd44/rf1jeE1bPeKQk06nH2OyklALLukt+sAVLHbGNbhageoU+SwNoCP
 gmcgpd/lvptRnTv0tP8x43GMJkHxzpSlHGUmmb3dqgAJLCednCx79T6bY3j3SrREFzsS
 BxnJptlJqIzGPAlXurYr5TBBxPg481MzREpHF1M0Q22U5vqTkfvtfeOecoJbA9c+eH5u
 9eBY5XE++IUpkmBHImpo9CIVV4iukuCgwinL/zCeh/qrRBfsO0ODuirjWzfweF2MwYJU
 qk8VkCQ0krvFohW8mQqmdjUB4BNgNavW3am9FPLJVEvJboEUB/X4bSRv6qmTv+/d6cm+
 qdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H6CuaNKLLI2/1Qz4pat/xAVJ4Xn+Ipul0udW4Bn7T30=;
 b=eatMoPjyghQRCgnucRo3a9hmRUojuk5ysWMj4uwSqq1lWR2ViOl5j15XhDybed+qmk
 NxAR3EeOA+A5xdjP3+JgvlAC476SZXBYUKEEsDclpRO66mgvcFcb7gomoYPSaY8VJ5bJ
 7CBZ/fpS6bH2kf7H+JQRawUYhZwIguETBbn/V3GDD08D/I7lrj14HQlnz+iG/FR3PpyG
 oHmNE75o6Oqqd9qoD2Ebv5/ZfVVRc7RT1NtYVzWItkEqqC0qqRv5OmRe1GJ26KWKAs/Y
 JMZ11OM3qOpPlq5LnMFUEoMdOSYw/CwL87kooov5yQsyu9kYHSHiPAYLseOgOnjnlEjc
 DdZA==
X-Gm-Message-State: AOAM532r6rD+LQorYlSx3ocqUohSGp9jpCPKzvbEZ7RmMxFaai4DHTdM
 0yqFcAxz6s7T4rA65XZ4Yk0=
X-Google-Smtp-Source: ABdhPJxcOqM1hcfvEKf83xdwNhrJ6+T9XQfFi4sUeZHRKRiMyRh+Xj+CUzmGij3v31z9O1tUKA79iQ==
X-Received: by 2002:a05:6402:38e:b0:410:c1a9:60aa with SMTP id
 o14-20020a056402038e00b00410c1a960aamr32183906edv.336.1645628320406; 
 Wed, 23 Feb 2022 06:58:40 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0?
 (p200300ea8f4d2b0019e2181b94d88cf0.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0])
 by smtp.googlemail.com with ESMTPSA id b6sm7549843ejb.80.2022.02.23.06.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 06:58:39 -0800 (PST)
Message-ID: <4f818e25-1c39-b4a3-ed09-370cb4a2c2a7@gmail.com>
Date: Wed, 23 Feb 2022 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <YhZB9C/xGaoslZzT@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_065842_464869_27FA6BA5 
X-CRM114-Status: GOOD (  18.40  )
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

On 23.02.2022 15:17, Alan Stern wrote:
> On Wed, Feb 23, 2022 at 01:26:23PM +0100, Heiner Kallweit wrote:
>> On 23.02.2022 03:10, Alan Stern wrote:
>>> On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
>>>>
>>>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>>>> index 83b5aff25..e3f40d1f4 100644
>>>> --- a/drivers/usb/core/hub.c
>>>> +++ b/drivers/usb/core/hub.c
>>>> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>>>>  		ret = -ENODEV;
>>>>  		goto fail;
>>>>  	} else if (hub->descriptor->bNbrPorts == 0) {
>>>> -		message = "hub doesn't have any ports!";
>>>> -		ret = -ENODEV;
>>>> -		goto fail;
>>>> +		dev_info(hub_dev, "hub has no ports, exiting\n");
>>>> +		return -ENODEV;
>>>>  	}
>>>>  
>>>>  	/*
>>>
>>> How about instead changing xhci-hcd so that it doesn't try to register 
>>> a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
>>> think that would make more sense.
>>>
>> Right, this would be better. I checked and it seems to be a little bit
>> bigger endeavor. If I let register_root_hub() fail, then this removes
>> the USB3 bus/host (shared hcd), but also the USB2 bus/host.
>> It took an additional change to xhci_plat_probe() to make it work on my
>> system. Not sure what the impact could be on systems not using
>> xhci_plat_probe(). Users may face the same issue like me, and having
>> a USB3 hub with no ports may remove also the USB2 bus/host.
> 
> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> 
How would I know the number of USB-3 ports before calling usb_add_hcd()?
get_hub_descriptor() can be called only later in usb_add_hcd().

> Alan Stern
> 
>> What I can do: submit my patches as RFC, then there's a better basis
>> for a discussion.
>>
>>> Alan Stern
>>
>> Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
