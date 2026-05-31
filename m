Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACB4CD6E52
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMngtr9YfjHuBwwX2Iww9hyHXTUcGYS1nDrrvFW/bLE=; b=YB+2b3bJ45CNmh
	WiBdCWl1FtCZLZd3VRPlZfqTH/jUMi/DsHuFajT68UPeA5uW3sZ2/J4Gg+O6RyqvhtTqCQ7y97hBo
	sZMw1oGppiMsxgbyNydRtlIq3st1B3RaBlK8i7sLMogcVrJ0UATCVixPLI1hePnuZDaofR4FLR6Rm
	9QiZv5KR2U7CO8aN+G6p9ryniEg3syRGq2mEAW3mVecfDI4g8LxBkXN6vHWcz1OL3lMgGbYNnzfDL
	FVNWdlM7kRoGcJGdaFj5mdKOwhvU2j20IcIYrpSIh1t5dZ2ZIwJM5i0OD3nDSXNUOpBmW5pN6HY3g
	/R5xMhbOEsKyEcMhQlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkIo-00000009npu-1JiY;
	Sun, 31 May 2026 17:50:22 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkIl-00000009npN-2EUF;
	Sun, 31 May 2026 17:50:21 +0000
Message-ID: <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780249805;
	bh=JQpEJWohU7u2PUrSQq5dK/MO03Qv9YI8notJ93T8T3k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=oJVEYD73f39ZQ8iUe8tM1mLjjbNxz4Aw2wpFEEW4h+E5It9PvmKzmqKDYSgM8dRCW
	 QmdyKnjKhbFuzVWjJHlmL4/ekhXpHSz8AXid6Fwhnpo5Iw5p+qp91UmNnJKACqV0KD
	 nK/0i3YsiVZdmB2M/Yy7X0I6YpjPuYYVPFIVp+C0=
Date: Sun, 31 May 2026 19:49:55 +0200
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
Content-Language: en-US
In-Reply-To: <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_105020_014105_26310A36 
X-CRM114-Status: GOOD (  14.34  )
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

T24gNS8zMS8yNiAxMDo0MSBBTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gNS8zMS8yNiAw
OTo1MSwgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBSb25hbGQg
Q2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4KPj4gQWZ0ZXIgbWVyZ2luZyB0
aGUgdGhlcm1hbCB0cmVlLCBsaW51eC1uZXh0IGJ1aWxkIChhcm1fbXVsdGlfdjcKPj4gZGVmY29u
ZmlnKSBmYWlsZWQgbGlrZSB0aGlzOgo+Pgo+PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2
ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLm86IGluIGZ1bmN0aW9uCj4+IGBhbWxvZ2ljX3Ro
ZXJtYWxfcHJvYmVfc20nOgo+PiAvdG1wL25leHQvYnVpbGQvZHJpdmVycy90aGVybWFsL2FtbG9n
aWNfdGhlcm1hbC5jOjE5NjooLnRleHQrMHgyZjQpOgo+PiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBtZXNvbl9zbV9nZXQnCj4+IGFybS1saW51eC1nbnVlYWJpaGYtbGQ6IC90bXAvbmV4dC9idWls
ZC9kcml2ZXJzL3RoZXJtYWwvCj4+IGFtbG9naWNfdGhlcm1hbC5jOjIwNTooLnRleHQrMHgzMjAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvCj4+IGBtZXNvbl9zbV9nZXRfdGhlcm1hbF9jYWxpYicK
Pj4KPj4gQWRkIGlubGluZSBzdHViIGltcGxlbWVudGF0aW9ucyBvZiBtZXNvbl9zbV9nZXQoKSBh
bmQKPj4gbWVzb25fc21fZ2V0X3RoZXJtYWxfY2FsaWIoKSBiZWhpbmQgYW4gI2Vsc2UgZ3VhcmQg
c28gdGhhdCBkcml2ZXJzCj4+IGluY2x1ZGluZyB0aGlzIGhlYWRlciBjYW4gYmUgY29tcGlsZWQg
d2l0aG91dCBDT05GSUdfTUVTT05fU00gLgo+Pgo+PiBGaXhlczogYjIxZDg4ZGU2OTE4ICgidGhl
cm1hbC9kcml2ZXJzL2FtbG9naWM6IEFkZCBzdXBwb3J0IGZvciBzZWN1cmUKPj4gbW9uaXRvciBj
YWxpYnJhdGlvbiByZWFkb3V0IikKPj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9v
ZS1rYnVpbGQtYWxsLzIwMjYwNTI5MTUzMC5lbjdhR243dy0KPj4gbGtwQGludGVsLmNvbS8KPj4g
UmVwb3J0ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBS
b25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4gLS0tCj4+IENoYW5n
ZXMgaW4gdjI6Cj4+IC0gUmVwbGFjZSAjaWZkZWYgQ09ORklHX01FU09OX1NNIGJ5ICNpZiBJU19F
TkFCTEVEKENPTkZJR19NRVNPTl9TTSkKPj4gwqDCoCB0byBjb3ZlciBidWlsdGluIGFuZCBtb2R1
bGUgaW4gY29uZmlnLgo+PiAtIEFkZCBtaXNzaW5nIHRyYWlsZXJzIGZvciBrZXJuZWwgdGVzdCBy
b2JvdC4KPj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNTMw
LWZpeC1taXNzaW5nLW1lc29uX3NtLQo+PiBzeW1ib2wtdjEtMS0zZmI2NzJiOTg5ZDRAYWxpZWwu
ZnIKPj4gLS0tCj4+IMKgIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8
IDE3ICsrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29u
X3NtLmggYi9pbmNsdWRlL2xpbnV4Lwo+PiBmaXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCj4+IGlu
ZGV4IDNlYmMyYmQ5YTk3NjAuLmJhZWNkYWYyNjNmNDEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
bGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2Zp
cm13YXJlL21lc29uL21lc29uX3NtLmgKPj4gQEAgLTI3LDggKzI3LDI1IEBAIGludCBtZXNvbl9z
bV9jYWxsX3dyaXRlKHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZQo+PiAqZncsIHZvaWQgKmJ1ZmZl
ciwKPj4gwqAgaW50IG1lc29uX3NtX2NhbGxfcmVhZChzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUg
KmZ3LCB2b2lkICpidWZmZXIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGludCBic2l6ZSwgdW5zaWduZWQgaW50IGNtZF9pbmRleCwgdTMyIGFyZzAsCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiBhcmcxLCB1MzIgYXJnMiwgdTMyIGFy
ZzMsIHUzMiBhcmc0KTsKPj4gKwo+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX01FU09OX1NNKQo+
PiArCj4+IMKgIHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqbWVzb25fc21fZ2V0KHN0cnVjdCBk
ZXZpY2Vfbm9kZQo+PiAqZmlybXdhcmVfbm9kZSk7Cj4+IMKgIGludCBtZXNvbl9zbV9nZXRfdGhl
cm1hbF9jYWxpYihzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCB1MzIKPj4gKnRyaW1faW5m
bywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgdHNlbnNv
cl9pZCk7Cj4gCj4gRG8geW91IHJlYWxseSB3YW50IHRvIGNvbXBpbGUgbWVzb25fc20gYXMgYSBt
b2R1bGUgPwo+IAo+IAo+IAoKSSBkb24ndCB3YW50LCBidXQgaWYgSSBzZW5kIGEgcGF0Y2ggdG8g
Y2hhbmdlIHRyaXN0YXRlIHRvIGJvb2wsIGl0IHdpbGwKcmFpc2UgYSB3YXJuaW5nIGJlY2F1c2Ug
J20nIGlzIG5vdCB2YWxpZC4KSWYgaXQgaXMgYWNjZXB0ZWQgdG8gaWdub3JlIHRoaXMgd2Fybmlu
ZywgSSBjYW4gc2VuZCBhbm90aGVyIHBhdGNoLgoKLS0gCkJlc3QgcmVnYXJkcywKUm9uYWxkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
