Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE01CC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 20:10:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1898061353
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 20:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1898061353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0OW1epr4/Mmr8h7zw/bSqEF16ScGyQ4dVY9sUgUMPU=; b=B+vBg8pqhsMB0LXC8/75A4zbV
	/cq850+uoARuEEIrYEk7s05uoA63q3ivBYZ3v+cJg/stljVqPMnQt11BO7XT+8DyYxXb8ZEZDnZIP
	KUs8jIcs147iDJ6YcfUcwiUptxO0I+M19BaxKwDSiL4zUhqU2yV51qww/By0zVWNgX7If7cso1xnB
	Jji2Mlim68aXecJDTrx8I7ExPIVTUTgQod0TsHe6u4yTbeNJcmEOJM3BN6KS/d1rG5V2bONmrtpMp
	W7806Coi6G5E2AbwMBC5jBiyMtLzB9wGMUlgbUDSSiG5uvoudcbkH9imcuyJY6e2U+I5KaZJQzDS+
	XZD1ElA7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljSWC-004ytR-5e; Wed, 19 May 2021 20:10:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSW4-004ysn-HY; Wed, 19 May 2021 20:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=hwKEFNAdOUQmpOgMlOaD1GakByAbn1VmROEZ2WgD8ho=; b=2PIMFPUaUjnfRugyP9MeB8nTJ4
 4zUtzLTAwrvHCagY+jrCVq0CBgPTMNtNRZzz9alKxzAOlMpWuJ0Lqy9HdkosLVKeGAev9V7Gt84gC
 qNSVijcAXJY6OGoe9jl2X+Zuev6vvJt5cZfFfpMlIqtxjXcD3KMzPe4/0GEOnB5hF7rGZBKs2kfzo
 TQ3HCqlJX7cNkHG0tA3GkG1kCYwuNbemznHCZFByk5n39TmQko9IQXiNT4cNYkuF4zIjUkY864HIR
 HIapAlqMEycYURjGKcLy0sQkcxwxe+h1sR1bjx1ACEWJy2/YMV44Vq1WeSSeUHcLqslyN+yeLzyRj
 OSgNVopw==;
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSW1-00FlIU-33; Wed, 19 May 2021 20:10:03 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5D2FE5C0208;
 Wed, 19 May 2021 22:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1621454995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwKEFNAdOUQmpOgMlOaD1GakByAbn1VmROEZ2WgD8ho=;
 b=G+VqX69uG0qmFtq3K2vmMznUzUJa3yY3+1LDFsKnFlK3MznLy67TQhaUqUNtRzV8xN8KjA
 i4yr7/+CcLxzXWkhuYG8o1Nnlzo25H3uZsn4e6c0PMksRwadVqhtKOWfwT4lPtiJoK0Ia+
 P+7qjyAoLpQiGui35ECmd9NaAqcTH+M=
MIME-Version: 1.0
Date: Wed, 19 May 2021 22:09:55 +0200
From: Stefan Agner <stefan@agner.ch>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, andrew@lunn.ch
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1c71a7c1e58590811094ebdd0e1abc54@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_131001_604080_20BA2E2A 
X-CRM114-Status: UNSURE (   8.93  )
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
> [202983.988160] sp : ffff8000132a3ae0
> [202983.988160] x29: ffff8000132a3ae0 x28: ffff8000132a3bf0
> [202983.988164] x27: 00000000fb0000e0 x26: ffff8000132a3d58
> [202983.988165] x25: 0000000000000073 x24: ffff000007963e24
> [202983.988167] x23: ffff8000132a3bf0 x22: ffff000005a72a80
> [202983.988169] x21: 0000000000000011 x20: 0000000000000073
> [202983.988170] x19: ffff000001a92c00 x18: 0000000000000001
> [202983.988172] x17: 0000000000000000 x16: 0000000000000000
> [202983.988173] x15: ffff8000132a3460 x14: 00000000ac1e2001
> [202983.988175] x13: ffff0000079181a0 x12: 0000000000000028
> [202983.988176] x11: ffff8000d3407000 x10: ffff800010ea8af0
> [202983.988178] x9 : 000000000000001b x8 : ffff000007963e00
> [202983.988179] x7 : ffff000000000000 x6 : 0000046a76b5fe28
> [202983.988181] x5 : 0000000000941cc2 x4 : 0000000000000000
> [202983.988182] x3 : 0000000000000001 x2 : ffff8000d3407000
> [202983.988184] x1 : ffff00002f6e0000 x0 : 0000000100000001
> [202983.988186] Kernel panic - not syncing: Asynchronous SError
> Interrupt
> [202983.988187] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
> #1
> [202983.988187] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [202983.988188] Call trace:
> [202983.988188]  dump_backtrace+0x0/0x1a0
> [202983.988189]  show_stack+0x18/0x70
> [202983.988190]  dump_stack+0xd0/0x12c
> [202983.988190]  panic+0x170/0x338
> [202983.988191]  nmi_panic+0x8c/0x90
> [202983.988191]  arm64_serror_panic+0x78/0x84
> [202983.988192]  do_serror+0x38/0xa0
> [202983.988193]  el1_error+0x88/0x108
> [202983.988193]  udp_send_skb.isra.0+0x178/0x390
> [202983.988194]  udp_sendmsg+0x7c8/0x9c0
> [202983.988194]  inet_sendmsg+0x44/0x70
> [202983.988195]  sock_sendmsg+0x4c/0x60
> [202983.988196]  __sys_sendto+0xd0/0x140
> [202983.988196]  __arm64_sys_sendto+0x28/0x40
> [202983.988197]  el0_svc_common.constprop.0+0x78/0x1a0
> [202983.988197]  do_el0_svc+0x24/0x90
> [202983.988198]  el0_svc+0x14/0x20
> [202983.988199]  el0_sync_handler+0xb0/0xc0
> [202983.988199]  el0_sync+0x178/0x180
> [202983.988211] SMP: stopping secondary CPUs
> [202983.988212] Kernel Offset: disabled
> [202983.988212] CPU features: 0x0240002,61082004
> [202983.988213] Memory Limit: none
> 

A second stack trace, same build etc. but different board (instance):

[48112.247242] SError Interrupt on CPU5, code 0xbf000000 -- SError
[48112.247244] CPU: 5 PID: 264945 Comm: python3 Not tainted 5.10.33 #1
[48112.247245] Hardware name: Hardkernel ODROID-N2Plus (DT)
[48112.247246] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
[48112.247247] pc : __rcu_read_lock+0x18/0x20
[48112.247248] lr : lock_page_memcg+0x28/0xd0
[48112.247249] sp : ffff800013e238e0
[48112.247249] x29: ffff800013e238e0 x28: ffff800013e23b18
[48112.247252] x27: ffff000055c5c780 x26: 0000ffff9163c000
[48112.247254] x25: ffff0000053000c0 x24: 00e00000d40e3bc3
[48112.247256] x23: fffffe00033038c0 x22: ffff800013e23a18
[48112.247257] x21: 0000ffff9163b000 x20: fffffe00033038c0
[48112.247259] x19: fffffe00033038c0 x18: 0000000000000000
[48112.247261] x17: 0000000000000000 x16: 0000000000000000
[48112.247262] x15: 0000000000000002 x14: 0000000000000001
[48112.247264] x13: fffffe0001acdd08 x12: 0000000000000000
[48112.247265] x11: ffff0000e4650100 x10: ffff00004c640000
[48112.247267] x9 : 000000000000000c x8 : 00000000ffffffff
[48112.247268] x7 : 0000000000000020 x6 : 0000000000000000
[48112.247270] x5 : 00000000000d40e3 x4 : 0000ffff9163b000
[48112.247271] x3 : 00000000ffffffff x2 : 0000000000000001
[48112.247273] x1 : ffff000000182ac0 x0 : 0000000000000001
[48112.247275] Kernel panic - not syncing: Asynchronous SError Interrupt
[48112.247275] CPU: 5 PID: 264945 Comm: python3 Not tainted 5.10.33 #1
[48112.247276] Hardware name: Hardkernel ODROID-N2Plus (DT)
[48112.247277] Call trace:
[48112.247277]  dump_backtrace+0x0/0x1a0
[48112.247278]  show_stack+0x18/0x70
[48112.247279]  dump_stack+0xd0/0x12c
[48112.247279]  panic+0x170/0x338
[48112.247280]  nmi_panic+0x8c/0x90
[48112.247280]  arm64_serror_panic+0x78/0x84
[48112.247281]  do_serror+0x38/0xa0
[48112.247281]  el1_error+0x88/0x108
[48112.247282]  __rcu_read_lock+0x18/0x20
[48112.247283]  page_remove_rmap+0x1c/0x560
[48112.247283]  unmap_page_range+0x5b0/0x7b0
[48112.247284]  unmap_single_vma+0x4c/0xb0
[48112.247285]  unmap_vmas+0x70/0xf0
[48112.247285]  exit_mmap+0xc8/0x180
[48112.247286]  mmput+0x7c/0x150
[48112.247286]  begin_new_exec+0x2d4/0xa90
[48112.247287]  load_elf_binary+0x38c/0x1800
[48112.247288]  bprm_execve+0x29c/0x5d0
[48112.247288]  do_execveat_common.isra.0+0x178/0x1d0
[48112.247289]  __arm64_sys_execve+0x40/0x60
[48112.247290]  el0_svc_common.constprop.0+0x78/0x1a0
[48112.247290]  do_el0_svc+0x24/0x90
[48112.247291]  el0_svc+0x14/0x20
[48112.247291]  el0_sync_handler+0xb0/0xc0
[48112.247292]  el0_sync+0x178/0x180
[48112.247303] SMP: stopping secondary CPUs
[48112.247304] Kernel Offset: disabled
[48112.247305] CPU features: 0x0240002,61082004
[48112.247305] Memory Limit: none

The stack trace does not look related to me...

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
