Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0A3CA5FCE
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcGsz45YsCjFX9b5Nsog/HF5nHp9ULfxbOZVqmaMc/k=; b=GBhnTHogQ/tIaq
	jjlMXyFVBjlV6GG8Y6IZblSl38qlie8GtcqzhRLnMIUpcRFBNXIgK7K+WOhguu5PANCgQuz1PAGlt
	9jbzcGR/iQD2XfObBVg3QZBZYc7nQn0QSoGp/8mDzPEQJXhseSqYW+uQRHhtSR5gZpUyoUfhNASy0
	O+oDbtBbKPj41gHoXPBORHfqkwejXvFx62YUv6ZV+GGrlPwZxSkSQiVc0PBCxZ1Zz41I/tmbyrhaN
	ZMBbg8rgipf6gnbTFvoIWk6UZ2EL66GgCMskTCDajUwvzc8x+hGqi0eswnpg9Iyj1IJ3LGnsyjFFO
	NypHieZ+CVgQaqjvbkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOFQ-0000000Ezzu-3do0;
	Sun, 04 Oct 2026 15:35:32 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOFN-0000000Ezz2-2dpu
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 15:35:30 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso8566085e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 08:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128127; x=1791732927;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwyDMGKhrQUUcZw1khziLYF4shBI37cIxufrD9bOvf4=;
        b=T19RmQ8m3MnjnM1ZWSBx3GoJ84H/jvlLuvdReJcjOtEgVQ5NQciwLm0qc8/xG8cZvK
         iGtLWz9yaaT7rgckf66NMcMI934nalVMntwLbULEUDPKiLCdss33ao8jLa5nUdgXEnNB
         8HnuhadeQnMfYmp7ay63V3GH3eHJpsHKs4qCnTdVxGgqZqi9QZBTHhHBcbaCYx2t6vWf
         uLu67n0mz9orFQuqfPF3FmI3r88Ez4Sas4xCZalhfDRNg60NpVx3/CZLYRJ+MiooRKjL
         1pRohOBYMbASO1LzfZHXqyIiex7CHYxsdYJIpMhq3KkiiZovyK5gZl0+QalyjtSuBbBo
         SG8A==
X-Forwarded-Encrypted: i=1; AKwUvBxGvCob3+qTGZXaOt4KHCH+01PolBYnA5ee/E/1pi86amycu7g+SZB64nVDJZd26zE0d1Rp6eMpU5W53IPH@lists.infradead.org
X-Gm-Message-State: AFuF++kAgmSiBMPgWEVG34ZCLtTnGKVZCMIijQiD9eHyPDL1YN1ZD2bG
	nXktHbQHLQHZTNCj72abjyG6uPy758emoAk1NvVvzmU64X41cwAvMuJC
X-Gm-Gg: AYBFou3GL1qhexk6f31Blcx+riPFKlp0F2PLjWFISGqxvAV6H2C70w3a/IYd5RWz771
	tqA6czbqoJnRp9b15qmalhmjMmPh0P+PyIR9UkfhSowb2TwbanH0saX2PB0nKALvR8tQt1QErR2
	Md0pYxuXohn1Jg4EKHs+Vb3wse7pu05Do7D6pd1pjB9ylbMUVsR8tX1IYFds42WyqwilIhEaNac
	kTskYflqJW4qb8HQkRPMfN+dN0RjYm7FYAyUoyPxMYi5LZLkgUNsmjvGClRBY/JJyLlHiP2H42B
	r61r3s7rPVaaBeOKALRty5UDB+CwL+v5QzEcDaapjIWGZUJmq7vyJK8ADNHRbKfErLJoRg/823P
	C3RAOIUP18Gr19pWNT1ZTTmv91g+Fzm8u0weEMMw2zkE4uOQlJm/H2qHH8PwavYbsyob8OSgLra
	p6Av8v0/QKO/ogtSILtixaGspzbD79TSz86QjYi8rOK2lJEAnlT5GPbGbt6//GWzOqPMbaVVIVB
	qHSNNmgY+U/qhkP94O/3kllYfbF
X-Received: by 2002:a05:600c:348d:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a1680f405fmr76449125e9.25.1791128127431;
        Sun, 04 Oct 2026 08:35:27 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm310617265e9.1.2026.10.04.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:35:26 -0700 (PDT)
Message-ID: <54b064f8-8e01-44da-be40-4125620ff9d0@linux.com>
Date: Sun, 4 Oct 2026 16:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
From: Lucas Tanure <tanure@linux.com>
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
 <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Language: en-US
In-Reply-To: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_083529_694709_F27741CF 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDQvMTAvMjAyNiAxNTowNiwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIDI0LzA5LzIwMjYg
MTg6MjEsIENvbm9yIERvb2xleSB3cm90ZToKPj4gT24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMDU6
NTE6MDlBTSArMDAwMCwgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSAKPj4gd3JvdGU6Cj4+PiBG
cm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Cj4+PiBBZGQg
dGhlIFQ3IGNvbXBhdGlibGUgdG8gdGhlIE1lc29uIERXTUFDIGJpbmRpbmcuCj4+Pgo+Pj4gVGhl
IFQ3IERXTUFDIGNvbnRyb2xsZXIgcmVxdWlyZXMgdGhlIGZvbGxvd2luZyBjb21wYXRpYmxlIGNv
bWJpbmF0aW9uOgo+Pj4KPj4+IGFtbG9naWMsdDctZHdtYWMKPj4+IGFtbG9naWMsbWVzb24tYXhn
LWR3bWFjCj4+PiBzbnBzLGR3bWFjLTQuMDAKPj4+Cj4+PiBBZGQgYSBjb25kaXRpb25hbCBzY2hl
bWEgY2hlY2sgdG8gZW5mb3JjZSB0aGlzIGNvbXBhdGlibGUgY29tYmluYXRpb24KPj4+IHdoZW4g
YW1sb2dpYyx0Ny1kd21hYyBpcyB1c2VkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkg
WmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiDCoCAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1swqDCoMKgIHwgMTcgKysr
KysrIAo+Pj4gKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvYW1sb2dpYyxtZXNvbi0gCj4+PiBkd21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLSAKPj4+IGR3bWFjLnlhbWwKPj4+IGlu
ZGV4IDVjOTE3MTZkMWYyMS4uYjUyOWNhNTU3N2E5IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNv
bi1kd21hYy55YW1sCj4+PiBAQCAtMjMsMTEgKzIzLDI0IEBAIHNlbGVjdDoKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCAtIGFtbG9naWMsdDctZHdtYWMKPj4+IMKgwqDCoCByZXF1aXJlZDoKPj4+IMKgwqDCoMKgwqAg
LSBjb21wYXRpYmxlCj4+PiDCoCBhbGxPZjoKPj4+IMKgwqDCoCAtICRyZWY6IHNucHMsZHdtYWMu
eWFtbCMKPj4+ICvCoCAtIGlmOgo+Pj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPj4+ICvCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb250YWluczoK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiBhbWxvZ2ljLHQ3LWR3bWFjCj4+PiAr
wqDCoMKgIHRoZW46Cj4+PiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGNvbXBhdGlibGU6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNucHMsZHdtYWMtNC4wMAo+Pgo+PiBUaGlzIGlz
IG5vdCBob3cgZmFsbGJhY2sgY29tcGF0aWJsZXMgYXJlIGRlc2NyaWJlZC4KPj4KPj4gSW5zdGVh
ZCBvZiBkb2luZyB0aGlzLCB3aGljaCBhZmZlY3RzIGFsbCBvdGhlciBjb21wYXRpYmxlcyBpbiB0
aGUgZmlsZQo+PiBieSBhbGxvd2luZyBkd21hYy00LjAwIGZvciBhbGwgZGV2aWNlcywgcGxlYXNl
IGRvIHRoaXMgdGhlIG5vcm1hbCB3YXkuCj4+IGR3bWFjIGlzbid0IHNwZWNpYWwsIGl0J3MganVz
dCB0aGlzIGJpbmRpbmcgdGhhdCdzIHdlaXJkIQo+PiBDYW4gd2hhdHMgY3VycmVudGx5IGluIHRo
ZSBiaW5kaW5nIChiZWZvcmUgdGhpcyBwYXRjaCkgYmUgbGFyZ2VseQo+PiByZXBsYWNlZCBieSBq
dXN0IGRvaW5nOgo+PiDCoMKgIGNvbXBhdGlibGU6Cj4+IMKgwqDCoMKgIG9uZU9mOgo+PiDCoMKg
wqDCoMKgwqAgLSBpdGVtczoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbjhiLWR3bWFjCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc25wcyxkd21hYy0zLjcwYQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzbnBzLGR3bWFjCj4+IMKgwqDCoMKgwqDCoCAtIGl0ZW1z
Ogo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uNi1kd21hYwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gYW1sb2dpYyxtZXNvbjhtMi1kd21hYwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAt
IGNvbnN0OiBzbnBzLGR3bWFjCj4+Cj4+IFlvdSdsbCBoYXZlIHRvIGNoZWNrIHRoaXMgeW91cnNl
bGYgYWdhaW5zdCB0aGUgYW1sb2dpYyBkZXZpY2V0cmVlcyBhbmQKPj4gc2VlIGlmIHRoaXMgaXMg
Y29ycmVjdCwgYnV0IHdpdGggdGhpcyB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gYWRkIHlvdXIgbmV3
Cj4+IGRldmljZSB3aXRob3V0IGRvaW5nIGFueXRoaW5nIHNwZWNpYWwuCj4gCj4gSSBoYXZlIHRo
ZSBzYW1lIHBhdGNoIGluIG15IFQ3IHdvcmsgYW5kIGNoZWNrZWQgaXQgYWdhaW5zdCB0aGUgYW1s
b2dpYyAKPiBkZXZpY2UgdHJlZXM6IG1lc29uNiBhbmQgbWVzb244bTIgdXNlIHRoZSB0d28gZW50
cnkgZm9ybSwgdGhlIHJlc3QgYWRkIAo+IHNucHMsZHdtYWMtMy43MGEuIGR0X2JpbmRpbmdfY2hl
Y2sgYW5kIGR0YnNfY2hlY2sgYXJlIGNsZWFuLiBUaGUgZXhhbXBsZSAKPiBuZWVkcyBmaXhpbmcu
Cj4gCj4gWGlhbndlaSwgZnJvbSBteSBWSU00OiB0aGUgTUFDIHJlcG9ydHMgU3lub3BzeXMgSUQg
MHg1MSwgRFdNQUNfQ09SRV81XzEwCj4gaW4gY29tbW9uLmgsIHNvIHRoZSBjb3JlIGlzIDUuMTBh
LCBub3QgNC4wMC4gQW5kIHRoZSBjb250cm9sbGVyIHJlYWNoZXMKPiBEUkFNIHRocm91Z2ggYSBw
aXBlbGluZSBzdGFnZS4gTm90aGluZyBjbGFpbXMgaXRzIGdhdGUsIHN5c19hbXBpcGVfZXRoLAo+
IHNvIGNsa19kaXNhYmxlX3VudXNlZCBzd2l0Y2hlcyBpdCBvZmYuIE15IG5vZGUgbGlzdHMgaXQg
YXMgYSBmb3VydGgKPiBjbG9jay4gRG9lcyB0aGUgQU40MDAgZGlmZmVyPwo+IAo+IEkgd2lsbCBz
ZW5kIG15IHNlcmllcyB0b2RheSBzbyB0aGUgY29kZSBpcyBvbiB0aGUgbGlzdC4gTm90IGEgcmFj
ZTogSQo+IHdpbGwgZHJvcCBvciByZWJhc2Ugd2hhdGV2ZXIgb3ZlcmxhcHMgb25jZSB5b3UgdGVs
bCBtZS4KPiAKPiBUaGFua3MsCj4gTHVjYXMKTXkgRXRoZXJuZXQgcGF0Y2hlcyAKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDI2MTAwNDE0NDA0Ni4zOTE0NDQtMS10YW51
cmVAbGludXguY29tIAoKCj4gCj4+Cj4+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKPj4KPj4g
VGhhbmtzLAo+PiBDb25vci4KPj4KPj4+IMKgwqDCoCAtIGlmOgo+Pj4gwqDCoMKgwqDCoMKgwqAg
cHJvcGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gQEAgLTM4
LDYgKzUxLDcgQEAgYWxsT2Y6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBh
bWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGFtbG9naWMsdDctZHdtYWMKPj4+IMKgwqDCoMKgwqAgdGhlbjoKPj4+IMKgwqDC
oMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+PiBAQCAtOTMsNiArMTA3LDcgQEAgYWxsT2Y6Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdt
YWMKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tYXhn
LWR3bWFjCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLHQ3LWR3bWFj
Cj4+PiDCoMKgwqDCoMKgIHRoZW46Cj4+PiDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJ4LWludGVybmFsLWRlbGF5LXBzOgo+Pj4gQEAgLTEzOSw4ICsx
NTQsMTAgQEAgcHJvcGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2lj
LG1lc29uLWd4YmItZHdtYWMKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1l
c29uLWF4Zy1kd21hYwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24t
ZzEyYS1kd21hYwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsdDctZHdtYWMKPj4+
IMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+PiDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+Pj4gK8KgwqDC
oMKgwqDCoMKgIC0gc25wcyxkd21hYy00LjAwCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzbnBz
LGR3bWFjLTMuNzBhCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzbnBzLGR3bWFjCj4+Pgo+Pj4g
LS0gCj4+PiAyLjUyLjAKPj4+Cj4+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
