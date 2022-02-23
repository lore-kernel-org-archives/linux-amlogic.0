Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAECC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 20:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCWV2QTyxYRz3kvlv4rOC1mS1F1JfiAHEr9QcGZV594=; b=hxl1D0oXv+GNPH
	B8ozO9XOH1lgPelgkbIW8CqhVQudsOISrSR53guqWl8ae26ZzajOBxU319NQrpL4nnWhEancNnZvS
	WQ/vWSAyfvo3Q5yLKuL7XOlkCQ1SEGG2Dqnmw0fxxGRiluOj5VSG+3Ygjrcu0QZRgCEHI8B+6j2eN
	ym/z+T3ZaJqCHYuA2iIbL3Hkt7uEo0ws0FOWjU9q1K1Oul28tu9A/vNl+OC7qBAnz/OAx6nLP/ogQ
	4qVGyGbG5F4/Ivf5dDxij5eNfE5KWni1VZTnSMopNDaw4RKNpfLK81Qbrx4SS25Ddqabd8Zhlq7lV
	vmvedj/HTxDoZC5n6hSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMyj4-00G34t-BB; Wed, 23 Feb 2022 20:59:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMyj0-00G33t-LU
 for linux-amlogic@lists.infradead.org; Wed, 23 Feb 2022 20:59:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id vz16so104722ejb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Feb 2022 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EvfefPJQD58rL//TUV4xf4YegZYhYTR/Y5nWvjnPOkU=;
 b=njpv+aGIWK+rQpyBHzZ9+e8u1lxFRxIqHI2dQL5GhcGaN6LKwXzycoxHdmvi4leQ33
 luXv49gYGazw7c1qKuucgowwd1HiO5+UVoZrQ4QSN57YDUjDn0WaqU74oQ+ssFuJfjpB
 /6KVvCGJni4+FZElzLCUpJgNmvw3Wbjmjrwqw9JSjjdghqE+qvscGzPRhFbSRU0aybPh
 vQ4eGIa4s4TepfSF4UGkglzdMeivD5yvmeE7SVmhi46ioWGSDQE4sQ+4U7h7dfBBSeW9
 904QGBhbnHxnM07s1kGaKPDxXBrbdGSrD+uhu3+6hgSpoekvHI799J6JPo4suh6NOM7X
 DuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EvfefPJQD58rL//TUV4xf4YegZYhYTR/Y5nWvjnPOkU=;
 b=1sadjqU4Oc4OUYXD1OotFYdIhKlhI+AaOH4S0hryHuZ8GyuzsQesQw60F8iUghL31Z
 MTioQTMTaPr+QdU0FwSeZ4Zfg/uSz84/NxsKxS1gv4CPmkCJMcW/ISZDFm2BgHRe/RFN
 9w4Wj5NzcGnZs6RmmfwYy50+KGlZyXYDXGj4N/fdcUTCmV4hfL8aTQCzmWaoaznmUiaC
 Nb5Wk8mAqMUqOVMfmdadZTp6GgHva+SC2UVG0qTHT8sos09CA0lnXeT+0+QW7fjXxELg
 pVBItNIaQWmT8QaeWpxk7wQKsdUgBrcqvbFM/O6TP0nH4ZsG4RjER6vucBawDEHwt7oo
 2SGw==
X-Gm-Message-State: AOAM530u0vv7ZHs32Dy7MmwIb1wfUgDTpeFQqUMxEsSqCx67uXJ6AQGc
 46a6mMi3CkzkRhMoSi2cyAvQ/fFdoWI=
X-Google-Smtp-Source: ABdhPJzloU1IRGXCNjmFDv+YExaB9VsBpbub0gmyBMHg54LDCCu7FyMXkLkNwI2ZtNrm7KYF/+81vA==
X-Received: by 2002:a17:906:ae97:b0:6cf:73fe:8515 with SMTP id
 md23-20020a170906ae9700b006cf73fe8515mr1132085ejb.462.1645649941030; 
 Wed, 23 Feb 2022 12:59:01 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id m2sm369970edl.106.2022.02.23.12.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:59:00 -0800 (PST)
Message-ID: <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
Date: Wed, 23 Feb 2022 21:58:56 +0100
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
X-CRM114-CacheID: sfid-20220223_125902_755534_20699D51 
X-CRM114-Status: GOOD (  19.42  )
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
This works on my system. However a consequence is that xhci->shared_hcd
is NULL. There are a few places like the following in xhci.c where
this may result in a NPE. Not knowing the USB subsystem in detail
I can't say whether these places are in any relevant path.

static int xhci_run_finished(struct xhci_hcd *xhci)
{
        if (xhci_start(xhci)) {
                xhci_halt(xhci);
                return -ENODEV;
        }
        xhci->shared_hcd->state = HC_STATE_RUNNING;



> Alan Stern
> 
>> What I can do: submit my patches as RFC, then there's a better basis
>> for a discussion.
>>
>>> Alan Stern
>>
>> Heiner

Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
