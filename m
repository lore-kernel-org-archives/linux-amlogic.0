Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01639C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7Z/83ifotklaBw8f/ybgPHx6aDJjp1XmaBQCGd06FA=; b=2n5LLa/m9R7K7k
	cuV9KyHvCs0l68E7f71CHEiuK8iD8xEpqapSzXcypTzbH99x+WSHq9lzG7NBRKbz1uqZwTWrkwpbB
	3LXayCVdJLqJrfaiHewvWYPwpt4auNkpR/NbXUqHNXu7KuKfLBxcQHV5UEoZ/UdGZw/GJNKpBB6Fd
	0re+Kz5z0LfH7lVIRfqX3SFCweyer1EHhZB96vJN8lBFLYfMiKcqF86AW1dry2BUCg3EDyW50OrRa
	5CXRA8YWI9/pjS7FKkfR1xhGI6nefCxJDhZHVeZPUmY5dwMu6VRE+D0C7AOkg484TedcbTbGfop9n
	fmpBZmj6tipoY2+ZuzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsOZ-0000000Cuat-2SuH;
	Tue, 13 May 2025 16:22:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsMS-0000000CuDT-2FhR
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 16:20:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5975998b3a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1747153207; x=1747758007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=XGT74QQn3CjT1E1LQxc5G4e5tG7Q2OVNws57pT7IS5hqWnGr6Bdqoa2snn2MRpzWqx
         6PNEa/krQQ5BkgyStHc64G2NKJe8Rj1r2Kb91f28UUhRpIg2lnfjryz32koF/RCyyJ0I
         gcIvet9+uPNJaJ3ykLRzX0xzTqR4TxuQ9MZgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153207; x=1747758007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=DyB7iCAxEOz+hkMUNiMqzOtsRSVFt9noTyqabEkNRPTA+du5PDOAAM6nPKs/fbTYvE
         BCWWiB+C5z7Uut00p2h/25emSL75fuj7aXdPAfFppjjkzzYcgCuWGf1Du7G3/MISX4nB
         7yIvfUdC0Ako2f+/p5UVBWpAY6HCrpnnnqi0qpROf5iZTvDPMNbX+1fYB6d861enaIT1
         raPDXJbsKCMGZI7cBj4kl0+m+LbWLuGTJX/OI3/xiZDfT1XTczoad85vNqBeY0uy9eaO
         piEqYmXfRnAudZAjmMjcTuncfRzNb7XcRQWQqPYXqbBKF1HwzCXr/HqiChmvvygpyhGi
         Diug==
X-Forwarded-Encrypted: i=1; AJvYcCXbI8bASQd1UZZuo+HfJOY6+o34uFVp8xrKsNH+4wwKfl1WiUJ59oBfUgy4qaiDVqsletl/hFW4qAxLrfEj@lists.infradead.org
X-Gm-Message-State: AOJu0YzRNeRAcDt5UGqxyasgpNnN4YFfEw65hQTR4ABZvjrposGqBV5h
	BKjoXDuc63shwAM2ACLUpGgPZ96e2fLm0cbJRdxZsAWygS7pwHmPBBBnX91DZ3dEErxFBgRVACM
	F7PtGMi5+zczgX1ZmiwqFnH0KOWtgtyILQcqH7i2sp6e118DZ3Vs=
X-Gm-Gg: ASbGncu0CEODZ8NUfI58A215o3JSSOmoQf72/7YogscWYFV1pAmtIwfpSaYSu2p0Y6v
	S1MAyLCIkzExni0ECGXrRePfPD3lj6DbI12hTMa+YLBEQ2jPqNYKzLNZEowIw/KkAu1UiGJCBfH
	O5eymnuINJ0ncqsPRs+PSIZ1UFa6L6jQt6CkDEG27D4HqRPuwKBmbwaUKf7qzr9xvVr2M=
X-Google-Smtp-Source: AGHT+IEFiZZLEVm8p4exZqTgRnoEBDvu1NNpn5CecmgOUa1lbzow7S7xDOQ9y/PS6u/6mPTPI55hbsmTlWowpXVMs6Q=
X-Received: by 2002:a17:902:d492:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-231981d284emr53485ad.48.1747153207290; Tue, 13 May 2025
 09:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250512142617.2175291-1-da@libre.computer> <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 13 May 2025 12:19:55 -0400
X-Gm-Features: AX0GCFvX20FlZeuRo40HJUU0H1dNyPENU2uA3HGGuO4tfwuq5uvg2W8hOH9cVak
Message-ID: <CACdvmAgNVf8jtRj-jONwunGXhheaizUEEyB4rz5tpqzXb6hKqg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092008_573259_82AEC770 
X-CRM114-Status: GOOD (  22.79  )
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

T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMzo1MuKAr0FNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiAxMiBNYXkgMjAyNSBhdCAxMDoyNiwgRGEg
WHVlIDxkYUBsaWJyZS5jb21wdXRlcj4gd3JvdGU6Cj4KPiA+IFNQSUNDIGlzIG1pc3NpbmcgZmNs
a19kaXYyIHdoaWNoIGNhdXNlcyB0aGUgc3BpY2MgbW9kdWxlIHRvIG91dHB1dCBzY2xrIGF0Cj4g
PiAyLjV4IHRoZSBleHBlY3RlZCByYXRlLiBBZGRpbmcgdGhlIG1pc3NpbmcgZmNsa19kaXYyIHJl
c29sdmVzIHRoaXMuCj4KPiBJIGhhZCB0byByZS1yZWFkIHRoYXQgYSBmZXcgdGltZXMgdG8gZ2V0
IHRoZSB3aGF0IHRoZSBhY3R1YWwgcHJvYmxlbSBpcy4KPiBJZiB5b3UgZG9uJ3QgbWluZCwgSSds
bCBhbWVuZCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aAo+Cj4gJycnCj4gU1BJQ0MgaXMgbWlzc2lu
ZyBmY2xrX2RpdjIsIHdoaWNoIG1lYW5zIGZjbGtfZGl2NSBhbmQgZmNsa19kaXY3IGluZGV4ZXMK
PiBhcmUgd3Jvbmcgb24gdGhpcyBjbG9jay4gVGhpcyBjYXVzZXMgdGhlIHNwaWNjIG1vZHVsZSB0
byBvdXRwdXQgc2NsayBhdAo+IDIuNXggdGhlIGV4cGVjdGVkIHJhdGUgd2hlbiBjbG9jayBpbmRl
eCAzIGlzIHBpY2tlZC4KPgo+IEFkZGluZyB0aGUgbWlzc2luZyBmY2xrX2RpdjIgcmVzb2x2ZXMg
dGhpcy4KPiAnJycKPgo+IElzIHRoYXQgT0sgd2l0aCB5b3UgRGEgPwoKRmVlbCBmcmVlLiBZb3Vy
IGRlc2NyaXB0aW9uIGlzIGJldHRlci4KCj4KPiA+Cj4gPiBGaXhlczogYTE4YzhlMGI3Njk3ICgi
Y2xrOiBtZXNvbjogZzEyYTogYWRkIHN1cHBvcnQgZm9yIHRoZSBTUElDQyBTQ0xLIFNvdXJjZSBj
bG9ja3MiKQo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDYuMQo+ID4gU2lnbmVk
LW9mZi1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KPiA+IC0tLQo+ID4gQ2hhbmdlbG9n
Ogo+ID4KPiA+IHYyIC0+IHYzOiByZW1vdmUgZ3AwCj4gPiB2MSAtPiB2MjogYWRkIEZpeGVzIGFz
IGFuIG9sZGVyIHZlcnNpb24gb2YgdGhlIHBhdGNoIHdhcyBzZW50IGFzIHYxCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5j
IGIvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4gPiBpbmRleCA0ZjkyYjgzOTY1ZDVhLi5iNzJl
ZWJkMGZhNDc0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4gPiAr
KysgYi9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiA+IEBAIC00MDk5LDYgKzQwOTksNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBzcGljY19zY2xrX3BhcmVudF9kYXRh
W10gPSB7Cj4gPiAgICAgICB7IC5odyA9ICZnMTJhX2NsazgxLmh3IH0sCj4gPiAgICAgICB7IC5o
dyA9ICZnMTJhX2ZjbGtfZGl2NC5odyB9LAo+ID4gICAgICAgeyAuaHcgPSAmZzEyYV9mY2xrX2Rp
djMuaHcgfSwKPiA+ICsgICAgIHsgLmh3ID0gJmcxMmFfZmNsa19kaXYyLmh3IH0sCj4gPiAgICAg
ICB7IC5odyA9ICZnMTJhX2ZjbGtfZGl2NS5odyB9LAo+ID4gICAgICAgeyAuaHcgPSAmZzEyYV9m
Y2xrX2RpdjcuaHcgfSwKPiA+ICB9Owo+Cj4gLS0KPiBKZXJvbWUKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
