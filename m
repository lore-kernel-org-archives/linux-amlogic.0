Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C337CD8C8C
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFzholCYDtz8tssTiLwmFzPPDUUPyDpD5rWQoHuOY7k=; b=17tCOlH4sRNtmu
	Fhptx8f2kQsS36zvhlr1bd5QqEMujb+U1zg//7p73ipMPvrhJCyKK5Ite6zgtzkvtH7yP+vxiNNnQ
	Br9stuBe8P1pYjUYdVC5UthUDssf36iDGQPPZ1c7VVGzQ8uFHB76LYyFa1J2jXu5Gp3/URxN1f2oA
	4Xorm/uuwGWOrT4IUgQZQn5AEskALxWvxz4LgqqdFZg+wbSWRFeDlaiACsKQ+8iZ1VndeMS5CI7Rc
	SQiLpOPm+jmzFmDkcxh3hcnMwbeKx1Y3jP7prf3UCcXuYipay4SNmYPYAe03ixiBq/yLLptq4IxHi
	3iS72BmsVkp2fdjibypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLKU-00000002WvF-47Bl;
	Sun, 07 Jun 2026 21:46:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLKT-00000002Wv0-1emg
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:46:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53A8960018;
	Sun,  7 Jun 2026 21:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C120E1F00893;
	Sun,  7 Jun 2026 21:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780868808;
	bh=f4TYD2MK/8wcG+xA5CmnPUXUwAKuqVUgIAionwX1Aqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KiNwAdmwa7xTofVXFQc7QuWKxACGacgB2xMGs1/RnOU0zji8lNry6GGfE9SJ4dqE8
	 dN2mGJWk2b2nfsVa8vhbKH/y+EAB1EIMMIgKTr35iPrDFzo+djczZji93xezVtI2Nj
	 yEseB8ct/ZYjvf5iQr4H9nl4kCgI5uQ/qVhxz2IVEC4yFTLaMpx01Qi8UEmlYQC6Sc
	 Ca33dvb7PHWQe7mSf5X/bLB7Ort+F4HomB9kCRrVwNs4jctX1GGaSD1CPK5MvLRDI8
	 y/iTJrD9Rt/wv4iQYyZskTAOEVXPSog35V1SgwM1hi3goJsCU9tVPbBPz/VwKe4hOT
	 A5XTrPL6U9/ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
Date: Sun, 07 Jun 2026 21:46:47 +0000
Message-Id: <20260607214647.C120E1F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIGBjYW5jZWxfd29ya19zeW5jKClgIHVwb24gZGV2aWNlIHVuYmluZCBs
ZWFkcyB0byBhIHVzZS1hZnRlci1mcmVlIHZ1bG5lcmFiaWxpdHkgZm9yIHRoZSBgYWx0bW9kZWAg
YW5kIGBhbHRfcG9ydGAgc3RydWN0dXJlcy4KLSBbSGlnaF0gTWlzc2luZyBgcmVpbml0X2NvbXBs
ZXRpb24oKWAgY2FuIGNhdXNlIHN1YnNlcXVlbnQgZmlybXdhcmUgcmVxdWVzdHMgdG8gcHJlbWF0
dXJlbHkgc3VjY2VlZCBpZiBhIHByZXZpb3VzIHJlcXVlc3QgdGltZWQgb3V0LgotLQoKY29tbWl0
IDk0MjM2MjQwYjVkMWU5MGFkMTkxZGFlNTM5ODJhMjQ1OThjZDNkNGMKQXV0aG9yOiBEbWl0cnkg
QmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Cgpzb2M6IHFjb206
IHBtaWMtZ2xpbmstYWx0bW9kZTogcGFzcyBkb3duIEhQRF9JUlEgZXZlbnRzCgpUaGlzIGNvbW1p
dCBwYXNzZXMgSVJRX0hQRCBldmVudHMgZnJvbSB0aGUgZmlybXdhcmUgdG8gdGhlIERpc3BsYXlQ
b3J0CmRyaXZlciB0aHJvdWdoIHRoZSBIUEQgYnJpZGdlLiBUaGlzIGVuYWJsZXMgdGhlIERQIHNv
dXJjZSB0byByZWNlaXZlCm5vdGlmaWNhdGlvbnMgYWJvdXQgZXZlbnRzIG9uIHRoZSBzaW5rIHNp
ZGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9xY29tL3BtaWNfZ2xpbmtfYWx0bW9kZS5j
IGIvZHJpdmVycy9zb2MvcWNvbS9wbWljX2dsaW5rX2FsdG1vZGUuYwo+IGluZGV4IDYxOWJhZDJj
MjdlZWIuLjk0NmViMjBiOGY4MzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvcWNvbS9wbWlj
X2dsaW5rX2FsdG1vZGUuYwo+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vcG1pY19nbGlua19hbHRt
b2RlLmMKPiBAQCAtMzczLDcgKzM3MywxMSBAQCBzdGF0aWMgdm9pZCBwbWljX2dsaW5rX2FsdG1v
ZGVfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCQllbHNlCj4gIAkJCWNvbm5f
c3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Cj4gIAo+IC0JCWRybV9hdXhf
aHBkX2JyaWRnZV9ub3RpZnkoJmFsdF9wb3J0LT5icmlkZ2UtPmRldiwgY29ubl9zdGF0dXMpOwo+
ICsJCWRybV9hdXhfaHBkX2JyaWRnZV9ub3RpZnlfZXh0cmEoJmFsdF9wb3J0LT5icmlkZ2UtPmRl
diwKPiArCQkJCQkJY29ubl9zdGF0dXMsCj4gKwkJCQkJCWFsdF9wb3J0LT5ocGRfaXJxID8KPiAr
CQkJCQkJRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBEIDoKPiArCQkJCQkJRFJNX0NPTk5FQ1RPUl9O
T19FWFRSQV9TVEFUVVMpOwo+ICAJfSBlbHNlIGlmIChhbHRfcG9ydC0+bXV4X2N0cmwgPT0gTVVY
X0NUUkxfU1RBVEVfVFVOTkVMSU5HKSB7Cj4gIAkJaWYgKGFsdF9wb3J0LT5zdmlkID09IFVTQl9U
WVBFQ19UQlRfU0lEKQo+ICAJCQlwbWljX2dsaW5rX2FsdG1vZGVfZW5hYmxlX3RidChhbHRtb2Rl
LCBhbHRfcG9ydCk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNl
ZCBieSB0aGlzIHBhdGNoLCBidXQgc2luY2Ugd2UgYXJlIG1vZGlmeWluZyB0aGUKd29ya3F1ZXVl
IGhhbmRsZXIsIGlzIHRoZXJlIGEgcG90ZW50aWFsIHVzZS1hZnRlci1mcmVlIGR1ZSB0byBtaXNz
aW5nIHdvcmsKY2FuY2VsbGF0aW9uIG9uIHRlYXJkb3duPwoKSW4gcG1pY19nbGlua19hbHRtb2Rl
X3Byb2JlKCksIHRoZSBkcml2ZXIgYWxsb2NhdGVzIHRoZSBhbHRtb2RlIHN0cnVjdHVyZSB2aWEK
ZGV2bV9remFsbG9jKCkgYW5kIGluaXRpYWxpemVzIGFsdG1vZGUtPmVuYWJsZV93b3JrIGFuZCBh
bHRfcG9ydC0+d29yaywgYnV0Cml0IGRvZXMgbm90IHJlZ2lzdGVyIGEgLnJlbW92ZSBjYWxsYmFj
ayBvciBhIGRldnJlcyBhY3Rpb24gdG8gc3luY2hyb25vdXNseQpjYW5jZWwgdGhlc2Ugd29yayBp
dGVtcy4KCldoZW4gdGhlIGF1eGlsaWFyeSBkZXZpY2UgaXMgdW5ib3VuZCwgdGhlIGRldnJlcyBm
cmFtZXdvcmsgd2lsbCBhdXRvbWF0aWNhbGx5CmZyZWUgdGhlIGFsdG1vZGUgc3RydWN0dXJlIGFu
ZCByZWxlYXNlIHJlc291cmNlcy4KCklmIHBtaWNfZ2xpbmtfYWx0bW9kZV93b3JrZXIoKSBpcyBj
dXJyZW50bHkgcGVuZGluZyBvciBleGVjdXRpbmcsIGNvdWxkIGl0CmRlcmVmZXJlbmNlIHRoZSBm
cmVlZCBhbHRtb2RlIGFuZCBhbHRfcG9ydCBwb2ludGVycz8KCltTZXZlcml0eTogSGlnaF0KVGhp
cyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IEkgYWxzbyBub3RpY2VkIGEgcG90ZW50aWFs
IHN0YXRlIG1hY2hpbmUKaXNzdWUgcmVnYXJkaW5nIGhvdyByZXF1ZXN0cyBhcmUgc2VudCB0byB0
aGUgZmlybXdhcmUuCgpJbiBwbWljX2dsaW5rX2FsdG1vZGVfcmVxdWVzdCgpLCB0aGUgZHJpdmVy
IHNlbmRzIGEgcmVxdWVzdCBhbmQgd2FpdHMgZm9yIGFuCmFja25vd2xlZGdtZW50OgoKCXJldCA9
IHBtaWNfZ2xpbmtfc2VuZChhbHRtb2RlLT5jbGllbnQsICZyZXEsIHNpemVvZihyZXEpKTsKCS4u
LgoJd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZhbHRtb2RlLT5wYW5fYWNrLCAuLi4pOwoK
SWYgdGhlIHdhaXQgdGltZXMgb3V0LCB0aGUgZnVuY3Rpb24gcmV0dXJucyAtRVRJTUVET1VULiBJ
ZiB0aGUgZGVsYXllZAphY2tub3dsZWRnbWVudCBldmVudHVhbGx5IGFycml2ZXMsIHBtaWNfZ2xp
bmtfYWx0bW9kZV9jYWxsYmFjaygpIHdpbGwgY2FsbApjb21wbGV0ZSgpLCBpbmNyZW1lbnRpbmcg
dGhlIGNvdW50ZXIuCgpTaW5jZSB0aGUgZHJpdmVyIG5ldmVyIGNhbGxzIHJlaW5pdF9jb21wbGV0
aW9uKCkgYmVmb3JlIHNlbmRpbmcgYSBuZXcgcmVxdWVzdCwKd2lsbCB0aGUgbmV4dCBjYWxsIHRv
IHBtaWNfZ2xpbmtfYWx0bW9kZV9yZXF1ZXN0KCkgaW5zdGFudGx5IHN1Y2NlZWQgYnkKY29uc3Vt
aW5nIHRoZSBzdGFsZSBjb21wbGV0aW9uIGNvdW50ZXIgaW5zdGVhZCBvZiB3YWl0aW5nIGZvciB0
aGUgYWN0dWFsCmhhcmR3YXJlIGFja25vd2xlZGdtZW50PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYwOC1ocGQtaXJxLWV2ZW50
cy12NC0wLTMwYjYyYjMzNTQ4N0Bvc3MucXVhbGNvbW0uY29tP3BhcnQ9NwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
