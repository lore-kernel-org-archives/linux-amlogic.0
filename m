Return-Path: <SRS0=0hhE=AQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72ADC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 10:29:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7777C20786
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 10:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ns19Y34W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5ugYCRc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7777C20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J5AvtMPx7Ha7UBNe+8daTT+cojfXINf1wMYZLZMHVZo=; b=Ns19Y34WlT29bEMUseTHNtlkP
	391ZQDmHd44ub9LgHfOoPtXRdLy116SYkoTU56jxMUR9VoMWtsfRuoydOeAHdrV06ebTdzSXBVlj4
	IXNbSBadSa2+gSbegqy0JJNUsRwkBB64+2grkJh6gU5TPYZYvd+dTrRj0byH+cfz7pS1TysYP+xQX
	3SSGIWs9u8UdRnpyrZXeQr7kGmf6YTfWTlcE5vB83POZI4UjUz8PWP+x824olnJ7VhoXx2bf4LwO1
	6C6xm8cIttERghn9bheqAzgT26QBO8/rAU6L1AmOlR0VNfSJqPyNXYUYPT4IOdNnnHIZxCK3orxDh
	fE+yWucFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js1tQ-0008LQ-QQ; Sun, 05 Jul 2020 10:29:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js1tO-0008KY-Ih
 for linux-amlogic@lists.infradead.org; Sun, 05 Jul 2020 10:29:03 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81C7320786;
 Sun,  5 Jul 2020 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593944938;
 bh=ywDYyYP83zj9ux21PYQE5OrCn1bZz2ia8i+WucARUgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I5ugYCRcCIJ50y0MU+Z52rDKvhA5WMAhemEVnI4a1zRjeJkTWZ8WWI83NNCF0tVqg
 yZpQSUpFsTR16EKSAFVK2prnFxnoms/90vCmG3JEA5h+PvYzgn8V4GUC6t0rr6yi1p
 Ec+o8vL7a9Eb1lh8YklF6VIOGDSeqa9Ss+QELlZM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1js1tI-0099z3-TV; Sun, 05 Jul 2020 11:28:57 +0100
MIME-Version: 1.0
Date: Sun, 05 Jul 2020 11:28:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] tty: serial: meson_uart: Init port lock early
In-Reply-To: <CAHp75VfFNO=oqHX9EeNdVgcQUfu7RBr6SDTWi3XF4gSQNjqzUw@mail.gmail.com>
References: <20200705092736.1030598-1-maz@kernel.org>
 <CAHp75VfFNO=oqHX9EeNdVgcQUfu7RBr6SDTWi3XF4gSQNjqzUw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <66dcb907f3b9c5413cebe14e0bec00a4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org,
 khilman@baylibre.com, linux-serial@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, andriy.shevchenko@linux.intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_062902_786371_FEB4AA5A 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-07-05 11:07, Andy Shevchenko wrote:
> On Sun, Jul 5, 2020 at 12:32 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> The meson UART driver triggers a lockdep splat at boot time, due
>> to the new expectation that the driver has to initialize the
>> per-port spinlock itself.
>> 
>> It remains unclear why a double initialization of the port
>> spinlock is a desirable outcome, but in the meantime let's
>> fix the splat.
>> 
> 
> Thanks!
> 
> Can you test patch from [1] if it helps and doesn't break anything in 
> your case?
> 
> [1]:
> https://lore.kernel.org/linux-serial/20200217114016.49856-1-andriy.shevchenko@linux.intel.com/T/#m9255e2a7474b160e66c7060fca5323ca3df49cfd

On its own, this patch doesn't seem to cure the issue (and it
adds a compile-time warning due to unused flags).

Or did you mean to test it in complement of my patch?

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
