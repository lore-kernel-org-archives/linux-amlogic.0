Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CBBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AdOP1b6SYJPw30SXVsdBUKfPzlleLUP+O0Wmry7EB8E=; b=1lIhU7P/59Wt6WE1EMuIKUgmEj
	7EoICAKkFbxuqPU+ng8tHq3BxeV6jtBCXLY0gcs3cigb35+i1Xjzc3fqUhOdrBV65va9S/fY5+IVH
	VtWOhHlTT41JebE9amvY499PrpX7/BLHEdLsvQ9znTwnYzWUjERizKlCzbt60g8KVadaC3mAvqPa0
	xNnof9HLXroP27HOQlR/l5vUODjbAj/i/ya5T3vlYiWe150MrMMt0/sG8C0KDkxt75HfoLdfu6bCs
	nZ7yJSz9V5OJ6KCf5JFhxqhBjkQ4PoMZIKGXScQoD8Fe2//tah89Ov2LTxPwhZVzOWe9Ila5kimNC
	zLw3kZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4OoF-009H4k-P4; Mon, 03 Jan 2022 14:59:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OoC-009H3T-5l
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 14:59:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id i22so70368230wrb.13
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 06:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5H8+sBp3xMqm86KdM4FfbpDukKAPfJggOz8BlfBh0A0=;
 b=RK8OFVPMmrUeM0KlR68rRcYWwzcq++PFtk4HPYE1VFCR7hcKJSxFeMJx9CYY3LVv4I
 moBWkIUB72yHyKJzb2tn80RFoo86sQotegnN4jkRGGTW0Y4M0uZhxBZdy+u24t1Anoui
 /yJk3zR/e+rzYVKwvYlku68nmAQEar/7dnpjR5pZCJpefR3UKfUw6Pjb94+xF0DwR4gU
 1WReOYWVG/AforOPDCdbrmc5/ETwXyc/S7xV4ulG90KG2TPZtBvGYnyo1WOi/3nKCvx+
 n1mPYTvy+sogfJnANtKI8K4sP2rIQ/34MMESO830pup8bsreJRkgnWCfu+kyJlNAktOT
 6TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5H8+sBp3xMqm86KdM4FfbpDukKAPfJggOz8BlfBh0A0=;
 b=jNV3EJENJhXafm7+VkDBiqB69M6lav6Z4OZIaCR+dhX0kAc06kpLoedrlW+ynRf4pd
 8aRalOTn+/AodQtxu5N+tnQ40Z0cIkeoMU60yvStPmB0U2AFIjnzjOzu4XiW6jLRIaaR
 C6Cj/Ad1sSzGb/UMVQPjJwhHaSgC/P6ki+oWAQXEtOsZ1m7qv7NuU9rslhYNstmcIcek
 /3eNwtxtfdcJ+ddR5jaOfYuKp3dXSOfFJBKr+m2Oox0Ki4WobZF5FdJTGRV8HwNtINlX
 6XyB3UavB84UiW/b1989c4JQ0LKbB8Jmfl0qEtGGn3WJlG/VZPs7JdDM9bYgPfSp5L+g
 pqIg==
X-Gm-Message-State: AOAM530PzPWBhXwiOKzMAb+Q3CqyfGC1srW0JQxRhrj89gspK0gusQ4t
 rIaw3ZZ1KD29Rw7IuNjAa8FGcw==
X-Google-Smtp-Source: ABdhPJzNfggYHG8TJY3E0zgdGOK7eTg4snQBM1YrXj6DPHwN8T5t2nQ4pLz3K5gTZi3Kb1NO8LzQmQ==
X-Received: by 2002:a5d:5847:: with SMTP id i7mr24397911wrf.450.1641221974698; 
 Mon, 03 Jan 2022 06:59:34 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id w21sm30063985wmi.19.2022.01.03.06.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 06:59:34 -0800 (PST)
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
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3865f01c-83f7-a69d-6835-c26f662629b7@baylibre.com>
Date: Mon, 3 Jan 2022 15:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCA2V=sx95Q=+4nLDXFK1Os11XVWtK8KauxixVwYXLUz1Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_065936_325803_47879C34 
X-CRM114-Status: GOOD (  19.33  )
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

Martin just saw this patch was applied, but the serie wasn't reviewed enough and it will break
earlycon support on the ARMv7 Amlogic SoCs fore 5.17.

Anyway, I'll push the corresponding DT fixes for 5.17-rc1.

Would it be possible we also receive the notification when those patches are applied ?
Maybe a MAINTAINERS entry is missing so we can receive them ?

It would help me track those TTY and USB patches more easily.

Thanks !

Neil

On 31/12/2021 16:35, Martin Blumenstingl wrote:
> On Fri, Dec 31, 2021 at 11:27 AM Yu Tu <yu.tu@amlogic.com> wrote:
> [...]
>>>> -/* Legacy bindings, should be removed when no more used */
>>>> -OF_EARLYCON_DECLARE(meson, "amlogic,meson-uart",
>>>> -                   meson_serial_early_console_setup);
>>> This part is still needed as long as above series is not merged yet.
>>> If we remove this then earlycon will stop working on the 32-bit SoCs
>>> unless [0] is merged.
>>>
>>> All other code below - except the of_device_id entry - can still be
>>> removed since meson8.dtsi and meson8b.dtsi are using the non-legacy
>>> clocks already.
>>>
>>> Sorry for only noticing this now.
>>>
>> I will add it back in the next patch and delete it after your submission
>> is merged.
> I have just seen that Greg has already added this patch to the tty-next tree [1]
> In this case there's nothing to do on your end - I'll simply ask Neil
> to also queue my 32-bit SoC UART .dts fixes [0] for 5.17
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/cover/20211227180026.4068352-1-martin.blumenstingl@googlemail.com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
