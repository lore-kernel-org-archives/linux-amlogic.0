Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F527C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFACD2087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrX+HNZ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFACD2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIGg5x8IRBjvaTIjQccxD6eof9cnTnniBTCHPyXSyZ8=; b=hrX+HNZ3H4F1Vg
	ugUXOl2NsoAOnwZSF6NI82kA4wVQpmbIt3X9ne0xrM6slfXMdYWf6CSdCO2dvOlRsbW3HHwF+24Rh
	GSoZZuXuyf91wsciH5QVdu4BcjqZ21WNxlyMEm9fgm5yIhyfRAxXKOr2EPgYZSUvf0MWDz2IoMTkZ
	iibvcJnjc5Z2zH30oXjKG4UtPfYruZLLu/7kpbSv1s4kec2b1pOv5yaESJ1OuPkEMbk4SwJnwXCHG
	hhdij1J5vRvOWh7PLfeN+VwpzexfOtiVruLObjvKgpSbBhWke88rfkQoHhVX5IMup2t0+deaqrhwU
	oCiQazCzHIzZaAe+onFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL0do-00047J-Jh; Mon, 29 Apr 2019 07:23:56 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL0dl-00043P-Pk
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 07:23:55 +0000
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7AAk-1giQjU0jDY-017SZ2; Mon, 29 Apr 2019 09:23:28 +0200
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
To: Greg KH <gregkh@linuxfoundation.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427133117.GC11368@kroah.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <721dc048-8b5f-e7f5-2dab-f0f328435e0c@metux.net>
Date: Mon, 29 Apr 2019 09:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427133117.GC11368@kroah.com>
Content-Language: en-US
X-Provags-ID: V03:K1:2yBsSwNlRemILw3qvHg+EUmYturt1pLcLjGTAKgJyue8kvRS4SA
 Ycg5vG+6X+ZgHuQ3PHVzy/Dv44Zuxjh37IHDyzF2jEvtvZGNvYkKtrnXVZYGUnPdIu0W46i
 2IMqhI87Gg+pJeqQ6/ht5bwJVFkYWHqCEPoyT4ASEIm1+8v8y21GaFqc39ZCbGTdMT51cQj
 0S+tKBdUy1LLCwqz09Z5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hvct3rbX28g=:TmP05eZMgYa4HiZY4PnD/X
 6m3IhBL+nEVPGdArSYiuiX7eZZXEk5U/K4fdA/5I69ZzNB+lgpMzTJARgTptylrCcsF+ec56R
 EcFsOKNj9r4+Pijm0w6PIOOCQR9sDUMsKWVVev1N7blGt5gqfEfHG3QYEEANluS9l3kZ85qbk
 LdiiJxi6KrmHyMeNDiFyYrsu6r5+ZF6VhCjr35ptTbfRr0e5WdHohtBwPezdwun0dBypwZywX
 L5iAIZgzdTo2KZXu+RTM7QCX25OsuIZNUK0fBx7MuFFqj8vtok69bXzmZ8j7mixBq7tx5Wrn6
 i/cdujidsg4MAPszgSCu03/hJyb8p1ELPZ5aG5Cw03pNubg+wvW0vv70xGJY2ux2SC5jfv/TZ
 0kjKPYeKxFMu/0DII+t2N4c4ZCQJKTkCH/2d297RXIqJfaPcp0I+1ngc88j46FPAj7Y/CXSna
 oWFRjB2Mk47zKZTsVGCP+SZCjO+ppRHXdfWvy2WO2L47GwCItPGmDKR1G9/dkNJT/v4lSeMO9
 8RlnxdMzk4uTIE1tZ0xj9SJNh31sjQNICyC1uJ5Jnx2LeKdeZw8Ultodwh9RHuzYigZGtEqtq
 +w5cJnlLXt6zOcX65xf+ZznoLz9/DKEE+bN1MafnjmBF5nahezF1Q9YFoj0JclEWAYzhUDE9C
 F62YYxCgxwvt3b48D5G4DMkXK5gD+OnF6o1vZQ8+QwLzMY/Vt77ayebi1+6HkKqsi3zgXZHmD
 8+778zAcA9tvPs8yE7LGV7ixGCrb8ircrZMSmUQV9blo0HEhiHR6q028GOw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_002354_136213_456A5B6D 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27.04.19 15:31, Greg KH wrote:
> On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
>> Using dev_err() instead of printk() for more consistent output.
>> (prints device name, etc).
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
>> ---
>>  drivers/tty/serial/dz.c | 8 ++++----
> 
> Do you have this hardware to test any of these changes with?

Unfortunately not :(

Do you happen to know anybody who has ?

--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
