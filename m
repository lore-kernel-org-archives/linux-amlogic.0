Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BC1ECE585
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHtnAtVTT2s7jWs2UsbhFQ+YlXrfCfx2KAVMTCvOpuE=; b=2BcD1W4WEGUFtj
	14kNthp5oHBH7kn2ojNo/ui8VfzjKdY5iiyxGcuOTIh+aGosIEXmoeUq/1ETsowExexEz98+jISRw
	4NkdvuBVPJshdvHPyKrClkyfNAv+qIKe202uSFxNrH/VvoWZfdFO5/4QznNR9mQtuIkGHfWOOoE0O
	lyGq133gQKXbX9nwRxDpB38OJyhwfvxsT62ysmzIsX5fr7w7gV2c0CoxIlSMuGtGtQ300/+O8uYJ0
	iQ2/o9tq43313hS4jdLJDg4tWl2HfQGfMsH18TyE3MgN5WNVk3FzloLo6LTnE7qaMBLlAUnCqFb1e
	XH1FFEIEkfPUQL12ssmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna9t-00000001C4F-2iN3;
	Mon, 09 Sep 2024 08:54:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna6T-00000001Ba3-3fsO
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 08:50:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374c84dcc90so2366880f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725871832; x=1726476632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZJQioiDG6vZFQVLT3tLwBSGJZWN/LfrxwoKZ9E2niA=;
        b=AQSsrDVeHKCd5GF97Wh4LHaWhkIk+Hu0StSFk0f2DTKpKqCMNmANnoXdC3Uw0fJ8a7
         PqTYGcsVW/PGDmQOLVF4B/vVkS0X6NBQRK1uvF9q9dOJzKvNqwfk89up/Z20k7uuIWNf
         IAPbKWLQ00Rx/a8n3p3LOIXSfRFLvqKCXAMRTapVYj3EsPxf72+WIBJTStTPwPBR4tLp
         t15HZm0hXBMMWxqczh+ktsgj8mrDpPMsXWI91r2naECiftBtQVsbV5PdXxrmrPeIzIgX
         dVkbYecNSGgFK82S4Ttek6sXE4tccV/Q966r/BNzvLNftP6kpRgYVMSfwpxJ0/TXcreX
         NP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871832; x=1726476632;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZJQioiDG6vZFQVLT3tLwBSGJZWN/LfrxwoKZ9E2niA=;
        b=snWLy7ylK+sFmlwZnJmudg2kMLEI8ezOu1w8lxgpvpKfF8ayIbBzN/01eDPbcRyyYp
         D/ubsK2nssH8WYJkMuSLLxUiXk+aCdSLcDjxJbhpjWTiQToKJlTHQ/IQYYLN//yrMBLn
         sD/tORsbXhx+WUmVEMbbUFEWBPQ3R+HYl4gw7RhgidqsKPWInGLZmJ+E0Ggx/WosT2Jz
         ZoocM1QTaVIBpgBvkVAsJU2n1x7LEN/X6wWWcaQ7+z/PoWbgl3ro+XoC1ca/r/nazBMN
         bso8vMQyqUXGlJJs993swUrSo9/f3GLEj5D2thuZ/tn1QH18KSYvRbRxa3SN1pc9a5sE
         ZCRA==
X-Forwarded-Encrypted: i=1; AJvYcCWCb0SGgzpJ2qwRmWCIaUjnnF58MBLIBmSe3tvRoPmEGh/X4Jw3dtFiZ/lqBiO4CNIPg3n9ZwD3US3lPnuR@lists.infradead.org
X-Gm-Message-State: AOJu0YzMDwEfl7d9S8Qj9Ak/ihPoj1U26FGUL35ydYlej3d+yqvSnSUb
	IFTVdtL9vOCOVKX6W1o32FvWyKfxQHHQYMXesWp0DL0fv95mR+lqAUke3msmeHQ=
X-Google-Smtp-Source: AGHT+IEYu8WPZODx8ejAn+tDdBcHP1mOYbzIHeP/oTcvUPyjQNTIqE3O72WiYNlPU07xjDbs+OC6BA==
X-Received: by 2002:a5d:69cf:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-378895ca1a2mr7244471f8f.16.1725871831557;
        Mon, 09 Sep 2024 01:50:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956655f1sm5437292f8f.46.2024.09.09.01.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <a84c8ffb-8eda-434a-834c-a023563ac8cd@amlogic.com> (Chuan Liu's
	message of "Mon, 9 Sep 2024 16:46:35 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
	<1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
	<46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com>
	<1jmskhtgv1.fsf@starbuckisacylon.baylibre.com>
	<a84c8ffb-8eda-434a-834c-a023563ac8cd@amlogic.com>
Date: Mon, 09 Sep 2024 10:50:30 +0200
Message-ID: <1jikv5tdm1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_015034_080165_B791CB67 
X-CRM114-Status: GOOD (  18.01  )
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

T24gTW9uIDA5IFNlcCAyMDI0IGF0IDE2OjQ2LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6DQoNCj4gSGksIEplcm9tZToNCj4NCj4gwqDCoMKgIMKgwqDCoCBUaGFuayB5
b3UgZm9yIHlvdXIgbWV0aWN1bG91cyBleHBsYW5hdGlvbi4NCj4NCj4NCj4gT24gMjAyNC85Lzkg
MTU6NDAsIEplcm9tZSBCcnVuZXQgd3JvdGU6DQo+PiBbIEVYVEVSTkFMIEVNQUlMIF0NCj4+DQo+
PiBPbiBNb24gMDkgU2VwIDIwMjQgYXQgMDk6NTUsIENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9n
aWMuY29tPiB3cm90ZToNCj4+DQo+Pj4gU29ycnksIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB0
aGlzIG9uZS4gSXMgaXQgYmVjYXVzZSB5b3Ugc3VnZ2VzdCBrZWVwaW5nDQo+Pj4NCj4+PiAiKDEg
PDwgcGxsLT5mcmFjX21heCkiIGhlcmUsIGZvbGxvd2VkIGJ5ICJpZiIgdG8gZGV0ZXJtaW5lIHdo
ZXRoZXIgdG8gYXNzaWduDQo+Pj4NCj4+PiAicGxsLT5mcmFjX21heCI/DQo+Pj4NCj4+Pg0KPj4+
ICJ1bmxpa2VseSIgaXMgdXNlZCBoZXJlLiBNeSBpZGVhIGlzIHRoYXQgaXQgd2lsbCBiZSBwb3Nz
aWJsZSB0byBkZXRlcm1pbmUNCj4+PiB0aGUgdmFsdWUNCj4+Pg0KPj4+IG9mICJmcmFjX21heCIg
YXQgY29tcGlsZSB0aW1lLCB3aGljaCB3aWxsIHJlc3VsdCBpbiBvbmUgbGVzcyAiaWYiIGp1ZGdt
ZW50DQo+Pj4gYW5kDQo+Pj4NCj4+PiBzbGlnaHRseSBpbXByb3ZlIGRyaXZlIHBlcmZvcm1hbmNl
Lg0KPj4gSSdsbCByZXBocmFzZS4NCj4+DQo+PiBQbGVhc2UgZHJvcCB0aGUgJ3VubGlrZWx5KCkn
IGNhbGwuDQo+Pg0KPj4gWW91IG1heSBhZGQgdGhhdCA6DQo+PiAgICogaW4gYSBzZXBhcmF0ZSBj
aGFuZ2UNCj4+ICAgKiBpZiB5b3UgcmVhbGx5IHJlYWxseSB3aXNoIHRvDQo+PiAgICogaWYgeW91
IHByb3ZpZGUgcHJvZmlsaW5nIG51bWJlcnMgZm9yIHRoZSBkaWZmZXJlbnQgc3VwcG9ydGVkDQo+
PiAgICAgcGxhdGZvcm1zIGFuZCBQTExzLCBub3QganVzdCB0aGUgb25lIHRhcmdldGVkIGJ5IHRo
aXMgcGF0Y2hzZXQuDQo+DQo+DQo+IE9rYXksIFVuZGVyc3Rvb2QuIFNvIHlvdSBzdWdnZXN0IGxp
a2UgdGhpcz8NCg0KTm8uIGRyb3AgdGhlIGNhbGwgdG8gdW5saWtlbHkoKS4gS2VlcCB0aGUgcmVz
dC4gVGhhdCdzIGl0Lg0KDQo+DQo+IHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fcGxsX3BhcmFtc190
b19yYXRlKHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsKQ0KPiDCoHsNCj4gwqDCoMKgwqDC
oMKgwqAgdTY0IHJhdGUgPSAodTY0KXBhcmVudF9yYXRlICogbTsNCj4gK8KgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgZnJhY19tYXggPSAoMSA8PCBwbGwtPmZyYWMud2lkdGgpOw0KPg0KPiDCoMKg
wqDCoMKgwqDCoCBpZiAoZnJhYyAmJiBNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+ZnJhYykp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBmcmFjX3JhdGUgPSAodTY0
KXBhcmVudF9yYXRlICogZnJhYzsNCj4NCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmF0ZSArPSBESVZfUk9VTkRfVVBfVUxMKGZyYWNfcmF0ZSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoMSA8PCBwbGwtPmZyYWMud2lkdGgpKTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHBsbC0+ZnJhY19tYXgpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmcmFjX21heCA9IHBsbC0+ZnJhY19tYXg7DQo+ICsNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmF0ZSArPSBESVZfUk9VTkRfVVBfVUxMKGZyYWNfcmF0
ZSwgZnJhY19tYXgpOw0KPg0KPg0KPiBJbiBteSBvcGluaW9uLCB0aGlzIGNoYW5nZSBzZWVtcyBt
b3JlIGxvZ2ljYWwsIGJ1dCB0aGUgYW1vdW50IG9mDQo+DQo+IGNoYW5nZSBpcyBsYXJnZXI/8J+Y
rg0KDQotLSANCkplcm9tZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
