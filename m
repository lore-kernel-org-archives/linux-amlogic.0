Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D03C27C4F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jun 2024 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb8ZiD7RC8o4OmlsVV4dK6Ut8a1Lv35V0vib55GexxE=; b=n6zoaQ3hO2yRzk
	Q4Ge1xqah1oYe3n6Qr696X00ghk9VQ2DOFA+1RGbOZDx4N3w5KJOJ9M26j2rCj59Zsw+3yVN5oAp3
	yKniECIwC3aCnvpnZSYfdkXZX6qbbfZ1Qjb120/fNMqjtArGIagb32t/gfUHVgJQur65cnZWBWX9F
	dX9LQ1bcT+rAHA7yk0wdKrLFU3Dp89iJyYINC0giERBlEDISn/Smr+1Q3gHRmU3JWDL6c9+RYSl1R
	tlYBa4RxOO0hsUnxC0TJbq1EIOTQoOd651sT5JxcHuBax95qutjTJ4vUKPsw+mGR6hdrN5e3tinTu
	R0DFy3xLpR79Sp9lY7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW2Z-0000000ELoe-0H0N;
	Tue, 18 Jun 2024 10:26:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW2U-0000000ELkl-3Ub5
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Jun 2024 10:26:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso56316601fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Jun 2024 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706369; x=1719311169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=bz1j8/XGUSFyTlIWYEdrVzTNjNP4Iv7F9KevnaHhuZK0SLDN6GJo8tvnqOr3YukBwT
         f68diMCV3Ad3UUIMuiFUXFBltU3legLpZqDVJiKeN+Xq5KoK2yaTW73uNjcqIAe4ADgY
         oLUMCtS2zKWETFKl+cJCTp7nwv1EYUNcHCVzkPEdhbEhXju+LmMHxsOFkmSz7PyUNyZ7
         wsEBbzNbobO5MCxYrQ+cQYEfRC73itufzSDd00Xvm2WrB3o9tv68Mkmh4qoXiWFhjALN
         CG740Lltz/Qj5MbVEFvvohQmNBaboijfJg24VianwNFjn2L21tqvfZ3IPdGHdZReiaSc
         jLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706369; x=1719311169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=XjH3HxYm4eYWvrtzzK99Ml58GRZcrGAnHqBn7CEAfMibG8TdXns1RFCEsssm7SZ8FZ
         WoXMrYe+kCuMMs49wbrIEPQuzrk5Po0/UPoVuq4Een6DqXypgq0U7TbI8cbblJ+EWWzj
         3WcM/xopIfQ+/TFD1ZAU19WquXr54ELneVCXsrOQgczz42IgJ/EVbP2ILperMGlC34lI
         TGA9uwPqHl7I9ZqkWHf0IcBS1Vgm/LgiFaDEYTRZfv5BVb5AVfpvb6wHcYP0sHwtL2Ut
         SsdB6ZF2O2Z6/nPdH4/twp5JmpqDDGQWtP6hY9pxfr4N6Og3jpTYYC2uXYosSvxCUM/w
         QiFg==
X-Forwarded-Encrypted: i=1; AJvYcCV1OjImnFIjeZkzzHBQlf7jWYv4fdgcy/5vtIxmIiQOnfg8hvggZRhP9H1H8F+3QJPq7G9iIfbVexGImQWDfbsTfj+WCb8wQD9Q+WAZyXlQiiE=
X-Gm-Message-State: AOJu0YyIN4mVLFFnEb1ru/D1M07v4z5URIw6mmxbv2LAizrMJKPCuXuE
	outSLG+gvhkwYE9LPyhmL8QOKpiZCBfwtyibIxtFeFDsvpHq8ELHE2TD5NWkpXmIgsLcBeyn77G
	GQVLiCalMZGgszghZ8M5+bQvgKl2rtfvKOySagw==
X-Google-Smtp-Source: AGHT+IFVnhzqBoiu9GboooE5iY1zi/XLlllZteuuassl+ZmbxgbyJsQPD3pk6oFTjF6bKUOXQjAi+8CRlASoDk+Kx6o=
X-Received: by 2002:a19:6912:0:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52ca6e5639fmr6700866e87.7.1718706369027; Tue, 18 Jun 2024
 03:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:25:57 +0200
Message-ID: <CACRpkdZdjL7Z7qY5MTtZZRKQBLWHPKoHKKyoy56mKzZfu=WfPA@mail.gmail.com>
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_032610_902391_9728C10A 
X-CRM114-Status: UNSURE (   7.77  )
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

T24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgNzo1MeKAr0FNIEplZmYgSm9obnNvbiA8cXVpY19qam9o
bnNvbkBxdWljaW5jLmNvbT4gd3JvdGU6Cgo+IFdpdGggQVJDSD14ODYsIG1ha2UgYWxsbW9kY29u
ZmlnICYmIG1ha2UgVz0xIEM9MSByZXBvcnRzOgo+IFdBUk5JTkc6IG1vZHBvc3Q6IG1pc3Npbmcg
TU9EVUxFX0RFU0NSSVBUSU9OKCkgaW4gZHJpdmVycy9zb2MvaW14L3NvYy1pbXg4bS5vCj4gV0FS
TklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3Nv
Yy9peHA0eHgvaXhwNHh4LXFtZ3Iubwo+IFdBUk5JTkc6IG1vZHBvc3Q6IG1pc3NpbmcgTU9EVUxF
X0RFU0NSSVBUSU9OKCkgaW4gZHJpdmVycy9zb2MvaXhwNHh4L2l4cDR4eC1ucGUubwo+IFdBUk5J
Tkc6IG1vZHBvc3Q6IG1pc3NpbmcgTU9EVUxFX0RFU0NSSVBUSU9OKCkgaW4gZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLm8KPiBXQVJOSU5HOiBtb2Rwb3N0OiBtaXNzaW5nIE1P
RFVMRV9ERVNDUklQVElPTigpIGluIGRyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1
cmUubwo+Cj4gQWRkIHRoZSBtaXNzaW5nIGludm9jYXRpb25zIG9mIHRoZSBNT0RVTEVfREVTQ1JJ
UFRJT04oKSBtYWNyby4KPgo+IFNpZ25lZC1vZmYtYnk6IEplZmYgSm9obnNvbiA8cXVpY19qam9o
bnNvbkBxdWljaW5jLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
