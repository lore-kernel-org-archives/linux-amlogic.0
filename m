Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B25C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 18:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B542133F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 18:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0QWCd3K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0dWIfn3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B542133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ug80LHjR4wcYTBXmSN3tMX/SDzXt3mPJARXwP4EjZYE=; b=m0QWCd3K9u4Izk
	0+pYKGZC+g+Mi/6txRyG3o7Rl7dIa0zfKZkmawN/rgwrPDBQArJP8l4v5BwNEIefsRG8imYlATY6Y
	6skjdNyq+L6A+AqeCas1Z9d91UrZozv94gu/L95sETP5cEsmjx+MW/gebGJi7vi4MteAig03YG8Px
	hAYEpcA+TXyqgwRuiT3+VNUvC5tjrCDy19dyuYfiUtA+/fLZHHypDMT8oV4GHHxVqzEF3/eb+mc5q
	kBR78WYrJw7qlyhPg+7D/hcfya2lVX3Se3WjcvHV80nbYXJ9naszg14GHh5wDwFXar7hpHt+nLIVz
	qDrn2ooHkO3X+dg8nTKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi1tu-0006vz-1l; Fri, 11 Jan 2019 18:51:26 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi1th-0006m6-0r
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 18:51:15 +0000
Received: by mail-pl1-x643.google.com with SMTP id u18so7140843plq.7
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 10:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pitR8L9WmDjBuoydS++yrSyyfQoqz7HyAqmD7cthpYg=;
 b=0dWIfn3CjL8f3ooGjVaCGCDJ+E/gb8q1ofg/8qdVJKhwf8mLPtIKsn2wGgPtnXaKG9
 tA8XuV0wnp9rQ2UGojIGsK70/wZ5JXOrlX51bwFOF5RC+EoLPCJ79yK3pWStXfvxtCYQ
 bxbEMh97oY6sWMH/xZ0/ykXzyLg5vs7F0WKNUBKCodE8YI4A82rntfjkSgWmm2LCOrhB
 7ahAwskWSE226zgL2Sf6O6sr3glfJth7lHY2wuBYiLKjOyZMMRACniWBPpgnJK7b7qOc
 2mRNqxlBwOwp7qyEq1djyQs/dHeBzW9jKUW3VJMb4kkRrp8JIePQJd8PyeB/XlJHKv/I
 JRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pitR8L9WmDjBuoydS++yrSyyfQoqz7HyAqmD7cthpYg=;
 b=ll4yX/RosRCI6hhV7Kn7CthpdTLMXzg9BCLaEqWVsxLAg9JsM6kdaAV96TTAqWlmbv
 la5cGBDZqf/9yrzqWRJUKD+U0pNNOh54pM3prg+t3lw9KkFcP843JKFT/qM8fhFMl5w+
 xzQqIGYxD3X/3aEkaESHv3UYHfxUmS0hhtXVdMJKL+YnPSSIYSwSzR9Syt16+Qh7TPby
 R5MvuPt5Y+kTgl/fc3lsKwgZOhmYB8Yjc+fEogcJ5o1DMWpSDmkkv6InAy3qrDQUTiq6
 SoFOgLlPp9z8CG79c+1Kt+GXolnDKCYvu3IrZ7UmUP8rKt2M7/tLN22fTcv1gxJgbAyK
 A5qg==
X-Gm-Message-State: AJcUukd7VNabkaPs/lLE1KSkLRXhPBPSfVL99x5nayinRddwNoZtWUg2
 e8ZP07OnyY2lQd4e9XVGZzLPdw==
X-Google-Smtp-Source: ALg8bN61o21eFQRa/93epFy74wP25uFR1S+FUjQQ/w81s8mnjpvgL+E9yh2cFDpF6OuC8FkmIEO2TQ==
X-Received: by 2002:a17:902:42e4:: with SMTP id
 h91mr16054674pld.18.1547232670911; 
 Fri, 11 Jan 2019 10:51:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 u70sm135770245pfa.176.2019.01.11.10.51.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 10:51:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator
 warning
In-Reply-To: <CANAwSgTX4Rs7xXzjpNi-zizRyyO0FiFF0baOuQZ0fx9WEM9NCA@mail.gmail.com>
References: <20190111092235.28161-1-linux.amoon@gmail.com>
 <772bd70c-2cd9-a1be-d18f-7824a9ea0556@baylibre.com>
 <CANAwSgTX4Rs7xXzjpNi-zizRyyO0FiFF0baOuQZ0fx9WEM9NCA@mail.gmail.com>
Date: Fri, 11 Jan 2019 10:51:09 -0800
Message-ID: <7h1s5jowo2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_105113_124309_730579C3 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Neil,
>
> On Fri, 11 Jan 2019 at 19:10, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Anand,
>>
>> On 11/01/2019 10:22, Anand Moon wrote:
>> > Add missing vin-supply 5V regulator node on usb_phy nodes needed
>> > to power usb bus ports. Override the dr_mode from "host" to "peripheral"
>> > for initialization of dwc2 usb0 phy node,changes fix the below
>> > warning for usb initialization.
>>
>> I would have switch the dr_mode to peripheral in another patch,
>> fix the regulator issue in this patch only.
>>
>> Neil
>>
> [snip]
>
> Ok will split this into two patches and send after next dts updates.
>

When you split, please be specific about which part fixes which
problem.  e.g. it appears the dr_mode fixes the WARNING from the
regulator core by itself, and the vin-supply fixes the usb resets,
correct?  It wasn't obvious upon reading the changelog.

In either case, feel free to add:

Tested-by: Kevin Hilman <khilman@baylibre.com>

I tested on meson-gxbb-odroidc2 and it looks good.

Thanks for fixing this,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
