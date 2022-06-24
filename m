Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE839C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jun 2022 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzDV+mXZILajFpKnnEO8Ph5/p7faSDwoNuxZoSWf3Vo=; b=nbWQlKznqdZ+7mxQmsDCY6h2SQ
	xDf8/4dQ3PUfZdG1n5/IZVlZ+vGdEyl5fQcDDLp9LTE4ezP3aQdXk5yO/GlSEJ+CT4g9eW/jXEE0M
	TLioaSncq1DDcL+xItCAlNzjGjBnmA9xh9fbv0xoaKt42CHNj1HHNJ6ZhAN/6U5tJdrzZFEjTYAbV
	bN62Nnl+10DTarBZ6LUJZKRi0zhegoRswJohIy+rl9iHuK9K1JzZPqkm1bNKNvEG0t7PXdOZB/4Cx
	7srZelQ29SpkrCC39BnCkC/K2T4dNdwTNem+VNgnEVMvBybnEbkPmj+glZAAGj/Dqg5WmaIOHIJ6V
	OJGMnLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4pTs-003i82-GV; Fri, 24 Jun 2022 20:00:40 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4pTh-003i4c-0b; Fri, 24 Jun 2022 20:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656100829; x=1687636829;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aPeFMT2xLIQ7Nk30nxXxTOVKrUtn7QWE8ufSym4FWP4=;
  b=J/vblKG1gRj9GHVosYBIVPHjfX62aSxP9FKPsYwuf3OptoRg4yAv3SrR
   xQo9j7H4kO8cSA3AwGgPhQsVRJ4M+AyfESdi6mQJE/YIpo1syHYYFCDEw
   H2MmuHaUtypG4fBVCWwSzu4WxsLaSiMP+DM9t3N6O988XNWNgnyXUEUZZ
   jY3Ao2l+N496NfF8QNTDqnwvq6HlBK7mVTd1ndurvbFVZ0CBXoy4qqR6l
   xWga8oSuanFoynKSafZAZ568LF8qiRjn3zlBLycSMndmTzOTKaNuNret+
   SwNUQg7uZCeUoRNf4RAQrwondWwXcPoGwbwDcJrg/zYbQODsmHi2qtRby
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="261501426"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; 
   d="scan'208";a="261501426"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 13:00:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; 
   d="scan'208";a="645421660"
Received: from vhavel-mobl.ger.corp.intel.com ([10.251.216.91])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 13:00:22 -0700
Date: Fri, 24 Jun 2022 23:00:13 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
cc: linux-serial <linux-serial@vger.kernel.org>, 
    Greg KH <gregkh@linuxfoundation.org>, 
    Neil Armstrong <narmstrong@baylibre.com>, 
    Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
    =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
    linux-amlogic@lists.infradead.org, linux-actions@lists.infradead.org, 
    linux-unisoc@lists.infradead.org
Subject: Re: [PATCH v2 5/6] serial: Use UART_XMIT_SIZE
In-Reply-To: <e864ffbc-5885-f648-01c4-68a598f942b9@kernel.org>
Message-ID: <6fb33489-946f-ad92-df35-7f608420bc7@linux.intel.com>
References: <20220621124958.3342-1-ilpo.jarvinen@linux.intel.com> <20220621124958.3342-6-ilpo.jarvinen@linux.intel.com> <e864ffbc-5885-f648-01c4-68a598f942b9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-120668389-1656100826=:2099"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_130029_108468_84169ED0 
X-CRM114-Status: GOOD (  15.98  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-120668389-1656100826=:2099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Jun 2022, Jiri Slaby wrote:

> On 21. 06. 22, 14:49, Ilpo Järvinen wrote:
> > --- a/include/linux/serial.h
> > +++ b/include/linux/serial.h
> > @@ -9,7 +9,6 @@
> >   #ifndef _LINUX_SERIAL_H
> >   #define _LINUX_SERIAL_H
> >   -#include <asm/page.h>
> >   #include <uapi/linux/serial.h>
> >     /* Helper for dealing with UART_LCR_WLEN* defines */
> > @@ -25,11 +24,6 @@ struct async_icount {
> >   	__u32	buf_overrun;
> >   };
> >   -/*
> > - * The size of the serial xmit buffer is 1 page, or 4096 bytes
> > - */
> > -#define SERIAL_XMIT_SIZE PAGE_SIZE
> > -
> >   #include <linux/compiler.h>
> >     #endif /* _LINUX_SERIAL_H */
> > diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> > index 5518b70177b3..1767dee98021 100644
> > --- a/include/linux/serial_core.h
> > +++ b/include/linux/serial_core.h
> > @@ -296,6 +296,7 @@ struct uart_state {
> >   	struct uart_port	*uart_port;
> >   };
> >   +/* The size of the serial xmit buffer is 1 page, or 4096 bytes */
> 
> That is not completely true, I'd remove the "or" part. Hmm, but then the
> comment is somehow superfluous as it says what we can see below. So maybe
> don't add it at all?
> 
> >   #define UART_XMIT_SIZE	PAGE_SIZE

Yeah, the comment is probably not that useful. I managed to get into  
an "autopilot mode" with a sole goal to preserve the comment rather than 
thinking/reading it through whether it's worth preserving.

-- 
 i.

--8323329-120668389-1656100826=:2099
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--8323329-120668389-1656100826=:2099--

