Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DB9C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 08:11:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0D1207D2
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 08:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0D1207D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPVoBg0I22DSIUedx+FVZjYV59PWzmaEBOpkZxs8YRE=; b=1L3tNVgCkj7gtUq6sWvZyZaP5
	MUylecyDBX6vStlatnmzeHclT2JCI6qjQ3nJuA2TzJaOMqBhzuzKbW80YiP04uuLGighsowT6xINF
	esKJeMoneLOrpZCTVCplmyBYOKdFVN50CrIrgoO+t6gDG7CTSnCqbtUCMJ913PJY0I9aXmVNLkSEV
	Kaaw8MI3HQo/jDWWSwOmJT0tSQ/f8kYff9x3f3i0PuhJ7+w7jHyV4yDx/Js1E+8D85Ss9Lo1H/SZq
	DWmaSLGKdocNb13oZ5MRg5w4Lb9jfFy/shtSpdRsJNMMs/PPX3bORYEweSRN1MS4UsaYJbQ3cIdaO
	vOB+RiZWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzFK-0006iD-TT; Wed, 23 Dec 2020 08:11:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzFI-0006hH-AT; Wed, 23 Dec 2020 08:11:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8B03207D0;
 Wed, 23 Dec 2020 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1608711102;
 bh=r04tfWe6BzgW/kVLq7dsu9JKh40VfeDiStZESOyfGiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zTIAU+9EG80hB23b6L4UsXEUhfnuvBsWojntx70qYFYZMxhJ3izK+ymtEU9UGAo2F
 ehVZTNIdKwNLodmLXtyhtHgcccNrhrYb3DE1mutCVkov1xxQPn950pF0Cw5YyoV6GB
 2/GotKG7sQ/5fDcWWhbwz2L0MY3BmXftTBun+vLg=
Date: Wed, 23 Dec 2020 09:11:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Zengkai <zhengzengkai@huawei.com>
Subject: Re: [RESEND] usb: dwc3: meson-g12a: disable clk on error handling
 path in probe
Message-ID: <X+L7usyEWYXzxQWD@kroah.com>
References: <20201215025459.91794-1-zhengzengkai@huawei.com>
 <c069b566-224d-f938-089c-6a69d1ec9d55@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c069b566-224d-f938-089c-6a69d1ec9d55@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_031144_448402_6E238FA4 
X-CRM114-Status: GOOD (  10.15  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: balbi@kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 10:13:03AM +0800, Zheng Zengkai wrote:
> Hi everyone,
> 
> Friendly ping:
> 
> Just want to know why this patch was ignored,

Right now it is the merge window and we can't do anything with any
patches until 5.11-rc1 is out.  After that happens, I'll work on
catching up on older patches like this.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
