Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E203FC79FB0
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V75goN9X4ObMcO/Q9Jno9afPe8mK0uqokFgS/dZqxHI=; b=DoKNlDelbOa2g6p1i45hr1rhKB
	rjT5WbRP+NkEEIy8L2XR9Pcdjqy3+VK/4oPDgkVqHwiRCUTS7jPbYwCtL4ajhK6zviLQLYkOl2fX0
	3Rwcp8VTHpURpaW3fy5zTmneDA16OiqExYX/B39YuzWd4kv807MbnqRYbfjJzEuRUtbUaG6ZdtXto
	CvLGBs2/KKCa4eh/S0+pr83oFI81UKrqSdI+VTtqlbrXAxttIicc4KkY51vcVJlU9JOmyryo8wJNb
	I8XBgdPkeWTEvMNeGz3b4elYFrzm+qxTsCSa2ivdovs97RTunSjfJ/IFXLpL6epVcveo8PdkgLTj6
	OziKbZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoXU-0000000Bqho-0tj4;
	Mon, 05 Jan 2026 17:38:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoXQ-0000000BqgP-0oCS
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 17:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67B6E4438C
	for <linux-amlogic@lists.infradead.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4676CC2BCB1
	for <linux-amlogic@lists.infradead.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634719;
	bh=Xp0i1Ix8i4EVXbO6cbFPIEaut/C7zGARDQHbCBH0TDs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ih9Qw6lz1Sko5fL7pFLbomG8nmlCZWV5f7VzhNkCv3qefRr8/DZCKpPozic2neoTd
	 Xw4fRybgZh/FRbdFzVZ7KJ3VUaI+bO8UXaC0hYJ6BHPod+ZT9Fbf54stFIjt889hVF
	 JrGDcMSZtE2iEZp6xZj9JnTOSTTs2m75dLdvvRvpmnYM4/IqnM5c5fRWYDDFtGfmU5
	 buKtj+8Sw+3eOCb2sKEA4X7KO3Dgn3T6udqPNwd+kNITAJjjP5Wv1CZDkGPCa7Ftr9
	 GnV7m7L+1R6UyMjEMJ0APffCchNsz13K5mszzy3M2J0GHXoIaUObJ8m0lFNZY6a2Oa
	 N9eikJpKN+0jA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso1581351fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 09:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdpKBt7WUHYIz3GXSE6cwPsN6mLQlHuIZYnCh4+A7x/JT2nZSX7c4hYO84MxwMBU+cWSvcnx/gT7GnNWo1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3WyfMtT3c4dqx2ETFTRQdxVqgIvTZWxxe6ETBULm1sSsiMdsM
	nTXGgG+OzDk13ukgSE/Lk/M25OWZSd+hmuo1UNIN4UgA2mMI6yjZ6m2PAiDP28g2mHSn+67HuHh
	Jfnr15wHTnR/2UooPQSbZHtp0IwCavSr/eivDtHYOlw==
X-Google-Smtp-Source: AGHT+IG6SIPigJxkJHInO+tkcsToIW/YovjrsTkuD8gZ0NGaSCdwwzyT7wEbNisz6v64WdN2v0/svdmJHeaElAERj4U=
X-Received: by 2002:a2e:ad13:0:b0:382:8844:2080 with SMTP id
 38308e7fff4ca-382eaabb736mr255161fa.25.1767634717790; Mon, 05 Jan 2026
 09:38:37 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com> <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Date: Mon, 5 Jan 2026 09:38:36 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-Gm-Features: AQt7F2oSq5mFA1y8aimNhkWa6uJgJwLZMRBreFji3RmTtVrRuRT8uL2rJ5zqO0Q
Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_093840_268079_25954F27 
X-CRM114-Status: UNSURE (   8.76  )
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

T24gTW9uLCA1IEphbiAyMDI2IDE4OjI4OjIzICswMTAwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiBzYWlkOgo+IEhpIEJhcnRvc3osCj4K
PiBPbiBNb24sIEphbiA1LCAyMDI2IGF0IDQ6MDXigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpCj4g
PGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4g
ICBtdXRleF9sb2NrX25lc3RlZCsweDI0LzB4MzAKPj4gICBwaW5jdHJsX2dldF9kZXZpY2VfZ3Bp
b19yYW5nZSsweDQ0LzB4MTI4Cj4+ICAgcGluY3RybF9ncGlvX3NldF9jb25maWcrMHg0MC8weGRj
Cj4+ICAgZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWcrMHgyOC8weDNjCj4+ICAgZ3Bpb19kb19zZXRf
Y29uZmlnKzB4YTgvMHgxOTQKPiAkIGdpdCBncmVwIGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnIGRy
aXZlcnMvcGluY3RybC9tZXNvbi8KPiBkcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1hbWxv
Z2ljLWE0LmM6ICAgICAuc2V0X2NvbmZpZwo+ICA9IGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnLAo+
IGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLmM6ICBwYy0+Y2hpcC5zZXRfY29u
ZmlnID0KPiBncGlvY2hpcF9nZW5lcmljX2NvbmZpZzsKPgo+IHBpbmN0cmwtYW1sb2dpYy1hNC5j
IHN0aWxsIGhhczoKPiAgIC5jYW5fc2xlZXAgPSBmYWxzZSwKPgo+IEFyZSB0aGVyZSBwbGFucyB0
byBzZW5kIGEgc2VwYXJhdGUgZml4IGZvciBwaW5jdHJsLWFtbG9naWMtYTQuYyAtIG9yCj4gd2Fz
IHRoZSBpbnRlbnRpb24gdG8gZml4ICJhbGwiIEFtbG9naWMgcGluIGNvbnRyb2xsZXJzIGluIHRo
aXMgcGF0Y2gKPiAod2hpY2ggd291bGQgbWVhbiB0aGF0IHRoZSBjaGFuZ2UgdG8gcGluY3RybC1h
bWxvZ2ljLWE0LmMgaXMgbWlzc2luZyk/Cj4KPgoKWWVhaCwgSSBtaXNzZWQgaXQuIEkgd2lsbCBz
ZW5kIGEgZm9sbG93LXVwIHRvbW9ycm93LgoKQmFydG9zegoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
