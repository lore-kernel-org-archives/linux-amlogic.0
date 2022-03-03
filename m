Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8176AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Mar 2022 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4ExYK21ShaLiIfaVbTuzsOBQFCjUEalt2Tm1iZ+1UT4=; b=ukTTFS2RrmnfwszZBLRMMzjQQ2
	vR8oLzoQi/LT00BUoOj1ki7zqEuY/oHtAdm799lSALA8hcv+hsWw+8fx4Jg/MusY22D1oCHneL54W
	L11Hvw7Ca69pkjc5HrVmYjB0E+X2monYFrLVkwISiaGaZYSI6dS4ihm4UnjT2i32eMnx8Cbtk73G3
	dl5EHOtro6pGofQJTMDxWziN+F5Rn5T7cPkR30SOj/prodAOS/0Y5hoBDJUA74pmYwa6x53xCKpck
	kViq8YwOqr57STLH8zPjRom9PExObMHSS5MP4B9fEWULe4C4p23yAHAxFMoNXpcN+gGmoru+pZyGR
	z1SmGrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjwY-006G0a-1h; Thu, 03 Mar 2022 11:48:26 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPjwV-006G0D-AF
 for linux-amlogic@lists.infradead.org; Thu, 03 Mar 2022 11:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646308103; x=1677844103;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ybg0+ozAxYOdaStjFzx7N6WGF1+kvUBfjv87WPT1mcg=;
 b=nLCcTzfEaz1LUyr7x1rlzvbIRJNUQp6uqB+qqscGCi0wYBH7sv0X7JD4
 xbU0untwui/jMpvy/sdAF9MEremnWE/EZHWpVjSYXXD0rwpaPzc0B41BW
 nnNWU66fLiKRSfkvLw2v5jUzq49Ub10Y6Q/N+cBO5EDtmld0tfl4iFNxu
 ubSAbWEZq2pTZOWdV+kSwZUgGBdIk7d/2OKWOq80OTTJ3qw2nD2h25tBI
 1C5+WzWzXC3L50ytSgE47uYRIWdj6T2oS7/ajYPlLeeHsvJMlTdsFP9r/
 UA7NSdy3EnmxlKVJerrPsEHgZO6VE7BuZSNPyj+1KH6wLjRztuLwwcjLJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251228038"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="251228038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 03:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="576461193"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:48:20 -0800
To: Alan Stern <stern@rowland.harvard.edu>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jack Pham <quic_jackp@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
 <YhfougN/KOTZeGV7@rowland.harvard.edu>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <4b0c7f0d-749b-a8a8-9b25-720ed826ae2a@linux.intel.com>
Date: Thu, 3 Mar 2022 13:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YhfougN/KOTZeGV7@rowland.harvard.edu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_034823_398101_6248781A 
X-CRM114-Status: GOOD (  22.07  )
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

On 24.2.2022 22.21, Alan Stern wrote:
> On Thu, Feb 24, 2022 at 09:16:05PM +0100, Heiner Kallweit wrote:
>> On 24.02.2022 21:06, Jack Pham wrote:
>>> On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
>>>> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
>>>>> On 23.02.2022 15:17, Alan Stern wrote:
>>>>>> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
>>>>>> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
>>>
>>> I believe this had been attempted in the past, but it does not appear
>>> that patch was ever accepted:
>>>
>>> https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/
>>>
>> I also found that xhci at several places relies on a proper shared_hcd,
>> even if there are no USB3 ports. Therefore maybe go with the less invasive
>> original version of my patch?
>>
>> https://www.spinics.net/lists/linux-usb/msg222998.html
> 
> The patch that Jack refers to, written by Tung Nguyen, does always 
> create the shared_hcd.  It simply avoids registering the shared_hcd 
> when there are no USB-3 ports.
> 
> You should try that patch and see if it works on your system.
> 
> Alan Stern
> 
>>> Jack
>>>
>>>>> This works on my system. However a consequence is that xhci->shared_hcd
>>>>> is NULL.
>>>>
>>>> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
>>>> skipping that call shouldn't cause it to be NULL.
>>>>
>>>> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
>>>> corresponding call to usb_remove_hcd().  There may be a few more 
>>>> subtleties involved as well; like I said before, I'm not an expert on 
>>>> this driver.  You should ask the xhci-hcd maintainer for advice.

I think we need to start supporting xHC conreollers with just one roothub. 
Only call usb_add_hcd() once in those cases.

Even prepare for special cases where xHCI only has usb3 ports (usb2 pins routed
to a different host controller)

Currently driver reads port capabilities in:
usb_add_hcd()
  hcd->driver->reset   ...-> xhci_gen_setup()
    xhci_gen_setup()
      xhci_init(hcd)
        xhci_mem_init()
          xhci_setup_port_arrays()
  
Driver makes some assumptions based on if hcd is primary or not early in
xhci_gen_setup(), and initializes values like hcd->speed = HCD_USB2;

Should be doable, changes needed in at least xhci_run(), xhci_stop(),
xhci_resume(), xhci_suspend(), xhci_gen_setup() and probe.

-Mathias


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
