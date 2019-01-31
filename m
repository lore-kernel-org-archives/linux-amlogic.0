Return-Path: <SRS0=06Fz=QH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85132C282DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A83218AC
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpKk9xH3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="luXkdEMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A83218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sug9El4i6amPjfBEmj2pZbIT4JG8dGh3oKBM2qfyJUo=; b=jpKk9xH38xgomI
	O5fVe7tST7KsyOVhmA43Nwux70lphXtrvlcyrDTaMlJmpzS4D3hnj//0m8x62NESe0svNC6UPHm25
	KPFbIaK/wBJ5sTbq6wMxFzBmxA+RN5SVDUemyxN8iWD+kKRs6v0iW35+v9L2UAW2tATyOIHxFHjwr
	qekm7VtqHLcgmOPP+mG4EGtUe26icYk4kc0BzkwFHz9M9os9zxq427j2ZOyipdTViSxKmU1AfUno0
	dLzoyREBDcMm1/GqDx6TySgrv0ef8wWIy0J11A2LfFH+6uv9YFDn4/JPK1NnRou/oB001kAYKYwaG
	oJ2TrX7ypdsc6v+YzWKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpFXN-0006Lo-KP; Thu, 31 Jan 2019 16:50:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpFXH-0006Kx-S9
 for linux-amlogic@lists.infradead.org; Thu, 31 Jan 2019 16:50:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id v13so4077818wrw.5
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Jan 2019 08:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hguvWJc2EDwJ0Br1Pfz9Z4XonQAlIa1Ud1y7I+35X2g=;
 b=luXkdEMKQmBCpwNbO1fO2aUFlnq/I/f9rQPvV6LrHYPL8jOdF0xzrYQNZSouEUWyEK
 IE/RRo/QlHowjUzqmsQj8MAhdJweVnt40PNHKjJbsO+KGY1GQRZNqEU3SObz2nFZlMLL
 aWQs2DnpGA2yfTePDgQutuHNuJDM4h8XwsaUNb64M+5a0BekQToof0QccKZlqZ0px2XK
 2sFHjLsf/NRZTcEdGT5fHC1quakxYiVmgsWJsYUzPREmIpPRKG+c7jgPfhnJO+ILf7S1
 14cUJfdfyQp/5HlKgRDxo56Zo8uhAyJrDzWVgU8EWxzHQGS2PqrVJeoAYVW6JhWZHqy5
 wt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hguvWJc2EDwJ0Br1Pfz9Z4XonQAlIa1Ud1y7I+35X2g=;
 b=tHpY3A+FzszEYlWjBsKeEVdRVYrc91y6kjwhVqa3a0RXT6vX7vXLPhLLHf4aCGIssM
 EVMsMhBD7CSn6InWpkLKU2nZJPL+Io53cyMuTnvivN/mJG3k2EO9VHklo5MQauworx5h
 9/O/gQzSAhqzXD6AbikYYXgQEMO+UH+FYQORzBFdtaSN7JjSohkyOC38koeZGNSQFGjd
 sJblT9V1bY0YFVuZNmOwvUNc0hf7MIUwAwVGMdu+BF8iE+0aIROu+t3XwAqyAnHke9+d
 +24oTAyJPuKRgVrlyB/JYLwo39ZY2xDCoDZurLXHjEXBsUcCvt1Ht9ytSkBoK1rC83v3
 4ewA==
X-Gm-Message-State: AJcUukf+q5PyTLNWXSmJfpmET+vfQUDMVMb00L6ZSXaRSRkQvk+S+Lnp
 yVtyfAIKZnpeGxkmC7XV9R2KFg==
X-Google-Smtp-Source: ALg8bN7w7STAXXKYrJAk/AGWoFLYGBqWgIQk3HIiKzzc/FkYSCIEVgAxS1y+2+8B9xp1cRAZfgec7w==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr35800983wrw.139.1548953394337; 
 Thu, 31 Jan 2019 08:49:54 -0800 (PST)
Received: from localhost (aputeaux-684-1-8-223.w90-86.abo.wanadoo.fr.
 [90.86.125.223])
 by smtp.googlemail.com with ESMTPSA id h13sm6675745wrp.61.2019.01.31.08.49.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Jan 2019 08:49:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
In-Reply-To: <CAFBinCBUm+Js1-ZabP9bSmYE0qG9Z9gYr-ua+ayDyPOdXUsEyQ@mail.gmail.com>
References: <20181219233519.35287-1-khilman@baylibre.com>
 <CAFBinCBUm+Js1-ZabP9bSmYE0qG9Z9gYr-ua+ayDyPOdXUsEyQ@mail.gmail.com>
Date: Thu, 31 Jan 2019 17:49:52 +0100
Message-ID: <7hwomkg4b3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_084958_766728_02CED938 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Thu, Dec 20, 2018 at 12:35 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Add new vendor for amediatech, and initial board: x96-max
> as we have seen there is no "amediatech" branding anywhere on the board itself
> however, FCC gave us a clue about the manufacturer: [0]
> can you please add this info to the patch description when re-sending?

Yes, will add.

>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> (with the two comments below)
>
>>  Documentation/devicetree/bindings/arm/amlogic.txt     | 1 +
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> if Rob is fine with vendor-prefixes.txt being updated together with
> adding a new board then I'm as well :)
>
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
>> index 8dbc259081e4..c50b084b6c59 100644
>> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
>> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
>> @@ -99,6 +99,7 @@ Board compatible values (alphabetically, grouped by SoC):
>>    - "amlogic,p281" (Meson gxl s905w)
>>    - "oranth,tx3-mini" (Meson gxl s905w)
>>
>> +  - "amediatech,x96-max" (Meson gxm s912)
> I assume that you'll not only fix the SoC here (G12A) as reported by
> Chris Moore but also the ordering

Yes, will fix.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
