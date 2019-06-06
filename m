Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC99C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 21:22:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BA0207E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 21:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUo/3hTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8XX0OP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BA0207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsMW7BlAzdlfu5tClbZJ8v4dE6i20elZmE7s+xOMGhw=; b=WUo/3hTiAMu9Jr
	WR2lsLmnQN8zoOa8OPewHrGb5/a7DWbDZFBvd91QR9TP2dEtWX4tC86wGp8DaQo8VfEd+u26Je9f2
	NaCraMGB9oH7hSVqs/Mkbfoc+h4KA1JjZva+I0nbMz3pgVnbmjuHZi3BGtcescMlI4NGHb8lFzSSI
	lvfm7dLKO7ItWQ5bp8+rBpbW0rfg2lUU1JT3RB7H71zS2xxvA6Zc0qUDgpQ0GQL5Am4NKEPu99oMU
	SuBjMKhzJZj3o+b+JdZkMS2pPZdyMoF8BFG8T4lisMa3k3lsY2ALeKk2xb/yIccwzecUJovM0BK1/
	bplnA6sOaXv0hfKBvyMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYzq4-0004Zv-1h; Thu, 06 Jun 2019 21:22:24 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYzq1-0004ZP-3R; Thu, 06 Jun 2019 21:22:22 +0000
Received: by mail-pl1-x642.google.com with SMTP id x7so1406460plr.12;
 Thu, 06 Jun 2019 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RBQnY16OoiSU9x2fTbRylbra8bvQfhJHveZ7KsLfXLE=;
 b=r8XX0OP59OQafz2qMA3prFHhtITzIOlZ9tRNin1PaPA5CRz3/Rmq6Gp1R0CCilbiQ5
 9ah41993Yr8w0VBOaqbMcaz5gZrghaXz7dd9TfCi2k0ctANR7Vl7VwL/QtH8BoZL0Ojf
 gAcrDEb4VAuNbzVkL0jjpJzoTmWhj5x4WywG7yijizhplmGQFUkxWAIWZib+N1nvF4C+
 Oks7Dnca+eP8AhqzRHkpXPdFTIEOvRncvW1kFuJrqwUlC86oBSFN1oSRlYashgjYO3AD
 DsFuIRvZzlRrlXmDCjqkNCYlTAAMpmoYRWH5rkTSO+dji/GWII3FLXGZ8+9FtDs3XmbF
 AuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RBQnY16OoiSU9x2fTbRylbra8bvQfhJHveZ7KsLfXLE=;
 b=rE2hUWKupvQrxW5tQ0/2EJ12351kiJRtYWp1WMl0HjSUuXI498gJNyHQkWtr2jHwEm
 7wAciSaRcrSiJx9CpV3WOECKuBW0InHkFb6r95e7yOf1IUngwwrtSR5KLX8FSd7wAYDQ
 qklzIfOGZPPriKfP2O3xkqvgF3p+BIUrHpSzCvZ4780KOSgLqoIjLCr0+ejbnLcpPbMx
 iXIv+aD0c4b4wWx+M3tWqR4QvXGjeHPJUzWrMU5xRf8PHr06aoVK0VEeTYJtuF36E+MV
 BjB2xF3GfUBLjEoKb7ziJkcmO+o0a1XqhLPsJXEMMDLAm/FNXD+j5DmG0wCX6DlDTHgH
 WjNw==
X-Gm-Message-State: APjAAAV9eZp7fgqf4XFgrmKr5GJNeS4g+Q4eZXZMlDkQ9jnXeyGNVHYN
 +Bpuys8T3MBfOSaPJx1jBk2kUZe+
X-Google-Smtp-Source: APXvYqxBi6parEcN6dotMYwWVEm/YadS+PaoRNAtjRDPTr29165cicwhTFOnicMr2GAtIb9XE0WQNA==
X-Received: by 2002:a17:902:2a69:: with SMTP id
 i96mr43521459plb.108.1559856140254; 
 Thu, 06 Jun 2019 14:22:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k3sm88985pgo.81.2019.06.06.14.22.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 14:22:19 -0700 (PDT)
Date: Thu, 6 Jun 2019 14:22:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] watchdog: meson_wdt: update with SPDX Licence identifier
Message-ID: <20190606212218.GA1578@roeck-us.net>
References: <20190520142847.442-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520142847.442-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_142221_140660_6CE154B9 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: linux-amlogic@lists.infradead.org, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 04:28:47PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This change has been applied system-wide.

Guenter

> ---
>  drivers/watchdog/meson_wdt.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
> index 01889cef81e1..3389f4c02603 100644
> --- a/drivers/watchdog/meson_wdt.c
> +++ b/drivers/watchdog/meson_wdt.c
> @@ -1,12 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   *      Meson Watchdog Driver
>   *
>   *      Copyright (c) 2014 Carlo Caione
> - *
> - *      This program is free software; you can redistribute it and/or
> - *      modify it under the terms of the GNU General Public License
> - *      as published by the Free Software Foundation; either version
> - *      2 of the License, or (at your option) any later version.
>   */
>  
>  #include <linux/clk.h>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
