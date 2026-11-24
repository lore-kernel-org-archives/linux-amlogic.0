Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F37A606A33E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/3iWsCD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Zi31FqE9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J7jCc2eEhc53TRGrwUVoijTlvRbWeAXLmpmrdxajXD8=; b=H/3iWsCDzKDDYbAA4O+iH1Wn3M
	UxbemiYOfXCzA6zoYqVXXmjQdFX2qDjIhasXeqLWxKG+cdHDoRy60FPnZXlXTPbtjsDsjBv6CzNwh
	GRbrmJDRnN2ebvY0ugpupZSJwL71+c+XADh5tW3zjh5KANOisZpoAiVycalE5YPHaYyfyPygrqWAF
	DLl1CJ4leEer8FsFmQIcQu7cqek79b4FibRrs+tKtqWzYVCu0ZNi9fbMVbNwWbD8NRyCUFxuL1YRH
	akI3TUGIzBPDEtcdCarZyQNfpM6PiawNjHmF8cyZIx0CgfLcrH2KJ13bQhWEnr9jAjb/KgfGFHdx5
	rEHdB4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxqn-00000007pTr-0Saz;
	Tue, 24 Nov 2026 21:14:53 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxqk-00000007pS8-45pv
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 21:14:52 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67990a45e02so5181815d50.3
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554889; cv=none;
        d=google.com; s=arc-20260327;
        b=H1pMArX1XLcUA9ISj06XaK+oIMJ11opEB781No0lgNztuyxFVYlOmTjoZ1YwaA5geY
         vWLBqzF6P0pDLfJp/MS7JNl9vw2oNU6ciwvpypq3Wg7I5a8wH6G07jwATA4hasYCV79m
         H/S685vdAiUB9ZMjCDZ3GiiZvdcgnYitwC43HznMr9e/DNO9d0awMh81Zp4B4YNAVR89
         oN3E2ZjOkbTrttwDEMqkOtKJZa6bBoo47fd2pcLpBX8nSJM4D7jzUV4n9w+httkIYFHW
         blvPEJOX5kg6aCSM1wqu0BtjMDTN7zdP648cmj1ZANMy4M0Mv8yuMTt03HefXX8xYroD
         hG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        fh=K+0QiSFAfhVaji3Cj/A6sp2Zymm4ydxh2eIT6gcUKmI=;
        b=C92tse51aAwJ6AaMVtuAqVF0IbT5wn+hHpJxRRHDPfPZQAK1VveqDfYMAVn6sCl2cp
         Qp7vUIfjE/6xvmTBKS6jfb1AMFi8ZW6z4J7I2li0yDv9ZhW0+J9tPBzyw9AHuY4sq85R
         0RawMp221qinTKPzxxpEtyqND+LKXTYg9hJ3LCk8IKRUNWcW+yb2Hh+Ace+fx0Z6Imgn
         EuiHuQz7jvZDFjEbq5fNwZeKTEI/yDl2AomRyzuOtzO8iuty+jR2zr0suhhlLRmxMSXk
         Qy4FeHKw4Lr9o0ptnJipmxPctiphxPnQM+DQYei7ut/dhOhDmuZeIJGfrvqfyzeshiN+
         srOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795554889; x=1796159689; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=Zi31FqE9OEctwkEU7K4UImOdirAGjTjm1+RM8pw9gLrWa78hKJ87TI9v3Ai10++Cct
         zsFGVUUqFJmACeqw9X36X2/oGKes3W8kS2KnvumpjbiGxG+1+HO9hkJQanJUBatv3hEb
         SF3tj6dK0eRHsLhrv7TsZQCkA8IJ0UL9Rz/k3esW17sAbutb9MbCiHpKACcGh0d91m09
         g1bIg4bYR+Ze7jwrFH73PE3Rh5Wpo1XKZmScQ8+iCwocEYBkhNIk3b24N2pFQwtxcwhe
         eQc0tcE68os/kZ0BRFJtTXDG214UFF9pfsn3vJYlKchqscIGx/dZHLuRj4BwEw0IH4JO
         Xlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554889; x=1796159689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=LCtj5SHQnukacdwtepTdS6jL11HElf9+A5AZVbclU63T9WZjmTPGDnRYGV96dkEVBZ
         N5LFpEuFq9PrBkZAfkeRUWqxCQMVIRJ+c/AK5HaiRgCk/ZMItlCV/JQJbiZJHQwruSvu
         F7LFbz/O8RUlAylbCpESe7nhut4uSO8tcQ7sIyK/PSVkLE7g6x2kMk4Bx3uluoyTineQ
         sdrdc07czi5U3Rq4z6N2t1Wewr9lI++/trVQjzM34BF/t5oM4I2DpsKYXiFnZoJAlMRk
         4Dm65zM/XGq7AnXp7eU+az6qaHS1VeFyNF8ll4ocOrRYRr7c4oj8L0jOAGxcwn0XEN9L
         zdfQ==
X-Forwarded-Encrypted: i=1; AL+hErFiFQOXdPDy0a7KpLTDW+SNkr9SwN7Zd8Sb0jGzny4KJnG0S1a/8N4iTUAdjcDXOkbvn17r9itsuPej9uYX@lists.infradead.org
X-Gm-Message-State: APuU4Z8jBNfT0yUPjfL7iH4hfQ3HW7mAG181Rg46l083rA9Hi/ZoFO1H
	KsnyOJ66sX3x3/wuHsg7tp7Kx9K53q3TIORE9D0vDKtnSu/JaM4H2udGHrBJlUeGwjHAGKMc50p
	90jIPgA69wuohw/68qm8fiX35aV6L6qI=
X-Gm-Gg: AZFdTZd6S+/FmIVIF5riyqMqJ3lP7cTmvXkHOICEhmZkRpPaa1sP0VSxIhLo6Ebe9e2
	xTx9fa1hLTqkFgeN3ndlwTU/CBpo9kbXLUTrfPSxO1hKbwDNXRqaRnHPUvKhb2WYaCVRCrMuNZ5
	dStrqhi579ThcFMLLg35wnIwpSFM83EDGJZm6dSPaaedUAXi9ysMAOs6SNy6FqtvH4m6B/04u3q
	HLTnZxFxqJ8C/sFKsRI6SS49sapxDAWAFH7bnSQIK5QWk3Cx29VUzvT26C0S+wGUWE+QOghoYH6
	SJ2nUR79GzkFdbVCmcR2ZSoJaboXxVNGyysJvkMPLf7+GGvpUX9j8KJo1W9xmCPYJPKHDIPx5Zu
	GIsoJuZ6KM4Hv/YaB61kjcwZdc31vxCAFRE26WRLLoog+1Ml32mMu1pi5yWibBQZ38BfosA==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id
 956f58d0204a3-67df42b4d7dmr8236792d50.10.1795554889394; Tue, 24 Nov 2026
 13:14:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com> <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
 <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
In-Reply-To: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:14:38 +0100
X-Gm-Features: Aa3M54rEVwCpdz6_8gjaGQEhKA7ZqL-_05evb2pOjFxPbafFazCrzB2je-Od50w
Message-ID: <CAFBinCCd==1Vf7jMCHP0VuWTNa7A5FvRfPYdk2zUaZ8eR54Z+A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>, xianwei.zhao@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131451_019886_4BCC8C9F 
X-CRM114-Status: GOOD (  36.55  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmFsZXJpbywKCitDYyBYaWFud2VpIFpoYW8sIEkgd291bGQgYXBwcmVjaWF0ZSBpdCBpZiB5
b3UgY291bGQgdGFrZSBzb21lIHRpbWUgdG8KaGVscCB1cyBjbGFyaWZ5IHRoZSBxdWVzdGlvbnMg
YmVsb3cgKG9yIHJlZmVyIHVzIHRvIGEgY29sbGVhZ3VlKS4KCk9uIE1vbiwgTm92IDE2LCAyMDI2
IGF0IDExOjI04oCvUE0gVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4gd3JvdGU6
Cj4KPiBIaSBNYXJ0aW4KPgo+ICA+PiArcHJvcGVydGllczoKPiAgPj4gKyAgY29tcGF0aWJsZToK
PiAgPj4gKyAgICBvbmVPZjoKPiAgPj4gKyAgICAgIC0gY29uc3Q6IGFtbG9naWMsZ3hiYi1hdWRp
bgo+ICA+PiArICAgICAgLSBpdGVtczoKPiAgPj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2lj
LGd4bC1hdWRpbgo+ICA+PiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsZ3hiYi1hdWRpbgo+
ICA+ICBGcm9tIHdoYXQgSSBjYW4gdGVsbCBpdCdzIGV2ZW4gYW1sb2dpYyxtZXNvbjgtYXVkaW4g
Y29tcGF0aWJsZS4KPiAgPiBBbHRob3VnaCBJIGRpZG4ndCBoYXZlIHRoZSB0aW1lIHRvIHRlc3Qg
aW4gb24gaGFyZHdhcmUgeWV0Lgo+ICA+Cj4KPiBUaGFua3MgZm9yIGNhdGNoaW5nIGl0IQo+IEFu
eSB0ZXN0aW5nIGlzIG1vcmUgdGhhbiB3ZWxjb21lLiBJIGRvbid0IGhhdmUgdGhhdCBib2FyZCBh
dCBob21lIGFuZCwKPiBiYXNlZCBvbiBteSBxdWljayBzZWFyY2gsIGl0IHNlZW1zIG5vdCBzdXBl
ciBlYXN5IHRvIGZpbmQgb25lIHRoZXNlIGRheXMuCj4KPiAgPiBbLi4uXQo+ICA+PiArICAgIGF1
ZGlvLWNvbnRyb2xsZXJAYTAwMCB7Cj4gID4+ICsgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMs
Z3hiYi1hdWRpbiI7Cj4gID4+ICsgICAgICByZWcgPSA8MHhhMDAwIDB4MTQ4PjsKPiAgPiBJIGJl
bGlldmUgdGhlIGF1ZGluIHJlZ2lzdGVycyBhcmUgMHgzMDAgd2lkZS4KPiAgPiBCb3RoLCBHWEwg
ZGF0YXNoZWV0IFswXSBwYWdlIDQzIGFuZCBHWE0gZGF0YXNoZWV0IFsxXSBwYWdlIDQ4IGNsYWlt
Cj4gID4gdGhhdCB0aGUgcmVnaXN0ZXIgYXJlYSBpcyAweDEwMCB3aWRlLgo+ICA+IFRoZSBsYXN0
IGRvY3VtZW50ZWQgcmVnaXN0ZXIgd2l0aCBBVURJTl8gcHJlZml4IGlzIEFVRElOX0ZJRk8yX1BJ
T19SREgKPiAgPiA9IDB4YjguIFRoZSBkYXRhc2hlZXQgWzBdIChwYWdlIDM5NSkgbGlzdHMgcmVn
aXN0ZXIgbnVtYmVycyBkaXZpZGVkIGJ5Cj4gID4gNCwgc28gdG8gZ2V0IHRoZSBhY3R1YWwgYWRk
cmVzcyBpbiB0aGUgbWVtb3J5IG1hcCB3ZSBuZWVkIHRvIG11bHRpcGx5Cj4gID4gaXQgYnkgNCwg
d2hpY2ggZ2l2ZXMgMHgyZTAuCj4gID4gVGhlIDMyLWJpdCBTb0MgdmVuZG9yIGtlcm5lbCBbMl0g
aGFzIGEgaGVhZGVyIHRoYXQgc3RhdGVzOiAjZGVmaW5lCj4gID4gQVVESU5fQUREUl9FTkQgMHgy
OGJmIChzYW1lIGFzIGluIGRhdGFzaGVldCwgd2UgbmVlZCB0byBtdWx0aXBseSB0aGlzCj4gID4g
YnkgNCkuCj4KPiBJIGtub3cgdGhhdCB0aGUgcmVnaXN0ZXIgbGF5b3V0IGluIHRoZXNlIFNvQyBp
cyBhIGJpdCBtZXNzeSwgc28gbGV0IG1lCj4gZXhwbGFpbiBob3cgSSBnb3QgdG8gdGhlIDB4MTQ4
IHRoYXQgSSB3cm90ZSBhYm92ZS4KPgo+IFdoZW4gd29ya2luZyBhdCB0aGlzIGRyaXZlciBJIHVz
ZWQgdGhlIFMwOTUgYW5kIFM5MDVYIG1hbnVhbHMgdGhhdCBJCj4gZm91bmQgb25saW5lLCBidXQg
YmFzZWQgb24gdGhlIGxpbmsgeW91IHNoYXJlZCBmb3IgdGhlIFM5MTIsIEkgd291bGQgc2F5Cj4g
aXQncyB0aGUgc2FtZSB3aGVuIGl0IGNvbWVzIHRvIEFVRElOLgo+Cj4gVXNpbmcgWzBdIGFzIHJl
ZmVyZW5jZSwgdGhlIGhpZ2hlc3QgcmVnaXN0ZXIgYmVpbmcgbWVudGlvbmVkIGluIHRoZQo+IEFV
RElOIGNoYXB0ZXIgaXMgQVVEX1JFU0FNUExFX1NUQVRVUyB3aG9zZSBvZmZzZXQgaXMgMHgzMDQg
KGkuZS4gMHhjMSAqCj4gNCkuIEhvd2V2ZXIgSSBub3RpY2VkIHRoYXQgYmVmb3JlIHRoYXQgdGhl
cmUgYXJlIGEgbG90IG9mIHJlZ2lzdGVycwo+IHdob3NlIG5hbWUgZG9lc24ndCBzdGFydCB3aXRo
IEFVRElOXywgYnV0IHJhdGhlciB3aXRoIEFVRE9VVF8sIFBDTU9VVF8sCj4gUENNSU5fLgo+IFRo
ZSBmaXJzdCBjb250aWd1b3VzIGJsb2NrIG9mIEFVRElOXyBzdG9wcyBhdCBBVURJTl9GSUZPX0lO
VCB3aGljaCBpcwo+IDB4MTQ4ICg9IDB4NTIgKiA0KS4gVGhlIG90aGVyIEFVRElOXyBibG9jayB5
b3UgbWVudGlvbmVkIGlzIGJldHdlZW4KPiBBVURJTl9GSUZPMF9QSU9fU1RTIChhdCAweDJjMCkg
YW5kIEFVRElOX0ZJRk8yX1BJT19SREggKGF0IDB4MmUwKS4KWW91ciBhcHByb2FjaCBpcyBsb2dp
Y2FsLiBBbmQgSSBoYXZlIG5vIHdheSBvZiBwcm92aW5nIG15IHRoZW9yeS4KU28gdGhlIHF1ZXN0
aW9uIGZvciBzb21lb25lIHdpdGggYWNjZXNzIHRvIGJldHRlciBkb2N1bWVudGF0aW9uIG9yIHRo
ZQphY3R1YWwgaGFyZHdhcmUgZGVzY3JpcHRpb24gaXM6Ci0gaG93IGJpZyBpcyB0aGUgQVVESU4g
SVAgYmxvY2sgcmVnaXN0ZXIgc3BhY2U/Ci0gd2hhdCBpbnB1dHMgYXJlIHJvdXRlZCB0byB0aGUg
QVVESU4gSVAgYmxvY2sgdGhhdCBuZWl0aGVyIFZhbGVyaW8Kbm9yIEkgaWRlbnRpZmllZCBzbyBm
YXIgKG9uZSByZXNldCBsaW5lLCBvbmUgY2xvY2sgaW5wdXQsIG9uZQppbnRlcnJ1cHQpPwoKPiAg
PiBJJ20gYnJpbmdpbmcgdGhpcyB1cCBiZWNhdXNlIGR0LWJpbmRpbmdzIGFyZSBzdXBwb3NlZCB0
byBiZSBjb21wbGV0ZS4KPiAgPiBTbyBldmVuIGlmIHRoZSBkcml2ZXIgZG9lc24ndCB1c2UgYSBy
ZXNvdXJjZSB5ZXQgd2UncmUgc3VwcG9zZWQgdG8KPiAgPiBzdGlsbCBkZXNjcmliZSBpdC4KPgo+
IEkgcGVyZmVjdGx5IGFncmVlIHdpdGggdGhpcywgYnV0IGF0IHRoZSBzYW1lIHRpbWUgSSB0aG91
Z2h0IHRoYXQKPiBpbmNsdWRpbmcgcmVnaXN0ZXJzIHdoaWNoIHBvdGVudGlhbGx5IGRvIG5vdCBi
ZWxvbmcgdG8gQVVESU4gd2FzCj4gZGFuZ2Vyb3VzIGluIHRoZSBvdGhlciBkaXJlY3Rpb24sIGku
ZS4gd2UgY292ZXIgYSB0b28gbGFyZ2UgYXJlYSB0aGF0Cj4gd2lsbCBiZSBoYXJkIHRvIHVzZSBp
biB0aGUgZnV0dXJlIGlmL3doZW4gd2Ugd2FudCB0byB1c2UgaXQgYW5kIHdlCj4gcmVhbGl6ZSBp
dCdzIHJlYWxseSBub3QgcGFydCBvZiBBVURJTi4KTXkgY29uY2VybiBpcyBhY3R1YWxseSB0aGF0
IHRoZSBBVURJTiBoYXJkd2FyZSBibG9jayBzcGFucyAweDMwMCAob3IKY2xvc2UgdG8gaXQpIGFu
ZCB3ZSdsbCBmaW5kIG91dCBsYXRlciB0aGF0IHRoZXJlJ3MgYSBiaXQgdGhhdCB3ZSBuZWVkCnRv
IHRvZ2dsZSB3aGljaCBpcyBvdXRzaWRlIG9mIHRoZSAweDE0OCBhcmVhIGNvdmVyZWQgYWxyZWFk
eS4KRXZlbiB3b3JzZTogd2hhdCBpZiB3ZSBwdXQgYW5vdGhlciByZWdpc3RlciBhcmVhIGFmdGVy
IEFVRElOIGFuZCB0aGVuCmZpbmQgb3V0IHRoYXQgdGhpcyB0aGVvcmV0aWNhbCBiaXQgc2l0cyBp
biB0aGUgc2Vjb25kIHJlZ2lzdGVyIGFyZWEuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
