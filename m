Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB86C63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB32B22244
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EGok/X05";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wJtvxMFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB32B22244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oPNFU6vr4ulHyNdHdi2Q+0Di2P0ofaUAPhfNoMl3sOw=; b=EGok/X059nb4ZoSf0jC27j9Vi
	eENHfGBMq4PW4Bw//QKIx1zmhTpvavHTseSyyyyHI4pbqJ1advPasvjfmRvi/w6RaGKD5fFwx4CPs
	CXGsoCtSPdJfjz27wl+zMYJCUs78dWG8HMBQ5M//In3toxGNDX53EHDpDNlwRRmsqXLHJPQ1fMr3g
	b9pZ4EzSTsc3CsZ2PuqqnwyUTOVxEWlpNnNh6N5mmzriirPZ9lBSsXFr/515RK77mSGs5MQqgFWuj
	oKz6N2cMHQWvhskX5cJatNO3x3hQGbhkVfvkeREDvMchqGgk59BjQgy8PTs8c6IySzlMyDxuNEdku
	aOt9w7UDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg3Fx-0001vh-RI; Fri, 20 Nov 2020 10:03:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg3C7-0008Cz-Cy; Fri, 20 Nov 2020 09:59:09 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FE7722240;
 Fri, 20 Nov 2020 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866344;
 bh=/9Svc1nB4x4FQpTn7Lh51eg63FO1h5B4OU0Pfe7eNec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wJtvxMFtDr40TCmI+wTiQIU2yKxHb8Jp3i/Ci+irezyklhocG0CV+5L7Xx7DEPAE9
 86BPbtTyVEgag5qIdvDQRBG4jMeZV10ZbTKDynFeOMfsIv31QoSAZ49MOMowo4j8lc
 8sZhm0o2zr5UIgNt79JWXQt4QMgVbk6V/hwxt6YU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg3C2-00CDVO-29; Fri, 20 Nov 2020 09:59:02 +0000
MIME-Version: 1.0
Date: Fri, 20 Nov 2020 09:59:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <93dcf61a-be80-8870-48f5-30e215cc56ed@baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
 <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
 <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
 <00a10c12a4eb2a9cdd9f50e88a293c3f@kernel.org>
 <93dcf61a-be80-8870-48f5-30e215cc56ed@baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <45c711c9d5fb5ef0e3b80e82b10f5998@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 guillaume.tucker@collabora.com, kernelci-results@groups.io,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_045907_877811_BEBBA848 
X-CRM114-Status: GOOD (  17.87  )
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
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0xMS0yMCAwOToyNiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTkvMTEvMjAy
MCAxOTozNSwgTWFyYyBaeW5naWVyIHdyb3RlOgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHdfaGRtaS5jCj4+Pj4+IGluZGV4IDdmOGVlYTQ5NDE0Ny4uNTJhZjhiYTk0MzEx
IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5j
Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPj4+Pj4g
QEAgLTE0Niw2ICsxNDYsNyBAQCBzdHJ1Y3QgbWVzb25fZHdfaGRtaSB7Cj4+Pj4+IMKgwqDCoMKg
IHN0cnVjdCByZXNldF9jb250cm9sICpoZG1pdHhfY3RybDsKPj4+Pj4gwqDCoMKgwqAgc3RydWN0
IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9waHk7Cj4+Pj4+IMKgwqDCoMKgIHN0cnVjdCBjbGsgKmhk
bWlfcGNsazsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICppYWhiX2NsazsKPj4+Pj4gwqDCoMKg
wqAgc3RydWN0IGNsayAqdmVuY2lfY2xrOwo+Pj4+PiDCoMKgwqDCoCBzdHJ1Y3QgcmVndWxhdG9y
ICpoZG1pX3N1cHBseTsKPj4+Pj4gwqDCoMKgwqAgdTMyIGlycV9zdGF0Owo+Pj4+PiBAQCAtMTAz
Myw2ICsxMDM0LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgCj4+Pj4+ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPj4+Pj4gwqDCoMKgwqAgfQo+
Pj4+PiDCoMKgwqDCoCBjbGtfcHJlcGFyZV9lbmFibGUobWVzb25fZHdfaGRtaS0+aGRtaV9wY2xr
KTsKPj4+Pj4gCj4+Pj4+ICvCoMKgwqAgbWVzb25fZHdfaGRtaS0+aWFoYl9jbGsgPSBkZXZtX2Ns
a19nZXQoZGV2LCAiaWFoYiIpOwo+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIobWVzb25fZHdfaGRt
aS0+aWFoYl9jbGspKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIlVuYWJs
ZSB0byBnZXQgaWFoYiBjbGtcbiIpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9F
UlIobWVzb25fZHdfaGRtaS0+aWFoYl9jbGspOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gK8KgwqDC
oCBjbGtfcHJlcGFyZV9lbmFibGUobWVzb25fZHdfaGRtaS0+aWFoYl9jbGspOwo+IAo+IAo+IE9u
IHByZXZpb3VzIFNvQ3MsIGlhaGIgd2FzIGRpcmVjdGx5IHRoZSBidXMgY2xvY2sgKGNsazgxKSwg
YW5kIG9uIAo+IHJlY2VudCBzb2NzCj4gdGhpcyBjbG9jayBpcyBhIGdhdGUuCj4gCj4gVGhlIHF1
ZXN0aW9uIGlzIHdoeSBpcyBpdCBkaXNhYmxlZC4gTWF5YmUgYSBwcmV2aW91cyBmYWlsZWQgcHJv
YmUgCj4gZGlzYWJsZWQgaXQKPiBpbiB0aGUgZHctaGRtaSBwcm9iZSBmYWlsdXJlIGNvZGUgYW5k
IHRoaXMgY2xvY2sgaXMgbmVlZGVkIGZvcgo+IG1lc29uX2R3X2hkbWlfaW5pdCgpLAo+IHNvIHll
YWggdGhpcyBpcyB0aGUgcmlnaHQgZml4Lgo+IAo+IFRoYW5rcy4KPiAKPiBDb3VsZCB5b3Ugc2Vu
ZCBhIHJldmVydCBvZiBiMzMzNDBlMzNhY2RmZTVjYTZhNWFhMTI0NDcwOTU3NWFlMWUwNDMyCj4g
YW5kIHRoZW4gcHJvcGVyIGZpeCB3aXRoIGNsa19kaXNhYmxlX3VucHJlcGFyZSBhZGRlZCA/CgpC
YWguIEkgbWlzc2VkIHRoYXQgZW1haWwgYW5kIHNlbnQgYSBzbGlnaHRseSBkaWZmZXJlbnQgcmVz
b2x1dGlvbi4KSG9wZWZ1bGx5IHRoYXQnbGwgYmUgZ29vZCBlbm91Z2guCgpUaGFua3MsCgogICAg
ICAgICBNLgotLSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
