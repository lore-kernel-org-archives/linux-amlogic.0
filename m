Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB23DC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 18:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8689620675
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 18:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9AEKJPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8689620675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr3Pg2Etn2pJMr9UFHFNvgSwiWmAsgdoefFl2Rg6icY=; b=s9AEKJPGdk/DqR
	yLQBzD+sT+5mdtI109FYk5HwadYXXaUupR1I3K/3FyIHa3sfY1zhlbWvtds1Oid8emX7TtSZLwWNg
	6SFb3TOkZrImR5/cFFr7AToZK9h/HaCmM2BtvkSC9gyHyGGS4MQR+/YDTSPuro+SjFz/ckUnaIMUi
	EnSLJFM0dFAAsh1ybjmOdI56Ax9hI5oXYW2I7U0CG0923UC/RI6RY+JkvqUBM6Wi8i9O5kBoPSMKj
	xYs3C6L5Z1qR7bPxsXk+7d9cvsTjwotkZUfChMTU7+DT8a7LbwptkkorvikFIbZCOBZljUHyOHWK4
	9Cj82N0ZlgdoSj+SZHJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLB0a-0006vj-9V; Mon, 29 Apr 2019 18:28:08 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLB0W-0006vA-F1
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 18:28:06 +0000
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0FE1-1gWweB2srv-00xJGe; Mon, 29 Apr 2019 20:27:00 +0200
Subject: Re: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and
 use it
To: Peter Korsgaard <peter@korsgaard.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-14-git-send-email-info@metux.net>
 <87muk8rg82.fsf@dell.be.48ers.dk>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <cb01328c-6308-d9c7-17ba-644d983b0a50@metux.net>
Date: Mon, 29 Apr 2019 20:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87muk8rg82.fsf@dell.be.48ers.dk>
Content-Language: en-US
X-Provags-ID: V03:K1:au94e1eq1t1YlnnJViJhE/K6kMah+BGDcbk5VT8+2eMOcjazNzP
 K5DjPTgP9xkJSFVa90iiUwfTMbygt1pa/q/QVqLjBcRjKGldPhF1PlUIGuwEcvTYnwNYXHD
 4V5xXevhSRFXCoXSYK9fBGWVz8C7Tl/uH4wFGRM4rQiiRQ/9UA/oGA18KOJhfyGX6iPZWpN
 XbvZlLq2pR9jNFgvXr4Sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9sF2aDxgqew=:FGiiUO8PT3ifq3hod8tMoL
 +SEtG8hOTCH9pJUceAM5iP2H5Es8lUmMB0syxlho4LBC+yxxXRhOFRB2cWsSjbWIidwwPruTU
 0EH2VtAuQux2vVmh6WCiw729yobnsE6+P1JmGeH3xjLZdERrEdqLAdFjESsBb3Q0acApejZtZ
 zF8Viv5HEqMjOgJ1mYJhsAFbtXu1GQ8IITc7sTnty/rlKmhJexVwNJgnBjdqF5ZvLqLxecutK
 kZYcw0VOhspQU0gpK38Kxzp7r0nRLryCZTn/J1G4yqdgXd9ZksMtMoU9Aq3CF83pBTmKEuMfc
 W6iTXMoanXU5yPYQUsjPJ4X8CSucyPOh99f8HWSnnz59FeA5v7yE/kp7l1fIlr5K1u57DIYas
 R7YtCVkI4bBRX3RmDPo/y1IOHz2JqWRDKz2GpU26JYmU2yzf9ADZMm3w9nHD2iQOS21515NNx
 aQoEbBqIk+5kUHNVp2sw8kl8W5rbQ5QZSsgH/c8toQw67UhsUeuPvx425Yp7z4mplQmH4NlbT
 NgVx6Ahvz5wR9VoYhgLcei+Vz3/MqzReS6oP0JQ4aQh/MwUkU8lJwFW9tBu361Ays/BqoFyDb
 xiUN4IP0nNNMQp9V228OUBdjFFGdu4aU8k6c+QTT3D33uXP0z0uWrG8na7KNTfy7xff4cGQ0o
 TMDfGeX3+/tR9Z8ZWz8juRpzoZCUwqW4ATnaFyO1hO1XGHBPU/Tr30mlExcmRm/bx7EI73fMC
 AI9rD1w3c+BVcecBqTfQ0HHodM0p73pOlAR0KOmXf0piKKh5JjRv5OoDRY4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_112804_806604_A710AAA7 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org, vz@mleia.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29.04.19 17:19, Peter Korsgaard wrote:
>>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:
> 
>  > Fill the struct uart_port->mapsize field and use it, insteaf of
> 
> s/insteaf/instead/

Fixed.

>  > hardcoded values in many places. This makes the code layout a bit
>  > more consistent and easily allows using generic helpers for the
>  > io memory handling.
> 
>  > Candidates for such helpers could be eg. the request+ioremap and
>  > iounmap+release combinations.
> 
>  > Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Acked-by: Peter Korsgaard <peter@korsgaard.com>

thanks for review.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
