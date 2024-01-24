Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6898BC46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVnJCI6cRweuZEPLZzwESb+RjVa4SnIYOPKf+CPhbTY=; b=FL2m2DSROPJFev
	xGlGusvatruiDGboPRJGeh2mGwMuwIF0YOtUzj3xr1LJlXScVP2O0JMcTIDsvhXn4O53jdKl+ISyH
	obXk3vH9mljFaCNuZl5iumXKys2sXyT0ncxTUOVh8sBelgpWpj8Lml5BXNbHpzn3pMHoDQd3wN2vo
	viNO41D3PRg5hPqUNj/fvsLV/98bcgHr4wNyN2yj21qIDicSL4nQN9cx5wnC4aLu8ehlMlTeG88f0
	WG90st9ZrJ2uF6W0Zp575G7XlTY6fp/ZxxWIcY2e0MaZr/N65J7ss+/xeNvugWhUmGrLA2470hJwf
	qvQFSdYNNI6cq8gv6+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZQg-002BcS-0M;
	Wed, 24 Jan 2024 09:20:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZQf-002Bc2-0W
	for linux-amlogic@bombadil.infradead.org;
	Wed, 24 Jan 2024 09:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XKfrsIh+is/CrcG9RcsWASRz9/Tq/yuaNYUtRHDrGYY=; b=oV/9uyztLw3E5elmW+BPgBLiiJ
	cNDbXmxTC5CrObinWy5fzvB4yoTqcdXAA97C1G9AThBUkME7fWJKnrz2amy+yBb2CSly34HZCFomG
	9vS0tdWWPNjMtPaHEPH3IUoGo4koG7lWx3M83CMU/GZEVclBRWOyfVHyiRgX0Gk4yCIYtl+seF1zc
	BGYKtKhVJcq8dcBClx5RWXG9GilJ2CfgmpASG7yd9sHjeMoV07ulgJNjy0gR20xQOerLmxx5hfBrb
	3tJ00exV5WDenhcD4ajEClm5xT1khfLPIcSg0R2jhA3rK5bz9CB2gtUPrrkC0cgMsCBXXgh1DLp1c
	nzJfJMxQ==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSZQa-00000004Lie-3jPF
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:20:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2cf0e9f76b4so20739581fa.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jan 2024 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706088010; x=1706692810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKfrsIh+is/CrcG9RcsWASRz9/Tq/yuaNYUtRHDrGYY=;
        b=VJSa5eA9H3a9Q55nmIsFybaH8CsDboTsk3vKPvpAD8pcMNCFaQ5qKFUD2TKQhwszrc
         pB/ypeMTywWBfc8bORb+GFy/UZWsznXK/8O2E/Ed5JN93TodZjg4ppaVFAaZponMvIeb
         MSSjcB3cJZitSnxo73OCAsFczf78we9wD8+f45C9PIXMGHOBgzlbT80R92w3r0aBr6WT
         sCWm3zIllzvMbou5zkIvS2ECQZsH4/pzSAlAnZJo1RMQ7IGknz00tc2WAo+gWhGjpe8+
         s8lLn4QAYd8wPYC6urgI67w3A65M0eNcgQrL1lA5ZCyVOYFplGbW4rXOuQcxTvRW6G4j
         6g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088010; x=1706692810;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKfrsIh+is/CrcG9RcsWASRz9/Tq/yuaNYUtRHDrGYY=;
        b=CaVWn1YzB0V1pZtnoFynFxBo/0whxVg7JZd4Hr0OJEb8VTjDFx8CQic5TiqitHvvtd
         o0Zm384fGeL3uG8UgPXs9iOlmXYBy/GlSRotLrjqggD1UB/oFCypb/+gKfq6P9o5HkEA
         5yw0l4LOl4r3UKtp57a2AdnOfrEMTaO2kvjsvk6AtAVVPL2ku3sm7iCT+zX1lOvnn63S
         4rFjWrf6AwvYgJArAh1Mnq64D/xlFJkJpcodUjqhIXucpkTLfjujOVSI9Yz4ST1H2QwR
         CoXiyWf8Vtg8WxsqyD9lDxfmJmh8zYGxPbCMBBYoUuXOpOJyfeWxg+GrgK/6MpbMtVmS
         j9VQ==
X-Gm-Message-State: AOJu0YzlFnr/8BzcDH9qc6rHXdnC+4WCJ+ljyAlXyJ6H9RlPLgSjPZ27
	IKcElGrEnJV4sySaL2yFFdNbb0YBOK+bM7rDFEBKyi21uOWGwRMS1BU+gB2ZG9Q=
X-Google-Smtp-Source: AGHT+IEZUUso/GaClxXInQJERF5pL3kfwim7rmyD5VQKB34/cKfjEP6E08ieSs6LZXIkiNyWTfvtDA==
X-Received: by 2002:a2e:9c95:0:b0:2cd:5cfd:b13 with SMTP id x21-20020a2e9c95000000b002cd5cfd0b13mr332903lji.17.1706088009899;
        Wed, 24 Jan 2024 01:20:09 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d8b6:17b6:386f:c67b])
        by smtp.gmail.com with ESMTPSA id bw12-20020a0560001f8c00b00337cef427f8sm15938313wrb.70.2024.01.24.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 01:20:09 -0800 (PST)
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-6-jbrunet@baylibre.com>
 <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
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
Subject: Re: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements
 around
Date: Wed, 24 Jan 2024 10:16:17 +0100
In-reply-to: <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
Message-ID: <1jttn3w0ja.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_092013_072415_3FF3D20A 
X-CRM114-Status: GOOD (  17.38  )
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

Ck9uIFdlZCAyNCBKYW4gMjAyNCBhdCAxMDowMiwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MTY6NTNQTSArMDEwMCwgSmVyb21l
IEJydW5ldCB3cm90ZToKPj4gUG9pbnRlcnMgdG8gdGhlIGludGVybmFsIGNsb2NrIGVsZW1lbnRz
IG9mIHRoZSBQV00gYXJlIHVzZWxlc3MKPj4gYWZ0ZXIgcHJvYmUuIFRoZXJlIGlzIG5vIG5lZWQg
dG8gY2FycnkgdGhpcyBhcm91bmQgaW4gdGhlIGRldmljZQo+PiBkYXRhLiBKdXN0IGxldCBkZXZy
ZXMgZGVhbCB3aXRoIGl0Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCA2
NyArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPj4g
aW5kZXggMTVjNDQxODVkNzg0Li5mYjExM2JjOGRhMjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+IEBAIC05
MCw5ICs5MCw2IEBAIHN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbCB7Cj4+ICAJdW5zaWduZWQgaW50
IGhpOwo+PiAgCXVuc2lnbmVkIGludCBsbzsKPj4gIAo+PiAtCXN0cnVjdCBjbGtfbXV4IG11eDsK
Pj4gLQlzdHJ1Y3QgY2xrX2RpdmlkZXIgZGl2Owo+PiAtCXN0cnVjdCBjbGtfZ2F0ZSBnYXRlOwo+
PiAgCXN0cnVjdCBjbGsgKmNsazsKPj4gIH07Cj4+ICAKPj4gQEAgLTQ0Miw2ICs0MzksMTMgQEAg
c3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVscyhzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+
ICAJCXN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hhbm5lbCA9ICZtZXNvbi0+Y2hhbm5lbHNb
aV07Cj4+ICAJCXN0cnVjdCBjbGtfcGFyZW50X2RhdGEgZGl2X3BhcmVudCA9IHt9LCBnYXRlX3Bh
cmVudCA9IHt9Owo+PiAgCQlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0ID0ge307Cj4+ICsJCXN0
cnVjdCBjbGtfZGl2aWRlciAqZGl2Owo+PiArCQlzdHJ1Y3QgY2xrX2dhdGUgKmdhdGU7Cj4+ICsJ
CXN0cnVjdCBjbGtfbXV4ICptdXg7Cj4+ICsKPj4gKwkJbXV4ID0gZGV2bV9remFsbG9jKGRldiwg
c2l6ZW9mKCptdXgpLCBHRlBfS0VSTkVMKTsKPj4gKwkJaWYgKCFtdXgpCj4+ICsJCQlyZXR1cm4g
LUVOT01FTTsKPgo+IEkgZG9uJ3QgbGlrZSB0aGlzIGNoYW5nZS4gV2hpbGUgaXQgZG9lc24ndCBp
bmNyZWFzZSB0aGUgbWVtb3J5IHVzZWQsIGl0Cj4gZnJhZ21lbnRzIHRoZSB1c2VkIG1lbW9yeSBh
bmQgaW5jcmVhc2VzIHRoZSBvdmVyaGVhZCBvZiBtZW1vcnkKPiBtYW5hZ2VtZW50IGFuZCB0aGUg
bnVtYmVyIG9mIGRldm0gYWxsb2NhdGlvbnMuCj4KPiBBcmUgdGhlc2UgbWVtYmVycyBvZiBtZXNv
bl9wd21fY2hhbm5lbCBpbiB0aGUgd2F5IGZvciBhbnl0aGluZyBsYXRlcj8KCk5vdCByZWFsbHku
IEl0IGlzIGp1c3Qgbm90IHVzZWZ1bCBvbiB0aGUgU29DcyB3aGljaCBkbyB1c2UgaXQgYW5kIG5v
dAp1c2VkIGF0IGFsbCBzdGFydGluZyBmcm9tIHM0L2ExLgoKV2hhdCBhYm91dCBhIGRlZGljYXRl
ZCBzdHJ1Y3QgZm9yIHRoZSAzIGNsb2NrIGVsZW1lbnRzIGFuZCBhIHNpbmdsZQpkZXZtX2t6YWxs
b2MoKSBpbnN0ZWFkIG9mIDMgPyAKCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCgotLSAKSmVyb21l
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
