Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBD606A321
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GeNh2ybl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I3pMIz5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C/MOls+/wIguOwXy7Z5oIRT7EZj0e84RJmjmWcjt89M=; b=GeNh2yblBKOl5TMmZj0i264P+u
	7t3YRpi3NFxp/sokV5ttmOOAtWATXpyq5oimmhlNXCUlf1+KYaQMoqLIwuDUxYrVzkiepb8HVJQKA
	QJTISxD8fBRj00fx7tQIBgKGs9oOgKEhdUomxQp3Mp45No0XEH7Meuxy+vLwxsdTDVVVrHNEmekIO
	YDnqp8jX3e6TyYoz/9HDd4zSDJip+FJ1Mcu+R7HL/67z9e9s2vfHS/I2UgITRcOmMWVnv+wdmfxv0
	V5eC2Pk8V7ofhLpzqpVYK/KXjMmC5bCbO/eBafcaJtY2jG9oSaRjU4obYNlnxgTUGFgBYetMxQYml
	og8nd6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvtS-0000000GFIA-3MRE;
	Fri, 27 Nov 2026 13:21:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvtP-0000000GFH8-3Fmk
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 13:21:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso58268825e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795785694; x=1796390494; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=I3pMIz5bhFmJ2MJaxqICWamZQvkHEhRGEGaToL4H+84m2UEYTz2YrA2hit5WNWZUog
         AlEsYyCW3mDI0ikkrf9GOKYVTCw+uN2eX10aItLUU40MZbywYf7eQU5/OeUDqamECsTL
         S/EzEpH+S9aWqmGqT69evftIS/9osIXinXr5vTnuwlOWJM2F32F9YOU8lYCxpYp5cT1d
         jOCP43rEh6aD2lxXCxmVb/CGc7HKcs/OWK4aF+/BnO+YgTpyLRvbu/vqmcRqlsVmPIks
         d9AibZrw8ITA54B/eyqyZSR2u7oZ8MiEkm781tXV9lG/aZzsPTR8FPwRUdIzGgsnlZRd
         dMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785694; x=1796390494;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=YSlkKxyJMRn8HZ9n14XmpJt2L3PEXJqWaG9HK0gDtWmQy8RqKWy8h5RSCQldaoPGD4
         /IPZ4zT5XT8KUSGdrlsE8ZgjG4Zy2uaJ114qWNczbSJ6KVXqx26o3HNtP38YRcc65M6e
         AdrsZHTtzjQKe0NC2U7Xg4uM3WDBx3DezrJ1JkTukNukjRWdnSTDbQJi1TSH11jx9QVQ
         kM0xQe4fwBxsbDeFcUYFbPAEKvOllZlyMeB4yPnjVjh/19c9jX5O48f22Jed4L9snsRn
         CFZizR1VAwPGaLRNhMo4wM/Am+SQAqsDMQusnx++hyK3liRziEsugHG9YIfwx8mUEqmn
         gr+A==
X-Forwarded-Encrypted: i=1; AL+hErEhdOL5lHxnEnla3Z4F2O+moKXJ7GYeiQya+cJwd4WIrl+QJLH1ljgp5XXPCZ0qrillwAAjQSWxnG99e2RI@lists.infradead.org
X-Gm-Message-State: APuU4Z/n5a9k1IElEYdWjHskuc6UwJ/lEgYg8vGX/R2V3E9E8Abd3Nd3
	y7M2fLPquuFLpD+U97NegFUW+9mBf8BQwLh6JrF2c/dpw92Gz4v4dHVjxaOvaHGDn5s=
X-Gm-Gg: AZFdTZehbMzKjObvjsnEUeDCYcjGLOrbtYgWMPPtu/CKIwG/hMJaEnJKVkTgc2m1TZD
	buFjooWmmcNQ7jbswpYgjWvhLakJgLWemlS8YLq6JTGyYBhNflZaKhRx4ReIJyWUQ1AUeyCekje
	rtDq+ws1WGQ3ok4n8ue0kt4cp6H1u03ZyCIVS4LIuqZNkSWpKUvZWfykvWZzlaPwGbxwE0IOdC0
	5k74hmg7xget+X19Vdu1UZS4x4jxfh4bt6S4XSphGiCwhFve0hMgD7o3XYlwkVfxIGuy2czJbJA
	Y/NU0pKMb5yZbOOTtMobXVVFthULHcmvxh65MHhNTYA2UbYZ+4ts6C6nUUifg9G37aBmP/2xX2G
	bSNOaKIfqxDUbylPfubFUTkpRJ03iJ5azFEAuu2QEyGF5ZuTtGzElWF/MdRhb+myZA3taeKhrzh
	N7aT6SoUlTg6qQBFBcphB0sXw2++CEyuSLDQFUWJtc07d3yslKy12fyoWCPzxCp7x8o7PBQGqlg
	5XFkfJemoELI/PsIHlfTM1gAR53xdhYUEXuNKyNDg//4bR6TiB9uSKDpS9WZi2yeNgJr23b9NgF
	uItMG6kdY4shsF5SnPuIC2bFkt7gVHJ6rQ6nhkebNyc2h4gL
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr492570985e9.35.1795785693896;
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm772362675e9.10.2026.11.27.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
 <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
Date: Fri, 27 Nov 2026 14:21:32 +0100
Message-Id: <179578569228.3130490.14256403264790878680.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=E4dLgfAPlyGRAwDDbFxbbsD6Cc9CC30EoXytcCxZdeQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmczXf6cy9W/3oi+bV7cZXnU8vLz/4zK0vWJ22ebHPE8
 1Rj933DjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEykdjrDX9la7iuLNjZrtM37
 zPl+mruZ18OzH1TXHuZwtM4/pKVmeoLhf2VL+Znd7z8cP9NrZe//sNuyqU+n/2fIGoVzx+ZwPDh
 Txg8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052135_846621_551E1D1A 
X-CRM114-Status: GOOD (  22.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4gPj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxsX3BhcmFtc190YWJsZSBheGdfcGNpZV9wbGxf
cGFyYW1zX3RhYmxlW10gPSB7Cj4gPj4gLSAgICAgewo+ID4+IC0gICAgICAgICAgICAgLm0gPSAy
MDAsCj4gPj4gLSAgICAgICAgICAgICAubiA9IDMsCj4gPj4gKy8qCj4gPj4gKyAqIEEgcHJlLWRp
dmlkZXIgdmFsdWUgb2YgMyBwcm92aWRlcyB0aGUgYmVzdCBwZXJmb3JtYW5jZSBmb3IKPiA+PiAr
ICogdGhlIEFYRyBQQ0llIFBMTC4KPiA+PiArICovCj4gPiBBZ2FpbiwgZGVmaW5lIHBlcmZvcm1h
bmNlIGhlcmUuIHdoYXQgZG9lcyBpdCBtZWFuID8KPiAKPiAKPiBUbyBjbGFyaWZ5IHdoYXQgInBl
cmZvcm1hbmNlIiBtZWFucyBpbiB0aGF0IGNvbW1lbnQ6Cj4gCj4gU29tZSB0YXJnZXQgZnJlcXVl
bmNpZXMgY2Fubm90IGJlIGFjaGlldmVkIHdpdGggTj0xLCByZXF1aXJpbmcgYSBub24gMSAKPiBw
cmUtZGl2aWRlci4KPiAKPiBOIG1heSBub3QgYmUgMSBmb3IgQW1sb2dpYyBmaXhlZCBQTExzIGFu
ZCBQQ0llIFBMTHMuCj4gCj4gVGhpcyBBWEcgUENJZSBQTEwgaXMgZGVzaWduZWQgYmFzZWQgb24g
Tj0zIGZvciBvcHRpbWFsIGJhbmR3aWR0aC4KPiAKPiAKPiBUaGUgQVhHIFBDSWUgUExMIHJhdGUg
aXM6Cj4gCj4gMjRNaHovMyAqIDIwMCAvMi84ID0xMDBNaHouCj4gCj4gCj4gSSB3aWxsIHVwZGF0
ZSB0aGUgY29tbWVudDoKPiAKPiAvKgo+IAo+ICDCoCogVGhpcyBBWEcgUENJZSBQTEwgbmVlZHMg
cHJlLWRpdmlkZXIgMyB0byBoaXQgdGhlIHRhcmdldCBmcmVxdWVuY3kgCj4gMTAwTWh6LAo+IAo+
ICDCoCogd2hpY2ggYWxzbyB5aWVsZHMgb3B0aW1hbCBiYW5kd2lkdGguCj4gCj4gIMKgKi8KCkFs
bCBJJ20gc2VlaW5nIGluIHlvdXIgZXhwbGFuYXRpb24gaXMgImFiaWxpdHkiIHRvIHJlYWNoIGEg
cmF0ZSwgbm90aGluZyByZW1vdGx5CiJwZXJmb3JtYW5jZSIgcmVsYXRlZC4gRWl0aGVyIGRyb3Ag
dGhlIHdvcmQgb3IgZXhwbGFpbiB3aGF0IG1lYW4gYmV0dGVyLgoKPiAKPiA+PiArc3RhdGljIGNv
bnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlIGF4Z19wY2llX3ByZWRpdl9kaXZfdGFibGVbXSA9IHsK
PiA+PiArICAgICB7IC52YWwgPSAzLCAuZGl2ID0gMyB9LAo+ID4+ICsgICAgIHsgLyogc2VudGlu
ZWwgKi8gfQo+ID4+ICt9Owo+ID4+ICsKPiA+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIGF4
Z19wY2llX3ByZWRpdiA9IHsKPiA+PiArICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBf
ZGl2X2RhdGEpewo+ID4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IEhISV9QQ0lFX1BMTF9DTlRM
LAo+ID4+ICsgICAgICAgICAgICAgLnNoaWZ0ICAgPSA5LAo+ID4+ICsgICAgICAgICAgICAgLndp
ZHRoICAgPSA1LAo+ID4+ICsgICAgICAgICAgICAgLnRhYmxlID0gYXhnX3BjaWVfcHJlZGl2X2Rp
dl90YWJsZSwKPiA+PiArICAgICAgICAgICAgIC5mbGFncyA9IENMS19ESVZJREVSX0lOVkFMSURf
WkVSTywKPiA+PiArICAgICB9LAo+ID4+ICsgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2lu
aXRfZGF0YSl7Cj4gPj4gKyAgICAgICAgICAgICAubmFtZSA9ICJwY2llX3ByZWRpdiIsCj4gPj4g
KyAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9vcHMsCj4gPj4gKyAgICAg
ICAgICAgICAucGFyZW50X2RhdGEgPSAmKGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEpIHsK
PiA+PiArICAgICAgICAgICAgICAgICAgICAgLmZ3X25hbWUgPSAieHRhbCIsCj4gPj4gKyAgICAg
ICAgICAgICB9LAo+ID4+ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwKPiA+PiAgICAg
ICAgfSwKPiA+PiArfTsKPiA+PiArCj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGxsX211bHRf
dGFibGUgYXhnX3BjaWVfcGxsX3BhcmFtc190YWJsZVtdID0gewo+ID4+ICsgICAgIFBMTF9NVUxU
KDIwMCksCj4gPj4gICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiA+PiAgIH07Cj4gPj4KClsu
Li5dCgo+ID4+Cj4gPj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxsX3BhcmFtc190YWJsZSBzeXNf
cGxsX3BhcmFtc190YWJsZVtdID0gewo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTAsIDEpLAo+ID4+
IC0gICAgIFBMTF9QQVJBTVMoNTEsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTIsIDEpLAo+
ID4+IC0gICAgIFBMTF9QQVJBTVMoNTMsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTQsIDEp
LAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTUsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTYs
IDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTcsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMo
NTgsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNTksIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJB
TVMoNjAsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNjEsIDEpLAo+ID4+IC0gICAgIFBMTF9Q
QVJBTVMoNjIsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNjMsIDEpLAo+ID4+IC0gICAgIFBM
TF9QQVJBTVMoNjQsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNjUsIDEpLAo+ID4+IC0gICAg
IFBMTF9QQVJBTVMoNjYsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoNjcsIDEpLAo+ID4+IC0g
ICAgIFBMTF9QQVJBTVMoNjgsIDEpLAo+ID4+IC0gICAgIFBMTF9QQVJBTVMoODQsIDEpLAo+ID4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBsbF9tdWx0X3RhYmxlIHN5c19wbGxfcGFyYW1zX3RhYmxl
W10gPSB7Cj4gPj4gKyAgICAgUExMX01VTFQoNTApLAo+ID4+ICsgICAgIFBMTF9NVUxUKDUxKSwK
PiA+PiArICAgICBQTExfTVVMVCg1MiksCj4gPj4gKyAgICAgUExMX01VTFQoNTMpLAo+ID4+ICsg
ICAgIFBMTF9NVUxUKDU0KSwKPiA+PiArICAgICBQTExfTVVMVCg1NSksCj4gPj4gKyAgICAgUExM
X01VTFQoNTYpLAo+ID4+ICsgICAgIFBMTF9NVUxUKDU3KSwKPiA+PiArICAgICBQTExfTVVMVCg1
OCksCj4gPj4gKyAgICAgUExMX01VTFQoNTkpLAo+ID4+ICsgICAgIFBMTF9NVUxUKDYwKSwKPiA+
PiArICAgICBQTExfTVVMVCg2MSksCj4gPj4gKyAgICAgUExMX01VTFQoNjIpLAo+ID4+ICsgICAg
IFBMTF9NVUxUKDYzKSwKPiA+PiArICAgICBQTExfTVVMVCg2NCksCj4gPj4gKyAgICAgUExMX01V
TFQoNjUpLAo+ID4+ICsgICAgIFBMTF9NVUxUKDY2KSwKPiA+PiArICAgICBQTExfTVVMVCg2Nyks
Cj4gPj4gKyAgICAgUExMX01VTFQoNjgpLAo+ID4+ICsgICAgIFBMTF9NVUxUKDg0KSwKPiA+PiAg
ICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+ID4+ICAgfTsKPiA+Pgo+ID4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGNsa19kaXZfdGFibGUgbWVzb244Yl9maXhlZF9wcmVkaXZfZGl2X3RhYmxlW10g
PSB7Cj4gPj4gKyAgICAgeyAudmFsID0gNCwgLmRpdiA9IDQgfSwKPiA+IFByZXZpb3VzIHRhYmxl
IHdhcyBzaG93aW5nIGEgcHJlZGl2IG9mIDEgLi4uIGhlcmUgaXQganVtcHMgdG8gNCB3aXRob3V0
Cj4gPiBhbiBleHBsYW5hdGlvbiAhCj4gPgo+ID4gQWxzbywgaXQgaXMgYSBSTyBjbG9jaywgc28g
d2hhdCBpcyB0aGUgcG9pbnQgPwo+IAo+IAo+IFRoaXMgaXMgc2ltaWxhciB0byB0aGUgQVhHIFBD
SWUgUExMIGNhc2UuIFRoZSBwcmUtZGl2aWRlciBpcyBmaXhlZCBhdCA0LAo+IHdoaWNoIGxldHMg
dGhpcyBmaXhlZCBQTEwgb3V0cHV0IDI1NTBNSHogYW5kIGdpdmVzIG9wdGltYWwgYmFuZHdpZHRo
Lgo+IFRoZSB0YWJsZSB3YXMgdXNlZCBzbyB0aGUgZml4ZWQgUExMIERDTyByYXRlIGNhbiBiZSBj
YWxjdWxhdGVkIGNvcnJlY3RseS4KPiBXaXRob3V0IHRoZSB0YWJsZSBvciBgQ0xLX0RJVklERVJf
T05FX0JBU0VEYCwgdGhlIGRpdmlkZXIgd291bGQgYmUgCj4gaW50ZXJwcmV0ZWQgYXMgNSwKPiBs
ZWFkaW5nIHRvIHdyb25nIERDTyByYXRlIGNhbGN1bGF0aW9uLgoKQnV0IHlvdSBhcmUgaGlkZGlu
ZyBhIGZpeCBpbiBhIHJld29yayB0aGVuLgoKWW91ciByZXdvcmsgc2hvdWxkIGtlZXAgdGhlIHBy
ZWRpdiBhcyBpdCB3YXMuClRoZW4geW91IGNhbiBjaGFuZ2UgZXhwbGFpbmluZyBjbGVhcmx5IHdo
eSB5b3UgYXJlIGRvaW5nIGl0LCB3aXRoIGEgcHJvcGVyIGZpeGVzIHRhZy4KCi0tIApKZXJvbWUK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
