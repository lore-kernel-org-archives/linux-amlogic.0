Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33321CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Sep 2025 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/3auyiqt+NB/p6WUrNcD5z8G/Z7ILoHXpIlIvugJtA=; b=Vs7OKOPwMf1fSD
	1CH3H4bGf06AYWBeV4S4qOGUfR7eU7DEVwem3uYEqnT4H1BB3WWFl+y+kRz49mVWtCMUYvc18Mzb6
	71hofp8DEl+Rxu9VQpem5kXPFS7jP6/4DohbsquF8tNKea+p2/HbKbF+8CucRjBH0nto+gWOlWWh/
	T3TMzYsEGPlDD4ossQxYS3Znv+WZL2clkAlFjyFegXGjkvaxI6geW9vdDw34cL/L2jBTSNmT/VTbW
	Fne6hSJpYxvSvZ4bmhSHILP9ndbppjN3Kp0GdE5PVv8AX/+UATErEwd/qPc9yKlZtJ+kT8YdXWusJ
	iontyBAPB3lmMya4DRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39YO-00000001p8r-1vFF;
	Mon, 29 Sep 2025 08:48:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39YG-00000001p7W-3ttK
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Sep 2025 08:48:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3f2ae6fae12so2445743f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Sep 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759135687; x=1759740487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=dbebMIcSL4//frQhU7+YJUvS4DLWrMKLXbmiyAeZVp+CvoBDv9lYDLvYnQoMe4kVJW
         BxAezBHlNlbbeIrLrO4XX/gctSnexsNzyjqZQchvAnNwGlDjXbHfC75VMACgM5toUUYp
         V9iB8dDhxXc4vgTBkDBTwoyUhI93cVuL5+SRR4zkoXv2UJZQkSNLWx/YjcL0QWnfFDvt
         JoTuxIX/zv0eWC8o53LhC/0MI9yD+UlPZJt/rCBczDinYFGlKuQt9nMeYBURr3DiQbTG
         FCJzpiLKN5q7NzQeORWQG+EZkeVW9BK8KvQpeXTUJViCZwxgnlzHVvyzNwDZc/zisrWE
         SaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135687; x=1759740487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=aHER+DP0rXbYql7teircmz1JiXkifn6v7JoOjQfHhY0hBv84RFKV1AL4jZjHgLTvow
         PumyqzyS+J+n6etydyT0IwDeY6lvtxTaOwIVHtv1iNvbu6vc39QMAK/NPac9j+/syXdn
         P3h0cdJ2Gh8cO85ZaWihpmejktkpafTRcNX7yxZ0w2HUemx6C4F9ZW3UdSAnwpZNazUh
         DkwNAa0ZbXPzUCynwSKNDwdMQnF7BqUHLV4qBiW21J3Qzr1WSFdLqJIMV1tDjVX7vuzI
         231S/8aEDZUMVr5T6i8G5UY47FQlEGW10ZAaniBk39V+KqNKFmo+4ZgdBEKIb8Oybz7v
         oWog==
X-Forwarded-Encrypted: i=1; AJvYcCVDX22lMzDlUchpOPi2ysmoPOq8Iy737CckKjwd/N6wxBlnz21U4NbqZrf2YBE5ZOdo2dFjqLUXv9EyfCAr@lists.infradead.org
X-Gm-Message-State: AOJu0YyH/2X0BXP2n6AYjomhdv/OqRDVqyI1g393S/D2wRsWtZHB1pUR
	/qzGR3tzRU00quRMN50kFqlEKpJJaf2rSROulQFUP+NwhKUyrJrZwZJHk3mCPl/LSPg=
X-Gm-Gg: ASbGncsV9MjgiCdTRu65PdETugLJ8cnaiOipkLXzNJEeUw/wsuKDcHnhkP9Teb6Fogz
	Sm1DSe38B8aYvmsne6b/Xg7aB8u9dQF3j7D4W7qedNAmTrNdHUzlcctZ42aLDhHhixemYOzbg+W
	DIMC8kXcb6ny8alwxqHcrM1EspHVzu8ajOgarznbzncL02dYcbobIBNmt/ARnxhcltZqWxL8sUs
	y7T2HA6erl/Cs7NE0J2wQZ1uUD040kbcNGJBVmi2oZuIu4ok33mphb/ycR/63+2LgAgfAxyb7PJ
	aYVrafVlK/f3GZ6fQebbHxURc0HXuiGo2FiWqXIzBRLTd8BldR3wd7HE6XH0sRChINMzmVYug/X
	IYwG+ssn7fRQaWJ++XwnnD0LXmvQghhiN
X-Google-Smtp-Source: AGHT+IEuJjQ2ywEf1FmcgUiPlzRMP7EQ4wv/Yzx58fshvg0ascmwTL+/3T4ksUZ0TgAGJ3QGBI0S5Q==
X-Received: by 2002:a05:6000:2586:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-40e498b77bfmr13575306f8f.12.1759135686798;
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9891:6c55:82b6:bfe9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb7203b8asm17522265f8f.9.2025.09.29.01.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 28 Sep 2025 22:55:50 +0200")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 10:48:05 +0200
Message-ID: <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_014808_985097_45E07337 
X-CRM114-Status: GOOD (  28.16  )
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

T24gU3VuIDI4IFNlcCAyMDI1IGF0IDIyOjU1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBPbiBTdW4s
IFNlcCAyOCwgMjAyNSBhdCA4OjQx4oCvQU0gQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5j
b20+IHdyb3RlOgo+Pgo+Pgo+PiBPbiA5LzI4LzIwMjUgMjowNSBQTSwgQ2h1YW4gTGl1IHdyb3Rl
Ogo+PiA+IEhpIEplcm9tZSAmIE1hcnRpbjoKPj4gPgo+PiA+IFNvcnJ5IGZvciB0aGUgaW1wcmVj
aXNlIGRlc2NyaXB0aW9uIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXggZWFybGllci4KPj4gPgo+PiA+
IFJlY2VudGx5LCB3aGlsZSB0cm91Ymxlc2hvb3RpbmcgYSBDUFUgaGFuZyBpc3N1ZSBjYXVzZWQg
YnkgZ2xpdGNoZXMsCj4+ID4gSSByZWFsaXplZCB0aGVyZSB3YXMgYSBkaXNjcmVwYW5jeSBmcm9t
IG91ciBwcmV2aW91cyB1bmRlcnN0YW5kaW5nLAo+PiA+IHNvIEknZCBsaWtlIHRvIGNsYXJpZnkg
aXQgaGVyZS4KPiBbLi4uXQo+PiBBbiBleGFtcGxlIG9mIHRoZSBjbG9jayB3YXZlZm9ybSBpcyBz
aG93biBiZWxvdzoKPj4KPj4KICAgICAgICAgICAgICAgICAgICAgMSAgICAgICAgICAgICAgICAg
IDIKICAgICAgICAgICAgICAgICAgICAgdiAgICAgICAgICAgICAgICAgIHYKPj4gICAgICAgICBf
XyAgICBfXyAgICBfXyAgICBfXyAgICBfXyAgICBfXyAgICBfXyAgICBfXwo+PiBvcmk6ICDihpEg
IHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAg
fF9f4oaRCj4+ICAgICAgICAgICAgICAgICAgICBeCj4+ICAgICAgICAgICAgICAgICAgICAxICog
Y3ljbGUgb3JpZ2luYWwgY2hhbm5lbC4KPj4gICAgICAgICBfICAgXyAgIF8gICBfICAgXyAgIF8g
ICBfICAgXyAgIF8gICBfICAgXyAgIF8KPj4gbmV3OiAg4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf
4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgNSAqIGN5Y2xlcyBuZXcgY2hhbm5lbC4KPj4gICAgICAg
ICBfXyAgICBfXyAgICAgICAgICAgICAgICAgICAgICAgIF8gICBfICAgXyAgIF8KPj4gb3V0OiAg
4oaRICB8X1/ihpEgIHxfX19fX19fX19fX19fX19fX19fX19f4oaRIHxf4oaRIHxf4oaRIHxf4oaR
IHxf4oaRCj4+ICAgICAgICAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gICAg
ICAgICAgICAgICBzdGFydCBzd2l0Y2hpbmcgbXV4LiAgICAgc3dpdGNoIHRvIG5ldyBjaGFubmVs
LgoKT2sgLi4uIGJ1dCB3aGVuIGlzIGl0IHNhZmUgdG8gZGlzYWJsZSB0aGUgIm9yaSIgY2xvY2sg
PwpDYW4geW91IGRvIGl0IGF0ICcxJyBhbHJlYWR5ID8gb3IgZG8geW91IGhhdmUgdG8gd2FpdCBm
b3IgJzInID8KCgo+IFRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIHJlcG9ydCEKPiBUaGlzIGlz
IGluZGVlZCBwcm9ibGVtYXRpYyBiZWhhdmlvci4gSSBndWVzcyB0aGUgcmVzdWx0IGlzIHNvbWV3
aGF0Cj4gcmFuZG9tOiBkZXBlbmRpbmcgb24gbG9hZCAocG93ZXIgZHJhdyksIHNpbGljb24gbG90
dGVyeSAocXVhbGl0eSksCj4gdGVtcGVyYXR1cmUsIHZvbHRhZ2Ugc3VwcGx5LCAuLi4gLSBvbmUg
bWF5IG9yIG1heSBub3Qgc2VlIGNyYXNoZXMKPiBjYXVzZWQgYnkgdGhpcy4KPgo+IEJhc2VkIG9u
IHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWMsIG15IHN1Z2dlc3Rpb24gaXMg
dG8KPiBzcGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2g6Cj4gLSBvbmUgdG8gYWRkIENMS19TRVRfUkFU
RV9HQVRFIHdoZXJlIG5lZWRlZCAoSSB0aGluayB0aGUgbWVzb244Yi5jCj4gZHJpdmVyIGFscmVh
ZHkgaGFzIHRoaXMgd2hlcmUgbmVlZGVkKSB0byBhY3R1YWxseSBlbmFibGUgdGhlCj4gZ2xpdGNo
LWZyZWUgbXV4IGJlaGF2aW9yCj4gLSBhbm90aGVyIG9uZSB3aXRoIHRoZSBDTEtfT1BTX1BBUkVO
VF9FTkFCTEUgY2hhbmdlIChtZXNvbjhiLmMgd291bGQKPiBhbHNvIG5lZWQgdG8gYmUgdXBkYXRl
ZCkgdG8gcHJldmVudCB0aGUgZ2xpdGNoLWZyZWUgbXV4IGZyb20KPiB0ZW1wb3JhcmlseSBvdXRw
dXR0aW5nIGFuIGVsZWN0cmljYWwgbG93IHNpZ25hbC4gSmVyb21lIGFsc28gYXNrZWQgdG8KPiBk
b2N1bWVudCB0aGUgYmVoYXZpb3Igc28gd2UgZG9uJ3QgZm9yZ2V0IHdoeSB3ZSBzZXQgdGhpcyBm
bGFnCgpZZXMgcGxlYXNlIHNwbGl0IHRoZSBjaGFuZ2VzIGFuZCB2aXNpdCBhbGwgdGhlIGNvbnRy
b2xsZXJzIHNoaXBwaW5nIHRoaXMKdHlwZSBvZiBtdXhlcy4KCj4KPiBCb3RoIHBhdGNoZXMgc2hv
dWxkIGdldCB0aGUgcHJvcGVyICJGaXhlcyIgdGFncy4KCi4uLiBhbmQgcHJvcGVyIGZpeGVzIHRh
ZyBtYXliZSBkaWZmZXJlbnQgZGVwZW5kaW5nIG9uIHRoZSBjb250cm9sbGVyIHNvCnRoZXJlIG1p
Z2h0IG1vcmUgdGhhdCBqdXN0IDIgY2hhbmdlcy4KCj4gSSB0aGluayBpdCB3b3VsZCBhbHNvIGJl
IGdyZWF0IGlmIHlvdSBjb3VsZCBpbmNsdWRlIHRoZSB3YXZlZm9ybQo+IGV4YW1wbGUgaW4gYXQg
bGVhc3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGl0IGhlbHBzIHVuZGVyc3RhbmQgdGhlCj4gcHJv
YmxlbS4KPgo+IExldCdzIGFsc28gZ2l2ZSBKZXJvbWUgc29tZSB0aW1lIHRvIGNvbW1lbnQgYmVm
b3JlIHlvdSBzZW5kIHBhdGNoZXMuCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCi0tIApK
ZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
