Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA220C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRGYDUXe77rUf7t1q+7oYlRalCX9fogLwG3wLWRmdzw=; b=prKbKdPaJY5fgj
	jImCqfpBv6uxj7fB0lGJ0BCIbkLqxv44o96TbKGCHswp8MDk9o1nHkO3m6eZY1v9n0hjKScW80HrL
	qFI89pO2jYJctXrkt5cEUj51KlJbK9jVNDohHXdHsAjW+OlC7MTfKWxmhFfKhoWB/a/2xahfaI+B/
	PS/4zF5AP/kF25HTd6/TNRwBPb8vTC2jE3Ap2LxNIrgKNSKNlDcIb5U8ofI1rUve1P7c2IKJKfb7I
	wMCApFpjW6959my0pRDhp2hxtmm8oSObltEc6mHRhXigP210/sjyx0mpUH66aWzNN1uuJbKnj9+OU
	GgNLCc+1+VV0duj5sBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGTt-001NwH-8p; Thu, 09 Jun 2022 11:37:41 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGTc-001Nn4-2i
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 11:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654774644; x=1686310644;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TMr75W9JKZO+t3mT/EgyHSDLEJvzD8yw2MY1iSHkBQI=;
  b=MAY0htZzB7wJVib5m9YO1ko8+MZpuLcwmUdR3AROUVFFAfn8nAjE11/D
   nLMTLFd2Nh08uS04ckVALFSbpAbfymhS909Ah1LLV57c1yx9xvBfihZa1
   UQfIcQzfxXHPy4JBkQLWIoXIxtg1Uf43V4a0pww0SAOM/8+CLrFz56Zd+
   XFel5Lm143Zi6LcHS0bapVh3LukWWXNaM0ps9XbFyDR3rPqQBGoC+yhr4
   o4AdbZO6vZyxflUBpPeoanWd0/D6eUiwUyjfgSND+76QeYNJnK2ZKY/lE
   XXgSiUmo5615jI/ZC5w/it/+4O84kvgb1ScMdycq3s4jaAzg5psOFCmuK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="277274298"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="277274298"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 04:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="724377873"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2022 04:37:18 -0700
Message-ID: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
Date: Thu, 9 Jun 2022 14:38:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o shared
 hcd
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
 <YqEMzQgqG16gwFUq@google.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <YqEMzQgqG16gwFUq@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_043724_204240_70716495 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On 8.6.2022 23.55, Matthias Kaehlcke wrote:
> Hi,
> 
> with v5.19-rc1 (which includes this patch) I encounter a NULL pointer
> exception during system resume on a SC7280 board, which has an
> USB2-only HCD:
> 
...
> 
> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> however this field isn't initialized by __usb_create_hcd() for a HCD
> without secondary controller.

Thanks for debugging this, I'll write a patch for it.
Can you try it out?

-Mathias

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
