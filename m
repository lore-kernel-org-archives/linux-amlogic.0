Return-Path: <SRS0=+Jf1=LW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A734C48BC2
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 01:05:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8400619B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 01:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8400619B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrCSbYET9CmH4EJvA9L/JzKWCVPWgGkGq1JNGbbd3gw=; b=0hn1aCPWI3ekZ1
	B/lMIG3GzWPtqXdF8ZTAfwMKZ/FRzfctuCk0IiWfkkTZrlM1MF9jA0L0oBkHJnVrD98D1V95yPc7m
	gjD+mImz965gM9D80Sew/ukdEJONsmDaRokEJcer+qqeTLxkKvYfyq+uXZufCqVEEOcbuTiygRVM/
	FHbudee4uP/2ahgUOSjbz7DOk87E+l3Dv/bWMgexx1jKDhfsLCLcYlMHcoOycR3uUnUiiKP9fqJcV
	j3aD04k60jzG4JXrouD2+cv3VXoxi/494FJ6EI0J/hJv8zlfUQX954wnd+x96c47zhsmhgiw1X0Lj
	cea6k9gYQmc4Doi3BdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxfiN-006NV0-M0; Mon, 28 Jun 2021 01:05:31 +0000
Received: from mail.as397444.net ([2620:6e:a000:1::99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfiK-006NUU-Aa
 for linux-amlogic@lists.infradead.org; Mon, 28 Jun 2021 01:05:29 +0000
Received: by mail.as397444.net (Postfix) with UTF8SMTPSA id 8D5CC5F3C80;
 Mon, 28 Jun 2021 01:05:25 +0000 (UTC)
X-DKIM-Note: Keys used to sign are likely public at https://as397444.net/dkim/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattcorallo.com;
 s=1624840864; t=1624842325;
 bh=8pa21uLmbA4lr1gIMTlu/Iq6K9qQ8JbtXVKJPakqqGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lQ+FbKc3hv/lhsZZVkgw4VNEb4iewkLZohwSxPkilYT636CLuXkSYaKj1TKgf07KO
 luCiXA4Jj+KRW/FanBOitrjjyC6GAjEURoXxN/71MU0GdS2lLMgrVTAdPDjrKyflXQ
 p56rakPc3TcdyF8gldJzttmj+OSsKZTXzHFc4LDnP8yuZiFXf68kBSF0mNTUoh/rkb
 FUrPIReV69cEMnds72heDhQ4jE3Z1lsXWdBRGyGnDvMcN8f5sK+jadTU0hyrZK1/Xg
 H0VWlGe+eUjXhskhdffl0ExbC8Z+hMTAH3QAky3ll8TGRRLyqMSmxmnXay4xY6pekn
 afOMPBwoYdGMw==
Message-ID: <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
Date: Sun, 27 Jun 2021 21:05:25 -0400
MIME-Version: 1.0
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
From: Matt Corallo <oc2udbzfd@mattcorallo.com>
In-Reply-To: <20210628005825.GA638648@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_180528_501748_2F69BAD6 
X-CRM114-Status: GOOD (  16.69  )
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



On 6/27/21 20:58, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 08:32:21PM -0400, Matt Corallo wrote:
>> On an ODROID-C1/C2 device, using the dwc2 driver, only some devices cause USB bus to enumerate devices.
>>
>> Specifically, both on boot and during normal operation, if some devices are
>> plugged in, all USB devices are detected, but if those devices are removed,
>> no detection of any devices occurs.
> 
> So if you boot with no devices plugged in, and then you plug in (say) a
> flash drive, it doesn't get detected?

There is a separate and long-standing bug on the ODROID-C1 and ODROID-C2 devices where hotplug doesn't work reliably, 
which is why I mentioned rebooting. This specific bug all works identically whether booting fresh with the devices or 
testing hotplug (which sometimes works with lsusb -vvv).

>> I sadly don't have a lot more to go on, but xdarklight on IRC (I believe ==
>> Martin, CC'd) confirmed the findings with a grab bag of USB devices he had
>> sitting around as well, and may be able to provide CONFIG_USB_DWC2_DEBUG
>> output.
>>
>> Any further guidance on where to look to debug this issue would be appreciated.
>>
>> As a sample, some devices which, when plugged in (either alone or together)
>> do not cause any USB device detection (see attached lsusb -v files):
>>
>> Samsung T7 USB 3 drive
>> Samsung-Branded Silicon Motion USB 3 Flash Drive
>>
>> Some devices which, when plugged in cause all USB devices to be detected:
>>
>> Mushkin-Branded Kingston USB 3 Flash Drive
>> Kingston-Branded Kingston USB 2 Flash Drive
>> USB-3 MicroSD Card reader (lsusb/testing by xdarklight)
>> SanDisk USB 3 Flash Drive (lsusb/testign by xdkarlight)
> 
> This could simply be a question of power.  Most of the flash drives and
> the card reader probably don't require very much power, whereas some of
> them need more.  You can this, to some extent, in the MaxPower fields of
> the lsusb -v listings.

That seems strange, though, given that the first group of devices appear and work totally fine, but only when something 
from the second group of devices is plugged in. If the second group is not present, then the first group of devices do 
not appear at all.

> Do things work better if you plug these devices into a powered hub
> rather than directly into the computer?  If the hub can provide the
> power that these devices need, the computer won't be overloaded.

I don't have a powered hub handy, sadly. Maybe Martin does and can comment when he wakes.

Matt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
