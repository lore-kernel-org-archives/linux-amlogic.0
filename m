Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF98DC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SWaY2dnFPanAo/fIy1KyLQnRqEMoK4Ez9yF0+Tj41w=; b=2kax08Pf7Q1xxW
	NYsddpyTgmXvpKFuS9ot6PFt5B8heQeCRxzpF28zfKMrZ/tZV+qXCiV2URRjcQf8beHFeQMzEwaRT
	7HD6V0e5J8hfFT+q6zjxERVcuqHWsxNRGkyw1hztZCIkWpv1AC+Qo+uJViXoNN4FuCySHbKrTFOsm
	gAaxt4OHEsRSrTceiWV6fwVLgjNgyIuLjBz0Wc02fj/WjbRgsbEtOtSQzz5a2bUwT+W//Jlm3WvAL
	VcciEnAWgaAfimh/X7/Gi5eggtHo6Xl0WAHXD09njlZt7S3tL3AeftLoDj/vMaFhfHA92Ieeflh1C
	FZdql4Ggmr5A8qXPXuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKX8-002JeT-Vl; Thu, 24 Feb 2022 20:16:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKX6-002Jcp-3T
 for linux-amlogic@lists.infradead.org; Thu, 24 Feb 2022 20:16:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id bg10so6713015ejb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Feb 2022 12:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2kiO1t+7NFcOlx4ftFXU17rhmXrl+ejVO/EZEfGgLjY=;
 b=NJG0nqzeOwZE5M+c1zqS4A8E2j29NoBBRzsIe+k2hBoZKX2uydYl646j2mu3OvSBXQ
 ETSsZOQVJf0zhuvWU3bKmGpkpmNTtfhtgKEciYL3v00IXTubNxQCfVsASaLIpjSTxYK6
 U9xmxTzMH2HaE7e8ldFtBpMAnze9eF5gOe/JNiGNZorJT8PF96d5PRzCoE27VEhKD7hm
 tVDMCcwWnfW0DaniFBpJTI3mgnlsRntftfLwqibagqwOx2ECQKTRcb+nnSHNQ8WcHKa+
 fJAsaGAnnO57Fm+8nm5QR7tamz1badl6X7rojFSuFl7bOpI05gYO/Vxa9Gr4eloiug9a
 XXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2kiO1t+7NFcOlx4ftFXU17rhmXrl+ejVO/EZEfGgLjY=;
 b=VDHDrzV1bYlT6rciObZinLEAhzpZG9J50l+sgVlCHcvVpMDsRzFy/gyTr5aBTPA4mg
 twUd+ge+tcPUJYyvv6X6P9WnxHuugsj5CZxW92QZTbkVLFPoW3PXvtL9tVZvUanNLgD/
 wKjWMvUwHGXcNhqZb1dPLYyghkL54VcauEn/77kYDqxY4Zy627cYmVBowDAuFpXIhLvu
 JIVlXEkgb5FIf2PLBDS+fv/s97oezfIzvwE7X1LXk2R/eraYMxicQ9pSkSawWgzU8nGf
 SHea+kmSwsKP6o+fHi7t7Z3ZNsDj442B2yMmq3h3d+Gx5UAxC/5tQJfdmbLxpAcQ6PRs
 zKuw==
X-Gm-Message-State: AOAM532HiwCsX4CnSpXqL2CS5HzvNb5i2jho2yBHl7gwsbMRGvoZaoz0
 D0MfKIuSFk3AEZb/j3+Kn3BW0dRs3ss=
X-Google-Smtp-Source: ABdhPJyy5svUH1PYorDzvMPQKA6SGdcq3/cNcr4GrGA0nt2maPB2VzI8ZcsolsfsMstHU+gC8Ax9AQ==
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id
 p1-20020a170906b20100b006b558c8e43cmr3478116ejz.441.1645733770304; 
 Thu, 24 Feb 2022 12:16:10 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 q7-20020a170906940700b006b86e95dc1fsm137140ejx.41.2022.02.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:16:09 -0800 (PST)
Message-ID: <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
Date: Thu, 24 Feb 2022 21:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Content-Language: en-US
To: Jack Pham <quic_jackp@quicinc.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Tung Nguyen <tunguyen@apm.com>, Mathias Nyman <mathias.nyman@intel.com>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
 <20220224200637.GE13801@jackp-linux.qualcomm.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220224200637.GE13801@jackp-linux.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_121612_200615_EBFFDAC0 
X-CRM114-Status: GOOD (  15.96  )
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

On 24.02.2022 21:06, Jack Pham wrote:
> On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
>> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
>>> On 23.02.2022 15:17, Alan Stern wrote:
>>>> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
>>>> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> 
> I believe this had been attempted in the past, but it does not appear
> that patch was ever accepted:
> 
> https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/
> 
I also found that xhci at several places relies on a proper shared_hcd,
even if there are no USB3 ports. Therefore maybe go with the less invasive
original version of my patch?

https://www.spinics.net/lists/linux-usb/msg222998.html


> Jack
> 
>>> This works on my system. However a consequence is that xhci->shared_hcd
>>> is NULL.
>>
>> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
>> skipping that call shouldn't cause it to be NULL.
>>
>> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
>> corresponding call to usb_remove_hcd().  There may be a few more 
>> subtleties involved as well; like I said before, I'm not an expert on 
>> this driver.  You should ask the xhci-hcd maintainer for advice.
>>
>> Alan Stern
>>
>>>  There are a few places like the following in xhci.c where
>>> this may result in a NPE. Not knowing the USB subsystem in detail
>>> I can't say whether these places are in any relevant path.
>>>
>>> static int xhci_run_finished(struct xhci_hcd *xhci)
>>> {
>>>         if (xhci_start(xhci)) {
>>>                 xhci_halt(xhci);
>>>                 return -ENODEV;
>>>         }
>>>         xhci->shared_hcd->state = HC_STATE_RUNNING;
>>>
>>>
>>>
>>>> Alan Stern
>>>>
>>>>> What I can do: submit my patches as RFC, then there's a better basis
>>>>> for a discussion.
>>>>>
>>>>>> Alan Stern
>>>>>
>>>>> Heiner
>>>
>>> Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
