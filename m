Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F701C5AE59
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 May 2025 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnQG3ornMh2LvogG4vO7tVr1i3bRq73aTY4UgXA3YTE=; b=p0Ecw1UE6Qd9ZD
	OK+LNEw7SC35Jow/MT0auMuy/SkhKLfDKZlH1KqqJyLHuK61+S6V7ahHBxrDB75uxbbvzunbAE24z
	Uj3k+pm7eV7xKmqQqEY5ZRzOYABOxvRWlosDmPyRdzqGXgpGMhf9S0TMFgKGVqW0qThEnYFLvv3bs
	g1Bma98C9SQiY5EPH4j9dFZCBiAusiRc6v6ZEY6Oe9QEbSLy02oO3HBC+0zICFHMohbkfUdIgYZqb
	cg6HHNoaEPx46rl6VN1t97e0NHKj24FnLjb2jhWFapkKcDzu1SHTROJ6R/79UNCRuSsZsgMEfLkbQ
	+cr8vlsdPamrh7vP1YyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBIB-0000000CRUO-2SUU;
	Wed, 28 May 2025 07:33:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBI9-0000000CRTQ-03Ps;
	Wed, 28 May 2025 07:33:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad51ef2424bso870952466b.0;
        Wed, 28 May 2025 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748417615; x=1749022415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=EOJqZt2lp0gCtFM7n4t72Gvm3SmjOlMoIJ+sCQ+GyuApqGwvFXTESjt/cTkm0Y/qeH
         ASUJqPS2oz8UAIA06pHkA+1eybeTyldoyA+YcdChUX5Njns0ZSW2fALq5Qtk4yJTTwg+
         GcbnVFqN+82M/f+ym99+iuoW99m1+dAkxLRuSOwBoxI6MSHSmYntrw7F3XY2hMrty1G+
         XTvbU4sp1uBGH5xrq20FkyyEYIrLlafG1IruzAlatQ9hPO3knacVf+JQfQQDeLe+bP6R
         8WidR9KVude3oVXrXQABwD8f1HhkXWsp91R1BQCxOMNkM7RN2yMnTkcBG2V+UUEjOHXl
         X2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417615; x=1749022415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=YplYb0yxsq0AAsOl1Btmfh8eIl7NgEZ5/HYFxnPvvIKXxSP+FpdQqubDMFptbk+MQD
         BZbVYQAEg1fJ56FHVVHcUvW2/uXKx5Hr70ojIeYKzDrCq4auisdv26Y7+IxnNuahnom6
         jd0tfcOFGZrJDhZTLwrNTZWg5HTWBgHM34hdFw5GZQj9gFTtHucPoiKQhDfhuzbDN+or
         6GjrXv5OEa1cXgU8bmQLlAsDy1CpO6l52w/KRJWi910ttbVzJZjXzjE0IZnNYbajmix8
         UJUwlQl2amZ6OzqW6H2IPSIgkPadYbRwJonu8hU4ChFOp3wVigkHpJC/3RyR1fE2Zcgo
         P3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVjjz297wScxa1dopBy+dPPAEdvbXyQlQOSxQCXj0QsdX6YEp5RjYty/6LcylXbgy3bIW9n/sQfFR0Qq2ZQx2LgfQ==@lists.infradead.org, AJvYcCWAGnlhhfzPfDhpkZjSL1DVW0E1+z6sbsPXnJkfgwQmVMJ4Jyp/qKfPfF+u2QO6lyMLiseWNpAgEEbJGIM0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2bL/s5/xezL6w5xyc8kShD82TgDu1ObYtSK3ev/RUKeDsuTP3
	9M4ZGCboi7jZBjd7hfTQndIXPji88mJ6ixTcbHQZfM8YEnw7aGTW21AS/ltRdZpXWPj1Ar6y6PI
	Vi5dbB8WG/9ixO0IB/P/L6fPhzQ3FRBc=
X-Gm-Gg: ASbGnct/ODIVNvJMxpnazJtDFe8xatpHz3T11u+yiJh1t6MBDrZzBUipH+JKkZStZ8Z
	6KohdoONtAOeHrnG4Yqf2jEycDU+cnODtnsEuKPyIAXpjO5pzU0roMRgF8W5Sustj+DRVjafBtV
	1JGCxBrWX94xIbHPCYZ6fXiXawGM4k5mE=
X-Google-Smtp-Source: AGHT+IF1fHMff8y//YavCY6qV37Mp44tGyDZLCVJ94/lgd4evp/huakNGNFGIncJfZaxREzO0BTmn3RMxhTEPInRqyk=
X-Received: by 2002:a17:907:7252:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ad85b120626mr1097477166b.9.1748417614813; Wed, 28 May 2025
 00:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250522172535.302064-1-linux.amoon@gmail.com> <174802762618.2701053.17389702773465611504.robh@kernel.org>
In-Reply-To: <174802762618.2701053.17389702773465611504.robh@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 May 2025 13:03:17 +0530
X-Gm-Features: AX0GCFuQMy8n1ZwrrUkMQP3W0riMpGcHItsAis2ldicF1OXrte5AN2N1gNz0rP4
Message-ID: <CANAwSgQFbhG-VPwSsEZcMZq3VE8n14trr4uXp8MoMW3ML+vHDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and
 reset properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Wayne Schroeder <raz@chewies.net>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_003337_057761_C0E0555B 
X-CRM114-Status: GOOD (  27.15  )
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

SGkgUm9iLAoKT24gU2F0LCAyNCBNYXkgMjAyNSBhdCAwMDo0NiwgUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPgo+IE9uIFRodSwgMjIgTWF5IDIwMjUgMjI6NTU6
MzEgKzA1MzAsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiBBZGQgbWlzc2luZyByZXNldC1ncGlvcyBw
cm9wZXJ0eSB0byB0aGUgVVNCIDIuMCBodWIgbm9kZSB0bwo+ID4gZW5zdXJlIHByb3BlciByZXNl
dCBoYW5kbGluZy4gQWxzbyB1cGRhdGUgdGhlIHZkZC1zdXBwbHkgZm9yCj4gPiBib3RoIFVTQiAy
LjAgYW5kIDMuMCBodWJzIHRvIHVzZSB0aGUgc2hhcmVkIGh1Yl81diByZWd1bGF0b3IKPiA+IGZv
ciBjb25zaXN0ZW50IHBvd2VyIG1hbmFnZW1lbnQuCj4gPgo+ID4gRml4ZXM6IGNjZmYzNjkzNDEz
NyAoImFybTY0OiBkdHM6IGFtbG9naWM6IFVzZWQgb25ib2FyZCB1c2IgaHViIHJlc2V0IG9uIG9k
cm9pZCBuMiIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+IHYzOiBkcm9wcGVkIHJlbW92ZSBvZiB1c2IyX3BoeTEuCj4gPiB2
MjogcmVtb3ZlIHVzYjJfcGh5MSBwaHktc3VwcGx5IHNpbmNlIG5vdyBpdCdzIG1hbmFnZWQgYnkK
PiA+IHRoZSBodWIgcmVzZXQgY29udHJvbC4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpIHwgNSArKystLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+Cj4KPiBNeSBi
b3QgZm91bmQgbmV3IERUQiB3YXJuaW5ncyBvbiB0aGUgLmR0cyBmaWxlcyBhZGRlZCBvciBjaGFu
Z2VkIGluIHRoaXMKPiBzZXJpZXMuCj4KPiBTb21lIHdhcm5pbmdzIG1heSBiZSBmcm9tIGFuIGV4
aXN0aW5nIFNvQyAuZHRzaS4gT3IgcGVyaGFwcyB0aGUgd2FybmluZ3MKPiBhcmUgZml4ZWQgYnkg
YW5vdGhlciBzZXJpZXMuIFVsdGltYXRlbHksIGl0IGlzIHVwIHRvIHRoZSBwbGF0Zm9ybQo+IG1h
aW50YWluZXIgd2hldGhlciB0aGVzZSB3YXJuaW5ncyBhcmUgYWNjZXB0YWJsZSBvciBub3QuIE5v
IG5lZWQgdG8gcmVwbHkKPiB1bmxlc3MgdGhlIHBsYXRmb3JtIG1haW50YWluZXIgaGFzIGNvbW1l
bnRzLgo+Cj4gSWYgeW91IGFscmVhZHkgcmFuIERUIGNoZWNrcyBhbmQgZGlkbid0IHNlZSB0aGVz
ZSBlcnJvcihzKSwgdGhlbgo+IG1ha2Ugc3VyZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToKPgo+
ICAgcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQo+Cj4KPiBUaGlzIHBhdGNoIHNlcmll
cyB3YXMgYXBwbGllZCAodXNpbmcgYjQpIHRvIGJhc2U6Cj4gIEJhc2U6IHVzaW5nIHNwZWNpZmll
ZCBiYXNlLWNvbW1pdCA1Y2RiMmM3N2M0YzNkMzZiZGVlODNkOTIzMTY0OTk0MTE1N2Y4MjA0Cj4K
PiBJZiB0aGlzIGlzIG5vdCB0aGUgY29ycmVjdCBiYXNlLCBwbGVhc2UgYWRkICdiYXNlLWNvbW1p
dCcgdGFnCj4gKG9yIHVzZSBiNCB3aGljaCBkb2VzIHRoaXMgYXV0b21hdGljYWxseSkKPgo+IE5l
dyB3YXJuaW5ncyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBmb3IgYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljLycgZm9yIDIwMjUwNTIyMTcyNTM1LjMwMjA2NC0xLWxpbnV4LmFtb29uQGdt
YWlsLmNvbToKPgo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9p
ZC1uMi1wbHVzLmR0YjogdXNiQGZmZTA5MDAwIChhbWxvZ2ljLG1lc29uLWcxMmEtdXNiLWN0cmwp
OiAncGh5LXN1cHBseScgZG9lcyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAnXnBpbmN0
cmwtWzAtOV0rJCcsICdedXNiQFswLTlhLWZdKyQnCj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3VzYi9hbWxvZ2ljLG1lc29uLWcxMmEtdXNi
LWN0cmwueWFtbCMKPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJv
aWQtbjIuZHRiOiB1c2JAZmZlMDkwMDAgKGFtbG9naWMsbWVzb24tZzEyYS11c2ItY3RybCk6ICdw
aHktc3VwcGx5JyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdecGluY3RybC1b
MC05XSskJywgJ151c2JAWzAtOWEtZl0rJCcKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL2FtbG9naWMsbWVzb24tZzEyYS11c2ItY3Ry
bC55YW1sIwo+Ck9rIEkgYW0gYWJsZSB0byByZXByb2R1Y2UgdGhpcywgaXQgc2VlbSB0aGUgaXNz
dWUgaXMgd2l0aCBzZWNvbmQgcGF0Y2gKCkN1cnJlbnRseSwgSSBhbSBpbiB0aGUgcHJvY2VzcyBv
ZiBkZWJ1Z2dpbmcgdGhlIG9uYm9hcmRfdXNiX2Rldi5jIGRyaXZlci4KSXQgYXBwZWFycyB0aGF0
IHRoZSBkcml2ZXIgaXMgbm90IGNvcnJlY3RseSBwYXJzaW5nIHRoZSBwZXJyLWh1YiBub2RlIGFu
ZAppcyBleGl0aW5nIHByZW1hdHVyZWx5LiBJ4oCZdmUgYmVlbiBhYmxlIHRvIHBhcnRpYWxseSBp
ZGVudGlmeSB0aGUgcm9vdCBjYXVzZSwKYnV0IEkgaGF2ZW7igJl0IHlldCBmb3VuZCBhIHByb3Bl
ciBzb2x1dGlvbi4KCmFsYXJtQG9kcm9pZC1uMnBsdXM6fiQgbHNtb2QgfCBncmVwIG9uYm9hcmQK
b25ib2FyZF91c2JfZGV2ICAgICAgICAyMDQ4MCAgMAphbGFybUBvZHJvaWQtbjJwbHVzOn4kCgpU
aGFua3MKLUFuYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
