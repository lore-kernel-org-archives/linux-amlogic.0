Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E944CD128A
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2024 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKU2ZWBL8mliv3j0hYyIvSC9c3s/vjg3CdBxluSBq/E=; b=JsTEfTyl82cQOP
	BtKGYuS0sOLvZrQstKdKUhT4Ms5UtQpcflpPgdtkO8nwKe5v4lyub91LewAFnlllEnD9biV7RxxP8
	FmikION+iaedXHcLApmXhP+3HAWkD/u7rcYIa71FDCE6QWsonlrBFrg16176WjEQu3e3lPpiep9L7
	La9HjecDm9Imgclj7sRFoeK761Xr7ahUCHUnLEtzFNySItQt5uoT0erHcPwflZVDE+9uJ9bZkwIZI
	eY63tcxUMDR8bNsncyWZCfosc5iXYH/JZr7GU8qqDEN7U3Yu3UzDVJWRbrO6cT22f0xsAGpAb/Dcd
	bQlARNHhagH2hpZBU4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr2uj-00000006MFq-3qk3;
	Sun, 31 Mar 2024 21:40:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr2uh-00000006MFK-0USE;
	Sun, 31 Mar 2024 21:40:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1df01161b39so30676435ad.3;
        Sun, 31 Mar 2024 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711921225; x=1712526025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bOAMX8CDxRFe75wZuJ9Z2dq25ZmCynlaxMc7spfxAM=;
        b=RJ8qeP0le4xXdp711R9QiDgrDwIvImr0rIfd0u8nZ+WvxBBJsWRBqLiAQOlSAAJWqH
         eMlSTI2MBqCOw+7jRquhTsHnkbVvhouHz7+tRLfT93M3TcrrMETd/U2n/WgVIv7eS9ZW
         tvnaYwarU+l+d1GcHRqCFkgWUiIVeiyaHDjvBcRdUk4V2YsMVIdycVDByCl9ZRYuUyl8
         tkE8Op/HRsjpdIn2vWmOpf19oB9GjKR62wTHr+/39Bt+AeXmkBRHe5zVotz6SwDP/iNX
         1jTHkhu1Xiouy64QINI/vFCYLSnThHiD72zyw4fYJo+8bv7eMXgZLonqohOYJ0ALWR41
         4Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711921225; x=1712526025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bOAMX8CDxRFe75wZuJ9Z2dq25ZmCynlaxMc7spfxAM=;
        b=NsDUWpAtEkQyCXMSu3AQpL1Rmg5J54AqPB3o9dWcXW2pik5k66ONYyZa14uTbU2y+i
         lNC/YA3AtLhieQoIqzbQdQ1/bax0wf6hXZKGy4xk7EkrkClQ5xARB1OiHpdgDVGSkh15
         M12F6tTgP4QAU//SNffNHzJFZBk+7RWkTuWJtuejQX3/0wa2kdFDuNlkPAVIdRo2wNmP
         RkiqopVUmcljdGHU6FE6GGt/G3i7Q4wUEUP3EIn039wJ10k1sJnvjJWF8Doaqcjz6ndi
         +woMscWtJdQ4OWBt63FYQ64IuffEHiNichZKCSer0pnqjPdFj0bzL5c8Mw4rmc+D1Qai
         2N3g==
X-Forwarded-Encrypted: i=1; AJvYcCXvrQ/0yXoT8zpiBrDM5LDyZ9ao6MhoRxUxvF4DoOkMrcFI66TyWy3JhOo9oB1N0GoRKT4wmN8hw7G3RUMD2CkgsxeSE1MRG8BNh9/XgVdDaV6RULBkPTBIqQmeEEFQgwOOHl7UOy5HgohlKjnDKl0GcY6b0m5M9g==
X-Gm-Message-State: AOJu0Yxxhw3a3a+rqQlrhr/gsTzSi/UNrLJCNT+h0UqkYnb3yyrTbSiM
	jSwik0sMagr284oH/ypXeIwzEEdV2bfF7h1pbxPBLTE90NrGpSCQ3mpKE7DA10EBdL4O/vC9xf+
	4VNQio8m4WMerXw1fg5xw8Ot0u14=
X-Google-Smtp-Source: AGHT+IFiqj4SbYwzxlpmSNvPFU6oA3OXhWytg+jzKWNJs6wKOMo0mOw5iOQRrId8XNfTznU7DImuvdgTgbvN4vcPI8c=
X-Received: by 2002:a17:903:94b:b0:1e2:3719:43f5 with SMTP id
 ma11-20020a170903094b00b001e2371943f5mr9219842plb.14.1711921224652; Sun, 31
 Mar 2024 14:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240329205904.25002-1-ddrokosov@salutedevices.com> <20240329205904.25002-7-ddrokosov@salutedevices.com>
In-Reply-To: <20240329205904.25002-7-ddrokosov@salutedevices.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 31 Mar 2024 23:40:13 +0200
Message-ID: <CAFBinCCC5KK-4_w41B-+ZJ3zdZckq_EDuAW+Kak2C0Ow8uuD6Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, kernel@salutedevices.com, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_144027_186280_9388AA15 
X-CRM114-Status: GOOD (  12.07  )
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

SGkgRG1pdHJ5LAoKT24gRnJpLCBNYXIgMjksIDIwMjQgYXQgOTo1OeKAr1BNIERtaXRyeSBSb2tv
c292CjxkZHJva29zb3ZAc2FsdXRlZGV2aWNlcy5jb20+IHdyb3RlOgpbLi4uXQo+ICtzdGF0aWMg
c3RydWN0IGNsa19yZWdtYXAgY3B1X2ZjbGsgPSB7Cj4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0
IGNsa19yZWdtYXBfbXV4X2RhdGEpIHsKPiArICAgICAgICAgICAgICAgLm9mZnNldCA9IENQVUNU
UkxfQ0xLX0NUUkwwLAo+ICsgICAgICAgICAgICAgICAubWFzayA9IDB4MSwKPiArICAgICAgICAg
ICAgICAgLnNoaWZ0ID0gMTAsCj4gKyAgICAgICB9LAo+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0
cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gImNwdV9mY2xr
IiwKPiArICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9vcHMsCj4gKyAgICAg
ICAgICAgICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgJmNwdV9mc2VsMC5odywKPiArICAgICAgICAgICAgICAgICAg
ICAgICAmY3B1X2ZzZWwxLmh3LApIYXZlIHlvdSBjb25zaWRlcmVkIHRoZSBDTEtfU0VUX1JBVEVf
R0FURSBmbGFnIGZvciAmY3B1X2ZzZWwwLmh3IGFuZAomY3B1X2ZzZWwxLmh3IGFuZCB0aGVuIGRy
b3BwaW5nIHRoZSBjbG9jayBub3RpZmllciBiZWxvdz8KV2UgdXNlIHRoYXQgYXBwcm9hY2ggd2l0
aCB0aGUgTWFsaSBHUFUgY2xvY2sgb24gb3RoZXIgU29Dcywgc2VlIGZvcgpleGFtcGxlIGNvbW1p
dCA4ZGFlYWVhOTljYWEgKCJjbGs6IG1lc29uOiBtZXNvbjhiOiBtYWtlIHRoZSBDQ0YgdXNlCnRo
ZSBnbGl0Y2gtZnJlZSBtYWxpIG11eCIpLgpJdCBtYXkgZGlmZmVyIGZyb20gd2hhdCBBbWxvZ2lj
IGRvZXMgaW4gdGhlaXIgQlNQLCBidXQgSSBkb24ndCB0aGluawp0aGF0IHRoZXJlJ3MgYW55IGhh
cm0gKGlmIGl0IHdvcmtzIGluIGdlbmVyYWwpIGJlY2F1c2UgQ0NGIChjb21tb24KY2xvY2sgZnJh
bWV3b3JrKSB3aWxsIHNldCBhbGwgY2xvY2tzIGluIHRoZSAiaW5hY3RpdmUiIHRyZWUgYW5kIHRo
ZW4KYXMgYSBsYXN0IHN0ZXAganVzdCBjaGFuZ2UgdGhlIG11eCAoJmNwdV9mY2xrLmh3KS4gU28g
YXQgbm8gcG9pbnQgaW4KdGltZSB3aWxsIHdlIGdldCBhbnkgb3RoZXIgcmF0ZSB0aGFuIGEpIHRo
ZSBvcmlnaW5hbCBDUFUgY2xvY2sgcmF0ZQpiZWZvcmUgdGhlIHJhdGUgY2hhbmdlIGIpIHRoZSBu
ZXcgZGVzaXJlZCBDUFUgY2xvY2sgcmF0ZS4gVGhpcyBpcwpiZWNhdXNlIHdlIGhhdmUgdHdvIHN5
bW1ldHJpYyBjbG9jayB0cmVlcy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
