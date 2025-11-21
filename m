Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDBACFA765
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Nov 2025 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfmPAqOI7uV10VreUzY8hI6rtobAi1hyI0yQjTyFin4=; b=2g4XQhh7NKBwni
	2ZTYkCPn6hb3MS6zJnAjx0VlGqmghkaY96obn0e9kmXnZrz3E/Bohb/1aHotEc+tPHgY+nTjIzDFQ
	8NRY2jDPl9XOmUwEU/HqFf765rr4U15Kljm7px8ZsvofSmvBVYMXnfT7RMg/Q7Hjqu78ESJIUAaMl
	5l5xQame7R2aUkvuQgD1KqD/jJaPN+IhDylaAuvXWt9R4PhEK70IbBjiojrb7+NjFs28wbGiraAsB
	X3s6MtvLSHVnx9FOUAtyXUXj/74clRVL2EXFvqy61sYq64EMqf7fB2LEb5MFaeV6t00K5ZGXEHzBZ
	pHF7tfbgNFVTNYdJkCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNrL-00000008B6Z-0eSb;
	Fri, 21 Nov 2025 09:55:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNrH-00000008B5E-2p4h
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Nov 2025 09:55:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso2832147a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Nov 2025 01:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763718914; x=1764323714; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5sXa9oC+KOOiftpAe4sv1j7HqzzBA+hMLeVqAktHeQ=;
        b=WcXRPltvjmRv9r8cyXrpNIV1OocoIxWdgUIAQG7yRuFqWgllkOtPVh+EvQ9ved7V3S
         1BnrQ40BtT8bxfKQHxWC+kGS1AB9w6Z3hFunk3icjRrxOVQfiFb79V3XIAET3wd9sYyK
         JCyc5X4c+WPBa4vvLoK+zql4cBNn2Gw2eCENHUdozUDzuKkbAn+wbMxe1+vsTiFFtCs3
         ERyDYxuBUXEUsBvf1GMspBXshBAk8cITeRxQemQLHMS00Wtd/Agdk6k/c5klCp/HE8ka
         sdNpeBJnlKk3BnMC7bgsGw+BhBdBMquiVg6elEoKu408JoOABeH5MR6p+tKGrZtd4gXt
         OEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718914; x=1764323714;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5sXa9oC+KOOiftpAe4sv1j7HqzzBA+hMLeVqAktHeQ=;
        b=c2yFn4m6lsLAIhWmHUGGfYiImo4YLnJh2Atr80pFgkmLoZlnblS6ft2kmZmCQgWk6A
         6PjofknTeHt40e50wu09jJ7sPP0E9ddaKzlGx3vl2rgt7LKUTdvbppX1Tdl8M9d6l+Zj
         lEvSIT7Kw7/MNMY6e84Xa+2V+AnzxYdZI95uEd4cizufNuMSzK477QyWJ3AVLhQL833U
         2LTa9kVxY7rHveJ1Z4v5r//2MQdv05UTL7vu5LPilqIGnXCqhQvTgaOhc7GSCWIVj6co
         eZYT6L3z77en9iycz1ESfQ9GBDDj2tNkjqAtFUNoIvMDtS9x6wRMwcreBTVm/Ya8vtaM
         /qkw==
X-Forwarded-Encrypted: i=1; AJvYcCU13pgIcpGN0pVLxsvgwC63ie7Gvh5t4EhJ1dMYIaVHvghpibD6yhsDjMiLrx5z2S8BEuYcywWVydv1vvd5@lists.infradead.org
X-Gm-Message-State: AOJu0YwpBjx7bHVVYQss0HB8BbpzrPVK4lzO4a7r0SmKGywVksWqqtdJ
	SBnnTr2ZICCRk/7ZjhqBqB7o+1MqBYXTRZMdQZ0u1Wp3oJlz7DkjP5Vf
X-Gm-Gg: ASbGncvD/ON8XbXvN78DInIHM6M2d3oikNyfooGUBj9CBFv7wAyPvdchgbuFj32wqod
	k6cWSHAMW7G18YEIh3psixSagkKmZ7SIjcgPXmIu6sqJg+MtgSG7Rlx6t2zHUPyz3FRNQNBl5A6
	U8ncphxqgI1riuTfN4NyNBMKGC114wX7XdnkHHPd79n4IHcEqDmfumgvLlZulJmGyMk4zlRoqPO
	zBXuo/dlPnkPCfgvylH9CgopY8+3S6knkQW0/LXgYWLz847s/V6iU7213EUuKutWSbaAT1uPFoY
	YwqIli7UsHLtZl4mrh3p/NHcU6FYXpFv6+VPliaCjHkW4dDIvkmNx4rHJ6fRzB5J0iO0l104Jvl
	3aHgYfJKAaQmtg/TALUTzWkewPUcSp6t96BpYnEfwYgzRMBekVs6EeOqI2u3AHiHBjX12cZlOGA
	EY347kdhTgKyYZPCRMGntpTxytMIsPkCJ2FpBhUQK5ZHSRubXohdeJQ+wV9f4rsSKp
X-Google-Smtp-Source: AGHT+IFK2gLLD1c3WD4mHnPUfISp9zBgTSqIO/lEejZpzJMB+Sb3nwm+/TCS3vP9Ug1MEnPP1fQzYw==
X-Received: by 2002:a05:6402:2714:b0:640:93b2:fd0a with SMTP id 4fb4d7f45d1cf-64554665a08mr1612974a12.20.1763718913347;
        Fri, 21 Nov 2025 01:55:13 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d3ecsm4085545a12.17.2025.11.21.01.55.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:55:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Fri, 21 Nov 2025 10:54:59 +0100
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <1015ADA9-34EA-43E6-A43A-413740C6736E@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
To: Ao Xu <ao.xu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_015515_750433_01C65FDD 
X-CRM114-Status: GOOD (  16.51  )
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

VGh4IQoKYnR3OiBpIGZvdW5kIHRoYXQgZW5hYmxpbmcgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNP
TEVfREVGRVJSRURfVEFLRU9WRVIKCnJlc3VsdHMgd2l0aDogCi1ubyBhbnltb3JlIGJvb3QgaGFu
ZyBvbiBzNCAod2l0aCBjb25uZWN0ZWQgaGRtaSkKLXN0aWxsIGJsYWNrIHNjcmVlbiBhdCBzNCBi
b290ICh3aXRoIGNvbm5lY3RlZCBoZG1pKSAgIAotYnJlYWtzIGJvb3Qtc3BsYXNoIGZvciBtZSBv
biBvdGhlciBwbGF0Zm9ybXMgKGFsbHdpbm5lciwgcm9ja2NoaXApCgptYXliZSBzNCBkcm0gc2Vy
aWVzIGknbSB1c2luZyBpcyBub3QgcmVhZHkgZm9yIDYuMTggY2hhbmdlIG9mIGZiZGV2IGZyYW1l
d29yayB0byBEUk0/CiAgICAKPiBXaWFkb21vxZvEhyBuYXBpc2FuYSBwcnpleiBBbyBYdSA8YW8u
eHVAYW1sb2dpYy5jb20+IHcgZG5pdSAyMSBsaXMgMjAyNSwgbyBnb2R6LiAwMzo1NToKPiAKPiBI
aSBQaW90cu+8jAo+IAo+ICAgICBJIHdpbGwgY2hlY2sgdGhpcyBpc3N1ZQo+IAo+IOWcqCAyMDI1
LzExLzE5IDE4OjI3LCBQaW90ciBPbmlzemN6dWsg5YaZ6YGTOgo+PiBbWW91IGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIHBpb3RyLm9uaXN6Y3p1a0BnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlz
IGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQo+PiAKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+IAo+PiBQbHMgc2VlIGlubGluZQo+
PiAKPj4+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFt
bG9naWMuY29tPiB3IGRuaXUgMTkgbGlzIDIwMjUsIG8gZ29kei4gMDM6NTc6Cj4+PiAKPj4+IEhp
IFBpb3RyLAo+Pj4gCj4+PiAKPj4+IE9uIDExLzE4LzIwMjUgMTA6NTAgUE0sIFBpb3RyIE9uaXN6
Y3p1ayB3cm90ZToKPj4+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHBpb3RyLm9u
aXN6Y3p1a0BnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+IEFvLAo+Pj4+IElzIHRoZXJlIGFueSBjaGFuY2UgdG8gZ2V0IHRoaXMgczQg
ZHJtIGhkbWkgc2VyaWVzIGZvciBjdXJyZW50IDYuMTg/Cj4+Pj4gKGkgdHJpZWQgYmFja3BvcnQg
dGhpcyBzZXJpZXMgdG8gNi4xOCBidXQgaGF2ZSBzb21lIGlzc3VlcyB3aXRoIHJlcGFyZW50IHZw
dV8wX3NlbCB0byBzeXNjbGtfYl9zZWwpCj4+PiBXaHkgZG8gd2UgbmVlZCB0byByZXBhcmVudCB2
cHVfMF9zZWwgdG8gc3lzY2xrX2Jfc2VsPyBpcyB0aGVyZSBhbnkKPj4+IGJhY2tncm91bmQgaGVy
ZT8KPj4gV2VsbCAtIGl0IGxvb2tzIGl0IGlzIGJlY2F1c2UgYnVnLi4uLgo+PiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIGhhZCBwZXJmZWN0IGV5ZSBhbmQgY2F0Y2ggdHlwbyBpbiBwYXRjaCBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTAtZHJtLXM0LXYxLTExLWNiYzJkNWVkYWFlOEBh
bWxvZ2ljLmNvbS86Cj4+IAo+PiBCeSByZXBsYWNpbmc6Cj4+IGFzc2lnbmVkLWNsb2NrLXBhcmVu
dHMgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9GQ0xLX0RJVjM+LAo+PiA8MD4sIC8qIERvIE5vdGhp
bmcgKi8KPj4gPCZjbGtjX3BlcmlwaHMgQ0xLSURfVlBVXzA+LAo+PiA8JmNsa2NfcGVyaXBocyBD
TEtJRF9GQ0xLX0RJVjQ+LAo+PiA8MD4sIC8qIERvIE5vdGhpbmcgKi8KPj4gPCZjbGtjX3Blcmlw
aHMgQ0xLSURfVkFQQl8wPjsKPj4gCj4+IHdpdGg6Cj4+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMg
PSA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElWMz4sCj4+IDwwPiwgLyogRG8gTm90aGluZyAqLwo+
PiA8JmNsa2NfcGVyaXBocyBDTEtJRF9WUFVfMD4sCj4+IDwmY2xrY19wbGwgQ0xLSURfRkNMS19E
SVY0PiwKPj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4+IDwmY2xrY19wZXJpcGhzIENMS0lEX1ZB
UEJfMD47Cj4+IAo+PiBkbWVzZyBpcyBsaWtlIHRoaXMgaHR0cHM6Ly90ZXJtYmluLmNvbS82MDIw
Cj4+IAo+PiBTbyBpJ20gZ2V0dGluZyBoZG1pIHdvcmtpbmcgLSBidXQgb25seSB3aGVuIGRldmlj
ZSBib290cyBfd2l0aG91dF8gY29ubmVjdGVkIGhkbWkgYXQgYm9vdCAoYW5kIGNvbm5lY3RlZCBs
YXRlcikKPj4gSWYgaGRtaSBpcyBjb25uZWN0ZWQgYXQgYm9vdCAtIGJvb3QgaGFuZ3MgYXQ6Cj4+
IAo+PiAgICAgMC4zNDE2NzZdIG1lc29uLWR3LWhkbWkgZmUzMDAwMDAuaGRtaS10eDogRGV0ZWN0
ZWQgSERNSSBUWCBjb250cm9sbGVyIHYyLjAxYSB3aXRoIEhEQ1AgKG1lc29uX2R3X2hkbWlfcGh5
KQo+PiBbICAgIDAuMzQyNzUwXSBtZXNvbi1kdy1oZG1pIGZlMzAwMDAwLmhkbWktdHg6IHJlZ2lz
dGVyZWQgRGVzaWduV2FyZSBIRE1JIEkyQyBidXMgZHJpdmVyCj4+IFsgICAgMC4zNDM2NjBdIG1l
c29uLWRybSBmZjAwMDAwMC52cHU6IGJvdW5kIGZlMzAwMDAwLmhkbWktdHggKG9wcyBtZXNvbl9k
d19oZG1pX29wcykKPj4gWyAgICAwLjM0NDgzMl0gW2RybV0gSW5pdGlhbGl6ZWQgbWVzb24gMS4w
LjAgZm9yIGZmMDAwMDAwLnZwdSBvbiBtaW5vciAwCj4+IAo+PiBGWUk6IEl0IGlzIGFmdGVyIGFw
cGx5aW5nIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hbWxvZ2lj
L2NvdmVyLzIwMjUwMTEwLWRybS1zNC12MS0wLWNiYzJkNWVkYWFlOEBhbWxvZ2ljLmNvbS8gb24g
bWFpbmxpbmUgNi4xOCAod2l0aCBzb21lIG15IGFkanVzdG1lbnRzIG9uIHRoaXMgc2VyaWVzIHJl
cXVpcmVkIGJ5IGNoYW5nZXMgaW4gNi4xOCkuCj4+IEZvciBWUFUgY2xrIGNoYW5nZXMgc2VlIGh0
dHBzOi8vZ2l0aHViLmNvbS93YXJwbWUvbWluaW15dGgyL2Jsb2IvbWFzdGVyL3NjcmlwdC9rZXJu
ZWwvbGludXgtNi4xOC9maWxlcy8wMzEyLWRybS1tZXNvbi1hZGQtdnB1LWNsay1zZXR0aW5nLWZv
ci1TNC5wYXRjaAo+PiBJdCBpcyA2LjE4IGFkYXB0YXRpb24gb2YgaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvcGF0Y2gvMjAyNTAxMTAtZHJtLXM0LXYx
LTktY2JjMmQ1ZWRhYWU4QGFtbG9naWMuY29tLwo+PiAKPj4gQXMga2VybmVsIGhhbmdzIC0gaSBo
YXZlIGxpbWl0ZWQgY2FwcyB0byBkcmlsbCB3aGVyZSByb290IGNhdXNlIGlzLgo+PiAKPj4gTWF5
YmUgYWJvdmUgaGFuZyBpcyByZWFzb24gb2YgbXkgYmFja3BvcnRzIG9yIG1pc3NpbmcgYW55IHBy
ZS1yZXEgcmVxdWlyZWQgdG8gZ2V0IHM0IGRybSB3b3JraW5nPwo+PiBBbnl3YXkgLSBpdCB3aWxs
IGJlIGdvb2QgdG8gdGVzdCB3aXRoIHVwZGF0ZWQgdG8gNi4xOCBzZXJpZXMgb2YgQWRkIERSTSBz
dXBwb3J0IGZvciBBbWxvZ2ljIFM0IChwbHVzIGluZm8gYWJvdXQgYW55IHByZS1yZXEgcmVxdWly
ZWQgdG8gZ2V0IHM0IGRybSB3b3JraW5nKQo+PiAKPj4gCj4+PiBUaGUgdnB1X2NsayBvbiBTNCBk
b2Vzbid0IHN1cHBvcnQgc3lzY2xrX2Jfc2VsIGFzIG9uZSBvZiBpdHMKPj4+IHNlbGVjdGFibGUg
Y2xvY2sgc291cmNlcywgc28gdGhpcyByZXBhcmVudCBvcGVyYXRpb24gd2lsbCBkZWZpbml0ZWx5
Cj4+PiBmYWlsLiBUaGlzIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGtlcm5lbCB2ZXJzaW9u
Lgo+Pj4gCj4+Pj4+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEFvIFh1IHZpYSBCNCBSZWxh
eSA8ZGV2bnVsbCthby54dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3IGRuaXUgMTAgc3R5IDIw
MjUsIG8gZ29kei4gMDY6Mzk6Cj4+Pj4+IAo+Pj4+PiBGcm9tOiBBbyBYdSA8YW8ueHVAYW1sb2dp
Yy5jb20+Cj4+Pj4+IAo+Pj4+PiBBZGQgZGV2aWNldHJlZSBkb2N1bWVudCBmb3IgUzQgSERNSSBj
b250cm9sbGVyCj4+Pj4+IAo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbyBYdSA8YW8ueHVAYW1sb2dp
Yy5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbCB8IDEgKwo+Pj4+PiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pj4gCj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVz
b24tZHctaGRtaS55YW1sCj4+Pj4+IGluZGV4IDg0ZDY4YjhjZmNjYzg2ZmQ4N2E2YTBmZDJiNzBh
ZjEyZTUxZWI4YTQuLjZlMGE4MzY5ZWVlOTE1ZmFiNTVhZjI0ZDQ1MGE2YzQwZTA4ZGVmMzggMTAw
NjQ0Cj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4+Pj4+
IEBAIC01NSw2ICs1NSw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4+ICAgICAgICAgICAtIGNvbnN0OiBh
bWxvZ2ljLG1lc29uLWd4LWR3LWhkbWkKPj4+Pj4gICAgICAgLSBlbnVtOgo+Pj4+PiAgICAgICAg
ICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHctaGRtaSAjIEcxMkEgKFM5MDVYMiwgUzkwNVkyLCBT
OTA1RDIpCj4+Pj4+ICsgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LWR3LWhkbWkgIyBTNCAo
UzkwNVk0KQo+Pj4+PiAKPj4+Pj4gICByZWc6Cj4+Pj4+ICAgICBtYXhJdGVtczogMQo+Pj4+PiAK
Pj4+Pj4gLS0KPj4+Pj4gMi40My4wCj4+Pj4+IAo+Pj4+PiAKPj4+Pj4gCj4+Pj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IGxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0Cj4+Pj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
Pj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
