Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D26ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECwBkoz4ee5OR3XaHFEBratfmgqvFSOHRrPksCpp/VU=; b=fx6k9QCQIMOh26
	oT1rY2AYlVyiYHcm8nF9Fbicl/rpowOZknKJqp6396T8dmm27saOhh+T5vypvgGPPgKcOHs+CjtIa
	0DGb9m0uyKiry4DDpG5R0oP6aebJp+ifbUrRsYP7qbDzOD8vbqHEgfFHrDjfOIgmMh9avTZUB1W2R
	jv5gA0uh4q24exkUDY/mcNy8dpJ3LCvALJ8Jt+p2LIlwWYmIxcT0DN6LZ7IQdUOQ+SSsBoSAk1xDo
	mHMu59JY4gYh66PGxC6WxMGykyRTPCQR7UBccp9/3qT+TiVJVBGWwVNFcMUJCu84t/xw3w6eOnAbR
	AKNOmgP2+NZUAfGxKw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuuD-00ETQ0-8R; Tue, 30 Aug 2022 06:39:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSutx-00ETKq-JQ
	for linux-amlogic@lists.infradead.org; Tue, 30 Aug 2022 06:39:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id e20so12790962wri.13
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:from:to:cc;
        bh=mNuvuJblGgM9erVe7VcLK6pPLtsf0LmqJmZgGgV3TEY=;
        b=4JZcJU5Kk16NjSy/F4gIG+ZROwRDQaEaxk1TBxGeyVmhVZBBuI6MlZntdzUydskp0Y
         K2QLeLkibCJDa+iqJgONHz3Yp7okPWStEX6X/5KZddbDfK+ogKTKEomSOc//pbZKU23J
         8uoC5jijvaDy3zUtqNZBca90oR8FwjUXcnJwam1TiKWROB2VKLm5qsQEQQVTfCoyuOSo
         TB9WV0mEclmgLdHmsxiMyeSjoeoL/4wR2W6Tc4qo5E2oSQ91RoiQc7DSXCFs3KjxTG0O
         KPNWhSKWgMsvyl+JPG2BdMjDjlwa2ZbqCc4THp+M00xceZQUQOQSNS1b9CbV2R5lgNHH
         NtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
        bh=mNuvuJblGgM9erVe7VcLK6pPLtsf0LmqJmZgGgV3TEY=;
        b=wOKje5UavjBim2v1G3vvkWSvC6wCaF0t5Wo9kB4j9HL7g6ghGJ0erge5vVEDVrTGlX
         jrMVfpm1IjQCqdfAyt/nrZK+b8lBp2BB2Ik9/GtNmVBCSsp0SChWS3yaFO1s0pqlmQAG
         vGLlZLgFFDdRk9Mk9UdSIfaFF9Q3RzsS2SZ0bu6GvMopv/bNPnrFNHTBKPNw6uXwul3H
         E+vJIXZmsEAISp0tXKzknq21ZyUqGE3AN81+V/T664LOrkPy+fVYPNo814L3U6chj8ju
         utXlhieJmWaBl4p0U8bMDPSHOwg5i1q7+t6edGCMRLNhekKvBXPOUE8kwVH91oWoD+tz
         Vejg==
X-Gm-Message-State: ACgBeo1YqIxKgGepw+RLAOIMNW6mctYa0oLKRq+GsXlBAzoSUFfUzkiW
	HIOE67VT1o2z35lyVxoh+u2mog==
X-Google-Smtp-Source: AA6agR62NkzOlArUrEk7k7uj4nn6Sn+TSr+IpCcQazgLhmOgjmRiJzUtmuBSZR6cyJwtWRmU9owjjw==
X-Received: by 2002:adf:fa4e:0:b0:225:8616:be3a with SMTP id y14-20020adffa4e000000b002258616be3amr7730934wrr.234.1661841545776;
        Mon, 29 Aug 2022 23:39:05 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b003a83b066401sm10964211wms.31.2022.08.29.23.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 23:39:05 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
 <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
 <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
 <1j1qszv0wa.fsf@starbuckisacylon.baylibre.com>
 <72631035-58a6-23b5-1f7e-f1643b120432@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock
 controller in DT
Date: Tue, 30 Aug 2022 08:36:00 +0200
In-reply-to: <72631035-58a6-23b5-1f7e-f1643b120432@amlogic.com>
Message-ID: <1jy1v6z14n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_233909_882648_815C53C2 
X-CRM114-Status: GOOD (  19.38  )
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

Ck9uIFR1ZSAzMCBBdWcgMjAyMiBhdCAxNDowNSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gT24gMjAyMi84LzI5IDE3OjQzLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVY
VEVSTkFMIEVNQUlMIF0KPj4gT24gTW9uIDE1IEF1ZyAyMDIyIGF0IDE0OjE3LCBZdSBUdSA8eXUu
dHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+PiAKPj4+IEhpIEplcm9tZe+8jAo+Pj4KPj4+IE9uIDIw
MjIvOC8xMCAyMTozMiwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4+PiBPbiBGcmkgMDUgQXVnIDIwMjIgYXQgMTc6MzksIFl1IFR1IDx5dS50dUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4gSGkgS3J6eXN6dG9mLAo+Pj4+PiAgICAgICBUaGFuayB5
b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pj4+Cj4+Pj4+IE9uIDIwMjIvOC81IDE3OjE2LCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+PiBPbiAw
NS8wOC8yMDIyIDEwOjU3LCBZdSBUdSB3cm90ZToKPj4+Pj4+PiBBZGRlZCBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgUzQgU09DIFBMTCBDbG9jayBjb250cm9sbGVyIGluIERULgo+Pj4+Pj4+Cj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+ICAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDgg
KysrKysrKysKPj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4+
Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1zNC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4+
Pj4+PiBpbmRleCBmZjIxMzYxOGE1OTguLmE4MTZiMWY3Njk0YiAxMDA2NDQKPj4+Pj4+PiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+Pj4+Pj4+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+Pj4+Pj4gQEAgLTky
LDYgKzkyLDE0IEBAIGFwYjQ6IGFwYjRAZmUwMDAwMDAgewo+Pj4+Pj4+ICAgICAJCQkjc2l6ZS1j
ZWxscyA9IDwyPjsKPj4+Pj4+PiAgICAgCQkJcmFuZ2VzID0gPDB4MCAweDAgMHgwIDB4ZmUwMDAw
MDAgMHgwIDB4NDgwMDAwPjsKPj4+Pj4+PiAgICAgKwkJCWNsa2NfcGxsOiBwbGwtY2xvY2stY29u
dHJvbGxlckA4MDAwIHsKPj4+Pj4+IE5vZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMgLSBjbG9j
ay1jb250cm9sbGVyLgo+Pj4+Pj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2Vu
ZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlvbgo+Pj4+Pj4KPj4+Pj4gSSB3aWxsIGNoYW5nZSB0byBj
bGtjX3BsbDogY2xvY2stY29udHJvbGxlckA4MDAwLCBpbiBuZXh0IHZlcnNpb24uCj4+Pj4gU2Ft
ZSBjb21tZW50IGFwcGxpZXMgdG8gdGhlIGJpbmRpbmcgZG9jLgo+Pj4gT0theS4KPj4+PiBBbHNv
IGl0IHdvdWxkIGJlIG5pY2UgdG8gc3BsaXQgdGhpcyBpbiB0d28gc2VyaWVzLgo+Pj4+IEJpbmRp
bmdzIGFuZCBkcml2ZXJzIGluIG9uZSwgYXJtNjQgZHQgaW4gdGhlIG90aGVyLiBUaGVzZSBjaGFu
Z2VzIGdvZXMKPj4+PiBpbiB0aHJvdWdoIGRpZmZlcmVudCB0cmVlcy4KPj4+IEF0IHByZXNlbnQs
IEJpbmRpbmdzLCBEVFMgYW5kIGRyaXZlcnMgYXJlIHRocmVlIHNlcmllcy4gRG8geW91IG1lYW4g
dG8gcHV0Cj4+PiBCaW5kaW5ncyBhbmQgZHJpdmVycyB0b2dldGhlcj8gSWYgc28sIGNoZWNrcGF0
Y2gucGwgd2lsbCByZXBvcnQgYSB3YXJuaW5nLgo+PiBZZXMgYmVjYXVzZSBwYXRjaGVzIGFyZSBu
b3QgaW4geWV0IHNvIHRoZXJlIGlzIGEgZ29vZCByZWFzb24gdG8gaWdub3JlCj4+IHRoZSB3YXJu
aW5nLiBXYXJuaW5nIHdpbGwgbmV2ZXIgc2hvdyB1cCBvbiB0aGUgYWN0dWFsIHRyZWUgaWYgdGhl
Cj4+IHBhdGNoZXMgYXJlIGNvcnJlY3RseSBvcmRlcmVkLgo+Cj4gSSB0aGluayBCaW5kaW5nLCBE
VFMgYW5kIGRyaXZlcnMgdXNlIHRocmVlIHNlcmllcyBhbmQgeW91IHNhaWQgdHdvIHNlcmllcwo+
IGlzIG5vdCBhIGJpZyBwcm9ibGVtLiBUaHJlZSBzZXJpZXMgYXJlIHJlY29tbWVuZGVkIGZvciBj
aGVja3BhdGNoLnBsLCBJCj4gdGhpbmsgaXQgc2hvdWxkIGJlIGVhc3kgZm9yIHRoYXQgdG8gc2Vw
YXJhdGUgYW5kIG1lcmdl44CCCgpObyAtIFRoZXJlIGlzIG9ubHkgMiBzZXJpZXMuIDEgZm9yIHRo
ZSBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVycyBhbmQKb25lIGZvciB0aGUgRFQgb25jZSB0aGlu
Z3MgYXJlIGluCgo+Cj4gSSd2ZSBzZW50IGl0IHRvIFY0LiBQbGVhc2UgbG9vayBhdCBWNCBhbmQg
Z2l2ZSBzb21lIGNvbW1lbnRzLgo+CgpUaGF0J3Mgbm90IGhvdyBpdCB3b3Jrcy4gWW91IHNlbnQg
dGhhdCBiZWZvcmUgdjMgcmV2aWV3IHdhcyBkb25lLiBUaGVyZQphcmUgc3RpbGwgY29tbWVudHMg
dGhhdCBuZWVkZWQgdG8gYmUgYWRkcmVzc2VkCgpHaXZlbiB0aGUgdGltZSBpdCB0YWtlcyB0byBt
YWtlIHRoYXQgcmV2aWV3IEkgZ29pbmcgdG8gY29tcGxldGx5IHNraXAgdjQKYW5kIEknZCBsaWtl
IG9uIHRoZSBjb21tZW50IHRvIGFkZHJlc3NlZCBiZWZvcmUgeW91IHNlbmQgYW5vdGhlciB2ZXJz
aW9uCgoKPj4gCj4+Pgo+Pj4+Cj4+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+PiBLcnp5c3p0b2YK
Pj4+Pj4+IC4KPj4+PiAuCj4+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
