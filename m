Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7EFCA0EDC
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 19:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0yHgWBnhaPpN+jFH6gZb6q1ZkZPsotJy1CqqcoxrzQ=; b=yJNoN1Fs1FTbM1
	qqFJsieeW83wP14YVVr7AUO9A4rq4vjF5tNepj2sQk7sgUwQyxT3Wg+pt4s2GImyAKuLvBr8pWIc8
	KdA6dnSy16iKC6La8AeKijs5Hd2QnDb8mJpKtzZ2fL3FwGR9RK55+h0ZluldnYX6s9adcp2YuAV+v
	mbm9+gYQe22FfKqDRnJ3g/3uXwwyagxM4DGqb7jQUdsFJyn6FH4IYEJzNtI4DAlMLfnq7G8Zas1jY
	dgUIJwi/I9Kg+uFH8iKGR30jX0BJ2EH1v9m4LPbP72iH2YGPeCBe4JWd9wQ2Zr+M3N0lsR9ULJxTK
	XNM2HlpmyvDTbQivPGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdRr-00000000Pm1-0T4U;
	Thu, 14 Aug 2025 19:17:15 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdPH-00000000Pe3-1L2D;
	Thu, 14 Aug 2025 19:14:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b47174aec0eso839499a12.2;
        Thu, 14 Aug 2025 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1755198874; x=1755803674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MynYzWSWBWqEUHcEBQjDGSL1KC3nkyCQHmVsRTqpkgk=;
        b=bAyM3vjPFJh69oE2PNL9XbadSW+8BAJ+DrIR+3W45S5pEBauVcL/rq7X2RLuy6izvO
         1Y7G50ReBuA/7+Nn2JyILgtP5EzfUeAMzQX2zC2+EHxCwBGWNEu9jfMjQUC4IOHWgCjj
         76m44SGnAmEJ0BvItDGd1dwYifPzC7AHNQ88MIks6a7ChdQYK8XBgt+ckp0ptGR6ZUqP
         gZ989XE37elRrBuPFGcckpdnMmYcIM9OtinUIjvBbN4lasAy2/JEHkW4pIulehyvcgtK
         KdIYKGGrHyIVURpwLfufrsviJ3rVEZkZXUULOXVTdqDVWsH11ZEqctCjDHtyhnG5FfIq
         3GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198874; x=1755803674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MynYzWSWBWqEUHcEBQjDGSL1KC3nkyCQHmVsRTqpkgk=;
        b=CkkjBm8lhM0LgOG4JT62qiD2drl9Xs3PwXJAS5YklscFNMwrYggzYCK7MYrHIdiV34
         7FITPHNVvVBUOjlEYvG6HJ0a4/2MLuHDloB/eP05M+IVjNZlfdQClMYou9SKM8sv/mOq
         exbpszZ3Y1RmOVX3w+mxMSwSXeoMXC/bP0PlqL29qaZGrLbWCUEB5Bo9ozE5mlfG7yzh
         ppO3V7Ppd+AJ7aAykGuMT/6U+OCM6UEEKINfJsY6Klp2uQslukdQtoW1RGhvHK4VsNpV
         +/7PLTFbvVDctk5sXdNs8JutPAtn+5YuiYBl6eLX3ZX4Pq+bqJVeOrf0aEmdZhM10BCu
         Mqjw==
X-Forwarded-Encrypted: i=1; AJvYcCV/bAd21F81NhAm3rRVlcqn/IJQCa1PMO1uRlvIGd9CxD/NUWNi7QKerpV0k5oO9odioiU8YiJgPqVvVCM89NCsow==@lists.infradead.org, AJvYcCXFGozxeQLnZAijy34rT0BI0F1dHKuXDIeOIp7rmDG4iUcqFXFDF1SiXDTATXqthpjt06k6N1GyRdU4OQ2G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3k77gbZinYM2w34ItirtH1AupyzLskn1O09OyLnzComowtmn8
	2AbqrHo7Y66ITTUSoQbgdvZRsoTbCo0O/2Ep7rva/gr95ae+BXl0Wz68sHUKSrf3upJXSOtkl46
	3G/mJ/HII49LkgOkGbnPlD64UmIOt+sk=
X-Gm-Gg: ASbGncvtQIy5VA7Gb7MC7ta+XpzXyeB3sx8Xtzy9l+ff8XQMqyyRHHxWX3ZB65greGj
	BaImLjGq9Yt96xonX1/MI78FbhidXxPvEixuO8pgk7mzF9ktXz/g3oAZYniW3wFuuynh9QU437B
	2mkLGjYTrhrMLVJ+EEld+vox06Y/8gvrDd5FkPoBHExFtLvN5hAsTjfx/ta7qDYy3/A4gopKnn6
	VEi6bJ4G5o7EbhLTJh2bsBxe/WiTGAlCgyTBQzR
X-Google-Smtp-Source: AGHT+IEl//8qkytmSUYBnvYyuackNdjxZ2mG5UEdWxd9HJ7XZI6KUYhtofURa9ECsi60YB2ptnDNUZCTERVVEGpyGIY=
X-Received: by 2002:a17:903:2d2:b0:240:640a:c560 with SMTP id
 d9443c01a7336-244584fe05emr72033805ad.24.1755198874484; Thu, 14 Aug 2025
 12:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250814181236.1956731-1-da@libre.computer>
In-Reply-To: <20250814181236.1956731-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Aug 2025 21:14:23 +0200
X-Gm-Features: Ac12FXyB0zZLw1V5fvwOol8H_DWAY1Jzv9fmSEHz6sR2a-0EHmkZWmdJokkx7Zw
Message-ID: <CAFBinCCqdhdDGw+e=NQiLz3iSKb+nec4h7m1n+2Cg7TPQ0-3aw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
To: Da Xue <da@libre.computer>
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_121435_361176_A40C7FCD 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgODoxMuKAr1BNIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+IHdyb3RlOgo+Cj4gQW1sb2dpYyBHMTIgZXhwb3NlcyBQQ0llIGNsb2NrIHJlcXVlc3Qgc2ln
bmFsIG9uIEdQSU9DXzcgcGlubXV4IGZ1bmMgMQo+Cj4gQWRkIHRoZSByZWxldmFudCBwaW5tdXgg
YW5kIHBpbiBncm91cHMKPgo+IFNpZ25lZC1vZmYtYnk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
