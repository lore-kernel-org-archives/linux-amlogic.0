Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F2CC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 09:14:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E24DF6108B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 09:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E24DF6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSvYSHgmX7anvXQ8n9Ur6AM8guGwSDOf2T6V03xl3m8=; b=NB4wWMkQ0P8psaL2OpBqrsEuSS
	lSrsNvtFYSLRmtwTnQmjP7bPhAceyydIKm3LTE6GUjGwjptd2dc0iRNye7Jf9vGeI3gbv/bouMFNb
	tlwwHWQjLdbkE8/aNKbtmsJmDSWX+GtODj6ibWHpXV+k5I4TI1hfLAdOJ+ubrxIhy5Im7GNjTL/Jc
	qP6RamYsCAhWAs9FMSXZ/bX5yS30/VRxvd3hptRQ+aK3Kd262d2yMt1AissQVn9PwIoghXKjcVX1y
	0kqlyduw4VwByXNk1mA2Aq79wr0LXgj84vx0QnOCoq6tpaBO20S8gBr760i8IEUS10REtRolbO1xk
	eGT4r2nA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liZKZ-00EN6E-OG; Mon, 17 May 2021 09:14:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liZKX-00EN5v-6j; Mon, 17 May 2021 09:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Message-ID:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=S4mvERfvZSg2PWgJA6vEg7KO0TZ+AisxXm7lP0g2ND0=; b=wyLFFl8DgbINqMXxdHUN1RQXsY
 eZTtx89Ft6mlB61yOWoxxFhl8JsZbj/5ebbEViVNgD+lLIKKO481VSzz+pATb2UczqUjTD9I1Z/S8
 NorQ2Kwx14FM5ZzvRkCRhuFy55xzulEb8tvuqAAnMV1j2+WrLJsEZZKnlcGF4cIlewF4U4Cmcur4r
 opdiCroM01n/jEYMY8jViWTPG2P6jKsmaHR9xuLUPhnv+6btTPS3HAFQoiEbhVuRIAO1Jx8j6YUMD
 R8K++SRG2LTZyoH7iYRE+D+9zV3BbxBTSKoLHn1Z92itvhpqGzK4V21WxfnrxHcT5FMZw1/UzyFqm
 SA2g19rA==;
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liZKR-00Dd0K-HK; Mon, 17 May 2021 09:14:27 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 662F05C0769;
 Mon, 17 May 2021 11:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1621242858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=S4mvERfvZSg2PWgJA6vEg7KO0TZ+AisxXm7lP0g2ND0=;
 b=t+05r4kNOD5iI1yMdjidgyRXLO0jelg1OBGFap9bIFnoDdGl/gZ2Ykuh1+9bh0y/XDBpDP
 GC9wGuAwJYwdk9p3x3YuUgWsdQX15mmFh5OvVkFNEjDW5T9SxNxLweEzhEi2i4eEz6EQa4
 nCk3DF1+yfoVMt3Ke5j1nX60xqS7EYs=
MIME-Version: 1.0
Date: Mon, 17 May 2021 11:14:18 +0200
From: Stefan Agner <stefan@agner.ch>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Random reboots on ODROID-N2+
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_021424_068985_73E0A3E6 
X-CRM114-Status: UNSURE (   5.67  )
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

Hi,

We are currently testing a new release using Linux 5.10.33. I've
received since several reports of random reboots every couple of days.
Unfortunately the log (journald) doesn't show anything, just a hard cut
at some point.

After running serial console on several instances, I was able to catch
this stack trace:

[202983.988153] SError Interrupt on CPU3, code 0xbf000000 -- SError
[202983.988155] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
#1
[202983.988156] Hardware name: Hardkernel ODROID-N2Plus (DT)
[202983.988157] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[202983.988158] pc : udp_send_skb.isra.0+0x178/0x390
[202983.988159] lr : udp_send_skb.isra.0+0x130/0x390
[202983.988160] sp : ffff8000132a3ae0
[202983.988160] x29: ffff8000132a3ae0 x28: ffff8000132a3bf0
[202983.988164] x27: 00000000fb0000e0 x26: ffff8000132a3d58
[202983.988165] x25: 0000000000000073 x24: ffff000007963e24
[202983.988167] x23: ffff8000132a3bf0 x22: ffff000005a72a80
[202983.988169] x21: 0000000000000011 x20: 0000000000000073
[202983.988170] x19: ffff000001a92c00 x18: 0000000000000001
[202983.988172] x17: 0000000000000000 x16: 0000000000000000
[202983.988173] x15: ffff8000132a3460 x14: 00000000ac1e2001
[202983.988175] x13: ffff0000079181a0 x12: 0000000000000028
[202983.988176] x11: ffff8000d3407000 x10: ffff800010ea8af0
[202983.988178] x9 : 000000000000001b x8 : ffff000007963e00
[202983.988179] x7 : ffff000000000000 x6 : 0000046a76b5fe28
[202983.988181] x5 : 0000000000941cc2 x4 : 0000000000000000
[202983.988182] x3 : 0000000000000001 x2 : ffff8000d3407000
[202983.988184] x1 : ffff00002f6e0000 x0 : 0000000100000001
[202983.988186] Kernel panic - not syncing: Asynchronous SError
Interrupt
[202983.988187] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
#1
[202983.988187] Hardware name: Hardkernel ODROID-N2Plus (DT)
[202983.988188] Call trace:
[202983.988188]  dump_backtrace+0x0/0x1a0
[202983.988189]  show_stack+0x18/0x70
[202983.988190]  dump_stack+0xd0/0x12c
[202983.988190]  panic+0x170/0x338
[202983.988191]  nmi_panic+0x8c/0x90
[202983.988191]  arm64_serror_panic+0x78/0x84
[202983.988192]  do_serror+0x38/0xa0
[202983.988193]  el1_error+0x88/0x108
[202983.988193]  udp_send_skb.isra.0+0x178/0x390
[202983.988194]  udp_sendmsg+0x7c8/0x9c0
[202983.988194]  inet_sendmsg+0x44/0x70
[202983.988195]  sock_sendmsg+0x4c/0x60
[202983.988196]  __sys_sendto+0xd0/0x140
[202983.988196]  __arm64_sys_sendto+0x28/0x40
[202983.988197]  el0_svc_common.constprop.0+0x78/0x1a0
[202983.988197]  do_el0_svc+0x24/0x90
[202983.988198]  el0_svc+0x14/0x20
[202983.988199]  el0_sync_handler+0xb0/0xc0
[202983.988199]  el0_sync+0x178/0x180
[202983.988211] SMP: stopping secondary CPUs
[202983.988212] Kernel Offset: disabled
[202983.988212] CPU features: 0x0240002,61082004
[202983.988213] Memory Limit: none

Anyone observed such an issue? I am pretty sure that this is a new issue
as we have many installations using Linux 5.9.16 running stable on the
same hardware,.

Now that I can tell that it is network related I'll try to increase
network load to see if I can find a quicker way to reproduce this.

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
