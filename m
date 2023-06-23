Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194E3EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ckkr4eMzXZZtnPEzfVlLdhQ+vzOWXzgMl+2XsT1fvak=; b=5AfWzBPW9YbSUq
	Axe753M76jA4eyTi/FWYqt7UzQTS+qOh5UWUWzO4ssOFDjXvt+vQS84VzA7Tbv76Qo+aHvTPRiwMC
	k1+gBHAE5PAliKyTKVg/9pUEMc7TmOJlrktHAsuGC8CUQiv8+2xleTLMOqzhNCpv8otTabx41o1G5
	DO/9Hd+Jm0o86ArqrkRUSVLHedTlUhh12kkSiOgiFh9bivEz+pWNfh1P81+Oor8CwCH5merhYy9VY
	BHOJ2lCiAsUR05G4x59ptu4QonQJjKux+gwTZx9AmA3KgT+5PcME9hdpBZQB59jUQFWyhHan1+dUh
	Og9Noe5M3dOlHJbovT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCa6U-002fvP-2Z;
	Fri, 23 Jun 2023 06:17:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCa6R-002fuW-1S;
	Fri, 23 Jun 2023 06:17:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9881b9d8cbdso258431766b.1;
        Thu, 22 Jun 2023 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687501019; x=1690093019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTzRTBwuHpC7/hhWw9l446CStpPhNQn+H0m14KUu0h8=;
        b=VhM2vnJgCLaRCOzs0kOlroNdVzfrTvRkeuZIBNxezHdrD5f8hVG2zJtCjk15wJDIu9
         E3xJORLjKw5yGUvWyEnyfHARLXnT+RXT5MPD/hpvgYdNSlMXCzFv8ZPW6MiO+xY2hsF8
         nP2ScAqRqHyyJDKZzc/ikUla4De9zOcOpGIC33KJEu9csebDnzuh2nenlz25Fqw+PDFU
         xDLuzmYKVuZgGXKpj3lLeR3HW4Ob67rVKC2+2LRyAedaLqVXsA6DoqxxDdOw0l4Dn1sh
         YyKOHTFzUwvur5wsCqj1P3sXGmMA9wYIUEitkcaS3RoZxhVvuxeEFCYdKJJJVL+ARIHS
         t8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687501019; x=1690093019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTzRTBwuHpC7/hhWw9l446CStpPhNQn+H0m14KUu0h8=;
        b=CRvBRGQcGiGdI6ROnUPJykwRVbac1cYKUusUzwK0dzd4cqBFloSk3YbJSGH9jeets7
         cjfMdu/p3tNsSMDBNPNtLGm1Ia0uHiwBS7sUeyzZ8tV1wMMiMT9/mKJfy1Ph5wVteVmU
         aLqVntAuhl0qJNv2M9PNnYIB73hxkS5/+V853NKKz61lvE83To+W4o7h2U6kIx85ylRh
         IlJn/MC+8ZGDKDpxpa5nMutyiJkzt03hQjhJV/7GKBoUqpf6NtD3GaiE6RtgKLctpoo0
         8QYojy8X1QypfmfV/Clj4KyQ3cZbpSH5pejg1BfRD8pYvtY5thnQ+iW7dWmjXO6iEj1n
         oV/g==
X-Gm-Message-State: AC+VfDwwEr2eJdfo35LXdB7gxhcIlbO25vR69C7CJy607gh9yDTcUsbe
	hKBPTeBx/M9WyFHkvqI2opCM8DsP3E9x8nINZ0I=
X-Google-Smtp-Source: ACHHUZ7/k41yx67lWIal2QXf8cBmr9dIrsOBDzFQcnBkJqFbQY3pmpiYMLIDfCUFTJ2f2iU93/paSGzeBcAK9TsqaNg=
X-Received: by 2002:a17:907:3e83:b0:987:fe18:1c58 with SMTP id
 hs3-20020a1709073e8300b00987fe181c58mr15265725ejc.35.1687501018686; Thu, 22
 Jun 2023 23:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230623022334.791026-1-gnstark@sberdevices.ru> <20230623022334.791026-7-gnstark@sberdevices.ru>
In-Reply-To: <20230623022334.791026-7-gnstark@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 23 Jun 2023 08:16:47 +0200
Message-ID: <CAFBinCBv993Xv_wk9fE-U0Tw2mzTB1z22Tj6x8Uy1rRw_dztng@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] meson saradc: support reading from channel7 mux inputs
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, andriy.shevchenko@linux.intel.com, 
	nuno.sa@analog.com, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_231703_534012_CD9C54A8 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgR2VvcmdlLAoKT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNDoyM+KAr0FNIEdlb3JnZSBTdGFy
ayA8Z25zdGFya0BzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gTWVzb24gc2FyYWRjIGNo
YW5uZWwgNyBpcyBjb25uZWN0ZWQgdG8gbXV4ZXIgdGhhdCBjYW4gc3dpdGNoIGNoYW5uZWwKSSB0
aGluayB0aGF0IHRoaXMgc2hvdWxkIHJlYWQ6IC4uLiBpcyBjb25uZWN0ZWQgdG8gYSBtdXggdGhh
dCAuLi4KClsuLi5dCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyBtZXNvbl9z
YXJfYWRjX2lpb19jaGFubmVsc1tdID0gewo+IEBAIC0yNDUsNiArMjgwLDExIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyBtZXNvbl9zYXJfYWRjX2lpb19jaGFubmVsc1tdID0g
ewo+ICAgICAgICAgTUVTT05fU0FSX0FEQ19DSEFOKElOREVYX0NIQU5fNiksCj4gICAgICAgICBN
RVNPTl9TQVJfQURDX0NIQU4oSU5ERVhfQ0hBTl83KSwKPiAgICAgICAgIElJT19DSEFOX1NPRlRf
VElNRVNUQU1QKElOREVYX0NIQU5fU09GVF9USU1FU1RBTVApLAo+ICsgICAgICAgTUVTT05fU0FS
X0FEQ19NVVgoSU5ERVhfTVVYXzBfVlNTLCAwKSwKPiArICAgICAgIE1FU09OX1NBUl9BRENfTVVY
KElOREVYX01VWF8xX1ZERF9ESVY0LCAxKSwKPiArICAgICAgIE1FU09OX1NBUl9BRENfTVVYKElO
REVYX01VWF8yX1ZERF9ESVYyLCAyKSwKPiArICAgICAgIE1FU09OX1NBUl9BRENfTVVYKElOREVY
X01VWF8zX1ZERF9NVUwzX0RJVjQsIDMpLAo+ICsgICAgICAgTUVTT05fU0FSX0FEQ19NVVgoSU5E
RVhfTVVYXzRfVkRELCA0KSwKPiAgICAgICAgIE1FU09OX1NBUl9BRENfVEVNUF9DSEFOKCksIC8q
IG11c3QgYmUgdGhlIGxhc3QgaXRlbSAqLwpJIGhhdmVuJ3QgaGFkIHRoZSBjaGFuY2UgdG8gcnVu
IHRoZXNlIHBhdGNoZXMgeWV0IGJ1dDogSSB0aGluayB0aGV5CmFyZSBicmVha2luZyB0aGUgdGVt
cGVyYXR1cmUgc2Vuc29yIHJlYWRpbmdzIG9uIE1lc29uOC84Yi84bTIgYm9hcmRzLgpTZWUgYXJj
aC9hcm0vYm9vdC9kdHMvbWVzb24uZHRzaSB3aGVyZSB0aGUgdGVtcGVyYXR1cmUgY2hhbm5lbCBp
cwpiZWluZyByZWZlcmVuY2VkOgogIGlvLWNoYW5uZWxzID0gPCZzYXJhZGMgOD4KCldpdGggdGhp
cyBzZXJpZXMgKHRoaXMgcGF0Y2ggYW5kIEkgdGhpbmsgYWxzbyBwYXRjaCAzLzYgIm1lc29uIHNh
cmFkYzoKdW5pdGUgaWlvIGNoYW5uZWwgYXJyYXkgZGVmaW5pdGlvbnMiKSB0aGUgbnVtYmVyaW5n
IG9mIHRoZSB0ZW1wZXJhdHVyZQpzZW5zb3IgY2hhbm5lbCBjaGFuZ2VzLgoKVG8gbWFrZSB0aGlu
Z3Mgd29yc2U6IGluIHRoZW9yeSB3ZSBjYW4gdXNlIG1lc29uX3NhcmFkYyB0byByZWFkIHRoZQpT
b0MgdGVtcGVyYXR1cmUgc2Vuc29yIG9uIEdYQkIsIEdYTCBhbmQgR1hNIGJvYXJkcyAocG9zc2li
bHkgb24gQVhHIGFzCndlbGwgYnV0IEkgY2FuJ3QgcmVjYWxsIGZyb20gdGhlIHRvcCBvZiBteSBo
ZWFkKSBpbnN0ZWFkIG9mIGdvaW5nCnRocm91Z2ggU0NQSS4KSSBoYXZlIGV4cGVyaW1lbnRlZCB3
aXRoIHRoaXMgaW4gdGhlIHBhc3QgYnV0IG5ldmVyIGdvdCBpdCB0byB3b3JrLgpEb2luZyBzbyBp
biB0aGUgZnV0dXJlIGNvdWxkIGxlYWQgdG8gYW5vdGhlciBjaGFubmVsIGluZGV4IGNoYW5nZSwK
ZGVwZW5kaW5nIG9uIGhvdyB3ZSBkZWNpZGUgdG8gZ28gZm9yd2FyZCBub3cuCgpUaGVyZSdzIHR3
byB0aGF0IEkgY2FuIHRoaW5rIG9mOgotIHVwZGF0ZSBtZXNvbi5kdHNpIHRvIHVzZSB0aGUgbmV3
IGNoYW5uZWwgbnVtYmVyaW5nIChJIGRvbid0IGV4cGVjdAptYW55IDMyLWJpdCBTb0MgdXNlcnMg
b3V0IHRoZXJlIHVzaW5nIG5ldyBrZXJuZWwgKyBvbGQgLmR0YnMsIGJ1dCBpdCdzCmltcG9zc2li
bGUgdG8gc2F5IGZvciBzdXJlKQotIG9yIGtlZXAgdGhlIGRyaXZlciBiYWNrd2FyZHMgY29tcGF0
aWJsZSAodGhhdCBpbnZvbHZlcyByZS1hZGRpbmcgdGhlCmNoYW5uZWwgdGFibGVzKQoKV2hhdCBk
byB5b3UgdGhpbms/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
