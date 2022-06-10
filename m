Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FF6C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jun 2022 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iExWTfBc8FGJUy2VVRpXBnCOaQxNiyqEPDoeSXaAYRg=; b=vDG8g4T15NJIxy
	jUM2m2PwMRPxvBJH3eW1jG1NFlI4VdVa51kXPHPQYrFxw1NZrCCflbaDrQgIEdvl9wYkuXEG2YmlI
	n6q+lPBe3cCS/z5DGbXfrlU5Q9zVUn36pK7cs4b9WscChLwu2zw3/FvSmIKfjax1Inf3l7D1IW2Xh
	r2OIoj3JHpKtjn2JWKRyRW0aWYkXMefu7iZH78IwuxIbcyFEDD6rYPs+cRb7IfR8kUt8dQNJLN9xG
	wnhw/u+l50N0leHiw62gNl3Y7UnWc0io71iw7PFCik6stI/38eTxI+bFMAN0kFCP0ufn3HH5SmAYo
	zrfUm4kQlbebLaUesyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZoz-006iRk-HO; Fri, 10 Jun 2022 08:16:45 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZop-006iO6-Hq
	for linux-amlogic@lists.infradead.org; Fri, 10 Jun 2022 08:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654848995; x=1686384995;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=xB+8lCXM5ehOpPzqxNz9AwgTMfQZq9K7WuVY39UAKsA=;
  b=eEjGoOX1U4ne0E5RwG+KnwxuxG7jQRvvh0UnOqJJjfXW499Y7oktHEo9
   GrTLq7dNsvE8+PsOYGjDltMyze3S0p2xdPH5/v1pYtcaelbX+g4MeEWTc
   MqyqH0cSrcRr9XKdPbxKQOPJbZ5FDvNjlQzoumLnP+cCHWyaMLTwl7kBA
   ExA6CPvFApWYajJ9ffK08UYYWeeLiZsMNHbk1N+jCw4MjxWw5L46E56Df
   czBRrVNMtF+3Tvs+r2YoaQ3hnwwV0xnhDZawtB21qBKR6u5kyCrY/BMiw
   rr+E7IxFFkVHRf1UUxONOc5vehw9HsSm9aMJjbjHF6WCh0Hyx3idamdI5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="276331436"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="276331436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 01:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="724856825"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2022 01:16:27 -0700
Message-ID: <dfd65190-fe38-3189-70fa-6b2c31ebecdf@linux.intel.com>
Date: Fri, 10 Jun 2022 11:17:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>
Cc: hkallweit1@gmail.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 quic_jackp@quicinc.com, tunguyen@apm.com, linux-amlogic@lists.infradead.org
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
 <20220609120336.831533-1-mathias.nyman@linux.intel.com>
 <YqIUsP437G8g75YS@google.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci
 has only one roothub
In-Reply-To: <YqIUsP437G8g75YS@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_011635_649422_1A30E468 
X-CRM114-Status: GOOD (  18.69  )
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

*On 9.6.2022 18.41, Matthias Kaehlcke wrote:
> On Thu, Jun 09, 2022 at 03:03:36PM +0300, Mathias Nyman wrote:
>> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
>> however this field isn't initialized by __usb_create_hcd() for a HCD
>> without secondary controller.
>>
>> xhci_resume() is called once per xHC device, not per hcd, so the extra
>> checking for primary hcd can be removed.
>>
>> Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index f0ab63138016..9ac56e9ffc64 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>>   {
>>   	u32			command, temp = 0;
>>   	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
>> -	struct usb_hcd		*secondary_hcd;
>>   	int			retval = 0;
>>   	bool			comp_timer_running = false;
>>   	bool			pending_portevent = false;
>> @@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>>   		 * first with the primary HCD, and then with the secondary HCD.
>>   		 * If we don't do the same, the host will never be started.
>>   		 */
>> -		if (!usb_hcd_is_primary_hcd(hcd))
>> -			secondary_hcd = hcd;
>> -		else
>> -			secondary_hcd = xhci->shared_hcd;
>> -
>>   		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
>> -		retval = xhci_init(hcd->primary_hcd);
>> +		retval = xhci_init(hcd);
>>   		if (retval)
>>   			return retval;
>>   		comp_timer_running = true;
>>   
>>   		xhci_dbg(xhci, "Start the primary HCD\n");
> 
> Is the log still correct? IIUC this now isn't necessarily the primary HCD.

It's still correct as this is always the xhci->main_hcd, the one that is created first.
There could be a better word than "primary", but my brain is accustomed to seeing this
line while debugging.


> 
>> -		retval = xhci_run(hcd->primary_hcd);
>> -		if (!retval && secondary_hcd) {
>> +		retval = xhci_run(hcd);
>> +		if (!retval && xhci->shared_hcd) {
>>   			xhci_dbg(xhci, "Start the secondary HCD\n");
> 
> ditto

same, always xhci->shared_hcd, the one that is created second.

> 
>> -			retval = xhci_run(secondary_hcd);
>> +			retval = xhci_run(xhci->shared_hcd);
>>   		}
>> +
>>   		hcd->state = HC_STATE_SUSPENDED;
>>   		if (xhci->shared_hcd)
>>   			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
> 
> Tested-by: Matthias Kaehlcke <mka@chromium.org>

Thanks for testing
-Mathias

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
