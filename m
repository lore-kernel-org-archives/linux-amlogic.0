Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C0FEB64DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yhk+OVOrJvUcbcC0NAd294LDa2VXHjs/H0HbygSf2do=; b=sJmZ7pPLm0LSSq
	vyYNTRDar+d2LZ+TgLo08USIYQgn9pPLAHMG+FI/Ja7+42bJUb/tB/9ZApC9A6V20dMnUJcUcUeY+
	nm7Bpjoqljg0NkeKzLfCgZ62AD2uyC7QxkQXUIgNZmvY0qVCnYft8pgULHmNmISUKcQB7wqEGUuQf
	sXMn1kZcW38/kUs6OgW8OkjYDeIpRNnY3iW2tZrbuvM8fkfhoxtshBo1jv88NG2joUaTkSdGe+uzD
	L/B2j3+Z1et28F6l+QsW2MBZFhBJJg3rG3cjzqa/cPFxDvulnOJDeaNRiyyJ9yJUMALqjMx7UFlWk
	+WQ+r2CoZ/zi+6x+8THg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kMx-00ETcW-1Q;
	Thu, 15 Jun 2023 10:38:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kMu-00ETb2-0m
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jun 2023 10:38:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so4822125e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jun 2023 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686825498; x=1689417498;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HhDvY5NOJAhj9HpoAeApwW1Xx3nbYDTiIZwJoccQUI=;
        b=SNg6Oeo5SgROXY7rp+MSqrTKj/Ab2XYTPYa7yeactT2L5VC2QhH1RD7NqyBIEZ6kCf
         3iT+uwZPq+L3N3ARWPGthtf0dngxReaq4LDrcT3nhbAFF0nWSo1KkCzdAbkHBgxaD/lO
         itFgK671PZW7Sdh0D9gFnoKDxeII4hQX3zqD2/YWrMB+ODE+/4yg6YxjSUUISuPlxmGd
         9KCwHfcouBOtRHQJNB7/E01+xlZud4iFDXUar5y+2y9UGq63YRi+I9Ms1fiYuu7TW4SL
         KhIwx4bM9WeT0YQwpaRgI8xrXJHt+y6WKK7V+0XdDKHrffly+IT/uyOEQw5pySCeGHVV
         /IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686825498; x=1689417498;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2HhDvY5NOJAhj9HpoAeApwW1Xx3nbYDTiIZwJoccQUI=;
        b=IPb7OpyC4bIecCsXXV97r48AokqJyV16hsj6tikF7tBua6JkpA6Uug1E1d9Wdd8KWE
         L6mVmyhB2zK+EGSXrEpKy9AQZViI/qo+jhQ7HzHRnVmMgYhAgVwjEGSHwNi1enVB8BAe
         2H0+QaEYCEAUp2oS1BzC9cdCspQ82KzAimHEi3M/YI6SEoeKDn1RsfodtuxZy2R0aE6R
         RwPvhVgOwDpaN9q1vj5jwimS7zw/LR0MKs/upYxg8t2W6zSJjgdW8coZnXp7HXr96u2Z
         p05TjSMR3g7aRdKe5b2Ov6BNMGTjb7RTzs+gjQUy7y270E9Isvhuz1In07aVqEhl+QnN
         5L6Q==
X-Gm-Message-State: AC+VfDxv9P4wXKITEsE7FF85LeuApSxNO/GCLKGBJEzBcBitYdvSwLey
	yLHDufLJGcB5RLR5OyBr6YUChg==
X-Google-Smtp-Source: ACHHUZ7aLxl6u8Xy8keJRrva8YV/gEx7RIIAOGjxj2M3OsUhXtIj8GbKGcAVpQ/yJBbdCRNp057N8w==
X-Received: by 2002:a05:600c:5562:b0:3f7:ba55:d03e with SMTP id ja2-20020a05600c556200b003f7ba55d03emr3885162wmb.6.1686825497863;
        Thu, 15 Jun 2023 03:38:17 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003f195d540d9sm20041465wmr.14.2023.06.15.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:38:17 -0700 (PDT)
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
 <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
Date: Thu, 15 Jun 2023 12:36:19 +0200
In-reply-to: <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
Message-ID: <1j7cs52ep4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_033820_300046_B75F9130 
X-CRM114-Status: UNSURE (   6.38  )
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

Ck9uIFdlZCAxNCBKdW4gMjAyMyBhdCAyMjowOSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgSnVuIDE0LCAy
MDIzIGF0IDEwOjQ44oCvQU0gSmlhcGVuZyBDaG9uZwo+IDxqaWFwZW5nLmNob25nQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPj4KPj4gTm8gZnVuY3Rpb25hbCBtb2RpZmljYXRpb24gaW52b2x2
ZWQuCj4+Cj4+IC4vZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jOjM3MzoyLTM6IFVubmVlZGVk
IHNlbWljb2xvbi4KPj4KPj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5h
bGliYWJhLmNvbT4KPj4gQ2xvc2VzOiBodHRwczovL2J1Z3ppbGxhLm9wZW5hbm9saXMuY24vc2hv
d19idWcuY2dpP2lkPTU1MzMKClJlbW92ZWQgdGhpcyBidWd6aWxsYSB0YWcgYW5kIGFkZGVkIGEg
Zml4ZXMgdGFnOgpGaXhlczogYjZlYzQwMGFhMTUzICgiY2xrOiBtZXNvbjogaW50cm9kdWNlIG5l
dyBwbGwgcG93ZXItb24gc2VxdWVuY2UgZm9yIEExIFNvQyBmYW1pbHkiKQoKPj4gU2lnbmVkLW9m
Zi1ieTogSmlhcGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4KPiBS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCkFwcGxpZWQgdGhyb3VnaCB0aGUgYW1sb2dpYyBjbG9jayB0cmVlLgpUaHgK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
