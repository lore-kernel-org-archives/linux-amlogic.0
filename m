Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B3CC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0419520656
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpT7RgLM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU8p/LiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0419520656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqS0H9kNktHlM1Bf0+0oU3rLLOI9oEPyMn5JXl8m+C8=; b=rpT7RgLMjZUS5h
	sadHjmeWdGTY5SYe4vEEs6Ls+6KG8DjzApGmHA8q76b5NX2cdaEJlxfNWnNCKlqxnFLIq+N2cUVs7
	zPgnSWQKeBHS2aaq3IbBPCR5G6idgO4gcdHqkVcEwtMckaAaaLTj1UqwcM4twA0YezRZwN67tbJsH
	oTRHjuI5F/cZ6owEzhfOO8owNqWAbhU8NpmY1xZc3+hjx6kRttpmKABWjTljRHLW3SiMOTX+m5Zyt
	j3ESkiBSPnaH8TUFUMfZOetdr15yLiEf6bt7mGbPVVVzg9GZYrH61+5sr/SpCQ077oEfmWXNCht3d
	wS6eBLB7J4ZcMzCdQ+ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL89K-0005FV-R7; Mon, 29 Apr 2019 15:24:58 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL89I-0005F5-Mk
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:24:58 +0000
Received: by mail-ed1-x542.google.com with SMTP id k45so9502343edb.6
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
 b=EU8p/LiAuWZTaBXKNZWaKq1vNaSJvDcy39qwV/Z0FHFTDHncV1Zr4ndrOk4JGQHpjX
 8+2Fp9pb74ZpblErpBwk2AHVSA0XH1TFcISRE2xKvyJ09GkPlceqdU0EpvbPyjROw/Rp
 2mjTY5DKkCICp5o8xAzP61nli8P0TVf4bfqEgZD8rzztWgastc4fusx/sOq1jUdvqMSm
 u/4ZemsXZ+LiOOOHhyR/mI0lVFDHDfej+AK9qa3aWH0ZWw6BwM+Q0zzdWbfYGenHUgTj
 mKQnWyDk7GiejXknp18q+wabn/scWwGXt9KqD4tzqHeVAqnAHml0d/6MfFfKMOSTgfl6
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
 b=In1YzooAVrgqLbJfnZCI2ZFgIFOJ5179lG4DMpHSSqsKGRvhWSbWCSsFcXtVp97INr
 Ys6DGo49fvVMsM9/h5uPISjfEm1b+Vakx8euUR2lfeEmUrt3VOEgjRIJ3dHzZNjrXSqL
 4NEi4D9UNKJJi2lNCosmEncoCl5ypjZPvuMo3kTO6OpVAO+dHV7HtALUw3OCZcetpYts
 OrY+KPcQW9Vlk1S1c7M8204x1/evQWCY0oFNdsFfiM3gWWgB4qJU3uH0sErD4f8dgwJm
 w1Q3BDPXpmr/yys0SRYXdeg07s/kfqTzBAn6T8H4a+uNx9nzfBe8nW09ufd56gqNRuqR
 oyGA==
X-Gm-Message-State: APjAAAV07ERVh5FqQnc/o3S5bJoa6l54gcmSqZ/wi8xPG3VqtxZ3xGbG
 IrVVGPwHopPdlvQ+aNF+JM4=
X-Google-Smtp-Source: APXvYqzd7kklmwd/rJ9mZmXiJZJarahK9hi98VCMk8C4K5NtullM8PfDIBfWq8pF0LtSyR4PuNZQ7Q==
X-Received: by 2002:a17:906:1f53:: with SMTP id
 d19mr10119945ejk.12.1556551494836; 
 Mon, 29 Apr 2019 08:24:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 y12sm5901269ejo.85.2019.04.29.08.24.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:24:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL89F-0000nB-4t; Mon, 29 Apr 2019 17:24:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 16/41] drivers: tty: serial: uartlite: fix overlong lines
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-17-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:24:53 +0200
In-Reply-To: <1556369542-13247-17-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:57 +0200")
Message-ID: <87a7g8rfzu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_082456_740527_20182168 
X-CRM114-Status: GOOD (  14.75  )
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

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fix checkpatch warnings:
 >     WARNING: line over 80 characters
 >     #283: FILE: drivers/tty/serial/uartlite.c:283:
 >     +	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,

 >     WARNING: Missing a blank line after declarations
 >     #577: FILE: drivers/tty/serial/uartlite.c:577:
 >     +	struct earlycon_device *device = console->data;
 >     +	uart_console_write(&device->port, s, n, early_uartlite_putc);

 >     WARNING: line over 80 characters
 >     #590: FILE: drivers/tty/serial/uartlite.c:590:
 >     +OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);

 >     WARNING: line over 80 characters
 >     #591: FILE: drivers/tty/serial/uartlite.c:591:
 >     +OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);

Given that these are just a few characters more than 80 I don't really
think these changes improve readability.


 > Signed-off-by: Enrico Weigelt <info@metux.net>
 > ---
 >  drivers/tty/serial/uartlite.c | 10 +++++++---
 >  1 file changed, 7 insertions(+), 3 deletions(-)

 > diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
 > index 6f79353..0140cec 100644
 > --- a/drivers/tty/serial/uartlite.c
 > +++ b/drivers/tty/serial/uartlite.c
 > @@ -280,7 +280,8 @@ static int ulite_startup(struct uart_port *port)
 >  		return ret;
 >  	}
 
 > -	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
 > +	ret = request_irq(port->irq, ulite_isr,
 > +			  IRQF_SHARED | IRQF_TRIGGER_RISING,
 >  			  "uartlite", port);
 >  	if (ret)
 >  		return ret;
 > @@ -574,6 +575,7 @@ static void early_uartlite_write(struct console *console,
 >  				 const char *s, unsigned int n)
 >  {
 >  	struct earlycon_device *device = console->data;
 > +
 >  	uart_console_write(&device->port, s, n, early_uartlite_putc);

Unrelated change?

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
