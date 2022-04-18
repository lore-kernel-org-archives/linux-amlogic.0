Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E02C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Apr 2022 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhI8HGEKbK5AZjVV1i8ccV5qz1yLxamic1P1TQxvWMI=; b=T81Sbq3AJgRkb6
	WASLVXVerHpjj7LZZD8/lGcQ9SP3qheaHkkLslOBgxEOwV8K39SH2AtjjyMsX8ZnEm4VQVCa9IsKz
	LK+euXIdX5W5lU0+kDzRGQ2dXo4pd8EcBliCc2rtRRDZiepot0t+Rk5sHxnyky0i72e2t7DFJdMTM
	9EXAHdqIi9iLpawVKFbQjLB7muNJTcqGDa5vJIBm5loqNID7X81MVBYlNG9+G3rz9u61n6nEbHAHp
	NCkWjPAlpmzi+6Mx3k41Lg9lzZ0mb6OaR/mKjfLN0k8EQXfotOUwnSLOHzJ1TVTlPs6X5Z8FNxqzQ
	IKnLEmKo+FU/FJqR4uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngUQB-0005UO-3D; Mon, 18 Apr 2022 16:40:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngUQ8-0005TM-9Z; Mon, 18 Apr 2022 16:40:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id r13so27828465ejd.5;
 Mon, 18 Apr 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FuAliLqkyYXn5Ey/EtjXF/Yu7oHI4/uKKrNgvBgX40c=;
 b=HebNsdKGP3yphWPGFSkZWvD1iaQWfLNxZhW5jTbTLcZ0S9fAgKGiXLbBg0TTnvT1FV
 c+JA3Udj18Mo6SUExXKSxsdd9J7tPqMULdZH0/E38SvMlKDPHNy2U+HBA4bTUcZCELQ9
 7aWOae4pdxva6sKGa8anR8axhqdxJafsgCBs6B0HLBVIqjT55F6K0yVvqtpVlHgzSsR3
 oqcazq59cY18iTwty+ozgl8CAztirZoyHNS+kPeicq2sOhwdQVAYx5IGmz7Eo8t2HBO/
 16egiV3IkjJrfXb4R7JU3+I3tsrPwTNDTiTQRUITme099wLOvPIWWFiseZdAVpqdnhIs
 Fs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FuAliLqkyYXn5Ey/EtjXF/Yu7oHI4/uKKrNgvBgX40c=;
 b=vpp1mDeUEHDlJHFUMwYyLy+Ms/Z73SCqM7xQivoTxebgPDJ/0kAtPrDvUA6Mql206B
 XveFsEyjew3u9KJROwFi7Pqy9G+Gsx7KiD3SI0266Yq/DpbJrWarzW04l2Y2Iof4YXiD
 /CRXe5pmPGkq5Ner6LoXHep30+ONBViaM4jbZDjubcqxn9MkTvrPtHGsXNpt6YuMlGaQ
 50f8LSO5aep6hLWAMWb3iudQ/Pi4qRf2p+sV706D0CnbY1bZfugidP4Aav1fM22MORdT
 q8WQrYDltFJMIuhkadNxd2gB1V4CyPZMXjJYq0rR0Q4srPWpvS2fUf9A7tfQKTeI/+QG
 adzA==
X-Gm-Message-State: AOAM5320VMsSZufCX56nvfMiMDKjd1Ke5z/gpLULSlmpyC1zWgLzy0Q9
 ZHlOBQ/56SHi/xX9Mm3t26VNnbxyQkOswKFjX0o=
X-Google-Smtp-Source: ABdhPJyaKoj4mv6UqdwrhwT31wWEjGcRuUu2PMnQVHnJsiFOgYOIT6nlTXzwAvL3RiTlQyiw6ulI4AiN0g5tlciXxKs=
X-Received: by 2002:a17:907:7d90:b0:6e8:cd12:8893 with SMTP id
 oz16-20020a1709077d9000b006e8cd128893mr10072953ejc.13.1650300008182; Mon, 18
 Apr 2022 09:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
In-Reply-To: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Apr 2022 18:39:57 +0200
Message-ID: <CAFBinCC=Dp4bXT9sbmT=ZTiVfC1Mj=oRVxeDXfKbDczq45iekQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: fix a memory leak in
 meson8b_clkc_init_common()
To: xkernel.wang@foxmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, 
 sboyd@kernel.org, khilman@baylibre.com, p.zabel@pengutronix.de, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_094012_393991_4EE45B28 
X-CRM114-Status: GOOD (  12.77  )
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

Hello,

first of all: thank you for this patch!

On Thu, Apr 7, 2022 at 11:28 AM <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> `rstc` is allocated by kzalloc() for resetting the controller register,
> however, if reset_controller_register() fails, `rstc` is not properly
> released before returning, which can lead to memory leak.
> Therefore, this patch adds kfree(rstc) on the above error path.
In general I am fine with this approach. There's some more "return"
statements below. Should these be covered as well?

Also a note about meson8b_clkc_init_common() itself: failures in that
function will result in a non-working system.
If we can't register the reset controller then most devices won't
probe and CPU SMP cannot work.
If registering any clock or the clock controller doesn't work then the
system also won't work as clocks are not available to other drivers.
So freeing memory in case of an error is good to have, but the end
result is still the same: the system won't work.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
