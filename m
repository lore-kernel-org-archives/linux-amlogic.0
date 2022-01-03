Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153B6C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j92m9nSPqawOIrrFFhNKw3BL7/LPddFLuNzHPyNu+eE=; b=xhHz8ulnY7bGueYuMpIE6QPYFP
	ET1Rkhyy+0VMNZfMxhJMYDt4nxaHGsL4xPfCbk/56gqmKaG1bvjE6HZDSiSsyyvdobu13DJUcJpPN
	YFzsai6R2Lgc37/mzorpzXs/8peghAHX7GN66e/dvJOsNel/ebewUkwaN6B/rHlpJEfD9SR08WAmI
	00SEHpkJ+GtwlazfkJ4fPnCLDNd34y70eLyNG4oSRDqPS1pB8g+CSPJFXNCRffpO04TZRueBpKfIE
	IjnQGk4+o6dmI9RlUIhcxfGLa2L5hB53UE4wHkquAmgQOMIhvO/oxRJkMz0ycuHihMTbBG8eNK28w
	z1WxkULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PHe-009Kpt-54; Mon, 03 Jan 2022 15:30:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PHa-009KoY-Qv
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:30:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r17so70552906wrc.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=He1XPHc1q2yAPDw1ASCF8a/HvnJeaI9DzePFGjO6+Xk=;
 b=dUAiapU6ubmSu1puNGJtfr9z4SpDnkqr2M1bVrvJExwEmqhm2iFMeFbty0VVyM03q2
 BafoPoun8b8LNWLcZOXC49e+c06UGwYyWLnvPn9qpri2FDxxhJIrDONJ7SnGFF+jg4hE
 s2Mrx24UrHQqpbg9/zTE5EeahDB0ZvBknDUkDEgS/E6ZdOSSie9sWRHbpfk+VWc3ibQZ
 9l53P3tRiSug38PT31syI7TYpx4k3ww4oAwXGNQeV5CC2R7W+E4EPkP42PW/C5u1GSce
 urAscOhcZym+OPuI3CBeFl3rwE6I2lNQxC6G3vR60kwFc9a3lWqkf3tESyLr0TCeFfgK
 gTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=He1XPHc1q2yAPDw1ASCF8a/HvnJeaI9DzePFGjO6+Xk=;
 b=bBMNHITqJ85leeJYuvFFCofkHoGEuo5R89bWPn4QBIUsiouiit/qO7KRlr6zVUoFDs
 GAdqCGK+4PUYQ23IId+SvxOZ9IGAgbYA5buWUCoPw/Kk7qg2QxPTzPiCcunKm2rtX+Zo
 YFh0t0XPqEH8nfEIcWRl98Fient0/jYiz15DTM/IiH24+Kc30xsUeIcqZ7sS8hpy01id
 Ct5ME7FmSu8hOS0JdVdWHwO3jyZyNAJRoutRcGHuhoNqWBqwbQMms8WQuwkql1mQcuf/
 SZUSSiurpd1uefw8T2OyukYSv5SPzPVc44n1wZpLh2PNc0lA+Ur9gpu6ufNNrq2aD4FO
 etSA==
X-Gm-Message-State: AOAM533EWp5ibnzQoK9Prr4blBP7Y3H/nFTkiPy3u4euqavDsfi2kcry
 CO3BDYbqs8L27Z2ugjp0CPTtjA==
X-Google-Smtp-Source: ABdhPJz+IcexWbDJ8mm9579drvcEzedAfwbYYmJYjvi1uUgRV9cnUEkohA83qW3bMDa22Oh0cL/Dow==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr38839836wrg.529.1641223797465; 
 Mon, 03 Jan 2022 07:29:57 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id m35sm71246964wms.1.2022.01.03.07.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 07:29:57 -0800 (PST)
Subject: Re: [PATCH V3 1/6] tty: serial: meson: Drop the legacy compatible
 strings and clock code
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Vyacheslav <adeep@lexina.in>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Tu <yu.tu@amlogic.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-2-yu.tu@amlogic.com>
 <CAFBinCCwjS36ss_4sU+o9m8gEprFsVZbqcxgpQxczTNohZqFdA@mail.gmail.com>
 <a296e666-368b-4cd5-427e-30fc66a15b49@amlogic.com>
 <CAFBinCA2V=sx95Q=+4nLDXFK1Os11XVWtK8KauxixVwYXLUz1Q@mail.gmail.com>
 <3865f01c-83f7-a69d-6835-c26f662629b7@baylibre.com>
 <YdMUEzStFf99EeQ5@kroah.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <df9e472e-ac17-26ed-d820-e80d5b7b0e80@baylibre.com>
Date: Mon, 3 Jan 2022 16:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdMUEzStFf99EeQ5@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_072958_932216_8C3BC712 
X-CRM114-Status: GOOD (  27.45  )
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

Hi Greg,
On 03/01/2022 16:19, Greg Kroah-Hartman wrote:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_to>
> On Mon, Jan 03, 2022 at 03:59:33PM +0100, Neil Armstrong wrote:
>> Hi Greg,
>>
>> Martin just saw this patch was applied, but the serie wasn't reviewed enough and it will break
>> earlycon support on the ARMv7 Amlogic SoCs fore 5.17.
> 
> Ok, what should I revert?

None, we have a fix in the pipe

> 
>> Anyway, I'll push the corresponding DT fixes for 5.17-rc1.
> 
> How did we get out of sync here?

The serie wasn't fully reviewed, and I was out of office when it was applied.

> 
>> Would it be possible we also receive the notification when those patches are applied ?
>> Maybe a MAINTAINERS entry is missing so we can receive them ?
> 
> That would be good, so that people can review the patches.  Otherwise I
> have to just guess :)

exact, I naively thought it would be matched in the:
N:      meson
entry but it seems an proper entry for drivers/tty/serial/meson_uart.c is needed.

> 
>> It would help me track those TTY and USB patches more easily.
> 
> I recommend MAINTAINERS entries for drivers that are not listed and that
> you care about seeing the changes for.

This is why we have a regex to match these.

I can submit a patch to have a proper entry if the regex is not enough/appropriate.

BTW can you point us how are selected the recipients of the notification messages you send ?

Thanks,
Neil

> 
> thanks,
> 
> greg k-h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
