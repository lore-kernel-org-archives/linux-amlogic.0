Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E536CCD6E60
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vEaSPpIIn37VEWB0B+jOa3POBVpgJTPM1ia+JqZ6eo=; b=Mz1WTdkjwLiwhD
	GP8hbjlL9sFZ2PaiGqp93QrxiU3WCTjfuIM9rFp/1kcHXnbubhS+No7Gdw4z/dA9vGtnL2wRSo1WI
	HICBd3Q++UDeWgHHBTzDT3UBqZzeq3c5jeojQJtKmSViqC2rO2Mibfm6SCPdQV4S0dWk1Iqq8LJmy
	uKFwJhs5pHExNWRr2KO4zUOB/HLr/ZX+45UvIXOwrAgNaxrZV3xC2m/Jq81VOcc6L7lJguEv6/+Ck
	QZ2VxzaN194iSCJdBYuKqht8So7Pm8XO/MoDtqszWtwIZKYQbtpk409Ip1jyirawv3lV2pHHe7U74
	rinYByFoHqiCplweoLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNmZ-0000000Cviz-2U5J;
	Tue, 02 Jun 2026 11:59:43 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNmV-0000000Cvhq-2nJe;
	Tue, 02 Jun 2026 11:59:41 +0000
Message-ID: <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780401571;
	bh=i/CLnyw+nMQ2TgMubNSEMNs34QegnKmLA2Cz5CageE4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=JGqojs/50utTbI7LUjY19Lnf8FUKDgj0EFRtclDac5XMgqfBGPS4/eqLsDCSFsbTa
	 HFF8w2+Etw02Rhc5kwyFq44Vb0gbVs3o3YKIuJkyEcNQMk6UJ107SKk91FP5Uu3DSl
	 7cxarQKmOI5M1zO0mgujXjXSEZ4rhKx12ioXpX/A=
Date: Tue, 2 Jun 2026 13:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
 <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045940_141476_86E05FF7 
X-CRM114-Status: GOOD (  13.91  )
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

T24gNi8yLzI2IDExOjU3IEFNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiA1LzMxLzI2IDIx
OjU4LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24gNS8zMS8yNiAxOTo0OSwgUm9uYWxkIENs
YXZlYXUgd3JvdGU6Cj4+PiBPbiA1LzMxLzI2IDEwOjQxIEFNLCBEYW5pZWwgTGV6Y2FubyB3cm90
ZToKPj4+PiBPbiA1LzMxLzI2IDA5OjUxLCBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkgd3Jv
dGU6Cj4+Pj4+IEZyb206IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZy
Pgo+Pgo+PiBbIC4uLiBdCj4+Cj4+Pj4+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfTUVTT05fU00p
Cj4+Pj4+ICsKPj4+Pj4gwqDCoCBzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKm1lc29uX3NtX2dl
dChzdHJ1Y3QgZGV2aWNlX25vZGUKPj4+Pj4gKmZpcm13YXJlX25vZGUpOwo+Pj4+PiDCoMKgIGlu
dCBtZXNvbl9zbV9nZXRfdGhlcm1hbF9jYWxpYihzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3
LCB1MzIKPj4+Pj4gKnRyaW1faW5mbywKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHUzMiB0c2Vuc29yX2lkKTsKPj4+Pgo+Pj4+IERvIHlvdSByZWFsbHkg
d2FudCB0byBjb21waWxlIG1lc29uX3NtIGFzIGEgbW9kdWxlID8KPj4+Pgo+Pj4+Cj4+Pj4KPj4+
Cj4+PiBJIGRvbid0IHdhbnQsIGJ1dCBpZiBJIHNlbmQgYSBwYXRjaCB0byBjaGFuZ2UgdHJpc3Rh
dGUgdG8gYm9vbCwgaXQgd2lsbAo+Pj4gcmFpc2UgYSB3YXJuaW5nIGJlY2F1c2UgJ20nIGlzIG5v
dCB2YWxpZC4KPj4+IElmIGl0IGlzIGFjY2VwdGVkIHRvIGlnbm9yZSB0aGlzIHdhcm5pbmcsIEkg
Y2FuIHNlbmQgYW5vdGhlciBwYXRjaC4KPj4KPiAKPiBbIC4uLiBdCj4gCj4+IENvbXBpbGluZyB0
aGUgZmlybXdhcmUgYXMgYSBtb2R1bGUgbWVhbnMgaXQgbXVzdCBiZSBsb2FkZWQgYmVmb3JlIHRo
ZQo+PiBhbWxvZ2ljIHRoZXJtYWwgZHJpdmVyLCByaWdodCA/IFdoZXJlIGlzIHRoZSBkZXBlbmRl
bmN5IGRlY2xhcmVkIGluCj4+IHRoZSBtb2R1bGUgPwo+Pgo+PiBJZiB0aGUgc21fbWVzb24gaXMg
aW4gdGhlIHBsYXRmb3JtLCBpdCBzaG91bGQgYmUgc2VsZWN0ZWQgYXMgcGFydCBvZgo+PiB0aGUg
cGxhdGZvcm0ncyBjb21wb25lbnQuIE5vIG5lZWQgdG8gaGF2ZSBhbiBvcHRpb24gZm9yIHRoYXQs
IG5vID8KPiAKPiBUaGUgcXVlc3Rpb25zIHJlbWFpbiBhbmQgUFIgaXMgYXBwcm9hY2hpbmcgLi4u
CgpTb3JyeSBmb3IgdGhlIGRlbGF5LgpUaGUgbW9kdWxlIGlzc3VlIHdhcyByYWlzZWQgYnkgdGhl
IHRlc3Qgcm9ib3QgaGVyZQpodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIw
MjYwNTMxMDE1NC5ibWRNQlpISi1sa3BAaW50ZWwuY29tLwoKSWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSB3ZSBjYW4gZHJvcCB0aGlzIHN0dWIgY2hhbmdlIGFuZCBvbmx5IHVzZSBhCiJkZXBlbmRz
IG9uIE1FU09OX1NNIiBmb3IgdGhlICJBTUxPR0lDX1RIRVJNQUwiIGNvbmZpZywgaXMgaXQgY29y
cmVjdCA/CgotLSAKQmVzdCByZWdhcmRzLApSb25hbGQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
