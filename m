Return-Path: <SRS0=+Jf1=LW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CD7C48BC2
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 00:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC49619BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 00:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC49619BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lv6/VikUb+KY1Hcq05d4TQYdplTo8in+8VCyZF/BQHs=; b=XjS4zn62kdgZAu
	DgYMNlOnK9p6DTnee5/VovLVDTG7Qg5rejGpBRs7NdUFb4JPmSwyEuSkih9nGB/aBSHMpRwvH/ZJS
	UWJdSE9xpxQBvRHfuwp/0yd7YNDoCW2iJ2NWqP5DsokcHhUrKY1hny7TfeEPq5sYNxFiD/zinbjV5
	Byxm2spHdo2wSnnzVHShumUHswmqWzMiDl1DPg5llMy6X7VL69QDY5uV418EaOcVA4Cw6kqJYFBQR
	sR4lmESZJTkHY2j6nIewa5XOoyuqjgGyuDm8HlaD+8rgS+Upy7Yy97EGSllNiTf+rZjm47F/McbBz
	xUaRe7m/z9oBG1d6+QzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxfbd-006NH1-Gl; Mon, 28 Jun 2021 00:58:33 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfbb-006NGS-3F
 for linux-amlogic@lists.infradead.org; Mon, 28 Jun 2021 00:58:32 +0000
Received: (qmail 639150 invoked by uid 1000); 27 Jun 2021 20:58:25 -0400
Date: Sun, 27 Jun 2021 20:58:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Matt Corallo <oc2udbzfd@mattcorallo.com>
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210628005825.GA638648@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_175831_330469_D1C1641F 
X-CRM114-Status: GOOD (  12.62  )
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

On Sun, Jun 27, 2021 at 08:32:21PM -0400, Matt Corallo wrote:
> On an ODROID-C1/C2 device, using the dwc2 driver, only some devices cause USB bus to enumerate devices.
> 
> Specifically, both on boot and during normal operation, if some devices are
> plugged in, all USB devices are detected, but if those devices are removed,
> no detection of any devices occurs.

So if you boot with no devices plugged in, and then you plug in (say) a 
flash drive, it doesn't get detected?

> I sadly don't have a lot more to go on, but xdarklight on IRC (I believe ==
> Martin, CC'd) confirmed the findings with a grab bag of USB devices he had
> sitting around as well, and may be able to provide CONFIG_USB_DWC2_DEBUG
> output.
> 
> Any further guidance on where to look to debug this issue would be appreciated.
> 
> As a sample, some devices which, when plugged in (either alone or together)
> do not cause any USB device detection (see attached lsusb -v files):
> 
> Samsung T7 USB 3 drive
> Samsung-Branded Silicon Motion USB 3 Flash Drive
> 
> Some devices which, when plugged in cause all USB devices to be detected:
> 
> Mushkin-Branded Kingston USB 3 Flash Drive
> Kingston-Branded Kingston USB 2 Flash Drive
> USB-3 MicroSD Card reader (lsusb/testing by xdarklight)
> SanDisk USB 3 Flash Drive (lsusb/testign by xdkarlight)

This could simply be a question of power.  Most of the flash drives and 
the card reader probably don't require very much power, whereas some of 
them need more.  You can this, to some extent, in the MaxPower fields of 
the lsusb -v listings.

Do things work better if you plug these devices into a powered hub 
rather than directly into the computer?  If the hub can provide the 
power that these devices need, the computer won't be overloaded.

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
