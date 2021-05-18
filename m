Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377A0C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 10:21:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D789611B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 10:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D789611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YUwd/mB6juT/9/DUjdB24cHQBVW5e/xVVXbKO2G7fYo=; b=M87XytlsE3tdo2PQMDaie004s
	RsHxIrRf84FRr9dorVfzLbQnWbBtM9Uy+brzynQ7IVNYRlG0RrVGQKfLXrif8ZhWX5GHeA806xTbq
	ZJId9b6alEr0krbYOpzgyOO3wDlSDM6xy47VSP+WhYvuMdmacym0pgPj5FbM7FeNdjb8tP5bTyTS6
	Rwxs1yQ0lkkCn3SnQdG9NZsbP/lcPOh5neDhs4j/eIGqaVd7YgoOQ25gXzIqfV4YXQdC4R3eCq1h5
	ZD53yrgqajVkw7hEFtUk/ec6QggRgFvXAWJMTGb8vQUMDhq060EC6ef2g9ubYffUgMDb0G7VWa5OA
	2Wngn6Cbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwqS-000LU3-O4; Tue, 18 May 2021 10:21:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwlZ-000Jx5-Oj; Tue, 18 May 2021 10:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=uwdaWK4C05Xo2Y/+LBg4n7UjN9PEC96SkWPCdjHcKyw=; b=e8v27KCv0wK0j0nq6BKPPZr5nL
 fQF/llHpEFFGwJPvWRZeAt7xGiY9+xtVI3VswVieOILlGIv83Ur7XG1UT6sZRWWaa6U/Tp8GAz9S+
 0U+p0bBhWPxlN9IxJui9uyUj9RzRncXetOQCnUIkrUAQunVGvV8S1b8OpNxouvvuYjnmwRSrPZ2sR
 S9M+r3Q2slY6KtvLo2Euc+FfpKIKC1fUPySb85QAUbN0T1c9EBX1GBxoymEHf36JzoaeYeZCi+s7o
 3B33/P7BXNUW1czdcBc5Fc7L4+kMM3w38VFTirD85kCdoSqy3bwfaIyUdoUJIqaztqniZbun8dpx+
 F8AOxCvA==;
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwlV-00EYJW-Sa; Tue, 18 May 2021 10:15:56 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E54575C025A;
 Tue, 18 May 2021 12:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1621332951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwdaWK4C05Xo2Y/+LBg4n7UjN9PEC96SkWPCdjHcKyw=;
 b=SqRrV15RgVGMc2SERmfP6jKOyLGRIbiU+woXL5ioS/K/DkAFee+48OgdFNbBMipvQEumTu
 F34XyzPhn0Hpp5b2mraeNlWBF5Lxpzy9LzNVwqpRw8ZiRYbZwjVIXtGAWWzO0KS48KMp95
 PdL2m8EQYq2ucXAkaVR7j0LDnCl+klw=
MIME-Version: 1.0
Date: Tue, 18 May 2021 12:15:51 +0200
From: Stefan Agner <stefan@agner.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <YKMZbMA/LFR921zw@lunn.ch>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <YKMZbMA/LFR921zw@lunn.ch>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <782039a3d9a36ddab5877ec771265be0@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_031554_238317_C1C5F490 
X-CRM114-Status: GOOD (  13.60  )
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

On 2021-05-18 03:33, Andrew Lunn wrote:
> On Mon, May 17, 2021 at 11:14:18AM +0200, Stefan Agner wrote:
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
> Hi Stefan

Hi Andrew,

> 
> Could you generate net/ipv4/udp.lst so we can see what
> udp_send_skb.isra.0+0x178/0x390 is trying to do, and what bit of C
> code it maps to.

Ok, built net/ipv4/udp.lst using the same build environment (buildroot)
the kernel which generated the stack trace has been built with, so I
think this should add up:

ffff800010c1bb60 <udp_send_skb.isra.0>:
static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
...
                udp4_hwcsum(skb, fl4->saddr, fl4->daddr);
ffff800010c1bc78:       29450ae1        ldp     w1, w2, [x23, #40]
ffff800010c1bc7c:       aa1303e0        mov     x0, x19
ffff800010c1bc80:       94000000        bl      ffff800010c184b0
<udp4_hwcsum>
                        ffff800010c1bc80: R_AARCH64_CALL26     
udp4_hwcsum
        err = ip_send_skb(sock_net(sk), skb);
ffff800010c1bc84:       f9401ac0        ldr     x0, [x22, #48]
ffff800010c1bc88:       aa1303e1        mov     x1, x19
ffff800010c1bc8c:       94000000        bl      0 <ip_send_skb>
                        ffff800010c1bc8c: R_AARCH64_CALL26     
ip_send_skb
        if (err) {
ffff800010c1bc90:       350008e0        cbnz    w0, ffff800010c1bdac
<udp_send_skb.isra.0+0x24c>
...
        u64 pc = READ_ONCE(ti->preempt_count);
ffff800010c1bcd4:       f9400820        ldr     x0, [x1, #16]
        WRITE_ONCE(ti->preempt.count, --pc);
ffff800010c1bcd8:       d1000400        sub     x0, x0, #0x1
ffff800010c1bcdc:       b9001020        str     w0, [x1, #16]
        return !pc || !READ_ONCE(ti->preempt_count);
...

The full udp.lst file:
https://drive.google.com/file/d/1j0RKOfuMXmCRWILpkG3uk_beohWrr-ho/view?usp=sharing

Since I only have this one trace, I am not 100% if this trace is just a
random one or always the case.

But things seem to add up to me: mdns-repeater deals with UDP packets,
and the it seems that the code tries to make use of HW check-summing
(from lr)? This would explain why this platform only shows the problem.

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
