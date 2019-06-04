Return-Path: <SRS0=z86A=UD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8FDC282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 09:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716D724071
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 09:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0KLcCyJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMPkntsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716D724071
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWu2gXox8k3ZZeireGqdHmAszuQhA3UYna+b+/HuLak=; b=c0KLcCyJNg69xE
	8n2edZcHvaE+ZILUEoIejphyg8w2PCxzl0nlf3Hif+xIa9ZfVCH4RzspABep2lD6T0bD/5vpLDnZs
	KtB3iMDKTo7/bVC49W8uDIp1jDJaNEAumkod6t816mCScn2mIZDV4JLsf2f2AQi46kO0wRkQJD2id
	ShW1ZVofWQAxCdqtV5QOWBW+lKQhT6u5kByR6//+ULuxKS/Eff9S9hLQEtgYyspFp3hWxy45Cs8bp
	xpjJdjHQLSzXMNqlSERjep5p5jZmLwz5parkwKEQOpA2WnhBeFU6fOmBZcLtYvgy3x9viIg4HTo5C
	qkolKSbdNpn9ZR2AemHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY5JG-0000qa-Pn; Tue, 04 Jun 2019 09:00:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY5JE-0000pn-F9; Tue, 04 Jun 2019 09:00:45 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0106B2404B;
 Tue,  4 Jun 2019 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559638843;
 bh=yLF/5A0Yt9mZ3x/1aXHAcLHej2ocHYBWAz21St3a8cI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMPkntsZuOQOTATf2QcQlpT6noEdpw2iM9TaoGZwwXEfEH4Q4a71EjkYhH4vafCeU
 f4aUKUM3TzE4b4m9fTqCCJ1KYrUfQ5qY2r3jbB9loxrFAjYnyvp/KLpN08m4pWY3i0
 LwlvTdaXx+5QVpJTcO5Am5KePDpEOhNS3KcXscqI=
Date: Tue, 4 Jun 2019 11:00:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] mmc: meson: update with SPDX Licence identifier
Message-ID: <20190604090041.GB2855@kroah.com>
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <CAPDyKFoOHnYiYogjogRr=7PBjqHOseDDS6L0eirTo7Y+F449ow@mail.gmail.com>
 <CAMuHMdWHnyTWMToXU_DSezwYs_Lkxj+v0BC8PKXHZgX=e1N3ww@mail.gmail.com>
 <b6e67d32-6092-4bdf-312d-7241094a9248@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6e67d32-6092-4bdf-312d-7241094a9248@baylibre.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_020044_527123_26A32F11 
X-CRM114-Status: GOOD (  14.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jun 04, 2019 at 10:52:51AM +0200, Neil Armstrong wrote:
> Hi,
> 
> 
> On 04/06/2019 10:36, Geert Uytterhoeven wrote:
> > Hi Ulf, Neil,
> > 
> > On Tue, May 28, 2019 at 10:53 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >> On Mon, 20 May 2019 at 16:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>> Update the SPDX Licence identifier for the Amlogic MMC drivers.
> >>>
> >>> Neil Armstrong (2):
> >>>   mmc: meson-gx-mmc: update with SPDX Licence identifier
> >>>   mmc: meson-mx-sdio: update with SPDX Licence identifier
> >>>
> >>>  drivers/mmc/host/meson-gx-mmc.c  | 15 +--------------
> >>>  drivers/mmc/host/meson-mx-sdio.c |  6 +-----
> >>>  2 files changed, 2 insertions(+), 19 deletions(-)
> >>
> >> Applied for next, thanks!
> > 
> > Please note this conflicts with commit 2874c5fd28426836 ("treewide:
> > Replace GPLv2 boilerplate/reference with SPDX - rule 152") upstream,
> > which added (different) tags.
> 
> This happens when we are not CCed with such changes.

No one was cc:ed on such huge changes.  The merge conflicts are trivial
to work out, this should not be an issue.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
