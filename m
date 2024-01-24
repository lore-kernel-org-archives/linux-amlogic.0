Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BEFC46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFYQGE7qCsDzqpX5fy2GwBhkhjbEHYZCX32PyRM4Bj4=; b=Z5XD+S8S1Iqhi1
	lPntdzWesTdqMXg8nkEmCuOpCx009bA4/nVPRVRRuypdamklzMhKBCl8wx40As3gMdnArXwjl69ET
	kC/dcQvuFRNdI01zajg+335TgvnS+9K9EMJfvqUotfzb/OEOFzqvtAYYhWTkOtJgvZibo3pTSitU+
	d7mBZzywdzk8iFBZiMZgJJh1Mcv8iFWr2ah8BVaxjv4aL/GcXM9UssCNB5tuiWWsYUAlkBk+ZaSe2
	QkwCde2Wfrmg+SD4CllNTleJslw7CvDOELxfcLzTOWosgehc/pkreEHFQeRw9jOGiiixDou3wHydH
	8LsIiolMD+zZeqs4v5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZMa-002A1A-1G;
	Wed, 24 Jan 2024 09:16:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZMW-0029zR-05
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:16:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so4773100f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jan 2024 01:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706087758; x=1706692558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbeFWfMqBmXODESAwukrIPoFDrHKEc0uZI5I1dvJGsU=;
        b=MkcNCnaXVFDCa9OCQrfYAqios3GgGkDL4Yw5U4HkTGCQaZd9rLWzhPv6FX9Nqbw7WI
         m+sZ9P5/mnBpbCkO66cy7xcSdkvkoZw11IlQSQJdiXlGS9lXBjwRURC8XPua4Ski6EDj
         2/vkmSVBY3ZrT0O/P5ddg7pF3ilr+ZNrBPvjIhNlbggmIvyiFgFzSg7eohN5zlqHnyBW
         dIgOdk5ZrUFwTAh56YZeXRtPrezTM/ZMyFqAXNGqcYua0rPR4HGkhQ+DJ5PRUfMZnuCV
         UdDS5FVrWTyAm16l0FwWwpTp/p8mm9N3xITpEROXi7isZSz/a2cn47ytx3J8WSMx/8ES
         PL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087758; x=1706692558;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZbeFWfMqBmXODESAwukrIPoFDrHKEc0uZI5I1dvJGsU=;
        b=p0ZWeRf2+ki1XwnSPnaIxFzXHSt1TrBGdkaIilrTuUSrf56j8xquyB7//mu4HBDduI
         r2IoJsXyoIY4oZCEvx7uhqdSx2Ni6dK5K043qmc0z2c1Y/CzlgkzBLmisLmObIEk4sUK
         fqBn1JAJOyyJcQC7gbbdC2ebrsd0n9f8A/w0nUGJr2D106JC6y6lj9qKGtsZsUIm7PXg
         gNVcl9RnK+YFUsHonyozv4+8LDPxi5puaoXBn+8JeumZKh/iJIkZHEY842vDXqv4hZif
         B3mo0eZFrNtt0+xVXyRNMbc5BfeyIp1WPMrrh8/SFMQ0H80NWHSw4CwL806RTSImyXuV
         x9Bg==
X-Gm-Message-State: AOJu0YzLgE4cdFNorQjk3JXVontnLUTdmODBwWB/17ESl1WENGd5ZtTw
	RMDt7v+FunY0Nvs0TEe2J8tBLjNhm08HXF3MtihAGnZwOAVaYC/VO+P/oJECEV8=
X-Google-Smtp-Source: AGHT+IEJA4fLxUIPUgV1CoOiF3Njgm57gU/G+2p6y1b7sd2MIpW1H3YSpsDs25CgqLP01So5oXJUjw==
X-Received: by 2002:a5d:554c:0:b0:337:c527:ad54 with SMTP id g12-20020a5d554c000000b00337c527ad54mr337926wrw.77.1706087758478;
        Wed, 24 Jan 2024 01:15:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d8b6:17b6:386f:c67b])
        by smtp.gmail.com with ESMTPSA id g18-20020adff3d2000000b00337f722e5ccsm13609525wrp.65.2024.01.24.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 01:15:58 -0800 (PST)
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-4-jbrunet@baylibre.com>
 <4kcbh4dezgpic2dpgdi2swtx2puqiq74w2tungmxipf4nznpn7@u4g4f3cimps4>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 3/6] pwm: meson: generalize 4 inputs clock on meson8
 pwm type
Date: Wed, 24 Jan 2024 10:11:59 +0100
In-reply-to: <4kcbh4dezgpic2dpgdi2swtx2puqiq74w2tungmxipf4nznpn7@u4g4f3cimps4>
Message-ID: <1jy1cfw0qa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_011600_068562_37BC8FFB 
X-CRM114-Status: GOOD (  16.32  )
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

Ck9uIFdlZCAyNCBKYW4gMjAyNCBhdCAxMDowOCwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gSGVsbG8gSmVyb21lLAo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MTY6
NTFQTSArMDEwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gTWVzb244IHB3bSB0eXBlIGFsd2F5
cyBoYXMgNCBpbnB1dCBjbG9ja3MuIFNvbWUgaW5wdXRzIG1heSBiZSBncm91bmRlZCwKPj4gbGlr
ZSBpbiB0aGUgQU8gZG9tYWluIG9mIHNvbWUgU29Dcy4KPj4gCj4+IERyb3AgdGhlIHBhcmVudCBu
dW1iZXIgcGFyYW1ldGVyIGFuZCBtYWtlIHRoaXMgaXMgY29uc3RhbnQuCj4+IFRoaXMgaXMgYWxz
byBkb25lIHRvIG1ha2UgYWRkaXRpb24gb2YgZ2VuZXJpYyBtZXNvbjggY29tcGF0aWJsZSBlYXNp
ZXIuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJl
LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDE5ICsrKysrKy0tLS0t
LS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVy
cy9wd20vcHdtLW1lc29uLmMKPj4gaW5kZXggMjk3MWJiZjNiNWU3Li5lZjUwYzMzN2Y0NDQgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+ICsrKyBiL2RyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jCj4+IEBAIC02MCw3ICs2MCw3IEBACj4+ICAjZGVmaW5lIE1JU0NfQV9FTgkJ
QklUKDApCj4+ICAKPj4gICNkZWZpbmUgTUVTT05fTlVNX1BXTVMJCTIKPj4gLSNkZWZpbmUgTUVT
T05fTUFYX01VWF9QQVJFTlRTCTQKPj4gKyNkZWZpbmUgTUVTT05fTlVNX01VWF9QQVJFTlRTCTQK
Pj4gIAo+PiAgc3RhdGljIHN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbF9kYXRhIHsKPj4gIAl1OAkJ
cmVnX29mZnNldDsKPj4gQEAgLTk4LDcgKzk4LDYgQEAgc3RydWN0IG1lc29uX3B3bV9jaGFubmVs
IHsKPj4gIAo+PiAgc3RydWN0IG1lc29uX3B3bV9kYXRhIHsKPj4gIAljb25zdCBjaGFyICogY29u
c3QgKnBhcmVudF9uYW1lczsKPgo+IEkgc3VnZ2VzdCB0byBtYWtlIHRoaXMKPgo+IAljb25zdCBj
aGFyICpwYXJlbnRfbmFtZXNbTUVTT05fTlVNX01VWF9QQVJFTlRTXTsKCk9rLgoKPgo+IHRvIG1h
a2UgaXQgbW9yZSBleHBsaWNpdCB0aGF0IHJlYWxseSBmb3VyIGVudHJpZXMgYXJlIG5lZWRlZCBo
ZXJlLiBUaGlzCj4gYWxzbyBtYWtlcyBpcyB1bm5lY2Vzc2FyeSB0byBhZGQgdGhlIGFkZGl0aW9u
YWwgTlVMTCBlbnRyaWVzIHRvCj4gcHdtX2d4YmJfYW9fcGFyZW50X25hbWVzIGFuZCB0aGUgb3Ro
ZXIgYXJyYXlzLgoKSSB3b3VsZCBub3JtYWxseSBhZ3JlZSBidXQgSSdkIHByZWZlciB0byBiZSBl
eHBsaWNpdC4KClRoZXJlIGFyZSBzb21lIGluc3RhbmNlIHdoZXJlIHRoZSBOVUxMIGlzIGluIHRo
ZSBtaWRkbGUsIHRoaXMgY2FuJ3QgZ28KYXdheS4gSSB0aGluayBpdCBsb29rcyBpZiBzb21lIGlu
cHV0cyBhcmUgZXhwbGljaXRseSBOVUxMIHdoaWxlIHRoZQpvdGhlciBhcmUgaW1wbGljaXQuCgpP
ZiBjb3Vyc2UsIGl0IGlzIGp1c3QgYSBwcmVmZXJlbmNlLiBJIGNhbiByZW1vdmUgdGhlc2UgaWYg
dGhhdCBpcwpib3RoZXJpbmcgeW91LgoKPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKCi0tIApKZXJv
bWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
