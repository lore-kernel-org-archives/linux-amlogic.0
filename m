Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE2C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4H5kBDfuBA9tv8+Yd97yXiqWvbmbfis72GrqSbnfLOM=; b=tYYDG0B+J2btXw
	EarXcVDTQnsE730bXexqVjPz5zSAQfAtGUVjYKnavN6J5s5tamUCYFw1qnPQrxqdXkgW5JBfxaJF5
	r7yVbdi58OunCi7JmYigefjpyfZaZn5+4h+4agKkuJnwUyuLld0P23eyefQ5e0n82Kn/d2arUbm8m
	ZyHqYlyCkDT3R/P/P9ExhNi1AEOLH3ur9yPBaPgR0J8kJERysNiZ//HQBZ5KpMSrR29fuGqJ6/TRw
	Zd85I/+YdfpprCHkqNp8JPIrYqragQ0HYNz8Lp2WQLKU2r+Nl+Ih2XSpPIqNQXu4/Axcrotd144bF
	j/0bOyqQE/Ozhok21HSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0oeI-00EOJ9-JR; Fri, 24 Dec 2021 17:46:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oe6-00EOHh-QY; Fri, 24 Dec 2021 17:46:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id f5so35669423edq.6;
 Fri, 24 Dec 2021 09:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gWLqudzw3rPOkXTg3uLw4bUPdmaGZXOelkQawT33qqs=;
 b=mS8Clobq9wPiU/5RvxXvuhGVw18f56VpcHRXdE38puWRYFpMiY51UFC/P2oZv81yPU
 6295K90YhoimHqNzM4ANW0eXSxizQey2jfB+u6c5wAnfLUwFERwmhoYMzH8WJyZNlGLg
 L6VCr+XZZXDucr2NHliHri4XE/JNk1IGo5UZVda+xTsaBAJenkIHWDumA0BD9Ofi9lQD
 paOYut2eKbYcL2lslsajIY3wmY/pDbeUpQXK38EEPgIkZgGofzl5YkUZ2b2DMScHwVxT
 h2ABOS1hxlbAmWGElFCwm+4k3Qsr0F59k4D0XKvtuF2cVTrFwksaiqQWZGAIn6PnUpbW
 4YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gWLqudzw3rPOkXTg3uLw4bUPdmaGZXOelkQawT33qqs=;
 b=eJ1SQquaw1aXV8ZyN4I9sw5KdFT/eRM2CPTPgL33JEW+5VWOpmn28RAkjvC5RW1mip
 lqXLNulUR5Cykbj2NQDsJVYHmHaDhHYiut286sMj9jzSv7u0OPV4UVNo+X8jll04aW1y
 GijwrbgVCd7CkLmriCQso2+AGtH3ROmAQa1fJvdvPARw+vzcNLgMezARYcMn8vCDIQQ6
 DbaMLZbdeYmtfjXxbiimQvwZUmZXouOsy6FOwLw5PfRg8zCG3WIDgh2BCYHsYuk5NkCG
 sZvv+917rny98aledfqJhzVxcWb7OOY1No9QyRQM45OrgbXkFNTBO7hrLo2Zb2MBcB3I
 w/wA==
X-Gm-Message-State: AOAM5317bG8lYB5qzqBZv1ic4f/PP3D0v0YIC0RQZg/+xGMtvg3YJs7B
 Ra1JhPWAPUl9QrP0uNH05821gct4jhukv0tqnCU=
X-Google-Smtp-Source: ABdhPJwO7D6VLbvq8orz3tQTTtQkEYvyo8XTOkfEiZZlLYVJFaLtUL15VnQe9jwlScjI6HUBJGr7SEL9Nu3a1UjYfWY=
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr5969032ejc.147.1640367981490; 
 Fri, 24 Dec 2021 09:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20211224071706.2505726-1-shunzhou.jiang@amlogic.com>
In-Reply-To: <20211224071706.2505726-1-shunzhou.jiang@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 18:46:10 +0100
Message-ID: <CAFBinCAh2_2B8KXcN5BBNqgfsE09ZW=wQ-UfaYoWGi1DPGrhsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: add Amlogic s4 power doamins bindings
To: "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 robh+dt@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, jbrunet@baylibre.com, jianxin.pan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_094622_905848_30D70E4C 
X-CRM114-Status: GOOD (  10.49  )
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

first of all: thanks for working on this!

On Fri, Dec 24, 2021 at 8:17 AM Shunzhou.Jiang
<shunzhou.jiang@amlogic.com> wrote:
>
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
Here the spelling of "domains" is correct but in the subject line it's
not (the subject has: doamins)

> The bindings targets the Amlogic s4, in which the power domain registers
> are in secure world.
>
> Signed-off-by: Shunzhou.Jiang <shunzhou.jiang@amlogic.com>
I found your name in an Android kernel maintainers file with a space
(instead of a dot): Shunzhou Jiang
In Germany a space between the names would be correct - but I can't
tell what's right or wrong for your case.

PS: as a small side-note: when using multiple patches we typically
send a cover-letter.
You can use the following patch-set/series as an example: [0]
It's not critical but it certainly helps identify which patches belong together.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20211214022100.14841-1-qianggui.song@amlogic.com/T/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
