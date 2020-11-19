Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCDDC388F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:12:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0E7246B2
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="temUXou4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0E7246B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8pUQ1Vuekpz58wy6LDKsALgqgMzl5wz1Razzx5pMoyg=; b=temUXou4TenC9eWEeBQM63XSk
	wMfRiNbY8l2b/ik/+iv4xgWY/cBd8sS2qW/eb7r9sYO0z7QvB9Whp/tf+QGuzTeeIybc+oZto/c1c
	OhKr4AzvW3UQEB7abQmwhDWpCW4rW2RYAe0Ml07wKl8DyN0Kx92jzSk4pKtuPQJ1nVw/l/qE1L/DY
	Q9SRy2wfU/UY/xeXCA+3+3CV25Mp8C0zwZSoWyTr2lN7NW03mKQ2LSh9qQnsTp/riSfop90vYv+tU
	OfXaAuooK09BTQUKEhEOxdIuq31K1a27PCOkwafK9LukTfIOsynIR8XlDRv0f188EPW4o077IUG39
	+BUHyadtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhrH-0004Zt-GY; Thu, 19 Nov 2020 11:12:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhrE-0004YX-1f; Thu, 19 Nov 2020 11:12:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CCED1396;
 Thu, 19 Nov 2020 03:12:07 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2DF3F718;
 Thu, 19 Nov 2020 03:12:06 -0800 (PST)
Date: Thu, 19 Nov 2020 11:12:01 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: dwc/meson: do not fail on wait linkup timeout
Message-ID: <20201119111201.GA19942@e121166-lin.cambridge.arm.com>
References: <20200921074953.25289-1-narmstrong@baylibre.com>
 <CAL_JsqLZzxXcvoqd29NM45UjL-mbSiHphTO_zOwbCwPKd+jWEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLZzxXcvoqd29NM45UjL-mbSiHphTO_zOwbCwPKd+jWEw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_061208_209239_4D4E17F8 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 11:30:30AM -0600, Rob Herring wrote:
> On Mon, Sep 21, 2020 at 1:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > When establish link timeouts, probe fails but the error is unrelated since
> > the PCIe controller has been probed succesfully.
> >
> > Align with most of the other dw-pcie drivers and ignore return of
> > dw_pcie_wait_for_link() in the host_init callback.
> 
> I think all, not most DWC drivers should be aligned. Plus the code
> here is pretty much the same, so I'm working on moving all this to the
> common DWC code. Drivers that need to bring up the link will need to
> implement .start_link() (currently only used for EP mode). Most of the
> time that is just setting the LTSSM bit which Synopsys thought letting
> every vendor do their own register for was a good idea. Sigh.

Should I drop this patch then ?

Thanks,
Lorenzo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
