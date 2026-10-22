Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29241606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvnhvwXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6iZiZinAGKFG6bKapFnOIgTXe3pauLDleIWtFtOv0BQ=; b=vvnhvwXyFrGb2DJHjdyVgrFoE/
	U+7iKec2iryGRZCMg1/uNNoWtrWL4V7EiFVjahQvM7/M7PpqEssoimv0ubLQWFdEVBXckVdfPbgXn
	b19nCCEInuaiV9c4cSgEaA/NwD01RbjxzfQnx0b9GfnhNWdObHI74cUaY5J2tRTOkLc1WrmZ8O1CM
	canLnfe41J70LozYjUw3bKfjkT+meaHVD0i16VmJY1XRHvd4sVlH72Y4LYrzxeCB9L/J3U75YYYHr
	tqEDEcz+LjM9ZgDjFXh/7PTuxLCb65D7uMVZVPLV7gDnmJCAIrmzzYnyxcNmZpAQnGrWLLuPcHt5g
	JLrpnTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwaq-0000000EaIl-2cdK;
	Thu, 22 Oct 2026 17:28:44 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwao-0000000EaI2-36XL
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:28:44 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso838145e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690120; x=1793294920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
        b=tW8lsVs0Pvjxg2xMjN1H0VvWc71+EPLL0pK2ttmq51SwPo2/fhhl9v1Q5cuCorkG3z
         BW4U5ImsqXdbHVOeysTgE5Nq/rCuhDX6/yaoC7BBhSQydyDhCPJUmsX7U62l8y7qOp0v
         djfQcG4kscnNNvObFObolQoE9QfFIehC5wj+1SX7fAzlM1vlsLkG7BIniv2rHT9EYX1u
         SVFlmGrGD1tBGQMGXX+fHgK2KvFuaKnDWmN7l0U12d6nGWQpF/oOMC+AXS+svHdbBUoZ
         ODph6URkxKHIq0X/dR2c1rEzWWyvUbsoRITfZf+OrLOQYJejHCeJ6HscOh1tS5O76UWn
         kviA==
X-Forwarded-Encrypted: i=1; AKwUvBynIzBiXdZ5SqmgN4Jgo/PWasQu/Sf3UyXFbNNiSJWKOK9bLD810IBn5ag2OfdiN+H3M/2/Nl98Uwq4QFpw@lists.infradead.org
X-Gm-Message-State: AFq9FYIfGJFQQrxeSbOx1zR1rYCF3PYmSJgKQR2fLgTPX0Y7u+9NDqGT
	DQmw6BpZ/AnA/S31IG86/KT34bhzkXeixnEozw/O0WNxDEyeXbX2d7pv
X-Gm-Gg: AYBFou2Shkm9dend+GDGZa/hxhJXH6wb/0+5X63xlG90k1TzloAZyAptiXiKxzpt07B
	qwhA7IdRHa0ymAKkhj1LIpCIDag1on1VO2Xm90Okh6o6e6PtjjMb45d4ntoaG/YO5I4H7FGZtj6
	V7KP9m1zS1ZmZbpV0i8gLDvoNPGsjbThvCMcb4KLpHsuod1O52uWlmrTgCXmDX9xcIuTPT+E5BT
	NG6/0SB7FQmMHqVKNuGEU4LsgfViwqFw1aVdt3GynQsVKw34qrB3aW0uolk1n0uvyte/STKpD3S
	esKcmSNDQAB3v4hfXYGtuw+vkUN7WeVRUlut8PN6YbIjnhQRvQdI7gcHJM6OaxJvWp2qKAHFr62
	6/QxIhn5ulUYyH9DtRB7bpPsupmytMEFD3Pe12lSfaSVeZxh2G/py4uYPuqU+yJssOpUnknct6R
	ykhTKQAODCAZIXdVC296N1XWZT/YZSo6LXwbU3y+6AwSEDMrs18dutMEKcSqjpthuLgUsC2WxaG
	gbLoj0nIYGts5AS+e+WVgopoXoHswvzrf2iY0v9vJLf4iqWsPSklRmkiNK0qQ9iCCo2m7jJaejI
	YiGu+xMdTA==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr52278535e9.8.1792690120279;
        Thu, 22 Oct 2026 10:28:40 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm11491635e9.7.2026.10.22.10.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:28:39 -0700 (PDT)
Message-ID: <1ca9d46b-02aa-41bf-b184-2a62f8a284bb@linux.com>
Date: Thu, 22 Oct 2026 18:28:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_102842_971109_0F5DDA91 
X-CRM114-Status: GOOD (  21.17  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTAvMjAyNiAyMjo0OSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBMdWNh
cywKPiAKPiAkc3ViamVjdCBjYXVnaHQgbXkgZXllIGJlY2F1c2UgSSBkaWRuJ3QgdW5kZXJzdGFu
ZCB3aHkgdGhlcmUncyBhICJUNwo+IHdheSIgZm9yIGFkZGluZyBSR01JSSBkZWxheXMgc2luY2Ug
d2Ugc2hvdWxkIGJlIGZvbGxvd2luZyBhIHN0YW5kYXJkLgo+IFBhdGNoIDgvOCBpbiB0aGlzIHNl
cmllcyBkb2N1bWVudHMgdGhlIHN0YW5kYXJkLiBDYW4geW91IHBsZWFzZSBmaW5kIGEKPiBtb3Jl
IHN1aXRhYmxlICRzdWJqZWN0IGZvciB0aGlzIHBhdGNoPwoKT2suCj4gCj4gT24gU2F0LCBPY3Qg
MTAsIDIwMjYgYXQgMTI6NTnigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdy
b3RlOgo+IFsuLi5dCj4+ICAgc3RhdGljIGludCBtZXNvbjhiX2luaXRfcmdtaWlfZGVsYXlzKHN0
cnVjdCBtZXNvbjhiX2R3bWFjICpkd21hYykKPj4gICB7Cj4+ICAgICAgICAgIHUzMiB0eF9kbHlf
Y29uZmlnLCByeF9hZGpfY29uZmlnLCBjZmdfcnhjbGtfZGx5LCBkZWxheV9jb25maWc7Cj4+IEBA
IC00MTEsMzIgKzQ1NSwzNCBAQCBzdGF0aWMgaW50IG1lc29uOGJfZHdtYWNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAgICAgICAgZHdtYWMtPmRldiA9ICZwZGV2LT5k
ZXY7Cj4+ICAgICAgICAgIGR3bWFjLT5waHlfbW9kZSA9IHBsYXRfZGF0LT5waHlfaW50ZXJmYWNl
Owo+Pgo+PiAtICAgICAgIC8qIHVzZSAybnMgYXMgZmFsbGJhY2sgc2luY2UgdGhpcyB2YWx1ZSB3
YXMgcHJldmlvdXNseSBoYXJkY29kZWQgKi8KPj4gLSAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVh
ZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsICJhbWxvZ2ljLHR4LWRlbGF5LW5zIiwKPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmR3bWFjLT50eF9kZWxheV9ucykpCj4+IC0gICAg
ICAgICAgICAgICBkd21hYy0+dHhfZGVsYXlfbnMgPSAyOwo+IFRoZSAybnMgZGVmYXVsdCB2YWx1
ZSBpbiBjYXNlICJhbWxvZ2ljLHR4LWRlbGF5LW5zIiBpcyBhYnNlbnQgaGFzbid0Cj4gYmVlbiBu
ZWNlc3Nhcnkgc2luY2UgY29tbWl0IDA5M2QyM2RiNGZmZiAoIkFSTTY0OiBkdHM6IGFtbG9naWM6
IGFkZAo+IHRoZSBldGhlcm5ldCBUWCBkZWxheSBjb25maWd1cmF0aW9uIikuCj4gVGhhdCBjb21t
aXQgaXMgcGFydCBvZiB2NC4xMi4gU28gYm9hcmRzIHVzaW5nIFJHTUlJIGFuZCBhIC5kdGIgd2l0
aG91dAo+IHRoYXQgcHJvcGVydHkgaGF2ZW4ndCBiZWVuIHVwZGF0ZWQgaW4gbW9yZSB0aGFuIDkg
eWVhcnMuCk9rLCBzbyBmb3IgdjQgdGhlIGNvZGUgaXMgbW92ZWQgcHJvYmUgaW50byB0aGUgZnVu
Y3Rpb24gb25seSB0aGUgb2xkZXIgClNvQ3MgdXNlLCBzbyBpdCBpcyBpc29sYXRlZCB0aGVyZSBh
bmQgdGhlIFQ3IHBhdGggbmV2ZXIgc2VlcyBpdC4gV2UgY2FuIApkcm9wIGl0IGZ1dHVyZSBwYXRj
aC4KCj4gCj4gWy4uLl0KPj4gLSAgICAgICByZXQgPSBtZXNvbjhiX2luaXRfcmdtaWlfZGVsYXlz
KGR3bWFjKTsKPj4gKyAgICAgICBpZiAoZHdtYWMtPmRhdGEtPm1hY19hcHBsaWVzX2R0X2RlbGF5
cykKPj4gKyAgICAgICAgICAgICAgIHJldCA9IG1lc29uX2R3bWFjX2luaXRfZHRfZGVsYXlzKGR3
bWFjLCBwbGF0X2RhdCk7Cj4+ICsgICAgICAgZWxzZQo+PiArICAgICAgICAgICAgICAgcmV0ID0g
bWVzb244Yl9pbml0X3JnbWlpX2RlbGF5cyhkd21hYyk7Cj4gIEZyb20gdGhlIGRpc2N1c3Npb24g
aW4gdjIgSSBjb3VsZG4ndCB1bmRlcnN0YW5kIHRoZSBvdmVyYWxsIHdheSBmb3J3YXJkLgo+IEkg
Z2V0IHRoYXQgbmV3IGNvbXBhdGlibGUgc3RyaW5ncyBzaG91bGQgbm90IHJlbHkgb24gb2xkLCBp
bmNvcnJlY3QKPiBiZWhhdmlvci4gQnV0IHdoYXQncyB0aGUgcGF0aCBmb3J3YXJkIGZvciB0aGUg
b3RoZXIgU29Dcz8KPiAKPiBbLi4uXQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb244Yl9k
d21hY19kYXRhIG1lc29uX3Q3X2R3bWFjX2RhdGEgPSB7Cj4+ICAgICAgICAgIC5zZXRfcGh5X21v
ZGUgPSBtZXNvbl9heGdfc2V0X3BoeV9tb2RlLAo+PiAtICAgICAgIC5oYXNfcHJnX2V0aDFfcmdt
aWlfcnhfZGVsYXkgPSB0cnVlLAo+PiAgICAgICAgICAuaGFzX3BpcGVsaW5lX2NsayA9IHRydWUs
Cj4+ICsgICAgICAgLm1hY19hcHBsaWVzX2R0X2RlbGF5cyA9IHRydWUsCj4gVGhpcyBzaG91bGQg
YmUgYSBjYWxsYmFjayBmdW5jdGlvbiBwb2ludGVyIChhcHBseV9kZWxheXMgb3Igc2ltaWxhciwK
PiB0byBtYXRjaCBzZXRfcGh5X21vZGUpIHVubGVzcyB0aGVyZSdzIGEgd2F5IHRvIG1ha2Ugb2xk
ZXIgU29DcyBhbHNvCj4gZm9sbG93IHRoZSAiY29ycmVjdCIgUkdNSUkgZGVsYXkgc3BlY2lmaWNh
dGlvbi4KCkFncmVlZC4gVjQgd2lsbCBkbyBpdC4+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRp
bgpUaGFua3MKTHVjYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
