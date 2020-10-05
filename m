Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22E7C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:03:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BEF20774
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="msJn8xct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91BEF20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ht7T6sDWhDHIXKngDCMUIhntEq44XF2gXyH2qBNHzF8=; b=msJn8xct4pl5tDyv1tP05mR4O
	+VfCEVjrBaPbgh2+jHr4pGooJMI7q3lG1q0eG/Os+ctQ8kKuw840f/lvCxJP4Dudcx9AIKk9FvV3n
	EIABEBz7bLDsYPhKh4TW8ex2lCbdXJB8mouZE76QqKSJIWJqubRt9m6TIq2NO9H02zriGlOmuzpHy
	LGGiBW95CzHJVMGuN7SZ1vkrDbixY9BkfhR9YArClr7f5R1mAyfVaoFk1mrjPr/fhi71ooAbLa9AX
	ubvfNXe7rrYghstWji3DsYaj2RdbtuuEiuUr72nlZcenlr3BGgTgmHZykK6nUiDfr0fF69sTnEZCi
	QMw9lu/oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPDL-0005da-1W; Mon, 05 Oct 2020 12:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPDH-0005br-76
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 12:03:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70D7D106F;
 Mon,  5 Oct 2020 05:03:28 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9D53F70D;
 Mon,  5 Oct 2020 05:03:27 -0700 (PDT)
Date: Mon, 5 Oct 2020 13:03:22 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pci: meson: build as module by default
Message-ID: <20201005120322.GA13539@e121166-lin.cambridge.arm.com>
References: <20200918181251.32423-1-khilman@baylibre.com>
 <20200928163440.GA16986@e121166-lin.cambridge.arm.com>
 <7h362wmpco.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7h362wmpco.fsf@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_080331_339556_7362748A 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Yue Wang <yue.wang@amlogic.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 02, 2020 at 11:53:27AM -0700, Kevin Hilman wrote:
> Hi Lorenzo,
> 
> Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> writes:
> 
> > On Fri, Sep 18, 2020 at 11:12:51AM -0700, Kevin Hilman wrote:
> >> Enable pci-meson to build as a module whenever ARCH_MESON is enabled.
> >> 
> >> Cc: Yue Wang <yue.wang@amlogic.com>
> >> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> >> ---
> >> Tested on Khadas VIM3 and Khadas VIM3 using NVMe SSD devices.
> >> 
> >>  drivers/pci/controller/dwc/Kconfig     | 3 ++-
> >>  drivers/pci/controller/dwc/pci-meson.c | 8 +++++++-
> >>  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > Applied to pci/meson, thanks.
> 
> Rob pointed out that the MODULE_LICENCE wasn't the same as the SPDX
> header.  Could you squash the update below before submitting?

Hi Kevin,

done thanks.

Lorenzo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
