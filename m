Return-Path: <SRS0=7hc/=2J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1FDC43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 02:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05B8227BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 02:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/PUoCu3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05B8227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YfHrkPLOCcdyI8nlpwpZD8lzZhDt9Ych+jDYCY1rY8o=; b=T/PUoCu3levCUbpyVZB5G/LgF
	uNQUeB9QIM6NcBvPDJ7yYO2moRT0ZPPDa2F8KHljcRhyKPLgUjbP4IoGca62DNmkI8LqI7cWZG0ju
	cV5Hz2FlfBFIjwoTEHGA4ZB3Gb/VGwkJiphDWlJAvt+pEjQUoEfe0Q811bz6aVTdemssp7/kxDP8i
	SNRMkaYDOZvgkXb4cbxcAkSFhc6RYUfyoe+qQ0lDT35CMTTJ+5lM3W5S4m27L3XDeBPPUvvjHq6Ef
	PEtvUIH+RVkfdQkJyGP3IvxEi44L6BdM9QiMw7X9Y5p7s75m27CQTV7pHBN/th+z8lbxYzsKhEdgE
	tpAX5N8BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihltb-00066j-T6; Thu, 19 Dec 2019 02:50:35 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihltZ-00065T-66; Thu, 19 Dec 2019 02:50:34 +0000
Received: from [10.28.19.135] (10.28.19.135) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 10:51:04 +0800
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To: Rob Herring <robh@kernel.org>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
 <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
 <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
 <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
 <20191218203404.GA2451@bogus>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <2d762720-cb08-e72a-06e5-4096e211e34b@amlogic.com>
Date: Thu, 19 Dec 2019 10:51:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218203404.GA2451@bogus>
Content-Language: en-GB
X-Originating-IP: [10.28.19.135]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_185033_233905_5FB306DB 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIFJvYgoKT24gMjAxOS8xMi8xOSA0OjM0LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBXZWQs
IERlYyAxOCwgMjAxOSBhdCAwMzozNzo0OVBNICswODAwLCBYaW5neXUgQ2hlbiB3cm90ZToKPj4g
SGksIEd1ZW50ZXIgTWFydGluCj4+Cj4+IE9uIDIwMTkvMTIvMTYgMjE6MzAsIEd1ZW50ZXIgUm9l
Y2sgd3JvdGU6Cj4+PiBPbiAxMi8xNS8xOSAxMDowMyBQTSwgWGluZ3l1IENoZW4gd3JvdGU6Cj4+
Pj4gSGksIE1hcnRpbgo+Pj4+Cj4+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+Pj4+Cj4+
Pj4gT24gMjAxOS8xMi8xMyA0OjA1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+Pj4+PiBI
aSBYaW5neXUgYW5kIFJvYiwKPj4+Pj4KPj4+Pj4gT24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMToy
MCBQTSBYaW5neXUgQ2hlbgo+Pj4+PiA8eGluZ3l1LmNoZW5AYW1sb2dpYy5jb20+IHdyb3RlOgo+
Pj4+PiBbLi4uXQo+Pj4+Pj4gK2V4YW1wbGVzOgo+Pj4+Pj4gK8KgIC0gfAo+Pj4+Pj4gK8KgwqDC
oCB3YXRjaGRvZyB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1s
b2dpYyxtZXNvbi1zZWMtd2R0IjsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dC1z
ZWMgPSA8NjA+Owo+Pj4+Pj4gK8KgwqDCoCB9Owo+Pj4+PiBpbiB2MyBvZiB0aGlzIHBhdGNoIFJv
YiBjb21tZW50ZWQgdGhhdCB0aGVyZSBzaG91bGRuJ3QgYmUgYW4gT0Ygbm9kZQo+Pj4+PiBpZiB0
aGVyZSBhcmUgbm8gYWRkaXRpb25hbCBwcm9wZXJ0aWVzCj4+Pj4+IHdpdGggdGltZW91dC1zZWMg
dGhlcmUncyBub3cgYW4gYWRkaXRpb25hbCBwcm9wZXJ0eSBzbyBteQo+Pj4+PiB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgaXQncyBmaW5lIHRvIGhhdmUgYW4gT0Ygbm9kZQo+Pj4+IFlvdXIgdW5kZXJz
dGFuZGluZyBpcyBjb3JyZWN0Lgo+Pj4+PiB3aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCB5ZXQgaXMg
d2hlcmUgdGhpcyBub2RlIHNob3VsZCBiZSBwbGFjZWQuCj4+Pj4+IGlzIGl0IHN1cHBvc2VkIHRv
IGJlIGEgY2hpbGQgbm9kZSBvZiB0aGUgc2VjdXJlIG1vbml0b3Igbm9kZSAoZm9yCj4+Pj4+IHdo
aWNoIHdlIGFscmVhZHkgaGF2ZSBhIGJpbmRpbmcgaGVyZToKPj4+Pj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLnR4dCkgb3IKPj4+Pj4g
d2hlcmUgZWxzZSB3b3VsZCB3ZSBwbGFjZSBpdCBpbnNpZGUgdGhlIC5kdHM/Cj4+Pj4gSU1PLMKg
IEFsdGhvdWdoIHRoZSB3YXRjaGRvZyBub2RlIG5lZWQgdG8gcmVmZXJlbmNlIHRoZSBtZXNvbl9z
bQo+Pj4+IG5vZGUsIHRoZXJlIGlzIG5vCj4+Pj4gYnVzLWxpa2UgZGVwZW5kZW5jaWVzIGJldHdl
ZW4gdGhlIGRldmljZXMgd2hpY2ggdGhlIHR3byBub2Rlcwo+Pj4+IGNvcnJlc3BvbmRpbmcgdG8u
Cj4+Pj4gc28gaSB0aGluayB0aGF0IHRoZSB3YXRjaGRvZyBub2RlIGFzIGNoaWxkIG5vZGUgb2Yg
bWVzb25fc20gbWF5YmUKPj4+PiBub3QgYXBwcm9wcmlhdGUuCj4+PiBUaGUgd2F0Y2hkb2cgZHJp
dmVyIG5lZWRzIHRoZSBtZXNvbiBTTSdzIGR0IG5vZGUsIGFuZCBpdCBkZXBlbmRzIG9uIHRoZQo+
Pj4gZXhpc3RlbmNlCj4+PiBvZiB0aGF0IG5vZGUuIFRoYXQgc2VlbXMgZW5vdWdoIG9mIGEgcmVs
YXRpb25zaGlwIHRvIHdhcnJhbnQgaGF2aW5nIGl0Cj4+PiBhcyBjaGlsZCBub3RlLgo+PiBUaGFu
a3MgZm9yIHlvdXIgcmVwbHksIGlmIGkgdGFrZSB0aGUgd2R0IG5vZGUgYXMgY2hpbGQgb2Ygc2Vj
dXJlIG1vbml0b3IKPj4gKHNtKSwgaG93IHNob3VsZAo+PiBpIHJlZ2lzdGVyIG9yIGZpbmQgdGhl
IHdkdCBkZXZpY2UgPwo+Pgo+PiBJIG9ubHkgdGhpbmsgb2YgdGhlIGZvbGxvd2luZyB0aHJlZSBt
ZXRob2RzIDoKPj4gMSkuIHVwZGF0ZSB0aGUgc20gZHJpdmVy77yMYW5kIHNjYW4mcmVnaXN0ZXIg
d2R0IGRldmljZSB3aGVuIHRoZSBzbSBkcml2ZXIKPj4gcHJvYmVzKEl0IGlzIGxpa2UgaTJjKSwg
YnV0IHRoZXJlCj4+IGFyZSB0b28gbWFueSBjaGFuZ2VzIGludm9sdmVkLgo+IEp1c3QgYWRkIG9m
X3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUoKSBjYWxsIGFuZCBjbGVhbi11cCBjYWxscy4gVGhh
dCdzCj4gbm90IHdoYXQgSSdkIGNhbGwgJ3RvbyBtYW55IGNoYW5nZXMnLgpUaGFua3MgZm9yIHlv
dXIgZ3VpZGFuY2UuCj4KPiAgIAo+PiAyKS4gYWRkICJzaW1wbGUtYnVzIiBrZXkgc3RyaW5nIHRv
IGNvbXBhdGlibGUgb2Ygc20gbm9kZSwgYW5kIGl0IHdpbGwgbWFrZQo+PiB0aGUgY2hpbGQgbm9k
ZSBpcyByZWdpc3RlcmVkIGFzCj4+IHBsYXRmb3JtIGRldmljZSwgYnV0IGl0IHNlZW1zIHRoYXQg
dGhlIGtleSBzdHJpbmcgaXMgbm90IG1hdGNoIGN1cnJlbnQKPj4gc2NlbmUuCj4gWW91IHByZXZp
b3VzbHkgc2FpZCBpdCdzIG5vdCBhIGJ1cy4uLgo+Cj4+IHNlY3VyZS1tb25pdG9yIHsKPj4gIMKg
wqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3hiYi1zbSIswqAgInNpbXBsZS1idXMi
Owo+Pgo+PiAgwqDCoMKgIHdhdGNoZG9nIHsKPj4gIMKgwqDCoCDCoMKgwqAgY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLG1lc29uLXNlYy13ZHQiOwo+PiAgwqDCoMKgIMKgwqDCoCB0aW1lb3V0LXNlYyA9
IDw2MD47Cj4+ICDCoMKgwqAgfQo+PiB9Cj4+Cj4+IDMpLsKgIGRvbid0IHJlZ2lzdGVyIGRldmlj
ZSwgYW5kIGZpbmQgZGlyZWN0bHkgdGhlIHdhdGNoZG9nIG5vZGUgYnkgdXNpbmcgdGhlCj4+IG9m
XyogQVBJIGluIHdhdGNoZG9nCj4+IGRyaXZlciAoRWc6IGxpbnV4LTQueC9kcml2ZXJzL3RlZS9v
cHRlZS9jb3JlLmMpCj4+Cj4+IHNlY3VyZS1tb25pdG9yIHsKPj4gIMKgwqDCoCBjb21wYXRpYmxl
ID0gImFtbG9naWMsbWVzb24tZ3hiYi1zbSI7Cj4+Cj4+ICDCoMKgwqAgd2F0Y2hkb2cgewo+PiAg
wqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXNlYy13ZHQiOwo+PiAg
wqDCoMKgwqDCoMKgwqAgdGltZW91dC1zZWMgPSA8NjA+Owo+PiAgwqDCoMKgIH0KPj4gfQo+Pgo+
PiBUaGUgbWV0aG9kIDMgbG9va3MgYmV0dGVyIGZvciBtZSwgZG8geW91IGhhdmUgYSBiZXR0ZXIg
c3VnZ2VzdGlvbiA/IFRoYW5rcwo+Pgo+PiBCUgo+Pj4gR3VlbnRlcgo+Pj4KPj4+IC4KPj4+Cj4g
Lgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
