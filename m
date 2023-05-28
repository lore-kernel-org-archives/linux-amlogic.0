Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD416C77B7E
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0UA0g/IP57/LPi4GsHcz2H+LHg523FVyGRH68b3eiQ=; b=UOTfgO6VFQL0tg
	+Q48rPIOIQYutwWBD0vigjYtGIjmOel9VgWs0N1Por2my7AWZqYZDC+w7wQOEMQ7mnGR3EzVvZe1U
	LNp0VdiL/yyTSg8B4TjlBrC9dEWgfMelxGMXaieUFb9Xdhym7299MX+YDzLrwY45nbzhKR/2f/8Bb
	+yHmsb3751WDZDApp0SRmHa4EykvEfPwLfI1kvHC3CH6edYcy8mySDkumhf1YYS09JQt+eqosUgZ5
	PpQ+h/qUtXKaXoSedvFhD9jK5pprqm2+oSMw0g/pr4Euj7lyRX5JgJd5rtuxLs+RA/ecGMCkh+HK+
	YV3veY+h/kMOWjvQuwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Hp3-007rpl-1c;
	Sun, 28 May 2023 14:56:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Hp0-007rop-30;
	Sun, 28 May 2023 14:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 994A660D3A;
	Sun, 28 May 2023 14:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8421C433D2;
	Sun, 28 May 2023 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685285797;
	bh=dYRUdw6cd80d3tuK/aTvNjJCPgSv66gl3Tan1xRID+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ozKYerTIdU290Z5Ru5InZuObVJvZ7SRayUrYO6E1jm9GIjlKx3UL9+UkVSR2HwPkT
	 PV2nBCOF0IxrDlwqVWNPBRFsmHFVbpBo5jt+zl46YKbuaxCkA+hcnzAZJ/BJMgZNEZ
	 /iyhprd7ImIz+xH69Up6SKvCtRjuMo447Mz8DZmvpfr9DEIzJfzOBruUkXUNSGjFnC
	 aR9+7VzVF2F6VE1PBRHddvYZmCXoszln5131uQjS4D0AfAsVDw0FMygMpsU2tEU4uA
	 gMlndYp1VsE//TbFheeT+c7/cT52tKYKwcYVLld5bpe1dSCAUbbsmxnAdpwLropBic
	 beBWU9vY3JUfQ==
Date: Sun, 28 May 2023 16:12:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: George Stark <gnstark@sberdevices.ru>, lars@metafoo.de,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@sberdevices.ru
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch
 channel 7 mux
Message-ID: <20230528161255.216fee6f@jic23-huawei>
In-Reply-To: <ZHMzGHsGEylDdgg7@smile.fi.intel.com>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
	<ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
	<ZHMzGHsGEylDdgg7@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_075639_015989_C372FB48 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 28 May 2023 13:55:20 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, May 28, 2023 at 01:46:37PM +0300, Andy Shevchenko wrote:
> > On Sun, May 28, 2023 at 12:48:54AM +0300, George Stark wrote:  
> 
> ...
> 
> > > +static const char * const chan7_vol[] = {
> > > +	"gnd",
> > > +	"vdd/4",
> > > +	"vdd/2",
> > > +	"vdd*3/4",
> > > +	"vdd",
> > > +	"ch7_input",
> > > +};  
> 
> One more thing to discuss (Jonathan, what's your opinion?) I think the
> following easier to understand and has less problematic characters in the names
> (in case of sysfs direct use from shelll):

I suspect no one would use these particulary inputs directly from the shell,
but agreed that avoiding / where not absolutely necessary is a good idea.

Jonathan
> 
> static const char * const chan7_vol[] = {
> 	"gnd", // alternatively GND
> 	"0.25vdd", // alternatively 0.25_vdd, 0.25Vdd, 0.25_Vdd
> 	"0.5vdd",
> 	"0.75vdd",
> 	"vdd", // Vdd
> 	"ch7_input",
> };
> 
> That said, my personal preference:
> 
> static const char * const chan7_vol[] = {
> 	"GND",
> 	"0.25Vdd",
> 	"0.5Vdd",
> 	"0.75Vdd",
> 	"Vdd",
> 	"ch7_input",
> };
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
