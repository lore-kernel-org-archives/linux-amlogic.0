Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D282C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkOvhMp/27av5grenzxkY5ygadtknscUrbeiM5p1y/Y=; b=TF2TOMRzRxTNyk
	T6AG549193/+ZVUYuMExXsqAJlbBCgpWEYGmkwyy9200z0M/0N97PjKmH1RyWuMVyjaQaYFpwE9Ew
	XJEaT/CN8q3iPg/zhBNAvPpCxNdowiMvMAdYtkVp8jaNeZMXPf81iL9LdCkz7ulN78CTjIayDbaM8
	Zgy9ZlgtBNXTj+IMyW6z9wZty+XOdNU2566eNeeHu6dwnF5+V9HM1n5AI+VNE0HffzNGT6l7SIhg7
	G4VjNfu0O8EKm+elZK9UkHOi0Ci5xZ82lYHZKT3tJ7DvMdVkIDQqFjDQC/Nlyq2obtVn7QnCPv+6R
	lWtcz7AZBfnh7ooLQVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA41p-003u6P-6f; Wed, 19 Jan 2022 06:01:05 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA41b-003u18-Lu; Wed, 19 Jan 2022 06:00:52 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 19 Jan
 2022 14:00:45 +0800
Message-ID: <21eea0cd-5bf1-dec6-a776-f417aefa5bda@amlogic.com>
Date: Wed, 19 Jan 2022 14:00:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V6 3/5] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-4-yu.tu@amlogic.com>
 <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_220051_759077_93574E7B 
X-CRM114-Status: GOOD (  15.17  )
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

SGkgSmlyaSwKCVRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcGF0aWVudCByZXBseS5JIGxl
YXJuZWQgYSBsb3QgZnJvbSB5b3VyIApyZXNwb25zZS4KCk9uIDIwMjIvMS8xOCAxNzozOSwgSmly
aSBTbGFieSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiAxOC4gMDEuIDIyLCA0
OjA5LCBZdSBUdSB3cm90ZToKPj4gVXNpbmcgdGhlIGNvbW1vbiBDbG9jayBjb2RlIHRvIGRlc2Ny
aWJlIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jawo+PiBtYWtlcyBpdCBlYXNpZXIgZm9yIHRoZSBV
QVJUIGRyaXZlciB0byBiZSBjb21wYXRpYmxlIHdpdGggdGhlCj4+IGJhdWQgcmF0ZSByZXF1aXJl
bWVudHMgb2YgdGhlIFVBUlQgSVAgb24gZGlmZmVyZW50IG1lc29uIGNoaXBzLgo+IC4uLgo+PiAt
LS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+ICsrKyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiAuLi4KPj4gQEAgLTYyOSw1NyArNjQwLDEwNSBAQCBzdGF0
aWMgc3RydWN0IHVhcnRfZHJpdmVyIG1lc29uX3VhcnRfZHJpdmVyID0gewo+PiDCoMKgwqDCoMKg
IC5jb25zwqDCoMKgwqDCoMKgwqAgPSBNRVNPTl9TRVJJQUxfQ09OU09MRSwKPj4gwqAgfTsKPj4g
LXN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqbWVzb25fdWFydF9wcm9iZV9jbG9jayhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29uc3QgY2hhciAqaWQpCj4+IC17Cj4+IC3CoMKgwqAgc3RydWN0IGNsayAqY2xr
ID0gTlVMTDsKPj4gLcKgwqDCoCBpbnQgcmV0Owo+PiAtCj4+IC3CoMKgwqAgY2xrID0gZGV2bV9j
bGtfZ2V0KGRldiwgaWQpOwo+PiAtwqDCoMKgIGlmIChJU19FUlIoY2xrKSkKPj4gLcKgwqDCoMKg
wqDCoMKgIHJldHVybiBjbGs7Cj4+IC0KPj4gLcKgwqDCoCByZXQgPSBjbGtfcHJlcGFyZV9lbmFi
bGUoY2xrKTsKPj4gLcKgwqDCoCBpZiAocmV0KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KGRldiwgImNvdWxkbid0IGVuYWJsZSBjbGtcbiIpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IEVSUl9QVFIocmV0KTsKPj4gLcKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoCBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQoZGV2LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm9pZCgqKSh2b2lk
ICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xr
KTsKPj4gLQo+PiAtwqDCoMKgIHJldHVybiBjbGs7Cj4+IC19Cj4+ICtzdGF0aWMgc3RydWN0IGNs
a19kaXZfdGFibGUgeHRhbF9kaXZfdGFibGVbXSA9IHsKPiAKPiBUaGlzIGNhbiBiZSBjb25zdCwg
cmlnaHQ/CllvdSBhcmUgcmlnaHQuCj4gCj4+ICvCoMKgwqAgezAsIDN9LAo+PiArwqDCoMKgIHsx
LCAxfSwKPj4gK8KgwqDCoCB7MiwgMn0sCj4+ICvCoMKgwqAgezMsIDJ9LAo+IAo+IE5vdCBzdXJl
IGlmIHlvdSBkaWRuJ3QgcmVtb3ZlIHRvbyBtdWNoIHdoaXRlc3BhY2UuIEkgdGhpbmsgaXQgc2hv
dWxkIGJlIAo+IGxpa2U6ICJ7IDAsIDMgfSwiLiBCdXQgSSBhY3R1YWxseSBkb24ndCBjYXJlLCBp
dCdzIGEgbWlub3IgdGhpbmcuCj4gCk9rLCBJIHdpbGwgY29ycmVjdCBpdCBpZiBpdCBuZWVkcyB0
byBiZSBjaGFuZ2VkLgo+IEkgY2Fubm90IGNvbW1lbnQgb24gdGhlIHJlc3QgKGNsayBhbmQgT0Yg
cGFydCkgYXMgbXkga25vd2xlZGdlIGlzIHByZXR0eSAKPiBsaW1pdGVkIHRoZXJlLiBMZWF2aW5n
IHVwIHRvIG90aGVycy4KPiAKQW55d2F5LCB0aGFua3MgZm9yIHlvdXIgcmVwbHkuCj4gdGhhbmtz
LAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
