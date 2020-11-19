Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1,WEIRD_PORT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E21C63697
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 18:04:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F141C21D46
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 18:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="amb6GrN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F141C21D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OtXqpxMaIM5t2q5ZyfnSZ2AwTQ5kEfzV2QLeNphokEI=; b=amb6GrN3uTJfzMQ6Vt4yyNEOJ
	397n2OAEDv0B2Af8l3BDruy6hAtvbFEcybe6avmQ6sKrfjdQ0nbs88Ge57vPjwG5QZuK+Yc7+vmey
	GW2gYsAfoJMT18fs4g+uHi3uoviYW63/Sl74/lujG9Iku/9072gXdyKsi7qnOBtU0An/vjfeU4CcE
	wPo9+VOanK8209Hh70deg15m9blWMTUnFeq9ynlQbDu4o0IQp1uAB0jIrtLbh2otC4rX6Yr2BVDk2
	1VGeivGwC8OrhVHtC5psA0fJcq4vbw3A7AFLm1hbzLweXulO+aR4c07TI5oAj8hCgYSl9l3Ttg0F7
	txNwaso4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfoIH-0003Tu-QW; Thu, 19 Nov 2020 18:04:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfoIE-0003T7-2V; Thu, 19 Nov 2020 18:04:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id C26961F45AC6
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
To: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
Date: Thu, 19 Nov 2020 18:04:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <c76273f5fe483766e6a7f509f82d928a@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_130426_361751_0963508A 
X-CRM114-Status: GOOD (  25.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWFyYywKCk9uIDE5LzExLzIwMjAgMTE6NTgsIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAy
MDIwLTExLTE5IDEwOjI2LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gT24gMTkvMTEvMjAyMCAx
MToyMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+Pj4gT24gMjAyMC0xMS0xOSAwODo1MCwgR3VpbGxh
dW1lIFR1Y2tlciB3cm90ZToKPj4+PiBQbGVhc2Ugc2VlIHRoZSBhdXRvbWF0ZWQgYmlzZWN0aW9u
IHJlcG9ydCBiZWxvdyBhYm91dCBzb21lIGtlcm5lbAo+Pj4+IGVycm9ycyBvbiBtZXNvbi1neGJi
LXAyMDAuCj4+Pj4KPj4+PiBSZXBvcnRzIGFyZW4ndCBhdXRvbWF0aWNhbGx5IHNlbnQgdG8gdGhl
IHB1YmxpYyB3aGlsZSB3ZSdyZQo+Pj4+IHRyaWFsaW5nIG5ldyBiaXNlY3Rpb24gZmVhdHVyZXMg
b24ga2VybmVsY2kub3JnLCBob3dldmVyIHRoaXMgb25lCj4+Pj4gbG9va3MgdmFsaWQuCj4+Pj4K
Pj4+PiBUaGUgYmlzZWN0aW9uIHN0YXJ0ZWQgd2l0aCBuZXh0LTIwMjAxMTE4IGJ1dCB0aGUgZXJy
b3JzIGFyZSBzdGlsbAo+Pj4+IHByZXNlbnQgaW4gbmV4dC0yMDIwMTExOS7CoCBEZXRhaWxzIGZv
ciB0aGlzIHJlZ3Jlc3Npb246Cj4+Pj4KPj4+PiDCoCBodHRwczovL2tlcm5lbGNpLm9yZy90ZXN0
L2Nhc2UvaWQvNWZiNjE5NmJmZDAxMjdmZDY4ZDhkOTAyLwo+Pj4+Cj4+Pj4gVGhlIGZpcnN0IGVy
cm9yIGlzOgo+Pj4+Cj4+Pj4gwqAgW8KgwqAgMTQuNzU3NDg5XSBJbnRlcm5hbCBlcnJvcjogc3lu
Y2hyb25vdXMgZXh0ZXJuYWwgYWJvcnQ6IDk2MDAwMjEwCj4+Pj4gWyMxXSBQUkVFTVBUIFNNUAo+
Pj4KPj4+IExvb2tzIGxpa2UgeWV0IGFub3RoZXIgY2xvY2sgb3JkZXJpbmcgc2V0dXAuIEkgZ3Vl
c3MgZGlmZmVyZW50IEFtbG9naWMKPj4+IHBsYXRmb3JtcyBoYXZlIHNsaWdodGx5IGRpZmZlcmVu
dCBvcmRlcmluZyByZXF1aXJlbWVudHMuCj4+Pgo+Pj4gTmVpbCwgZG8geW91IGhhdmUgYW55IGlk
ZWEgb2Ygd2hpY2ggcGxhdGZvcm0gcmVxdWlyZXMgd2hpY2ggb3JkZXJpbmc/Cj4+PiBUaGUgdmFy
aWFiaWxpdHkgaW4gRFQgYW5kIHBsYXRmb3JtcyBpcyBwcmV0dHkgZGlmZmljdWx0IHRvIGZvbGxv
dyAoYW5kCj4+PiBJIGRvbid0IHRoaW5rIEkgaGF2ZSBzdWNoIGJvYXJkIGFyb3VuZCkuCj4+Cj4+
IFRoZSByZXF1aXJlbWVudHMgc2hvdWxkIGJlIHRoZSBzYW1lLCBoZXJlIHRoZSBpbml0IHdhcyBk
b25lIGJlZm9yZSBjYWxsaW5nCj4+IGR3X2hkbWlfcHJvYmUgdG8gYmUgc3VyZSB0aGUgY2xvY2tz
IGFuZCBpbnRlcm5hbHMgcmVzZXRzIHdlcmUgZGVhc3NlcnRlZC4KPj4gQnV0IHNpbmNlIHlvdSBi
b290IGZyb20gdS1ib290IGFscmVhZHkgZW5hYmxpbmcgdGhlc2UsIGl0J3MgYWxyZWFkeSBhY3Rp
dmUuCj4+Cj4+IFRoZSBzb2x1dGlvbiB3b3VsZCBiZSB0byByZXZlcnQgYW5kIGRvIHNvbWUgY2hl
Y2sgaW4gbWVzb25fZHdfaGRtaV9pbml0KCkgdG8KPj4gY2hlY2sgaWYgYWxyZWFkeSBlbmFibGVk
IGFuZCBkbyBub3RoaW5nLgo+IAo+IEEgYmV0dGVyIGZpeCBzZWVtcyB0byBiZSB0aGlzLCB3aGlj
aCBtYWtlcyBpdCBleHBsaWNpdCB0aGF0IHRoZXJlIGlzCj4gYSBkZXBlbmRlbmN5IGJldHdlZW4g
c29tZSBvZiB0aGUgcmVnaXN0ZXJzIGFjY2Vzc2VkIGZyb20gbWVzb25fZHdfaGRtaV9pbml0KCkK
PiBhbmQgdGhlIGlhaGIgY2xvY2suCj4gCj4gR3VpbGxhdW1lLCBjYW4geW91IGdpdmUgdGhpcyBh
IGdvIG9uIHlvdXIgZmFpbGluZyBib3g/CgpJIGNvbmZpcm0gaXQgc29sdmVzIHRoZSBwcm9ibGVt
LiAgUGxlYXNlIGFkZCB0aGlzIHRvIHlvdXIgZml4CnBhdGNoIGlmIGl0J3MgT0sgd2l0aCB5b3U6
CgogIFJlcG9ydGVkLWJ5OiAia2VybmVsY2kub3JnIGJvdCIgPGJvdEBrZXJuZWxjaS5vcmc+CiAg
VGVzdGVkLWJ5OiBHdWlsbGF1bWUgVHVja2VyIDxndWlsbGF1bWUudHVja2VyQGNvbGxhYm9yYS5j
b20+CgoKRm9yIHRoZSByZWNvcmQsIGl0IHBhc3NlZCBhbGwgdGhlIHRlc3RzIHdoZW4gYXBwbGll
ZCBvbiB0b3Agb2YKdGhlICJiYWQiIHJldmlzaW9uIGZvdW5kIGJ5IHRoZSBiaXNlY3Rpb246Cgog
IGh0dHA6Ly9sYXZhLmJheWxpYnJlLmNvbToxMDA4MC9zY2hlZHVsZXIvYWxsam9icz9zZWFyY2g9
djUuMTAtcmMzLTEwMjEtZ2I4NjY4YTJlNWVhMQoKYW5kIHRoZSBleGFjdCBzYW1lIHRlc3Qgb24g
dGhlICJiYWQiIHJldmlzaW9uIHdpdGhvdXQgdGhlIGZpeApjb25zaXN0ZW50bHkgc2hvd2VkIHRo
ZSBlcnJvcjoKCiAgaHR0cDovL2xhdmEuYmF5bGlicmUuY29tOjEwMDgwL3NjaGVkdWxlci9qb2Iv
Mzc0MTc2CgoKVGhhbmtzLApHdWlsbGF1bWUKCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYwo+IGluZGV4IDdmOGVlYTQ5NDE0Ny4uNTJhZjhiYTk0MzExIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gQEAgLTE0Niw2ICsxNDYsNyBAQCBzdHJ1Y3Qg
bWVzb25fZHdfaGRtaSB7Cj4gwqDCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9j
dHJsOwo+IMKgwqDCoMKgIHN0cnVjdCByZXNldF9jb250cm9sICpoZG1pdHhfcGh5Owo+IMKgwqDC
oMKgIHN0cnVjdCBjbGsgKmhkbWlfcGNsazsKPiArwqDCoMKgIHN0cnVjdCBjbGsgKmlhaGJfY2xr
Owo+IMKgwqDCoMKgIHN0cnVjdCBjbGsgKnZlbmNpX2NsazsKPiDCoMKgwqDCoCBzdHJ1Y3QgcmVn
dWxhdG9yICpoZG1pX3N1cHBseTsKPiDCoMKgwqDCoCB1MzIgaXJxX3N0YXQ7Cj4gQEAgLTEwMzMs
NiArMTAzNCwxMyBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiDCoMKgwqDCoCB9Cj4gwqDCoMKgwqAgY2xr
X3ByZXBhcmVfZW5hYmxlKG1lc29uX2R3X2hkbWktPmhkbWlfcGNsayk7Cj4gCj4gK8KgwqDCoCBt
ZXNvbl9kd19oZG1pLT5pYWhiX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJpYWhiIik7Cj4gK8Kg
wqDCoCBpZiAoSVNfRVJSKG1lc29uX2R3X2hkbWktPmlhaGJfY2xrKSkgewo+ICvCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBnZXQgaWFoYiBjbGtcbiIpOwo+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gUFRSX0VSUihtZXNvbl9kd19oZG1pLT5pYWhiX2Nsayk7Cj4gK8KgwqDC
oCB9Cj4gK8KgwqDCoCBjbGtfcHJlcGFyZV9lbmFibGUobWVzb25fZHdfaGRtaS0+aWFoYl9jbGsp
Owo+ICsKPiDCoMKgwqDCoCBtZXNvbl9kd19oZG1pLT52ZW5jaV9jbGsgPSBkZXZtX2Nsa19nZXQo
ZGV2LCAidmVuY2kiKTsKPiDCoMKgwqDCoCBpZiAoSVNfRVJSKG1lc29uX2R3X2hkbWktPnZlbmNp
X2NsaykpIHsKPiDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiVW5hYmxlIHRvIGdldCB2
ZW5jaSBjbGtcbiIpOwo+IEBAIC0xMDcxLDYgKzEwNzksOCBAQCBzdGF0aWMgaW50IG1lc29uX2R3
X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiAK
PiDCoMKgwqDCoCBlbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IEJJVCgwKTsKPiAKPiArwqDCoMKg
IG1lc29uX2R3X2hkbWlfaW5pdChtZXNvbl9kd19oZG1pKTsKPiArCj4gwqDCoMKgwqAgRFJNX0RF
QlVHX0RSSVZFUigiZW5jb2RlciBpbml0aWFsaXplZFxuIik7Cj4gCj4gwqDCoMKgwqAgLyogQnJp
ZGdlIC8gQ29ubmVjdG9yICovCj4gQEAgLTEwOTUsOCArMTEwNSw2IEBAIHN0YXRpYyBpbnQgbWVz
b25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVy
LAo+IMKgwqDCoMKgIGlmIChJU19FUlIobWVzb25fZHdfaGRtaS0+aGRtaSkpCj4gwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gUFRSX0VSUihtZXNvbl9kd19oZG1pLT5oZG1pKTsKPiAKPiAtwqDCoMKg
IG1lc29uX2R3X2hkbWlfaW5pdChtZXNvbl9kd19oZG1pKTsKPiAtCj4gwqDCoMKgwqAgbmV4dF9i
cmlkZ2UgPSBvZl9kcm1fZmluZF9icmlkZ2UocGRldi0+ZGV2Lm9mX25vZGUpOwo+IMKgwqDCoMKg
IGlmIChuZXh0X2JyaWRnZSkKPiDCoMKgwqDCoMKgwqDCoMKgIGRybV9icmlkZ2VfYXR0YWNoKGVu
Y29kZXIsIG5leHRfYnJpZGdlLAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
