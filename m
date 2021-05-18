Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589E9C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 09:16:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799C961042
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 09:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799C961042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i7Y9WCjhijTzg6HqNrkTxoCDmwk4Qjy2F7e9VwKbsbw=; b=lDarHqd4v0bLaLklsjY9JH4tj
	6AqAH1jpZiLKSwROzzsXi9T26efFkpu6ecmIhwxAjIbUCmb5gOYicYps0KLLU9Yf566XsM5RLVOsp
	kMJI995WtyKxNu2IdqK1ifmJmNbSQdx8PdZ3vaP6GjE+8gZHzquq2gwBmLKObOx0jmTqfpLFrSTZ0
	CaJMFEbOiFT3+2V39o4jq/SE7ajFXgNpytNLrpsP6vIWFhnLRxc4oOZ1+9dd5PZa64HAgIvQwztaG
	ZfOTc9bTHNPpDAkKXYX+mNa22dfALH6WvOqIbnUZPoZxOaq1WdnxihzCJuomrvE8LsCQuFiDd1sg2
	93OG2YUCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1livpv-0005i2-IG; Tue, 18 May 2021 09:16:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1livps-0005h0-GE; Tue, 18 May 2021 09:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=V1Ul7qf1y7P5nBpTkuAKUdnsOAzPeHXA+hPmd6X9o6o=; b=Knv2ssakgKC1H2H/756PNsYOrG
 3ttQZDS3Dzs+UDabXdzyeT5rwKid58OWtDk2c0nGA/Ggq7gszTSNnZ08k56qbNQATlVqs/OhapdiU
 dEU1YE5qnVgNffYPdtGTiDWhaL3Ow6BEk5vhhvaL4BG6y6e3aKYMZauo19cjWQPfRKmmPzj+cp6b1
 q8TwMnRVAmJLBQulQ/t41STtMup+HKhMsG8rTvl9tlrDgBxxgzd0M2HX4FJspiiPNRHRfwCWuvf/P
 h8ulOGRaDrA6L4AiCYhvHzc8yfX6zuczK7FlUjslQIb48tkDoGScUxHOmbAA9ESu23j0g/rjxd+5c
 dGrfYdOQ==;
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1livpp-00EV1p-C7; Tue, 18 May 2021 09:16:19 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id F18B85C2054;
 Tue, 18 May 2021 11:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1621329372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1Ul7qf1y7P5nBpTkuAKUdnsOAzPeHXA+hPmd6X9o6o=;
 b=reYlbQwn1UkXQrmW/L9KWxT6sZ/MpRsai83MRPPcCJOXbUtgX6DdzU+b4BHrhIs+csJhhw
 n/eXejcE5BxLvlmTbfQz/XMVMCTZ98M6n1ybNul3eYa1eqjjrL6ZixErQnvvMGEz15SnxG
 r5vraDl1O9MOROeZzUS79ZS/xfNNsNU=
MIME-Version: 1.0
Date: Tue, 18 May 2021 11:16:11 +0200
From: Stefan Agner <stefan@agner.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <CAFBinCA50H55e2FMKgLtH-+2huReBgm_ckOW9BNcXA1WJwvvBQ@mail.gmail.com>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <CAFBinCA50H55e2FMKgLtH-+2huReBgm_ckOW9BNcXA1WJwvvBQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <29c053975110dfb6d91eab928116ea66@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_021617_885300_8A1F64EF 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Martin,

On 2021-05-17 23:09, Martin Blumenstingl wrote:
> Hi Stefan,
> 
> On Mon, May 17, 2021 at 11:14 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> Hi,
>>
>> We are currently testing a new release using Linux 5.10.33. I've
>> received since several reports of random reboots every couple of days.
>> Unfortunately the log (journald) doesn't show anything, just a hard cut
>> at some point.
> I'm sorry to hear that some things are not working right
> 
> [...]
>> [202983.988187] Hardware name: Hardkernel ODROID-N2Plus (DT)
>> [202983.988188] Call trace:
>> [202983.988188]  dump_backtrace+0x0/0x1a0
>> [202983.988189]  show_stack+0x18/0x70
>> [202983.988190]  dump_stack+0xd0/0x12c
>> [202983.988190]  panic+0x170/0x338
>> [202983.988191]  nmi_panic+0x8c/0x90
>> [202983.988191]  arm64_serror_panic+0x78/0x84
>> [202983.988192]  do_serror+0x38/0xa0
>> [202983.988193]  el1_error+0x88/0x108
>> [202983.988193]  udp_send_skb.isra.0+0x178/0x390
>> [202983.988194]  udp_sendmsg+0x7c8/0x9c0
>> [202983.988194]  inet_sendmsg+0x44/0x70
>> [202983.988195]  sock_sendmsg+0x4c/0x60
>> [202983.988196]  __sys_sendto+0xd0/0x140
>> [202983.988196]  __arm64_sys_sendto+0x28/0x40
>> [202983.988197]  el0_svc_common.constprop.0+0x78/0x1a0
>> [202983.988197]  do_el0_svc+0x24/0x90
>> [202983.988198]  el0_svc+0x14/0x20
>> [202983.988199]  el0_sync_handler+0xb0/0xc0
>> [202983.988199]  el0_sync+0x178/0x180
>> [202983.988211] SMP: stopping secondary CPUs
>> [202983.988212] Kernel Offset: disabled
>> [202983.988212] CPU features: 0x0240002,61082004
>> [202983.988213] Memory Limit: none
> that looks weird
> 
>> Anyone observed such an issue? I am pretty sure that this is a new issue
>> as we have many installations using Linux 5.9.16 running stable on the
>> same hardware,.
> I haven't but I am currently trying to hunt down a (probably
> unrelated) Ethernet issue on an older Meson8m2 SoC currently.
> All Amlogic Meson SoCs use a DWMAC IP for Ethernet connectivity plus
> there's a little bit of "glue" IP for the xMII connecting to the SoC's
> IO pads
> 
> I think it's a good idea to involve the netdev and (probably even more
> important) stmmac maintainers.
> Anything skb related is handled by the stmmac driver.
> So I am hoping that someone with expertise in that area can give any
> hints for debugging or reproducing this.

Ok I'll do that, I currently wait to see the same trace a second time,
just to make sure its really caused by that code path always.

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
