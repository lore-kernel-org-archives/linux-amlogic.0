Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3555CCA9ECA
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90u5kocfK/HFJqhrQWx7ofMZagNRVqiA33bntEPzzmE=; b=Tzz+/YZTQFinDP
	qBqWB/CE+4obJnyt42Tt85hv9149YNR6TLwfWbFuI3eucLdDB7un9UgPv6htHNVW0vQO2Z/8YOY6K
	87pum4gX0PayfpGN1wstys1GiQutvDhPfJ7omSpVq5dc9mThgXfkuPqh3sseHyF6RWwXpfFycPnr+
	aqBu0F+oC8Xhu8DxeQpijgtxyGevKUo8YvZQIhPtf5LTOmLL1yyK1MmeOK+Z5msFNYIavbOY4nqeo
	DTY4TiGhK58p7BofJ9iN1LaDS0hlmQMPx8ivZH7rByeVYDQ5s2qURoO8ea1KGKufYCS1/eKFEdG+U
	0Warl+NsgVPL4RPYWENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFewd-00000008Soq-3qoc;
	Sat, 10 Oct 2026 21:49:31 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFewa-00000008So4-2SyQ
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 21:49:30 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-677d35fd168so536111d50.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 14:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791668967; cv=none;
        d=google.com; s=arc-20260327;
        b=nkUZ6Ehv23mMLZdNdDf7tZTUSRFkSdOK1iFqXqp4mrenBBtXeVeWYPpizuJ1Wn1lfW
         YX5lU+szNSMeew7eCiwn04J7lCjrHSB+5xU4NJgXZRg7DxcDRk0PV1n5dnYsVb0gwzl5
         /wbca/yRQDIFcyJ713fvfuRvAvz2PX6MUU/bQfTIQRAjnW0CfMoHpFR8eWv12f5buyOq
         aBN8T56EdQBK/kmDdA7ONoHIj3pKIqoNLr3xf2K885unhkFHh0S7KCfZHvTBP43mVBvL
         lPsvWlspJSWKJR4V6qFeSDAPL4ChZajH5Cq+nVKiBq+yMEp+88V/z1wHR1rkIRGNOsYJ
         6v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        fh=sSJSPDOd+WdSxuCEEx3Fdd+oFrI+FV+SzMhDJ72vJv4=;
        b=h669nqzPvAkgq9l/kzFbwdVJcHrPwcpoDcE/vqg+d320dX9DOYf/KnJepqWVsgPBWz
         qqANA87u887sFJJZgxFj4br3SVvd4smm+l10loC6CA7N5Ezc9VYllvRc7qX/PgTTn5Pz
         c26fNLp22wU4sD3LaMkLgGumF0I7qsesQMY/SOcxjgkNglGe9AMyAbBc5kyVwrI+FBiL
         O3MQpenGn35x3dPsYXFEngHxBVUs7faYxH96ifrDGRT7ILNdyAn8VaPfURifRyiBXnWZ
         iebCVJyi2Lq6RNbGw7dVqJvtfpt0NLX1z0VLKb+SO8lSKqlNGl6AsbxRiLDalttGXJ3G
         Sjrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791668967; x=1792273767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=TDpq895xFFqLnS+glWCa9hZlfkLYPD6xY9rZzVZVj2cH+sA760cXYZ3hQc18BjO0gy
         2l1EbjKSa1hjpYGtRIeA84cgUO2SJDiYvg9i6CW4qOoH4WgyjvTB2qaD4P5mt+lkx8fg
         cAvsrC630LCp3+lm7gfHLJ6TDiS0qj85PtuWOx38d/9G9A6A1JVXBcZIQUsLhT0Gytsd
         CXnuvgMauC3pdvoKIotGlL+yOT2b37RFZOqfuEMtBTM0uxYCqPoSZCNrzEuzM5fVNp5N
         B7qzvGsDZldYyWQJHIX2Z53Sxbjn/TxrhMcE8c7NJGW3gls6nDGHayANtl8fA0BVwbHS
         KPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668967; x=1792273767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=cO0Br0YSaRPurSpsVhgvZY8vrkxxLFbhrnotT+F4UkUjGPQL1Qvox6uN7YDdHJPGFN
         G/efCnGBjPKK4dQeyKkXMLwzZ7ZTuNhtZRDyVpcvkDWmNdGjUQ0jAyl3SoM/DMz1zZH2
         IJ3p+Iy5SKJQqjE8h3zY56KTNfb8tHUe2Y/uaB25AHdnC5sO5S6Bw1vL/NdN5r4lX1Ei
         na+AdfPyI3zamVM2Zo7QxaxWss6IcXpfUPv2y1wztXre7Xtdol2JIg6xWw/cNjgYor11
         da9SdAat2NoqY4lSNqESQM6MV2tLkhyPw3Eb6iUmoz5fEyxLPLCJryp3QIOIFxlQ1EDf
         7lzA==
X-Forwarded-Encrypted: i=1; AKwUvByRExctIQskOdzcsz5cx8DKDiFlKn7cO24oz1g32Zq+uh8MzqcTHtDoq5kuqAMH7+W+tQsSXhkdTPFqlQxm@lists.infradead.org
X-Gm-Message-State: AFq9FYIELdGAiKrEyeHTYreNypzMwts6FxWiPS0+HzjBclSbAMKzCb0o
	uDIw00uxYkhaMwNGmsBmtF8vPxmbWNXxmLqxM47ZW8oD8p5uJ0X2K7kDqss0gfUuj3MTUrzbNgW
	vDPROn32TIJDrHfH/d55oBUVuhtzekVw=
X-Gm-Gg: AYBFou22zNa6HL1ovPObaF2cdXwZyALzhAeHCMi3cu073TojwOSWf/6QrUl3f0h+krT
	LnGLXYtHfgbn59VSmtyg33m6gTcxolAhbInaNFDtzNA3BKyyapD/tRouYAgx2C5KS554mC4C3lL
	NA+2EoZxNMDGKTpoZSfOUpDsp0P7fib8xtHXNIjQanuo3bsjDIoanvtT/GUxy/0/dqjUv6jDOoD
	FBtv//6s46Jn3oWS3pBoF8UHPPwDoen2Zne4ZpgP8gXdCCY0GCoJnGJOz+RXcL+fZucld/f3b18
	B0N/57oLsOt9/ylUDHK3Dj+vQEjeDDSN/EZk96yb/YUpuTc7nEM6jUbC++jUAJzLhnYW3vah6fm
	Pt63BxXrDO8/A
X-Received: by 2002:a05:690e:5:b0:674:17ca:25dd with SMTP id
 956f58d0204a3-679362cb227mr1431918d50.78.1791668966625; Sat, 10 Oct 2026
 14:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-5-tanure@linux.com>
In-Reply-To: <20261010105900.247342-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Oct 2026 23:49:15 +0200
X-Gm-Features: AclHuK8jJjUAGUEE_RiHqUn3ZKgg7qAYmUp7tVzhoh46a9QNl3VNEK64s0Xinno
Message-ID: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_144928_644264_B2A3DCC4 
X-CRM114-Status: GOOD (  14.56  )
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

SGkgTHVjYXMsCgokc3ViamVjdCBjYXVnaHQgbXkgZXllIGJlY2F1c2UgSSBkaWRuJ3QgdW5kZXJz
dGFuZCB3aHkgdGhlcmUncyBhICJUNwp3YXkiIGZvciBhZGRpbmcgUkdNSUkgZGVsYXlzIHNpbmNl
IHdlIHNob3VsZCBiZSBmb2xsb3dpbmcgYSBzdGFuZGFyZC4KUGF0Y2ggOC84IGluIHRoaXMgc2Vy
aWVzIGRvY3VtZW50cyB0aGUgc3RhbmRhcmQuIENhbiB5b3UgcGxlYXNlIGZpbmQgYQptb3JlIHN1
aXRhYmxlICRzdWJqZWN0IGZvciB0aGlzIHBhdGNoPwoKT24gU2F0LCBPY3QgMTAsIDIwMjYgYXQg
MTI6NTnigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdyb3RlOgpbLi4uXQo+
ICBzdGF0aWMgaW50IG1lc29uOGJfaW5pdF9yZ21paV9kZWxheXMoc3RydWN0IG1lc29uOGJfZHdt
YWMgKmR3bWFjKQo+ICB7Cj4gICAgICAgICB1MzIgdHhfZGx5X2NvbmZpZywgcnhfYWRqX2NvbmZp
ZywgY2ZnX3J4Y2xrX2RseSwgZGVsYXlfY29uZmlnOwo+IEBAIC00MTEsMzIgKzQ1NSwzNCBAQCBz
dGF0aWMgaW50IG1lc29uOGJfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgICAgICAgIGR3bWFjLT5kZXYgPSAmcGRldi0+ZGV2Owo+ICAgICAgICAgZHdtYWMtPnBo
eV9tb2RlID0gcGxhdF9kYXQtPnBoeV9pbnRlcmZhY2U7Cj4KPiAtICAgICAgIC8qIHVzZSAybnMg
YXMgZmFsbGJhY2sgc2luY2UgdGhpcyB2YWx1ZSB3YXMgcHJldmlvdXNseSBoYXJkY29kZWQgKi8K
PiAtICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwgImFt
bG9naWMsdHgtZGVsYXktbnMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZk
d21hYy0+dHhfZGVsYXlfbnMpKQo+IC0gICAgICAgICAgICAgICBkd21hYy0+dHhfZGVsYXlfbnMg
PSAyOwpUaGUgMm5zIGRlZmF1bHQgdmFsdWUgaW4gY2FzZSAiYW1sb2dpYyx0eC1kZWxheS1ucyIg
aXMgYWJzZW50IGhhc24ndApiZWVuIG5lY2Vzc2FyeSBzaW5jZSBjb21taXQgMDkzZDIzZGI0ZmZm
ICgiQVJNNjQ6IGR0czogYW1sb2dpYzogYWRkCnRoZSBldGhlcm5ldCBUWCBkZWxheSBjb25maWd1
cmF0aW9uIikuClRoYXQgY29tbWl0IGlzIHBhcnQgb2YgdjQuMTIuIFNvIGJvYXJkcyB1c2luZyBS
R01JSSBhbmQgYSAuZHRiIHdpdGhvdXQKdGhhdCBwcm9wZXJ0eSBoYXZlbid0IGJlZW4gdXBkYXRl
ZCBpbiBtb3JlIHRoYW4gOSB5ZWFycy4KClsuLi5dCj4gLSAgICAgICByZXQgPSBtZXNvbjhiX2lu
aXRfcmdtaWlfZGVsYXlzKGR3bWFjKTsKPiArICAgICAgIGlmIChkd21hYy0+ZGF0YS0+bWFjX2Fw
cGxpZXNfZHRfZGVsYXlzKQo+ICsgICAgICAgICAgICAgICByZXQgPSBtZXNvbl9kd21hY19pbml0
X2R0X2RlbGF5cyhkd21hYywgcGxhdF9kYXQpOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAg
ICAgICByZXQgPSBtZXNvbjhiX2luaXRfcmdtaWlfZGVsYXlzKGR3bWFjKTsKRnJvbSB0aGUgZGlz
Y3Vzc2lvbiBpbiB2MiBJIGNvdWxkbid0IHVuZGVyc3RhbmQgdGhlIG92ZXJhbGwgd2F5IGZvcndh
cmQuCkkgZ2V0IHRoYXQgbmV3IGNvbXBhdGlibGUgc3RyaW5ncyBzaG91bGQgbm90IHJlbHkgb24g
b2xkLCBpbmNvcnJlY3QKYmVoYXZpb3IuIEJ1dCB3aGF0J3MgdGhlIHBhdGggZm9yd2FyZCBmb3Ig
dGhlIG90aGVyIFNvQ3M/CgpbLi4uXQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uOGJfZHdt
YWNfZGF0YSBtZXNvbl90N19kd21hY19kYXRhID0gewo+ICAgICAgICAgLnNldF9waHlfbW9kZSA9
IG1lc29uX2F4Z19zZXRfcGh5X21vZGUsCj4gLSAgICAgICAuaGFzX3ByZ19ldGgxX3JnbWlpX3J4
X2RlbGF5ID0gdHJ1ZSwKPiAgICAgICAgIC5oYXNfcGlwZWxpbmVfY2xrID0gdHJ1ZSwKPiArICAg
ICAgIC5tYWNfYXBwbGllc19kdF9kZWxheXMgPSB0cnVlLApUaGlzIHNob3VsZCBiZSBhIGNhbGxi
YWNrIGZ1bmN0aW9uIHBvaW50ZXIgKGFwcGx5X2RlbGF5cyBvciBzaW1pbGFyLAp0byBtYXRjaCBz
ZXRfcGh5X21vZGUpIHVubGVzcyB0aGVyZSdzIGEgd2F5IHRvIG1ha2Ugb2xkZXIgU29DcyBhbHNv
CmZvbGxvdyB0aGUgImNvcnJlY3QiIFJHTUlJIGRlbGF5IHNwZWNpZmljYXRpb24uCgoKQmVzdCBy
ZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
