Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89AC369D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JScdCLh42EfSM9S3C4urPuuedsor5eWvBKnDis7PdHE=; b=Kt6cP7WULOGfeY
	iDaH3wT1eleTYfoBCIXb8pcgKbIx5I6sRhbeUkSZgI6VgT/vyHJNZjMpdGXTR1sEBsXeYjA4rXDeB
	G5j106wnMNfSEQ9Le9fGvYWnw8M3/NF5DcqL1En1ehCre2Vfdetp1JWp6/I7tS2ZQ1Z+W17BmmonK
	mjNozvZk7w+Bnv66tlzqvY37lUAq0+E7u1lhRta/wpsplhuik36NcrNp9tRExryf1sqwIApkUEvFT
	8sYBU5iykeCN4glO7P5NYBo7tn0tRYYP4+a6aCf7U3NL8Rwu/pcN/pvIG4bgncZodPCdIWqI7Yd1D
	OyT8Vs0El5r2OtfQtGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EVj-00000004NdK-19XB;
	Mon, 28 Apr 2025 02:46:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EVg-00000004NcW-1Tqc
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 02:46:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30332dfc820so5211267a91.2
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Apr 2025 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745808379; x=1746413179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=BHNqO43M+DKFbcUbH1GQrSKOimsp1YFefVi81RausxHex4rCZzP1sdx5Gfd/OXGsqG
         Ep8QWzmzgYjNKuMVZtt3Fby9GkC0K9J9YVg9tU6Sbj6wKmp49kOiEHT1VCR+73GFg3Nr
         kUh+F+EpJ9FyRpAR0wKmkq5MVgLpy6GTmihkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745808379; x=1746413179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=j8t066V7WQ/s33fyXTprx3zjx5LRNuLrh+nuXRnludBLm36tAmD9NJEBYBnMHUXzLi
         eB8OSjF1TItdrjAzRaYTi6L+euSxrEQkTkjv3odJ54AWVxEMJg5Rn8rIjFYArAmMNWZ1
         JXXb19U+K0Do3zI2CrRin2/WqnvTX7Q0lsFMJ/c+gxeVSnqhcMdznEVo70wgB1lLS4+0
         jik8ZazIBGRzhghNXGgeJDeXVkPZxG7mQAaspMoTL1UqDb7mApL5Giu+xNJ+FxYP1fDN
         gNEsgXKQwPLcW8QvoUk1ZByyRIHdFBqvZ5E6YAMqYRSZqaaPz1qHFdeMpy/IDnC1GPGa
         XH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB8r+QtLu0tM749Ln8xksxlkywhxGJ2wTGEpqVC6hdA9WhjSm+4xddrVuWrJfqkvnyz2k8tiYqncx0DXQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YyZYltKIK6UhHyqDQXqzrp7DjmgYt3CLYXcntwwhe5p21v6k5aw
	Rq/1ww+sM8AYduswvxZtp1x/R07B40/Q8l2T9L3KEqYyg7T+Fbl+2L7msWTV0vNzEvYLv5nV9gg
	pHH2sqFcwHvE2m7gEo3IBtiHMQyq7CzwiQOh+bg==
X-Gm-Gg: ASbGncvvB+kf7OidwayXYaEi0LssMwtcQfVHY+sPt4jaJ3SPJw7KOC4L7ZDU+teVI0/
	CydwwVfi1RsrSGxQk9AAckZKMoMkJ4tgKDGYbjnswzKN+TGQQ0xgVK3peHGxtUzIvAi7yxo7vuB
	f1V3gO8xVXspyo2TuDB7I7PoOJMyFLQfcr1VgOwf+2+RjtGGp0zaxj7Dg=
X-Google-Smtp-Source: AGHT+IFnzBUOX899hEhTQB+VFNRLl+PxXCq+IL10Ns4KASmw7qSvMl53RlFdnCNy3FuGcz9Ynut9j1cIj9JyY2lnZPI=
X-Received: by 2002:a17:90b:3944:b0:301:98fc:9b5a with SMTP id
 98e67ed59e1d1-309f7da6d2fmr14756992a91.6.1745808378981; Sun, 27 Apr 2025
 19:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
In-Reply-To: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Sun, 27 Apr 2025 22:46:07 -0400
X-Gm-Features: ATxdqUGWEOGuPy-ymNWEfY9-YxSHKLuGJnDXSl4c3NrXQIsa-1uCWVa4Pkv940Q
Message-ID: <CACdvmAhn_25GWtOwGsChU-U3PV481_h6-pC3o3G4p7T0Z5dHog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_194620_414693_6E8FB134 
X-CRM114-Status: GOOD (  16.34  )
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

T24gU3VuLCBBcHIgMjcsIDIwMjUgYXQgNToxMeKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIg
MjUsIDIwMjUgYXQgMTA6MzHigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPiB3cm90ZToK
PiA+Cj4gPiBHWEwgSTJDIHBpbnMgbmVlZCBpbnRlcm5hbCBwdWxsLXVwIGVuYWJsZWQgdG8gb3Bl
cmF0ZSBpZiB0aGVyZQo+ID4gaXMgbm8gZXh0ZXJuYWwgcmVzaXN0b3IuIFRoZSBwdWxsLXVwIGlz
IDYwa29obXMgcGVyIHRoZSBkYXRhc2hlZXQuCj4gPgo+ID4gV2Ugc2hvdWxkIHNldCB0aGUgYmlh
cyB3aGVuIGkyYyBwaW5tdXggaXMgZW5hYmxlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYSBY
dWUgPGRhQGxpYnJlLmNvbXB1dGVyPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+Cj4gK1hpYW53ZWkgWmhhbyAo
d2hvIGhhcyByZWNlbnRseSB1cHN0cmVhbWVkIEFtbG9naWMgQTQgcGluY3RybCBzdXBwb3J0KS4K
PiBJIHN1c3BlY3Qgd2UgbmVlZCBhIHNpbWlsYXIgY2hhbmdlIGZvciBhbGwgb3RoZXIgKE1lc29u
OCwgTWVzb244YiwKPiBHWEJCLCBHMTJBLCAuLi4pIFNvQ3MgYXMgd2VsbC4KPiBDYW4geW91IGNv
bmZpcm0gdGhpcz8gQW5kIGlmIG5vdCwgd2h5IGRvZXMgb25seSBHWEwgbmVlZCB0aGlzIHNwZWNp
YWwgdHJlYXRtZW50PwoKV2UndmUgb25seSB0ZXN0ZWQgdGhpcyBleHRlbnNpdmVseSBvbiBHWEwg
KFM4MDVYLCBTOTA1RCwgUzkwNVgpLiBJCnRoaW5rIHdlIHNob3VsZCBlbmFibGUgaXQgZm9yIGFs
bCBTb0NzIGlmIHRoaXMgcGF0Y2ggZG9lc24ndCBjYXVzZSBhbnkKaXNzdWVzLiBJIGRvbid0IHNl
ZSBtb3N0IEFtbG9naWMgYm9hcmRzIGltcGxlbWVudCBwdWxsLXVwcyBidXQgSQpoYXZlbid0IHRl
c3RlZCB0aGF0IGFzIGV4dGVuc2l2ZWx5IGFzIEkndmUgZG9uZSBmb3IgdGhlc2UuCgo+Cj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gTWFydGluCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
