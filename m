Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A80C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 07:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B8F6113D
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 07:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B8F6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PndGmrKWHEUFfu+hKlkvs4AHosprG5XadBOdN3+btMI=; b=qaKDaIAdfPw/Bd
	5KEAwjOJXUIICewwQdz0OA+oUcT1JR4ER47nPOkd9aC7gwjb4PEEEnBFT9E0qGygJj1xlbRzFrTOg
	6gOul4NKaGXkDYn2c9maUaIb6709RyZANEjznLMxuGi8bUkdqccfsZSjZpuryZKavbPW+/hli9BCP
	2E9wZeCzmM+nM0PFEAiHz1wYEDJ58DGMIhmsN9BHW3zkLxbcRrxjj/PqspYteMmurS3PwoRVKQh8V
	cJSv6kjw0LWzJwMnew3DpoRxhN3pZWXNTIvavoorrdep7nkdnJDiUMu5NvUuSph9llGZbc7MKkpBF
	UrPdpLn3nQl3wv17zl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvb0N-0063bT-2I; Tue, 22 Jun 2021 07:39:31 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvb0J-0063Yi-OA; Tue, 22 Jun 2021 07:39:29 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 660775C2B6F;
 Tue, 22 Jun 2021 09:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1624347563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onB9UuJyGc3H934z5YSKRbsq7jzwCO5Oq2iO4br0hps=;
 b=u1Xh3ic5lrJQNpntAjlQod/MYyNp28dTLlloQrU9ix/qs2OUlAYBE7IQ82GrI5EN6Bd/x+
 tUZeTUZI8Il1tT4ywOtDHIFs059Pa0qVxaIp3eG323l7zu9niDjdnkxmEE+PEL5v4ED1lc
 dzP9WGocSAyYmPYbNLwjMAsP0gz2kqI=
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 09:39:23 +0200
From: Stefan Agner <stefan@agner.ch>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_003928_432069_98E3338A 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On 2021-05-17 11:14, Stefan Agner wrote:
> Hi,
> 
> We are currently testing a new release using Linux 5.10.33. I've
> received since several reports of random reboots every couple of days.
> Unfortunately the log (journald) doesn't show anything, just a hard cut
> at some point.
> 
> After running serial console on several instances, I was able to catch
> this stack trace:
> 
> [202983.988153] SError Interrupt on CPU3, code 0xbf000000 -- SError
> [202983.988155] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
> #1
> [202983.988156] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [202983.988157] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [202983.988158] pc : udp_send_skb.isra.0+0x178/0x390
> [202983.988159] lr : udp_send_skb.isra.0+0x130/0x390

<snip>

We do see those crashes in similar frequency with Linux 5.12:

[129988.642342] SError Interrupt on CPU4, code 0xbf000000 -- SError
[129988.642348] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.12.10 #1
[129988.642350] Hardware name: Hardkernel ODROID-N2Plus (DT)
[129988.642351] pstate: 20000005 (nzCv daif -PAN -UAO -TCO BTYPE=--)
[129988.642352] pc : free_page_and_swap_cache+0x0/0x110
[129988.642352] lr : tlb_remove_table_rcu+0x30/0x60
[129988.642353] sp : ffff8000115bbdf0
[129988.642354] x29: ffff8000115bbdf0 x28: ffff800010103a18
[129988.642358] x27: 000000000000000a x26: ffff000000120000
[129988.642360] x25: ffff000000120000 x24: ffff8000115bbe90
[129988.642362] x23: ffff800011456680 x22: ffff0000e07df970
[129988.642365] x21: 0000000000000003 x20: 0000000000000001
[129988.642367] x19: ffff000005300000 x18: 0000000000000000
[129988.642369] x17: 0000000000000000 x16: 0000000000000000
[129988.642371] x15: 0000000000000000 x14: 0000000000000500
[129988.642373] x13: 0000000000000002 x12: 0000000000000000
[129988.642375] x11: ffff8000cf5e6000 x10: ffff000028212800
[129988.642377] x9 : 0000000000000001 x8 : 00000000fffff1b8
[129988.642379] x7 : 0000000000015f40 x6 : 0000000000000001
[129988.642381] x5 : ffff80001007cf4c x4 : 0000000000000007
[129988.642383] x3 : ffff0000e07e2e78 x2 : ffff000025a2bd00
[129988.642385] x1 : ffff800010208b60 x0 : fffffc00002e9a80
[129988.642387] Kernel panic - not syncing: Asynchronous SError
Interrupt
[129988.642388] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.12.10 #1
[129988.642389] Hardware name: Hardkernel ODROID-N2Plus (DT)
[129988.642390] Call trace:
[129988.642391]  dump_backtrace+0x0/0x1a0
[129988.642392]  show_stack+0x18/0x70
[129988.642392]  dump_stack+0xd0/0x12c
[129988.642393]  panic+0x170/0x338
[129988.642394]  nmi_panic+0x8c/0x90
[129988.642395]  arm64_serror_panic+0x78/0x84
[129988.642395]  do_serror+0x38/0xa0
[129988.642396]  el1_error+0x80/0xf8
[129988.642397]  free_page_and_swap_cache+0x0/0x110
[129988.642398]  rcu_core+0x310/0x5d0
[129988.642398]  rcu_core_si+0x10/0x20
[129988.642399]  _stext+0x128/0x28c
[129988.642400]  irq_exit+0xd8/0x100
[129988.642401]  __handle_domain_irq+0x68/0xc0
[129988.642401]  gic_handle_irq+0xa8/0xe0
[129988.642402]  el1_irq+0xbc/0x180
[129988.642403]  arch_cpu_idle+0x18/0x30
[129988.642404]  default_idle_call+0x20/0x68
[129988.642404]  do_idle+0x218/0x270
[129988.642405]  cpu_startup_entry+0x24/0x70
[129988.642406]  secondary_start_kernel+0x178/0x190
[129988.642418] SMP: stopping secondary CPUs
[129988.642419] Kernel Offset: disabled
[129988.642420] CPU features: 0x00240002,61082004
[129988.642421] Memory Limit: none

It seems load and/or hardware dependent since we see it on some devices
quite frequent (every few days), and on others it takes multiple weeks.
Of course the once we see it frequently are the ones in production :).

I am currently trying different stress-ng and other load to accelerate
the crash rate before then trying to git bisect it.

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
