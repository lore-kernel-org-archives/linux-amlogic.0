Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8584C021B8
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Mar 2025 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paaB7+I5BMwzSoA4L5xxb9NM2iTqLwf38h5+JTrvhFg=; b=njRDvpGyPguFLJ
	bh7/W2ybuctTlBdilUkomaV7IlQcpYaz7ltEv2Q6XBlAOTETYNiCUHH3xKhaxxof7uLzyd/iisI4I
	hOvVwGFY0VlWyAWrJIBygxvsNJYfQ5LkutdaKfEPJw205P5ndyn630Mif9SYORHskkE7+uMMmrOCA
	acls6QGYItzkFu9SkY0uZ4j3qgc0ZFNVocH4cdK+/qrjAa9LZ4znyEf40J7fOqde7p1Ijzt4Zt7eN
	GYUtmMM+p7GAQbbotAZEcXYNkmSv5z+KogvoOucKYxI/ivZlthh+cQcqxxUMKtnpC7J98zpFTBY+P
	TVQcNCDddwU40Fcku1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRJs-0000000EkKD-0qvD;
	Sat, 01 Mar 2025 18:12:12 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRJq-0000000EkIR-04hP
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Mar 2025 18:12:11 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30ba5cccc19so6582791fa.1
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Mar 2025 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852728; x=1741457528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=T29TXPqbpwAvNwNu9G938HiftVWgTKQto7Mvn6toqG7LEDexjxbdDVtsa+Z1LRDkYo
         VYhOymHb6DfayyPOHo36E2XgyhatEy6X3ZgS0wZmetBSPQFPaGFsgi4LFTVPbLVCgQ2/
         1cWz0bkj4M9nRyx7nN94uoSIy1qx2IRGAI9VCNe38U5X4u3fW3yEme/R5t1poX+BoCnE
         DzpfNkYmGcjS8tYncD99J3xD9djd3bIfo2kmgkrgMIOSIDjEWbZqA/cbJAQhQNiguK9I
         FKrQ/edTE5wdy674S7/9JP79L/khj0qkYkOluXVdfC31HvqfzzeWsk99C8SXJuWwP4sy
         6cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852728; x=1741457528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=mreS9YXCyvVjBwxuXi1Kr9xmDR0NEMLduq6Oac9rfu/oWfKase2KeLNmnsqkfDxNt6
         3FbtQ4oNQSIRyrAFEcazUqLXCasO2wJIfj8W+gS0nmHRG7qZOw4ehULC+1GHD0jDk0xh
         +7g2WDjo0j/WOM3/A2DsppCpi0p6P8qBu/o+drPdvMfvlC0k+GBBwgDkv1bCDmVTa9HK
         riVZITO9cIb6T4jwD2p023cHs8O13SUNbR9/W4SZ6pdEJFRcndLYyJoF+DGg1CotVcyL
         CRRlFsqKCIYcUp9hUu+gI3/JpH2M/AO7mrd7Bxd5sEn3y6QLebRg5umI71HqbapI6D/E
         W90g==
X-Forwarded-Encrypted: i=1; AJvYcCWvaoWH9YWjLoa9OoFJU6bod0p9unsTrSyzdosh5gI9t/NoU0q8NYkB529/tXKjvBR9mZZHkgxdnN5h7qLs@lists.infradead.org
X-Gm-Message-State: AOJu0YyRm8nfWtwc+s3mUgPWH9RdGw1P2mEH92Cw+Bb9qZS2VYwuO68C
	4HFLtonaX3yTsI4HjPn30BJUxinR5Vjl0u8XxGz0K8NF5odVE0foTLrqTQiVB6P8Hvn/VmBqfD5
	Hd4IoXyqyCDhaaEzK2fM8AjvdG2qZipN8kGHYCQ==
X-Gm-Gg: ASbGncvyuNn9+pq0940rAnJBwgjyc5j23nkePjcUL20gB5e2hiwK4bIBXl7FluApwY9
	lPIlHITcn079nd4g8EdfaaTkqgE4p9XFtnZ7r8iZbWOs/6EzpoHKWsPTK6bwNuBK20HpgppH4Eh
	0sdODqz5Ad2guDJophsb5Ine+B/w==
X-Google-Smtp-Source: AGHT+IEH99Tq5urSrvxoc72GqejnsJAsNSDML6g3rnh8KP+Vmtk9gqB7j3gZFHmLs6QHmiQqUlP2gDlbwUBJuyx82iI=
X-Received: by 2002:a2e:8052:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-30b933037d4mr26808421fa.32.1740852727658; Sat, 01 Mar 2025
 10:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:11:56 +0100
X-Gm-Features: AQ5f1JrUCPCMLG1ATCrGher1b7FQk-JSwRhx_use4qjyzNuoMvAXn5iqo9KhAOA
Message-ID: <CACRpkdamF4B1y+zr-Y_XB8gAoSv2Q2U4VxuZd+ivZq7KV1Quyw@mail.gmail.com>
Subject: Re: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_101210_053868_71BD5A15 
X-CRM114-Status: UNSURE (   9.04  )
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

T24gRnJpLCBGZWIgMjgsIDIwMjUgYXQgMzowN+KAr1BNIEFuZHLDqSBEcmFzemlrIDxhbmRyZS5k
cmFzemlrQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkgdGhl
IDo6cnRjIG1lbWJlciBpcyBtYW5hZ2VkIHZpYSBkZXZyZXMsIGFuZAo+IG5vIGNvZGUgaW4gdGhp
cyBkcml2ZXIgdXNlcyBpdCBwYXN0IF9wcm9iZSgpLgo+Cj4gV2UgY2FuIGRyb3AgaXQgZnJvbSB0
aGUgc3RydWN0dXJlIGFuZCBqdXN0IHVzZSBhIGxvY2FsIHRlbXBvcmFyeQo+IHZhcmlhYmxlLCBy
ZWR1Y2luZyBydW50aW1lIG1lbW9yeSBjb25zdW1wdGlvbiBieSBhIGZldyBieXRlcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+CgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
