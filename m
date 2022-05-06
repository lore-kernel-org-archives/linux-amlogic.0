Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F3C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 May 2022 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pShMPffVzsxScf1SQ1ObERJgYskHJRy/lxbbf8lAvPQ=; b=0+8T2xqcDOJbnE
	1BNNw3RV+QediVvdliAOp5F/CmgmbfnU0wHIqsaj6RqX2gRjKMlOoq6oAsIge0Kw78IDCjtGjfoxq
	PsphPfthi79xo1Ji8kiklXm1ftoRfxeJC2ZHcfmjuHRXsbyw6PTpaVsV5p8OPjsNrhnBAykqwK0t1
	F6Ig0+XJ/pm5AkNjKnqKkUH6g8vrcCsbFgarF9FVZyX558tFMH5SEBZ0wcdVjW1+5k9Prrg/cSBSL
	ggiZGbRAhJsqO380gr+n0EZ48T4F4CLgISujzVFbGO9E17DPn9teRdJ0ETk2YFZNuvM6Ml1qTzvdI
	jFRbtetCWdmJ/Wwc6WmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmsny-001wwj-Oz; Fri, 06 May 2022 07:55:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmsnu-001wv3-Ip
 for linux-amlogic@lists.infradead.org; Fri, 06 May 2022 07:55:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso6397508wma.0
 for <linux-amlogic@lists.infradead.org>; Fri, 06 May 2022 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fGiYCF2iw5t4VtH5jxb71hCLielghGLBGlvL9ckdnuk=;
 b=HDf5cH9w7G+JBlziGdc4NZXV/Bl8VMVD4v/0jrGsIwWz5NYvLAQiFnPEmBoFsefeYO
 sztyl5l3CnuKRyfgcmlntK3uO2Uh9qRQ2WVhIS+x3SMuT64wNnk7r/pLCTYNUSYIfyUa
 GgQS6XxeKpAkTkvg1zvrVI7ngmX6YfRKyw9eWZ1eoi5BD2v5M+HqyipHoAE26Y48TGAE
 oujwYlhZJBPJYX1VZP3NZZd0iizRFCD5qGVVtvr++gjmvLLoYFZUqq5+5xVj8iixhKGO
 46xpw2wOlxEc0haZbvZ9x3LUU3d1/MiRGsHt6zDrTSugr6+ECDUHhI4Lg0cYDE7T9MT2
 RI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fGiYCF2iw5t4VtH5jxb71hCLielghGLBGlvL9ckdnuk=;
 b=d8RhaUQs/kk/B13+SyFWPVqo9m43vF7y0rFdC8zv1ljMoAty41z/6Ny0bXvDvT6ZME
 RahFcApFrUd716CrS2EgMymeuQGOiLgdcfu0t6tdtKALO587kZsY8xbFssPv4H82boQF
 5780oqPDXftcSAloxakUhGE14aOKgkp2dnvErXDK3Q+8IyssJ+wQQZJXYRdc17AXQoWX
 rV4o+Wud+UGnc9TOGyQgyX+b/2Q+FC6iGXbDi+WBvLHu0rzXUiIwuR2ztmG2lE3NTPEB
 Uu4ZoOiIKWGNZREIxSTejXiKn46v3J/bVgJdDg42Y39M9Ns/+XvDVqp7iFtxo/0P0kNY
 AKVg==
X-Gm-Message-State: AOAM533wYEamilJChh/X3nwKuMnBG5/KjCIJ8x01ardecie4lMrdYuCo
 0nXHxg+dcOpBgaej74bzlfxr9A==
X-Google-Smtp-Source: ABdhPJxXUWYFj9gN67iP4+AdZg3KlNlbI6sMi3eGWQ9KfpsoSreGWKSf6vkbdnNjGdQ1YfZ1QGmKqA==
X-Received: by 2002:a05:600c:3b24:b0:394:7b59:dfd9 with SMTP id
 m36-20020a05600c3b2400b003947b59dfd9mr1343514wms.129.1651823707491; 
 Fri, 06 May 2022 00:55:07 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:56b7:4b6b:7ed:112a?
 ([2001:861:44c0:66c0:56b7:4b6b:7ed:112a])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a7bc34d000000b003942a244ebfsm3373135wmj.4.2022.05.06.00.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:55:06 -0700 (PDT)
Message-ID: <ca6b70a2-9bcc-fb86-200c-e1714c9d53be@baylibre.com>
Date: Fri, 6 May 2022 09:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for per-console
 locking
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com> <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com> <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de> <87a6bwapij.fsf@jogness.linutronix.de>
 <87zgjvd2zb.fsf@jogness.linutronix.de>
 <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_005510_880500_4D8C1601 
X-CRM114-Status: GOOD (  12.78  )
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

Hi,

On 06/05/2022 08:43, Marek Szyprowski wrote:
> Hi John,
> 
> On 06.05.2022 00:33, John Ogness wrote:
>> On 2022-05-05, John Ogness <john.ogness@linutronix.de> wrote:
>>> I will go through and check if all access to AML_UART_CONTROL is
>>> protected by port->lock.
>> The startup() callback of the uart_ops is not called with the port
>> locked. I'm having difficulties identifying if the startup() callback
>> can occur after the console was already registered via meson_uart_init()
>> and could be actively printing, but I see other serial drivers are
>> protecting their registers in the startup() callback with the
>> port->lock.
>>
>> Could you try booting the meson hardware with the following change? (And
>> removing any previous debug changes I posted?)
> 
> Bingo! It looks that the startup() is called when getty initializes
> console. This fixed the issues observed on the Amlogic Meson based boards.
> 
> Feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Best regards

Thanks all for figuring out the issue, perhaps other uart drivers could fall
in the same issue if startup code isn't protected with lock ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
