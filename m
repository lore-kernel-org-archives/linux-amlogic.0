Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0566FFC0342
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3nyKJ+1hkWEBfoJrX0xEuUg+ekbFfwLpu3hfzr1qSo=; b=AwrqsZS0UCjAnN
	3dU+ygQfLTeRMum8HKK1EM+X2oUwR01hIsifYojZ/3yY4TjZab/vkZy2QmNIVOOJV0dMa07Pbjz+P
	WNCZdOH7iBKaF+WhNVWeQYm99Gsmqm8Q39e6/kw0BS4BXywfy22C3ttnFQINUW0NrpTaqCBJjhEmd
	Bh4ll9cJMPWgdvBBX+Z/4YVgk0vjuTbAFV8HucDmsN2v4l0v9WFtLj+GJuYSxYNFD+MDloLvjvtLH
	SMLqapinQx0gu85zjFxQA3hPnI/vIAZd5wWSfBWa7bLlC+rjXDpMdxFFoFFOLzKvIWe2/A1ZxntMp
	75IQh2GVzJtK3jeOUSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFw01-0000000Btqn-1dl4;
	Thu, 23 Apr 2026 15:29:53 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvzz-0000000Btq8-04Sm;
	Thu, 23 Apr 2026 15:29:52 +0000
Message-ID: <9ac4db6a-b668-4e56-b940-dfb542086b39@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776958185;
	bh=BuFMoJ0ysYsrcKqnLlo60KQAjjDHrnpC5kQCUcwHtB0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=nDVJQ1AjCE5OlTV9ohw+s+40v3OWIxomoHihxxmKa33UWuI4CKmMPxIRrcc+qoTtr
	 MRafIrq7kiIn0mv+CjEkY4sx+kF/ymbOedcAFtood2+89njXRcH4XIqMUVbaWPC5PJ
	 +TqSnU2f6xdrIxnp2Ut4ZRt7cw3p8hKAmrHyW1y8=
Date: Thu, 23 Apr 2026 17:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
 <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
 <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
 <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082951_513446_BF904528 
X-CRM114-Status: GOOD (  17.05  )
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

T24gNC8yMy8yNiA1OjE3IFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiA0LzIzLzI2IDE3
OjA5LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gSGkgRGFuaWVsLAo+Pgo+PiBUaGFua3MgZm9y
IHlvdXIgZmVlZGJhY2suCj4+Cj4+IE9uIDQvMjMvMjYgMTI6MjUgUE0sIERhbmllbCBMZXpjYW5v
IHdyb3RlOgo+Pj4KPj4+IEhpIFJvbmFsZCwKPj4+Cj4gCj4gZnVuY3Rpb24xKCkgewo+IAo+IAo+
Pj4+ICvCoMKgwqAgaWYgKHBkYXRhLT5kYXRhLT51c2Vfc20pIHsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRldmljZV9ub2RlICpzbV9ucDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0
IG9mX3BoYW5kbGVfYXJncyBwaF9hcmdzOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MocGRldi0+ZGV2Lm9mX25vZGUsCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiYW1sb2dpYyxzZWN1cmUtbW9uaXRvciIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLCAwLCAmcGhfYXJn
cyk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNtX25wID0gcGhf
YXJncy5ucDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFzbV9ucCkgewo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIkZhaWxlZCB0byBwYXJzZSBzZWN1cmUgbW9uaXRvciBwaGFuZGxlXG4iKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcGRhdGEtPnNtX2Z3ID0gbWVzb25f
c21fZ2V0KHNtX25wKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoc21fbnApOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXBkYXRhLT5zbV9mdykgewo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBzZWN1cmUgbW9uaXRvciBm
aXJtd2FyZVxuIik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUFJPQkVf
REVGRVI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHBkYXRhLT50c2Vuc29yX2lkID0gcGhfYXJncy5hcmdzWzBdOwo+Pj4+ICvCoMKgwqAgfSAKPiAK
PiB9Cj4gCj4gZnVuY3Rpb24yKCkgewo+IAo+IGVsc2Ugewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBw
ZGF0YS0+c2VjX2FvX21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAocGRldi0+ZGV2Lm9mX25vZGUsICJhbWxvZ2ljLGFvLXNl
Y3VyZSIpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKHBkYXRhLT5zZWNfYW9fbWFw
KSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAic3lzY29uIHJl
Z21hcCBsb29rdXAgZmFpbGVkLlxuIik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIFBUUl9FUlIocGRhdGEtPnNlY19hb19tYXApOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4gwqDCoMKgwqDCoMKgIH0KPiAKPiB9Cj4gCj4+IFN1cmUsIEkgd2lsbCBkbyB0aGF0Lgo+Pgo+
Pj4+IMKgwqDCoMKgwqDCoCBwZGF0YS0+dHpkID0gZGV2bV90aGVybWFsX29mX3pvbmVfcmVnaXN0
ZXIoJnBkZXYtPmRldgo+Pj4KPj4+IFRoZSB0aGVybWFsIHpvbmUgaXMgcmVnaXN0ZXJlZCBiZWZv
cmUgY2FsbGluZwo+Pj4gYW1sb2dpY190aGVybWFsX2luaXRpYWxpemUoKSwgdGh1cyBwZGF0YS0+
dHJpbV9pbmZvIGlzIG5vdCBpbml0aWFsaXplZC4KPj4+IFdoZW4gYSB0aGVybWFsIHpvbmUgaXMg
cmVnaXN0ZXJlZCB0aGUgdGhlcm1hbCBmcmFtZXdvcmsgcmVhZHMgdGhlCj4+PiB0ZW1wZXJhdHVy
ZSwgc28gaXQgcmVhZHMgYW4gaW52YWxpZCB2YWx1ZSBiZWNhdXNlOgo+Pj4KPj4+IGRldm1fdGhl
cm1hbF9vZl96b25lX3JlZ2lzdGVyKCkKPj4+IMKgwqAtPiB0aGVybWFsX29mX3pvbmVfcmVnaXN0
ZXIoKQo+Pj4gwqDCoMKgIC0+IHRoZXJtYWxfem9uZV9kZXZpY2VfcmVnaXN0ZXJfd2l0aF90cmlw
cygpCj4+PiDCoMKgwqAgLT4gdGhlcm1hbF96b25lX2RldmljZV9lbmFibGUoKQo+Pj4gwqDCoMKg
wqDCoMKgIC0+IF9fdGhlcm1hbF96b25lX2RldmljZV91cGRhdGUoKQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCAtPiBfX3RoZXJtYWxfem9uZV9nZXRfdGVtcCgpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtPiBhbWxvZ2ljX3RoZXJtYWxfZ2V0X3RlbXAoKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLT4gYW1sb2dpY190aGVybWFsX2NvZGVfdG9fbWlsbGljZWxzaXVzKCkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWyBVc2Ugb2YgdW5pbml0aWFsaXplZCBwZGF0
YS0+dHJpbV9pbmZvIF0KPj4+Cj4+PiBSaWdodCA/Cj4+Pgo+Pgo+PiBZZXMsIEkgd2lsbCBtb3Zl
IHRoZSBpbml0aWFsaXplIGJlZm9yZSB0aGUgcmVnaXN0ZXIuCj4+Cj4+PiBJSVVDLCBhbWxvZ2lj
X3RoZXJtYWxfaW5pdGlhbGl6ZSgpIGNhbiBiZSBhbHNvIHNwbGl0IGFuZCBtb3ZlZCB0aGUKPj4+
IGNvcnJlc3BvbmRpbmcgYmxvY2tzIHRvIHRoZSBmdW5jdGlvbnMgdG8gYmUgY3JlYXRlZCBpbiB0
aGUgY29tbWVudAo+Pj4gYWJvdmUuCj4+Pgo+Pgo+PiBUaGUgU00gYW5kIHN5c2NvbiBzZXR1cCB3
aWxsIGJlIGV4dHJhY3RlZCBpbnRvIHR3byBmdW5jdGlvbnMuCj4+IGFtbG9naWNfdGhlcm1hbF9p
bml0aWFsaXplKCkgaXRzZWxmIGlzIGtlcHQgYXMtaXMgYnV0IG1vdmVkIGJlZm9yZQo+PiBkZXZt
X3RoZXJtYWxfb2Zfem9uZV9yZWdpc3RlcigpLgo+PiBMZXQgbWUga25vdyBpZiB5b3UnZCBwcmVm
ZXIgYSBkaWZmZXJlbnQgYXBwcm9hY2guCj4gCj4gSW4gdGhlIGluaXRpYWxpemUgZnVuY3Rpb24g
dGhlIGZvbGxvd2luZyBjaHVuayBpcyBhZGRlZDoKPiAKPiArwqDCoMKgIGlmIChwZGF0YS0+ZGF0
YS0+dXNlX3NtKSB7Cj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBtZXNvbl9zbV9nZXRfdGhlcm1h
bF9jYWxpYihwZGF0YS0+c21fZncsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZwZGF0YS0+dHJpbV9pbmZvLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZGF0YS0+dHNlbnNvcl9pZCk7Cj4g
K8KgwqDCoCB9Cj4gCj4gSSB3YXMgc3VnZ2VzdGluZyB0byBtb3ZlIGl0IHRvIGZ1bmN0aW9uMSgp
IGFuZCB0aGUgcmVzdCBvZiBjb2RlIGZyb20KPiBpbml0aWFsaXplIGluIGZ1bmN0aW9uMigpCj4g
Cj4gVGhhdCByZXN1bHRzIGluIGFtbG9naWNfdGhlcm1hbF9pbml0aWFsaXplKCkgdG8gYmUgZGlz
c29sdmVkIGluCj4gZnVuY3Rpb24xKCkgYW5kIGZ1bmN0aW9uMigpCj4gCgpUaGFua3MgZm9yIHlv
dXIgYW5zd2VyLCB0aGF0IHdhcyBteSBzZWNvbmQgb3B0aW9uLCBJIHdpbGwgZG8gdGhhdC4KCi0t
IApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
