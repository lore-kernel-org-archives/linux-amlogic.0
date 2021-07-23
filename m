Return-Path: <SRS0=pDvI=MP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F216AC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 14:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A603608FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 14:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A603608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=winds.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI/TKS8uEXpwdVJZtZLelYNX6pnv717VmuM0LtzXjts=; b=gbwAFw5Hy5pmptZJ3GWDm5dfW9
	NvB1/C1AMp3SNtl1Zjd3mklghQjZAkVvjsNfpCauWqsxNUjUumh8A+X7gG9Ooko9/C8D+q158sqXT
	JlZbekRyZEN+MQabFRSdbmlasEHR4fMTfZ3RuIMsVGBkqCitEvSt9o0az8TENmxFNysc0Fkm+lCSm
	MDZcNnbJVgQD8jJOdTOlEDC5dtsO1tI8ARLWa+bfi1oeMjuKLIZ7vKOLj6it22ur1bmeiC/5qF4yj
	EKj5GgJBIodUp8dlb0sRE1QVTcYfZsg9ZNnE67EATsRXhH1zKuVu2SA/2bv49nWdjfSxAMkNMuGA2
	QduhL04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6w71-0050lP-Js; Fri, 23 Jul 2021 14:25:15 +0000
Received: from winds.org ([68.75.195.9])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6w6z-0050kt-0v; Fri, 23 Jul 2021 14:25:14 +0000
Received: by winds.org (Postfix, from userid 100)
 id 2DDFC1921F39; Fri, 23 Jul 2021 10:25:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by winds.org (Postfix) with ESMTP id 2A55F18FB9F0;
 Fri, 23 Jul 2021 10:25:09 -0400 (EDT)
Date: Fri, 23 Jul 2021 10:25:09 -0400 (EDT)
From: Byron Stanoszek <gandalf@winds.org>
To: Stefan Agner <stefan@agner.ch>
cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mike Rapoport <rppt@kernel.org>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
Message-ID: <alpine.LNX.2.23.451.2107221723060.2673@winds.org>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
User-Agent: Alpine 2.23 (LNX 451 2020-06-18)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_072513_177802_E917FF95 
X-CRM114-Status: GOOD (  23.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jun 2021, Stefan Agner wrote:

> On 2021-05-17 11:14, Stefan Agner wrote:
>> Hi,
>>
>> We are currently testing a new release using Linux 5.10.33. I've
>> received since several reports of random reboots every couple of days.
>> Unfortunately the log (journald) doesn't show anything, just a hard cut
>> at some point.
>>
>> After running serial console on several instances, I was able to catch
>> this stack trace:
>>
>> [202983.988153] SError Interrupt on CPU3, code 0xbf000000 -- SError
>> [202983.988155] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
>> #1
>> [202983.988156] Hardware name: Hardkernel ODROID-N2Plus (DT)
>> [202983.988157] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>> [202983.988158] pc : udp_send_skb.isra.0+0x178/0x390
>> [202983.988159] lr : udp_send_skb.isra.0+0x130/0x390
>
> <snip>
>
> We do see those crashes in similar frequency with Linux 5.12:
>
> [129988.642342] SError Interrupt on CPU4, code 0xbf000000 -- SError
>
> It seems load and/or hardware dependent since we see it on some devices
> quite frequent (every few days), and on others it takes multiple weeks.
> Of course the once we see it frequently are the ones in production :).
>
> I am currently trying different stress-ng and other load to accelerate
> the crash rate before then trying to git bisect it.

I have an Odroid-N2+ and was able to track this problem down. The problem is
related to the following dmesg line that reads "failed to reserve memory"
below:

Machine model: Hardkernel ODROID-N2Plus
memblock_remove: [0x0001000000000000-0x0000fffffffffffe] 0xffffffc0107e3604
memblock_remove: [0x0000004000000000-0x0000003ffffffffe] 0xffffffc0107e3664
memblock_reserve: [0x0000000008210000-0x0000000008baffff] 0xffffffc0107e36dc
memblock_reserve: [0x0000000005000000-0x00000000052fffff] 0xffffffc0107feb50
OF: fdt: Reserved memory: failed to reserve memory for node 'secmon@5000000': base 0x0000000005000000, size 3 MiB
memblock_reserve: [0x00000000e4c00000-0x00000000f4bfffff] 0xffffffc0107ff87c
OF: reserved mem: node linux,cma compatible matching fail
memblock_free: [0x00000000e4c00000-0x00000000f4bfffff] 0xffffffc0107ffca8
...

A subsequent "cat /proc/iomem" shows that this memory region is still reserved
and the system appears to operate normally, until eventually the SError
Interrupt comes in under heavy memory/page-cache usage. The difference with
later kernels is that now the memory at 0x5000000-0x52fffff is registered under
the "System RAM" memory area, whereas previous kernels had dropped it from
"System RAM".

The culprit is this new code introduced in Linux 5.12, in this function in
drivers/of/fdt.c, called by function __reserved_mem_reserve_reg():

int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
                                         phys_addr_t size, bool nomap)
{
         if (nomap) {
                 /*
                  * If the memory is already reserved (by another region), we
                  * should not allow it to be marked nomap.
                  */
                 if (memblock_is_region_reserved(base, size))  <------
                         return -EBUSY;                        <------

                 return memblock_mark_nomap(base, size);
         }
         return memblock_reserve(base, size);
}

"nomap" is true, due to this text being present in the FDT:

    reserved-memory {
      ranges secmon_reserved: secmon@5000000 {
        reg = <0x0 0x05000000 0x0 0x300000>
        no-map
      }
      ...

But memblock_is_region_reserved() is returning true because there is already an
entry for 0x5000000-0x52fffff in the memory map, which is already marked
reserved, at the time the __reserved_mem_reserve_reg() function is called.
(Perhaps this is being set reserved by u-boot? -- I did not research that far.)

This function is defined as:

bool __init_memblock memblock_is_region_reserved(phys_addr_t base, phys_addr_t size)
{
         return memblock_overlaps_region(&memblock.reserved, base, size);
}

Since the region to mark no-map, "0x5000000-0x52fffff", overlaps the existing
reserved region "0x5000000-0x52fffff", the function returns true.

If I comment out the "if (memblock_is_region_reserved(base, size))" code and
allow it to mark the region no-map, then the memory area is properly removed
from the "System RAM" area and the crashing stops.

I've had the system up and running for 15 days now under heavy load without any
crashes, using just the following patch as workaround:


--- linux-5.13.0/drivers/of/fdt.c.bak	2021-07-07 00:22:58.000000000 -0400
+++ linux-5.13.0/drivers/of/fdt.c	2021-07-07 00:23:08.000000000 -0400
@@ -1157,13 +1157,6 @@
  					phys_addr_t size, bool nomap)
  {
  	if (nomap) {
-		/*
-		 * If the memory is already reserved (by another region), we
-		 * should not allow it to be marked nomap.
-		 */
-		if (memblock_is_region_reserved(base, size))
-			return -EBUSY;
-
  		return memblock_mark_nomap(base, size);
  	}
  	return memblock_reserve(base, size);


The above patch applies to later versions of Linux 5.10.x through 5.12.x as
well.

Perhaps a more proper fix is to allow the no-map to still proceed, in the case
that the existing reserved region is identical (same start/end) to the region
getting marked no-map.

  -Byron


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
