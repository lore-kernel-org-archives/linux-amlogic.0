Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E78D6AAEC
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2026 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPixc/kw7ZqASP+fSPMdW/c50HwJJpxk0ibF0Qx8e74=; b=H8IKJdMLn9Zqsk
	obk0vwArf7ONHkt0wqjuXjLjhSNF+9t4tQU318ODnQo5lvJR2UcTwnNgF745h3pgI6V8NmTHVZ7UI
	1uKJw2zbE6i74MaMlroobGg3A4S2XYiSwPY8lt1EzFv3l+2ezdCkHTQmU7/9jP6SRaRAuxU+rp4yR
	Y0OZg6+KiLpvbwNwgNzNufq7k1VmS0NkNRBrlYanWGXJQ57SxQnK6G5VpKhK6ST1YTM1T4WzUvEUg
	awLeah+pK9PShBos1auEGuQKQSEKf5ssCrbwB7nvQ4ULlYhyLzKFfcTwabYmNV+N+iBCKerbpGtC/
	TOC53ZcyC7AFXsyeEIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LPm-00000000ZDh-30fo;
	Thu, 02 Apr 2026 17:01:06 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LPi-00000000ZC9-0tXH;
	Thu, 02 Apr 2026 17:01:05 +0000
Message-ID: <d0d17d65-893d-44c8-a929-92ba5b71d7f6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775149257;
	bh=2OWqMG9cAvyIiZhUJJh6c3apSC/Ro+i93PaoDjc2ohY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TyDduWOpNvxQeMWOJLRKd7O4x57VGwm/FtjFB4aCLFl7jth9inkleHxhtz7dfmZpO
	 ainHsiv56YhFZcMxmPC6M0wdfV/f5bNz9T4fDyPLaFgxbBcKiYU+Tt4hIw74Jodnmh
	 wBAzw0LIaUuYcMk2fb2yJxzZTEAN/qFAlVGgh+tQ=
Date: Thu, 2 Apr 2026 19:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 5/8] thermal: khadas-mcu-fan: Add fan config from platform
 data Add regulator support
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
 <20260402-add-mcu-fan-khadas-vim4-v1-5-2b12eb4ac7b0@aliel.fr>
 <5e3e8684-f893-4fb0-879e-9661820f72dd@linaro.org>
Content-Language: en-US
In-Reply-To: <5e3e8684-f893-4fb0-879e-9661820f72dd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100104_545978_11CB71CC 
X-CRM114-Status: GOOD (  17.29  )
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

T24gNC8yLzI2IDU6MzkgUE0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDQvMi8yNiAxNjoy
NywgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+IFJlcGxhY2UgdGhlIGhhcmRjb2RlZCBNQVhfTEVW
RUwgY29uc3RhbnQgYW5kIGZhbiByZWdpc3Rlcgo+PiB3aXRoIHZhbHVlcyByZWFkIGZyb20gcGxh
dGZvcm1fZGF0YSAoZmFuX3JlZywgbWF4X2xldmVsKSwKPj4gYXMgbmV3IE1DVXMgbmVlZCBkaWZm
ZXJlbnQgdmFsdWVzLgo+Pgo+PiBPcHRpb25hbGx5IGFjcXVpcmUgYW5kIGVuYWJsZSBhICJmYW4i
IHJlZ3VsYXRvciBzdXBwbHkKPj4gYXQgcHJvYmUgdGltZSBhbmQgb24gcmVzdW1lLAo+PiBzbyBi
b2FyZHMgdGhhdCBnYXRlIGZhbiBwb3dlciB0aHJvdWdoIGEgcmVndWxhdG9yIGFyZSBoYW5kbGVk
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBh
bGllbC5mcj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdGhlcm1hbC9raGFkYXNfbWN1X2Zhbi5jIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICsrKystLS0tLS0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3RoZXJtYWwva2hhZGFzX21jdV9mYW4uYyBiL2RyaXZlcnMvdGhlcm1h
bC8KPj4ga2hhZGFzX21jdV9mYW4uYwo+PiBpbmRleCBkMzVlNTMxM2JlYTQxLi41NWI0OTY2MjVl
M2JkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwva2hhZGFzX21jdV9mYW4uYwo+PiAr
KysgYi9kcml2ZXJzL3RoZXJtYWwva2hhZGFzX21jdV9mYW4uYwo+PiBAQCAtMTMsMTMgKzEzLDE1
IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4
L3N5c2ZzLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC90aGVybWFsLmg+Cj4+IC0KPj4gLSNkZWZp
bmUgTUFYX0xFVkVMIDMKPj4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4K
Pj4gwqAgwqAgc3RydWN0IGtoYWRhc19tY3VfZmFuX2N0eCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0
IGtoYWRhc19tY3UgKm1jdTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgZmFuX3JlZzsKPj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgbGV2ZWw7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IG1heF9s
ZXZlbDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY2RldjsK
Pj4gK8KgwqDCoCBzdHJ1Y3QgcmVndWxhdG9yICpwb3dlcjsKPj4gwqAgfTsKPj4gwqAgwqAgc3Rh
dGljIGludCBraGFkYXNfbWN1X2Zhbl9zZXRfbGV2ZWwoc3RydWN0IGtoYWRhc19tY3VfZmFuX2N0
eCAqY3R4LAo+PiBAQCAtMjcsOCArMjksNyBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfZmFuX3Nl
dF9sZXZlbChzdHJ1Y3QKPj4ga2hhZGFzX21jdV9mYW5fY3R4ICpjdHgsCj4+IMKgIHsKPj4gwqDC
oMKgwqDCoCBpbnQgcmV0Owo+PiDCoCAtwqDCoMKgIHJldCA9IHJlZ21hcF93cml0ZShjdHgtPm1j
dS0+cmVnbWFwLAo+PiBLSEFEQVNfTUNVX0NNRF9GQU5fU1RBVFVTX0NUUkxfUkVHLAo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXZlbCk7Cj4+ICvCoMKgwqAgcmV0ID0gcmVnbWFw
X3dyaXRlKGN0eC0+bWN1LT5yZWdtYXAsIGN0eC0+ZmFuX3JlZywgbGV2ZWwpOwo+PiDCoMKgwqDC
oMKgIGlmIChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCBAQCAt
NDAsNyArNDEsOSBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfZmFuX3NldF9sZXZlbChzdHJ1Y3QK
Pj4ga2hhZGFzX21jdV9mYW5fY3R4ICpjdHgsCj4+IMKgIHN0YXRpYyBpbnQga2hhZGFzX21jdV9m
YW5fZ2V0X21heF9zdGF0ZShzdHJ1Y3QKPj4gdGhlcm1hbF9jb29saW5nX2RldmljZSAqY2RldiwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgKnN0YXRlKQo+PiDCoCB7Cj4+IC3CoMKgwqAgKnN0YXRlID0gTUFYX0xFVkVMOwo+PiArwqDC
oMKgIHN0cnVjdCBraGFkYXNfbWN1X2Zhbl9jdHggKmN0eCA9IGNkZXYtPmRldmRhdGE7Cj4+ICsK
Pj4gK8KgwqDCoCAqc3RhdGUgPSBjdHgtPm1heF9sZXZlbDsKPj4gwqAgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4gwqAgfQo+PiBAQCAtNjEsNyArNjQsNyBAQCBraGFkYXNfbWN1X2Zhbl9zZXRfY3Vy
X3N0YXRlKHN0cnVjdAo+PiB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlICpjZGV2LAo+PiDCoCB7Cj4+
IMKgwqDCoMKgwqAgc3RydWN0IGtoYWRhc19tY3VfZmFuX2N0eCAqY3R4ID0gY2Rldi0+ZGV2ZGF0
YTsKPj4gwqAgLcKgwqDCoCBpZiAoc3RhdGUgPiBNQVhfTEVWRUwpCj4+ICvCoMKgwqAgaWYgKHN0
YXRlID4gY3R4LT5tYXhfbGV2ZWwpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZB
TDsKPj4gwqAgwqDCoMKgwqDCoCBpZiAoc3RhdGUgPT0gY3R4LT5sZXZlbCkKPj4gQEAgLTgzLDEx
ICs4NiwzMiBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfZmFuX3Byb2JlKHN0cnVjdAo+PiBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qga2hhZGFzX21jdV9mYW5fY3R4ICpjdHg7Cj4+
IMKgwqDCoMKgwqAgaW50IHJldDsKPj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3Qga2hhZGFzX21jdV9m
YW5fcGRhdGEgKnBkYXRhID0KPj4gZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKPj4gwqAg
wqDCoMKgwqDCoCBjdHggPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmN0eCksIEdGUF9LRVJO
RUwpOwo+PiDCoMKgwqDCoMKgIGlmICghY3R4KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9NRU07Cj4+ICsKPj4gwqDCoMKgwqDCoCBjdHgtPm1jdSA9IG1jdTsKPj4gK8KgwqDCoCBj
dHgtPmZhbl9yZWfCoMKgID0gcGRhdGEtPmZhbl9yZWc7Cj4+ICvCoMKgwqAgY3R4LT5tYXhfbGV2
ZWwgPSBwZGF0YS0+bWF4X2xldmVsOwo+PiArCj4+ICvCoMKgwqAgY3R4LT5wb3dlciA9IGRldm1f
cmVndWxhdG9yX2dldF9vcHRpb25hbChkZXYtPnBhcmVudCwgImZhbiIpOwo+PiArwqDCoMKgIGlm
IChJU19FUlIoY3R4LT5wb3dlcikpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChQVFJfRVJSKGN0
eC0+cG93ZXIpID09IC1FTk9ERVYpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN0eC0+cG93
ZXIgPSBOVUxMOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihjdHgtPnBvd2VyKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoCBpZiAoY3R4LT5wb3dlcikgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVndWxhdG9y
X2VuYWJsZShjdHgtPnBvd2VyKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZW5hYmxlIGZhbiBw
b3dlciBzdXBwbHk6ICVkXG4iLAo+PiByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Owo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKg
wqDCoMKgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGN0eCk7Cj4+IMKgIMKgwqDCoMKgwqAg
Y2RldiA9IGRldm1fdGhlcm1hbF9vZl9jb29saW5nX2RldmljZV9yZWdpc3RlcihkZXYtPnBhcmVu
dCwKPj4gQEAgLTEzMCw2ICsxNTQsMTMgQEAgc3RhdGljIGludCBraGFkYXNfbWN1X2Zhbl9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UKPj4gKmRldikKPj4gwqAgc3RhdGljIGludCBraGFkYXNfbWN1X2Zh
bl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0
IGtoYWRhc19tY3VfZmFuX2N0eCAqY3R4ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+ICvCoMKg
wqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGlmIChjdHgtPnBvd2VyKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSByZWd1bGF0b3JfZW5hYmxlKGN0eC0+cG93ZXIpOwo+IAo+IFNlZW1zIHlv
dSdyZSBtaXNzaW5nIGEgcmVndWxhdG9yX2Rpc2FibGUoKSBvbiBzdXNwZW5kLgo+IAo+IE5laWwK
PiAKCllvdSByaWdodCwgSSB3aWxsIGFkZCB0aGUgcmVndWxhdG9yX2Rpc2FibGUgb24gc3VzcGVu
ZCBmb3IgbmV4dCB2ZXJzaW9uLgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suCgo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK
Pj4gK8KgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIGtoYWRhc19tY3VfZmFuX3NldF9s
ZXZlbChjdHgsIGN0eC0+bGV2ZWwpOwo+PiDCoCB9Cj4+Cj4gCgoKLS0gCkJlc3QgcmVnYXJkcywK
Um9uYWxkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
