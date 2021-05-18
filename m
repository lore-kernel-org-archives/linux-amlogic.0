Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B42FC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 09:36:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784AE61073
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 09:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784AE61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kWOfdY5V6Hq9ud7hriL5zJl8hbuRtkQWtgiJ2GNzQio=; b=ZLeii1UTf3+mOhtzB+MrjoCUO
	r7hH6fQ79E+hNE4NXqo1lv3zQvDedC9E5Fv0LQTeqIH0UESaur42/fZmsqUw0zIAbvw1MbEXytJRZ
	8VG5gYmNZrh65yxgHqKn7uW28Ax61N1AsdoDvkcTFNMJlj9mShjsXenQKyEbVcPuw81UWqz7jdOxY
	8XrDPSo3n9JX8jBlsLZtz6xqA0BFptIVmajKs5IyNWFBkR3sr5Y4N0knIXRqj3GM51FE0rxHNRmen
	dkvbj1P61O6FNF/Wm6xhnFs2ob4PiEgXeI7mqXwyeV4tOgqrtBT662wYoE8Qzd+J92IUEiC5obksT
	SqYXe5mvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liw9I-000AML-Tq; Tue, 18 May 2021 09:36:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liw8p-000A7T-Si
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 09:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=xdVYApuwrEz45JH77hHGmSppx0QLaR5X/gA5cviZtRI=; b=MuO4eX7WB0/zk/rjb17cYr+2a6
 az/LlepUCJaqNvWhb6+3IQT/0UfR6yFrE70jNbHsrB/eoLNCUHnng1UQLdMPnVYw+bP7js+fGw8B1
 8nxIXq59qB2uLXya71MmKJuXe9xfU4+K964l+/uEA3YoPeN0M6D5If2PCUNyeXWsRweMWnBZ0GWzT
 RZIkyisEL2M0PoGLP/O1p0QIcho8XJ2uZmANPUbnHEqIbZTEQ2idPARUoR0arunZpDu66Hr7WvXII
 Q9TDBBLh7mxdcpdHnQEjv7S/zJnc4AFDp6K+NTUSu08v0PumbBfVf+/e8fdKgHzRKSIzAivRXwfR6
 8M7dvUqw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liw8m-00EVxp-MZ
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 09:35:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id v12so9430135wrq.6
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xdVYApuwrEz45JH77hHGmSppx0QLaR5X/gA5cviZtRI=;
 b=gPT7TUsi9QpujYpPYmlHHGHHXJH7QkxbxHnhZd0jZhvMKsAEl8YNeLbdNTDmx/49O8
 oq5VubqJ0bKrPOHxSDWQGf+sLPiAiGXKTm0hIcQKFnbSa3MkaK+GdNXrRbOVnXIkTSZ3
 hKP/eIUqGtHQ/FsrNQWtP7un4GT87LPUafWqqc9eqV9RaLsBXwiNlc1dbTMj5+o78TIH
 OtyZaZOQybDdWCJMSGXXXlGti1IBmVC46Ix6CjEBCY6DTcP3z7u/jTj0xMndlojRuH/A
 X6Citixb9Ao/s2xuRpZXgwED+T9Eq/jfJS2iVzpSOqxdXIvjvIrvxr+4NH+c+uy7d+nG
 Brcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xdVYApuwrEz45JH77hHGmSppx0QLaR5X/gA5cviZtRI=;
 b=DfGWFWfVWlvEdNsE/BZnNznnURCGKtplg9rZkHnOiGy2N9MvRNnNyc9huQ+VQwzxtc
 qHD3Q+u85nTO6/vLwJDHDOLVjly6IYM51n2E7/kKFMwGRlScIMf/tyoKrZ9pxxS/k725
 bgq9b8j5EbU05c3c+5GWgw0NmTkib1qX86HjxQFu/ssFPPYdanEcQCl4OUzEN8dK5MBr
 JsBY7tnDzccwUoDTE8aL232uqZL+xbXSbkPdiEG7TvrwJ14tSQ6TqCptizE+ZwAjMKy6
 eCODfUV4UtQJlYoYY3Wl40091QfQBQN0otT2W+pjeeDH1qiwuDbHssj3nFu4pQo1sSK/
 JWmw==
X-Gm-Message-State: AOAM530/lYAQTwpDdjMmCgrSRzEaWyWFktDkInyygZ+YqvXQzM4sFW0J
 uRbANrqx+aDbWxetSpoaT3fv5Q==
X-Google-Smtp-Source: ABdhPJxDcCpBcYBQ0ylp9SnsTv3+2nf3oMUWxhiugX5Eec7q06x50hl8XbPseUYWeI2oW3XaxCiODg==
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr5588774wrh.373.1621330550784; 
 Tue, 18 May 2021 02:35:50 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:842:2d82:a1ae:1a91?
 ([2a01:e0a:90c:e290:842:2d82:a1ae:1a91])
 by smtp.gmail.com with ESMTPSA id d15sm18068054wrv.84.2021.05.18.02.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:35:50 -0700 (PDT)
Subject: Re: Random reboots on ODROID-N2+
To: Stefan Agner <stefan@agner.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <CAFBinCA50H55e2FMKgLtH-+2huReBgm_ckOW9BNcXA1WJwvvBQ@mail.gmail.com>
 <29c053975110dfb6d91eab928116ea66@agner.ch>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b4e10e64-54b6-6ff0-ff7b-f360e83bcd5e@baylibre.com>
Date: Tue, 18 May 2021 11:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <29c053975110dfb6d91eab928116ea66@agner.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_023552_747436_7B4ADA4B 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Stefan,

On 18/05/2021 11:16, Stefan Agner wrote:
> Hi Martin,
> 
> On 2021-05-17 23:09, Martin Blumenstingl wrote:
>> Hi Stefan,
>>
>> On Mon, May 17, 2021 at 11:14 AM Stefan Agner <stefan@agner.ch> wrote:
>>>
>>> Hi,
>>>
>>> We are currently testing a new release using Linux 5.10.33. I've
>>> received since several reports of random reboots every couple of days.
>>> Unfortunately the log (journald) doesn't show anything, just a hard cut
>>> at some point.
>> I'm sorry to hear that some things are not working right
>>
>> [...]
>>> [202983.988187] Hardware name: Hardkernel ODROID-N2Plus (DT)
>>> [202983.988188] Call trace:
>>> [202983.988188]  dump_backtrace+0x0/0x1a0
>>> [202983.988189]  show_stack+0x18/0x70
>>> [202983.988190]  dump_stack+0xd0/0x12c
>>> [202983.988190]  panic+0x170/0x338
>>> [202983.988191]  nmi_panic+0x8c/0x90
>>> [202983.988191]  arm64_serror_panic+0x78/0x84
>>> [202983.988192]  do_serror+0x38/0xa0
>>> [202983.988193]  el1_error+0x88/0x108
>>> [202983.988193]  udp_send_skb.isra.0+0x178/0x390
>>> [202983.988194]  udp_sendmsg+0x7c8/0x9c0
>>> [202983.988194]  inet_sendmsg+0x44/0x70
>>> [202983.988195]  sock_sendmsg+0x4c/0x60
>>> [202983.988196]  __sys_sendto+0xd0/0x140
>>> [202983.988196]  __arm64_sys_sendto+0x28/0x40
>>> [202983.988197]  el0_svc_common.constprop.0+0x78/0x1a0
>>> [202983.988197]  do_el0_svc+0x24/0x90
>>> [202983.988198]  el0_svc+0x14/0x20
>>> [202983.988199]  el0_sync_handler+0xb0/0xc0
>>> [202983.988199]  el0_sync+0x178/0x180
>>> [202983.988211] SMP: stopping secondary CPUs
>>> [202983.988212] Kernel Offset: disabled
>>> [202983.988212] CPU features: 0x0240002,61082004
>>> [202983.988213] Memory Limit: none
>> that looks weird
>>
>>> Anyone observed such an issue? I am pretty sure that this is a new issue
>>> as we have many installations using Linux 5.9.16 running stable on the
>>> same hardware,.
>> I haven't but I am currently trying to hunt down a (probably
>> unrelated) Ethernet issue on an older Meson8m2 SoC currently.
>> All Amlogic Meson SoCs use a DWMAC IP for Ethernet connectivity plus
>> there's a little bit of "glue" IP for the xMII connecting to the SoC's
>> IO pads
>>
>> I think it's a good idea to involve the netdev and (probably even more
>> important) stmmac maintainers.
>> Anything skb related is handled by the stmmac driver.
>> So I am hoping that someone with expertise in that area can give any
>> hints for debugging or reproducing this.
> 
> Ok I'll do that, I currently wait to see the same trace a second time,
> just to make sure its really caused by that code path always.

A good work would be to eventually do a bisect between the last known working and
the currently working version.

SError Interrupt looks like an HW issue caused by a change in v5.10

Neil

> 
> --
> Stefan
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
