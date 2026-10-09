Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF48CA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAifRiQ1ifaq4GBNhaZ1ehLLRYcVQLXKgp3IvB8X9Ww=; b=HAQ9+L5nVXHtM9
	Pbt1Jjq6kXD7nxVVOXw7vnOc6hE15aOd2EpjwWK+SVI0lkOVq2gxcEwn787O64psjZO3EOpJMFAFH
	zJ+xKmldedGEC0jfrVnbowzCpyOCyJgWc8lJYwM2U40kfOnhiuahVJjk4BuZXdwkhZFD3mRjtMp8f
	WJM1VnGy8fdFf/EUlF3C7pZzNYtXcz5y9iufi3EyYyVwWFmgMzPCFHVOO+iI8EUGcaM/e3JNqYioK
	VpY2P0foLIhMtrtxLXsAyiO5iGj1BAUVXE9SH8+v3zOF4sWsIRPndqqL8/g7kb0hPtKPEL5E6ILZ4
	sss5i5AEBiZdCVjc4hOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3X8-00000005Z4I-03cb;
	Fri, 09 Oct 2026 05:52:42 +0000
Received: from mail-yx1-f46.google.com ([74.125.224.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3X5-00000005Z3e-13mT
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 05:52:40 +0000
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6768ced47aeso4291890d50.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 22:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525157; x=1792129957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHcCOJlfDk2kf/nYjNk1wm3um6Oe/oxI7EYgEHDQ21E=;
        b=tAWjBij1tK6cmaAQuJ7bf2p24Uxh+X+MJVsrEA2VnYh1kkoRmpdmNIYK530uFJmZxc
         0Lu5K/h1D2f64FdXC0AG/Wf4oLOaRquJELYxnre5ad+CxCFCp41N7AC+jHpEZla0CuLh
         s0jaeIQz+7YMelIGBSAD0LloCOdOzMNrPl2fBzYQzugGYU0uxvaBMz8oxDPPe9qTTP6/
         DXk7XRY1AsfYSAro1qkX9x1HDIakyriFuELovnURb91zc109zfVYHiz2AxM/0LA1tYSN
         vyfTeEmPNQgC4eOUwRrI06Dd+Id4GaZRhM6+o78eUWM/sJXFS2aM4U7hZMSqli1aCc8G
         Zezg==
X-Forwarded-Encrypted: i=1; AKwUvBxH4Pod22uwBUW5nqGeepw7xn4Y5ej2hH90obpdWDrDQkowOfVby/bCTJLlgE036s1pXAeLDrLpyWZKC9bl@lists.infradead.org
X-Gm-Message-State: AFq9FYKXhLmjsiICqPmMx6vUoVzABOVS2Bb5OmA9sBhMmWbBSEMgAj3Q
	SZqDJH1Zlp0CT9Dmx573hAiEQ+Ekexz7DziaOcBuiCRz/kBp/D83+igD54XnbiGWIc0=
X-Gm-Gg: AYBFou3H0tkynJQlKOYK7KjGrPd7rvZoZi+rTatfRpmgumLZvpQnU2APSZudww584Uu
	XmtY8wVZWXI3weWxEMlaToGgQyhVcd0WbXwvU3Zt7NpGPTNK8VFRal8HbyUOmvGMtBvTK21ZZ2Y
	WCrwBwZzqFYSv7yYlz0LmYLfJmke5I1UfXjj+2WeTspxbSxR7SZgGdETzOSp728UG0re5VYYMA4
	z8Btq+UgpA0nW5MhPxCbLg6V2B3M4cV4ACfEHlBWlne1nwZGUgMa1iKMaFlJZ/VR7Q1KQibra8N
	9eL9iUV9tihdQfnL2TCCj9FULnSVZ7/Vy8OE2qtjWlsKIFiDiZx0hrGauKrcK72V067VaC/zSIN
	SBZ0By9UQXMQfk2wBYMwPBGbpVhd0gPOfNeYttIWFh+02O+xfYR1XpJNc1tE2E2CN9mNDAiYgNn
	MNGn3JInpo9fVU0wiBaYE2WRaR2TmfRZEaA5oa/TXU943DRMBzbItd48Ke9sGxXVJ5/POol33Wy
	HwAjO1vbzlTNjg5UcOJ8SvM2iEmHBuO2OD2nB93EPGPgQs0sj4w5YXBZp/ez0uaKv8=
X-Received: by 2002:a05:690e:4802:b0:675:5ce8:f037 with SMTP id 956f58d0204a3-6793600b1c7mr242598d50.35.1791525157301;
        Thu, 08 Oct 2026 22:52:37 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356bec15sm413574d50.16.2026.10.08.22.52.34
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:52:35 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-885cf67963eso40787277b3.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 22:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtdVmrhIXcLxPgifc0N84WLVRU0dxWOaE+zmDIBgHpZHViM6FO9e/yXDHTSLgHH+w2zIxLvCUB7qrvfGwH@lists.infradead.org
X-Received: by 2002:a05:690c:e:b0:88f:62ba:512b with SMTP id
 00721157ae682-8b07ee3297amr3678357b3.42.1791525154408; Thu, 08 Oct 2026
 22:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:52:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
X-Gm-Features: AclHuK9uJycl8wPMvbL9js8yfzmf_wvwEi-NV4Dy7HnHzbbgfaJpxaRVEvgynGU
Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_225239_346091_A0E35446 
X-CRM114-Status: GOOD (  17.57  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAyOjEy4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDA3LCAyMDI2IGF0IDA5OjI2OjI2QU0gKzAxMDAs
IEx1Y2FzIFRhbnVyZSB3cm90ZToKPiA+IFRoZSBTb0MgaGFzIGEgU3lub3BzeXMgZ2lnYWJpdCBN
QUMsIGEgYmxvY2sgb2YgZ2x1ZSByZWdpc3RlcnMgdGhhdAo+ID4gc2VsZWN0cyB0aGUgaW50ZXJm
YWNlIHR5cGUgYW5kIHRyaW1zIHRoZSBjbG9jayB0aW1pbmcsIGFuZCBhCj4gPiBtdWx0aXBsZXhl
ciB0aGF0IHBvaW50cyB0aGUgbWFuYWdlbWVudCBidXMgYXQgdGhlIG9uLWNoaXAgMTAwTSBQSFkK
Pgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVybmFsX2Vw
aHk6IGV0aGVybmV0LXBoeUA4IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMwMSIsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0MCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8OD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbWF4LXNwZWVkID0gPDEwMD47Cj4KPiBJdCBpcyBhIDEwME0gUEhZLiBX
aGF0IHN1cHBvcnRlZCBzcGVlZHMgZG9lcyBpdCByZXBvcnQgaW4gaXRzCj4gcmVnaXN0ZXJzPwpJ
IGNhbm5vdCByZWFkIHRoZW0uIE9uIHRoZSBWSU00IHRoZSBNRElPIG11eCBwb2ludHMgYXQgdGhl
IGV4dGVybmFsClBIWSBhbmQgdGhlIGludGVybmFsIG9uZSBuZXZlciBwcm9iZXMsIGFuZCBubyBi
b2FyZCBpbiB0cmVlIHVzZXMgaXQuCgpUaGUgbGluZSB3YXMgY29waWVkIGZyb20gbWVzb24tZzEy
LWNvbW1vbi5kdHNpLCB3aGljaCBoYXMgdGhlIHNhbWUKbWF4LXNwZWVkID0gPDEwMD4gb24gdGhl
IHNhbWUgUEhZIElELiBEcm9wcGVkIGluIHYzLgo+Cj4gWW91IHNob3VsZCBvbmx5IG5lZWQgbWF4
LXNwZWVkIHdoZW4gdGhlIFBIWSBpcyBicm9rZW4sIHNheXMgaXQgY2FuIGRvCj4gbW9yZSB0aGFu
IGl0IGFjdHVhbGx5IGNhbiBkbywgb3Igd2hlbiBhIDFHIFBIWSBvbmx5IGhhcyB0d28gb2YgdGhl
Cj4gZm91ciBwYWlycyBjb25uZWN0ZWQgdG8gdGhlIG91dHNpZGUgd29ybGQgZXRjLgo+Cj4gICAg
ICAgICBBbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
