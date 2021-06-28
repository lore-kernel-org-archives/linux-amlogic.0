Return-Path: <SRS0=+Jf1=LW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C232C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 14:24:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480DE613C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 14:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 480DE613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeK4aI8xsHXM6fRpU7/rCvHkZEjL1AxslWReEhNcbQw=; b=UXSOzLhL4XPNhs
	VtAAF1AuuV6Bp1YvMr6dKSW6fEwlsADxVa2PVZ0KDplrFfaArrNuhHk+x5fo/hgPzEcX8uuhjajjN
	MlVvFC15bTT2hR9izrkqZOHnUjdnKM+BhVWPoosOA9YvJ3O4qCLSktrVWq1GJmLhycpK7eoXNNjHi
	va4lFcOFsGEzaRA84eHxRIDaBYZhW1ecVM65r1Lx5ru5GaGEUcJK4mbsmqrlA1poY8bENoKU5VGuU
	Mce+2TlAr2khVa/WGkVx1/o//sm++M/3LS3ChAmYBx+Y7H0mQqWHUtGWFNPDfreuDh27+VHVmb3T3
	xbORhV6nBeudUM5TB5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxsBU-008Jmt-4f; Mon, 28 Jun 2021 14:24:24 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxsBS-008JmB-4q
 for linux-amlogic@lists.infradead.org; Mon, 28 Jun 2021 14:24:23 +0000
Received: (qmail 657845 invoked by uid 1000); 28 Jun 2021 10:24:18 -0400
Date: Mon, 28 Jun 2021 10:24:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Matt Corallo <oc2udbzfd@mattcorallo.com>
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210628142418.GC656159@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_072422_374324_3DE8D1E7 
X-CRM114-Status: GOOD (  11.42  )
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

On Sun, Jun 27, 2021 at 09:24:45PM -0400, Matt Corallo wrote:
> 
> 
> On 6/27/21 21:16, Alan Stern wrote:
> > You mean that only devices in the first group are affected by this bug?
> > Devices in the second group are always detected correctly regardless of
> > what else is plugged in?  (This contradicts what you wrote above.)
> 
> 
> Correct. Ignoring hotplug (ie on fresh boot or lsusb -vvv), the devices in
> the second group work great. The devices in the first group do too, but only
> if a device from the second group is present.

Okay.  You can try collecting some usbmon traces to see what's going on.  

First test: Boot with nothing plugged in, start a usbmon trace for bus 0 
(cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt), plug in a first-group 
device, run lsusb -v to trigger enumeration, and then kill the "cat" 
process.

Second test: Same as the first except that you boot with a second-group 
device already plugged in.

The differences between the two traces may indicate where the problem 
is.

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
