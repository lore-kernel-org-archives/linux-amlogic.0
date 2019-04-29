Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3821CC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 06:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 066F9205ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 06:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nS8SDDSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 066F9205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sl1DB1dr5PWdFwWqB8XdURxo5p4DP9Fhduj4u+pvejc=; b=nS8SDDSBbb9dIL
	gpvlNRVE1S1V/6Nm7COu9mY+f0NrWjmXFtyHpamHKhnlxH+p5mBkexM7Vnoq81f+lF0bgbdexfu00
	suI1OoTl55tD58WDy6wDxfGzDwWpFqrpIQtCrzbbgoPiGfjW22BPGGyiGYUpEBuIcx/7/zTmaSr4z
	CPFC9+uJp+01nlVq8XuPLHw8EwBDQ4pn2xNbzj2axJss69n7HWNnzFGYQE7dkfzv2GZkYiyNuAVMz
	uzqhOBouWjbOSyxfERHqlu2nSBVMnkJYOl3Bm+R0gv3oaIzZNkCMEcqSalLlqGw5U0BtjwUaUaaOA
	3DsrWjiRY12GEpYuCrbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL06U-0001dV-5l; Mon, 29 Apr 2019 06:49:30 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL06R-0001dD-8o
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 06:49:28 +0000
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mcp3E-1gl7730n7C-00ZzhK; Mon, 29 Apr 2019 08:48:59 +0200
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <20190428152103.GP9224@smile.fi.intel.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <431b36fe-3071-fcfd-b04e-b4b293e79a80@metux.net>
Date: Mon, 29 Apr 2019 08:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428152103.GP9224@smile.fi.intel.com>
Content-Language: en-US
X-Provags-ID: V03:K1:M88UFXLBX4VkHOON6uaOcOnE636KnuLI4S/ApACS+qnAPKvNe1+
 9MFUOX3DMU30BBIWozSwvAEA9pGnmBl6OGeXBQ8Y1viVSeN44w0UCqfu9VYX20rWKj/nkKL
 vlvP3uU93E8RgsPKi9ujRFjje3G/Y2BUL7L9RvbqLvk4fuIny6ic9WkRhGLxllJ4DYLhyIb
 wH0HgSJz+Bi+9teW53wMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UkSaLiNxTwM=:2TXPwgpE5+RBFRbyUqHOFQ
 xeHDo/3j0Na0BnkC+0JTCEUa34sTmyQbRB7w4ugZtpJdoNSu1xdU+BMA09hadC91DTT1c0yzO
 kuk7XpLkyI+N0+19kIGZ5gCjqYsD/gbKZ8Qyy9JocWvi4y1vEXHasSDdt8iTaU9VrQLQy8flK
 qSDevaqy2gkfA3bR4BtjfkFZnSKHQtpDiqq3mXC+4IcTnAFIySQzIAlEJJiI55bqb+tSkbzKq
 owQcCerB9D3TCNpnxqqLNVjWK+g79RDFMzNjrcbVvEkGniIRma6jIIKMCyNf42DVoMiMrhh0x
 aXAPFtRiFh/GxROS/IxKSP4wV6B5wR/h27VqFY21bHhQofeIIGTmI0KiIabQGBsdW35kxOhxg
 1i/1jG+pgigRkOKnignHIi2N2wHB6JAqxpWKLNKvEGWP50G0wE8Z6ORBFJtpohgAXfmwiFBxW
 3n1pn+bbr+SvajsKMQUl3+ZkelGKovLL03+RClDxUZP2SUJsaCOHtLAKZGFiCfwViK8E8xgfT
 G9pOuAh4EzKSrpcY52lyA+aZpShZ857A09XO01lj1MT/UIHMroXwGqPKTYB4pmEmeIzsrBOO+
 5T+0kwhObrwWG+hIxyGgBRbGwhYmyae04xr2e8gQMLYXfoA6nSOT3OsoSAIHPclTioTlxFhoE
 Oa4DTHlLTaZWs27uSZAC9epbFBl9Fx2JmP26IreUA0ypMl3yx9fpLArWCrivScL7WAoEN62AS
 VaOqKOyMslPbPSY1JUwq9qDAdgT3eIjQcZTeU8BmLykfVe2cq22dosTi4sw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_234927_616830_30A0C156 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On 28.04.19 17:21, Andy Shevchenko wrote:

> 
>> +#define SERIAL_RT2880_IOSIZE	0x100
> 
> And why this is in the header file and not in corresponding C one?

hmm, no particular reason, maybe just an old habit to put definitions
into .h files ;-)

I can move it to 8250_of.c if you like me to.



--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
