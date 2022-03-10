Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89346C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Mar 2022 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+5DKj0GnFe3At8FgIbOJRKkNa+c5UfEJpSL0JG7A9Y=; b=22Eb/xDc5thONp
	dahCwTJAGJNC0zQ5Zb1lCJ/B7i/sIO7Uqb8wDXNlvUQLtgsELI+L+UfXz55zbe1VEybUQIVV028Sz
	UxarBTcOWOY6XcXeXzroPaCG6FNpq0GTiWW5laUsag3cWnOD5SPA9ha7ywiLHOz03YU6mQ5gL4GiN
	IeoVxLPfJ+VjwLRtgE3yzcr+wvHKQgGicEuSUYpznNEN4OmA6lL5cWNC5Qj/ejYrzjT2jDwMrqUV8
	iDDdvN/pe4MH24cOwW0KYd4F/pXsQ5cY2fC7ejt3tPc5yx+xp4rq2K36O9oox3n+cV+fhTcLXUCCw
	mGVBR6lEVGV0u3wriKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSQ3V-00E3Rr-Uk; Thu, 10 Mar 2022 21:10:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSQ3S-00E3QU-Nb
 for linux-amlogic@lists.infradead.org; Thu, 10 Mar 2022 21:10:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id b24so8570393edu.10
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Mar 2022 13:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sdrXghyjSVHFb+yz++V3HzEqP1U2DdyypDa2QGjMBHs=;
 b=mhpWc9HQv13QJsM4PEp08Nz7KpUVebSYRdLEtYYPdvD1Fbi5vG3Ou8mYrbbAlVK4WX
 jh9ibqGjKePXiWvL7XauD7RsSLfmNzbfYxAXrUMkaNM1euOS/IFvy04UMksuDlXlo27K
 6RUKSguvCCZtruq1JXjlJJ5kUpCsYQFv1otOYrYEPVJBAnr8hQE/d7Zx3idjzhF54mOj
 UUuH8rMbfQecRRXtf6wEo3fHSPGeK5KNzaLNAc0CK+SL9gnKMKxAUIA9uuZphIkmeXg5
 eANQKJNXEdAeORxMxDv+HnVCl56MnLndP6HdIdGQ5BNe4iu9BwkjnwptFVNvd5iZSx0U
 fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sdrXghyjSVHFb+yz++V3HzEqP1U2DdyypDa2QGjMBHs=;
 b=dEFEMTDVliYniCuX1JgxydVE8tqo658P+ZK6r+2EzbmLzAwWgmlUO9g9iSHbC4HeBj
 aA1MW8ud6fZVfh4fFMzNKvXB3oGOEk6zElV8ZwTnifGhBwBCx4m6N3BiHZS8yItsitHm
 xzMwlRtEr4ZU4HqM+GYaQ/G5F5twgITN/1D39+wTSBCsT97hMhLEFq+sf3THqbSUYlqP
 6Nsx4gsBLlofO/LoXJjeczsf0ZC8y8fpv0XE3sw1SwYfrVw3g5rsUFi88q7GQ6cnEAFM
 MxuhT7m3M/LqCWN2h+GY2419b9qCGxV6UZCW8n94OMcLp+HSG1vD88tpvsmBjmNC/T3z
 iFUQ==
X-Gm-Message-State: AOAM532VdnD2AeutQ6IQ4OaTO3hKlYxoe3PyMos8pcJAMIYG+Pej1m9n
 q0lO8GY18AbRK0ZKTKgm7hY=
X-Google-Smtp-Source: ABdhPJzx4bJ+h68HZu/UDyqKeW0k2okErrlnfOON8PxM7YlUVUQ1T+7ovoO+QZPbGZSLHnxY9RVVTg==
X-Received: by 2002:a05:6402:150f:b0:416:175d:3f5d with SMTP id
 f15-20020a056402150f00b00416175d3f5dmr6234910edw.184.1646946636278; 
 Thu, 10 Mar 2022 13:10:36 -0800 (PST)
Received: from ?IPV6:2a01:c22:72cc:7000:95e2:80d9:a43c:4b6f?
 (dynamic-2a01-0c22-72cc-7000-95e2-80d9-a43c-4b6f.c22.pool.telefonica.de.
 [2a01:c22:72cc:7000:95e2:80d9:a43c:4b6f])
 by smtp.googlemail.com with ESMTPSA id
 j5-20020a056402238500b00416c32d548esm713889eda.59.2022.03.10.13.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:10:35 -0800 (PST)
Message-ID: <2e7118f1-99df-1811-5f3e-8cd9893a83c6@gmail.com>
Date: Thu, 10 Mar 2022 22:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] xhci: support omitting shared hcd if either of the
 root hubs has no ports
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
 <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
 <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_131038_805604_D0183B03 
X-CRM114-Status: GOOD (  22.62  )
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

On 08.03.2022 15:55, Mathias Nyman wrote:
> On 4.3.2022 20.37, Heiner Kallweit wrote:
>> If either of the root hubs has no ports, then we can get rid of
>> overhead like the shared hcd. A major internal change is that now
>> the main hcd can be USB2 or USB3.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/usb/host/xhci-mem.c | 11 +++++------
>>  drivers/usb/host/xhci.c     |  9 ++++++---
>>  2 files changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index a1a17713a..ced139583 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>>  		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
>>  	}
>>  
>> -	xhci->needs_shared_hcd = 1;
>> -
>> -	/*
>> -	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
>> -	 * Not sure how the USB core will handle a hub with no ports...
>> -	 */
>> +	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
>> +		xhci->needs_shared_hcd = 1;
>> +	else
>> +		xhci_info(xhci, "USB%u root hub has no ports\n",
>> +			  xhci->usb2_rhub.num_ports ? 3 : 2);
> 
> This now works for xhci controllers using xhci-plat.c, but in all other cases
> the the secondary hcd will still be added.
> 
> Would it make sense to instead of setting xhci->needs_shared_hcd, we
> set a xhci->allow_single_roothub flag in the .reset override function?
> In the xhci-plat.c case this would be in xhci_plat_setup()
> 
> We would only add the flag if the respective probe supports one roothub.
> 
> Add a helper function to check if we if really should set up just one 
> hcd in probe, and should call xhci_run_finished() already the he first time
> xhci_run() is called (like you do in patch 3/5).
> 
> Something like:
> 
> bool xhci_has_one_roothub(struct xhci_hcd *xhci)
> {
> 	return xhci->allow_single_roothub && (!xhci->usb2_rhub.num_ports != !xhci->usb3_rhub.num_ports);
> }

Looks (very) good to me. I'll incorporate this and reorder the patches,
then I'll send a v2.

> 
> Thanks
> -Mathias
Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
