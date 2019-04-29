Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31B5C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 14:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A17205F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 14:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UoFbqbzt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A17205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ka8HGWVNz6UQfOnuSRHCDpJPIGFFRqitMaHDqgwOek=; b=UoFbqbzt7yG2N8
	1F6ucJFYosupZWlKj0v5CVPNpHgv3qQCaieJzWNbpgvf7SB4wV9T+dEGy0v9kNob1/it1FfEQjMWt
	EaRSNjfkltKk7i1rT10yRnU64ktITc+brnEc4baywRnw4Mi4MaYUiNmiCXsGlJWBZh1Ud3uNPWrEa
	dG+u/eaKbbPsC7HnPL1k0HykNh25SGJiNP85dG4bGbXN27iBUR+71zJ1t8CyeEsetJCj6WQZqugF9
	AIl/Hs9CFZEcUDMblAJ7UFt+24PPSve++Bk3dECP84jq+2P/JCwoVPlNjxCAxjHQuF0IeTvAcmzzJ
	dR0kdd+g3462FUTxye4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL7h4-0003RS-E6; Mon, 29 Apr 2019 14:55:46 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL7h1-0003R3-HT
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 14:55:45 +0000
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MzhSh-1gYdpR49Nx-00vcL0; Mon, 29 Apr 2019 16:55:13 +0200
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
 <20190428151848.GO9224@smile.fi.intel.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
Date: Mon, 29 Apr 2019 16:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428151848.GO9224@smile.fi.intel.com>
Content-Language: en-US
X-Provags-ID: V03:K1:3sNaGIwVieBtMMPDbaHtnQ9WqDYUZdXDzXdtSPxuDKdaXl1IhJx
 gExeQeuUVBW9F8lPEU32YFMe/ujn/jKm3Qo/yQgDM0nzyQYP+uCPSUDJN/wl74WlUhOFl0H
 b9FygV4JGeGXjaq1ueGEJHfa2utbBtfqmEwr5N/Cg0mgACNio7NSt3lhmpR00vRsMaYfrz8
 XlPVJlU6S0ovAYl+qK9DA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4eAEJ0wqyW0=:R8Lq31LWiuM3bZqp1AQZRZ
 jyqOXktZyU/EhjOWGDvRMWW3paokS57Sx0yc4uwnO6dW+U4GGDyD5OGfx43RER6pilTojd0Cc
 1UvhRZhNvHyNSboccxXg4jxVr61SiKbaiipZqc+naHd1ejutU8kiPSah1j2BPJMskurk632/Y
 nukzV2GRHNrvPqdoyfrS6s+qBz9aDlcAx9P6cdOpirdL0w0XVqfr+tiPUixOrykaqEPKMVtKL
 4OGgSljM9ZDmNeIvVFhlvLWLVFKmPMfuyzdRN0JRAjZGHQP8bk3aTcH8A8onXk/l0QJqHKhDX
 ZQ4bypEgU32hQ4fqOqnWyQmKcfVmdEkraWqwANE/QrsjnJU89kjPxH4M9ZfgkJf1GE7bGdCt1
 XhrQ8ybROPrVDOJCthK1AGoo0AmLPY6uR2O1MZa5KaS3QjuUVPykBRE01dQJR2GvK2jlSiPXW
 zZ6hxOJP8CI1RzsHOkTMtdomXf7Gm8m2tF4WFR6XxuWUgOBnt3ZZIIlrPwEeD6KS08lQpQRZD
 3qMm83rz1mRcgd9SJaG5GP6l1TZznT12n5BWoD4OS3VG6a46jzylv2wemvehNTDk4TTOjt62R
 OncMDUxVV4h+DnfwTXj+a6L5MPoAszfUepWtuwGjKsEhwBb+0x+CAUGIFYQFSjobFQD0BxRfx
 r0b01pqkzW9vQJ/lMSLIZWsbJ91UXnzPMnujJVFsM8G2B6NAhnk2yAV+0RvlzpNVO1H9zAvDC
 XLBBWgy4vh7jwZz35FbEeJ2gzJ9/pMyOzs3Y5+E5mRhxkcAYeGmPmyAuSLg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_075543_884941_3DAAC906 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 28.04.19 17:18, Andy Shevchenko wrote:
> On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:
>> The io resource size is currently recomputed when it's needed but this
>> actually needs to be done once (or drivers could specify fixed values)
> 
> io -> IO

fixed.

>> Simplify that by doing this computation only once and storing the result
>> into the mapsize field. serial8250_register_8250_port() is now called
>> only once on driver init, the previous call sites now just fetch the
>> value from the mapsize field.
> 
> Do I understand correctly that this has no side effects?

I don't know of any. (except someting changes things like regshift after
the initialization phase ... :o)

>> @@ -979,6 +979,9 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>>  	if (up->port.uartclk == 0)
>>  		return -EINVAL;
>>  
>> +	/* compute the mapsize in case the driver didn't specify one */
>> +	up->mapsize = serial8250_port_size(up);
> 
> I don't know all quirks in 8250 drivers by heart, though can you guarantee that
> at this point the device reports correct IO resource size? (If I'm not mistaken
> some broken hardware needs some magic to be done before card can be properly
> handled)

Actually, I don't see anything talking to the hardware at all here.
It's all derived from values that are set up before
serial8250_register_8250_port() is called.

>> -	unsigned int size = serial8250_port_size(up);
>>  	struct uart_port *port = &up->port;
> 
>> -	int ret = 0;
> 
> This and Co is a separate change that can be done in its own patch.

I don't really understand :(
Do you mean the splitting off the retval part from the rest ?

>> +			port->membase = ioremap_nocache(port->mapbase,
>> +							port->mapsize);
> 
> You may increase readability by introducing temporary variables
> 
> 	... mapbase = port->mapbase;
> 	... mapsize = port->mapsize;
> 	...
> 	port->membase = ioremap_nocache(mapbase, mapsize);
> 	...

Is that really necessary ? Maybe it's just my personal taste, but I
don't feel the more more verbose one is really easier to read.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
