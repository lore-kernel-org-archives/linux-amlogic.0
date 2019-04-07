Return-Path: <SRS0=pUon=SJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06528C10F0E
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 10:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70BF20880
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 10:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YT/KuUG/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LTeLSoEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70BF20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrXNNOu8DqJeJv9k4cUHRM+c7Rw8vC5ieJsGpmnee9E=; b=YT/KuUG/4k3EWH
	AXpFyh15JtL19jMHeFE8ahyaG3i0acWr2wJAfe4jIYwlDxTcYQ4/jqxdr/ivNtZK7LEw+N84l0tj5
	8K9nywqfwcDtz/+oxa4B3VOHy0RDqVw4lteW7W2m2jMMYhmbAAXE7TG3lImodHXuvudfPQyrdcS6/
	HQza40u8lIaILj7D6XO5JfHadTcrlOUto5V7p2dpVZJOUAVvgOkNjsdqisOpfCHlPolL0yCqVwvOb
	r5A+u5RJkpjGZxna/CCGcP5C2gTrhweQiCUsl1jVnArZHZz+iJmlXGxzx5XVggj5vWbchf5Bu0zSB
	yw1Gjovh2y/10nKTazKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hD4rM-0004tw-6X; Sun, 07 Apr 2019 10:17:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hD4rI-0004sP-EY
 for linux-amlogic@lists.infradead.org; Sun, 07 Apr 2019 10:17:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id r4so12858710wrq.8
 for <linux-amlogic@lists.infradead.org>; Sun, 07 Apr 2019 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=5lcB7Wch1bi7eOnQ+uFbKmPRUk4kHkGbfW5/BeV2uIc=;
 b=LTeLSoEfp7pdTE4fl5R9s8skKop8jQpclNFb9vNaPwmyXQjSp3Gd1wxIk9jQFVcbx/
 YfRVEoRpGreZRn+bg+VZJtpbB3ysNUUnE1r2S9TPzapoyIAkOXowxINbOKtAEzOHE9Gy
 HrZqQ+0Y+mZfQQURpeRT+1/AnDgs5A3DbRrkCkymG+q8uA+UjgfW+yrNRPP9dqRvoIkD
 u+tFG2Z0hIGZVqfx/ObCmMMG6l7gyl9i1MM4FCssvT67vu79Rf0xsDBX+TyoyzOWkgt/
 MR2dT/NegM6NDWuhCM++9TK4CCTXxRB4E4nDnOt1z2j0qqBgPgRkh+NXPANiLG934rTq
 Ni2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=5lcB7Wch1bi7eOnQ+uFbKmPRUk4kHkGbfW5/BeV2uIc=;
 b=BbWdmKjEtSlhf1jpzOkBmcApm8OiJ+jFmh/SKKnCYNE/Udo7dKiG4y83Ngb1kYjg5h
 dEUpdfPERvZePgi/I6tTLhKPQQ/xUCxqb1iQZIxlZ4lFZ3w5RMScyoNBTGlpZjrT2Scf
 WC+lnNvYedWTN1JoTb/18cjoMgx1hevvBFV9VAdM9si+yz6Rr5NJsm1NMRoHcJv1duql
 Q5/ZVoLDTNGDhXZX1Obkx3L/tol1PUhj5BJJOjJpECrw7RsEDqCNTo0ap2gjft/J6sid
 xCzNpV/gi7cDaotwUy0Af1h/68BMkEsJSs3s65AxZsaZ+2lXfTpxlJtoW0sTe3X0OmaA
 vTQQ==
X-Gm-Message-State: APjAAAUnItWfOHi7RuVz0vomTZVjqBsR3s5NrgTcbNJmQbDcxjSiHEJf
 7uWHvZK3BMWetKKrWoFiUw8gNA==
X-Google-Smtp-Source: APXvYqzncw2UHqVoDvNK6OpljP9VBbV8193ABL+UI/ScYWvn2NrE2koim6mNu8NcM2bNTgGA/7ucZw==
X-Received: by 2002:adf:b6a3:: with SMTP id j35mr13980118wre.25.1554632220509; 
 Sun, 07 Apr 2019 03:17:00 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 a17sm7881057wmg.40.2019.04.07.03.16.59
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 07 Apr 2019 03:16:59 -0700 (PDT)
Message-ID: <5CA9CE1A.6060109@baylibre.com>
Date: Sun, 07 Apr 2019 12:16:58 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: robh@kernel.org
Subject: Re: [PATCH v4] dt-bindings: gpu: add bindings for the ARM Mali Bifrost
 GPU
References: <20190401080949.14550-1-narmstrong@baylibre.com>
 <1640dd7b-3576-d9ce-0641-6b6a64a87275@arm.com>
 <d26f1ce9-c56c-5e51-37f5-0689aa198dc0@baylibre.com>
In-Reply-To: <d26f1ce9-c56c-5e51-37f5-0689aa198dc0@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_031704_488308_583FED8B 
X-CRM114-Status: GOOD (  16.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKTGUgMDEvMDQvMjAxOSAxMzoyNCwgTmVpbCBBcm1zdHJvbmcgYSDDqWNyaXQgOgo+
IE9uIDAxLzA0LzIwMTkgMTI6MDAsIFN0ZXZlbiBQcmljZSB3cm90ZToKPj4gT24gMDEvMDQvMjAx
OSAwOTowOSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBBZGQgdGhlIGJpbmRpbmdzIGZvciB0
aGUgQmlmcm9zdCBmYW1pbHkgb2YgQVJNIE1hbGkgR1BVcy4KPj4+Cj4+PiBUaGUgQmlmcm9zdCBH
UFUgYXJjaGl0ZWN0dXJlIGlzIHNpbWlsYXIgdG8gdGhlIE1pZGdhcmQgZmFtaWx5LAo+Pj4gYnV0
IHdpdGggYSBkaWZmZXJlbnQgU2hhZGVyIENvcmUgJiBFeGVjdXRpb24gRW5naW5lIHN0cnVjdHVy
ZXMuCj4+Pgo+Pj4gQmluZGluZ3MgYXJlIGJhc2VkIG9uIHRoZSBNaWRnYXJkIGZhbWlseSBiaW5k
aW5ncywgYnV0IHRoZSBpbm5lcgo+Pj4gYXJjaGl0ZWN0dXJhbCBjaGFuZ2VzIG1ha2VzIGl0IGEg
c2VwYXJhdGUgZmFtaWx5IG5lZWRpbmcgc2VwYXJhdGUKPj4+IGJpbmRpbmdzLgo+Pj4KPj4+IFRo
ZSBCaWZyb3N0IEdQVXMgYXJlIHByZXNlbnQgaW4gYSBudW1iZXIgb2YgcmVjZW50IFNvQ3MsIGxp
a2UgdGhlCj4+PiBBbWxvZ2ljIEcxMkEgRmFtaWx5LCBhbmQgbWFueSBvdGhlciB2ZW5kb3JzLgo+
Pj4gVGhlIEFtbG9naWMgdmVuZG9yIHNwZWNpZmljIGNvbXBhdGlibGUgaXMgYWRkZWQgdG8gaGFu
ZGxlIHRoZQo+Pj4gc3BlY2lmaWMgSVAgaW50ZWdyYXRpb24gZGlmZmVyZW5jZXMgYW5kIGRlcGVu
ZGVuY2llcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Cj4+PiAtLS0KPj4+ICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJp
ZnJvc3QudHh0ICAgICAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrCj4+PiAgMSBmaWxlIGNo
YW5nZWQsIDkyIGluc2VydGlvbnMoKykKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAo+Pj4KPj4+
IENoYW5nZXMgc2luY2UgdjM6Cj4+PiAtIEFkZGVkIG5vdGUgYWJvdXQgZGlzY292ZXJhYmxlIG1v
ZGVsL3JldmlzaW9uCj4+PiAtIEVuZm9yY2VkIGZpeGVkIGRlZmluZWQgaXJxIG9yZGVyCj4+PiAt
IEZpeGVkIHR5cG8gaW4gYWNjb21tb2RhdGUKPj4+Cj4+PiBDaGFuZ2VzIHNpbmNlIHYyOgo+Pj4g
LSBtb3ZlZCB0byBhIHNpbmdsZSBjb21wYXRpYmxlIHNpbmNlIEhXIGlzIGZ1bGx5IGRpc2NvdmVy
YWJsZQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzExYzllYWQxN2EyCj4+PiAtLS0gL2Rldi9udWxsCj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJp
ZnJvc3QudHh0Cj4+PiBAQCAtMCwwICsxLDkyIEBACj4+PiArQVJNIE1hbGkgQmlmcm9zdCBHUFUK
Pj4+ICs9PT09PT09PT09PT09PT09PT09PQo+Pj4gKwo+Pj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6
Cj4+PiArCj4+PiArLSBjb21wYXRpYmxlIDoKPj4+ICsgICogU2luY2UgTWFsaSBCaWZyb3N0IEdQ
VSBtb2RlbC9yZXZpc2lvbiBpZiBmdWxseSBkaXNjb3ZlcmFibGUgYnkgcmVhZGluZwo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXgo+PiBzL2lmL2lzLwoK
U2hvdWxkIEkgc3RpbGwgc2VuZCBhIHY1IHRvIGZpeGluZyB0aGlzIHR5cG8gPyBJIGNhbiBmaXgg
aXQgd2hpbGUgYXBwbHlpbmcgaXQuCgpOZWlsCgo+IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhp
cy4KPiAKPj4KPj4+ICsgICAgc29tZSBkZXRlcm1pbmVkIHJlZ2lzdGVycywgbXVzdCBjb250YWlu
IHRoZSBmb2xsb3dpbmc6Cj4+PiArICAgICsgImFybSxtYWxpLWJpZnJvc3QiCj4+PiArICAqIHdo
aWNoIG11c3QgYmUgcHJlY2VkZWQgYnkgb25lIG9mIHRoZSBmb2xsb3dpbmcgdmVuZG9yIHNwZWNp
ZmljczoKPj4+ICsgICAgKyAiYW1sb2dpYyxtZXNvbi1nMTJhLW1hbGkiCj4+PiArCj4+PiArLSBy
ZWcgOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGRldmljZSBhbmQgbGVuZ3RoIG9mIHRo
ZSByZWdpc3RlciBhcmVhLgo+Pj4gKwo+Pj4gKy0gaW50ZXJydXB0cyA6IENvbnRhaW5zIHRoZSB0
aHJlZSBJUlEgbGluZXMgcmVxdWlyZWQgYnkgTWFsaSBCaWZyb3N0IGRldmljZXMsCj4+PiArICBp
biB0aGUgZm9sbG93aW5nIGRlZmluZWQgb3JkZXIuCj4+PiArCj4+PiArLSBpbnRlcnJ1cHQtbmFt
ZXMgOiBDb250YWlucyB0aGUgbmFtZXMgb2YgSVJRIHJlc291cmNlcyBpbiB0aGlzIGV4YWN0IGRl
ZmluZWQKPj4+ICsgIG9yZGVyOiAiam9iIiwgIm1tdSIsICJncHUiLgo+Pgo+PiBJcyB0aGVyZSBh
bnkgcG9pbnQgaW4gaGF2aW5nICJpbnRlcnJ1cHQtbmFtZXMiIGlmIHdlJ3JlIGZpeGluZyB0aGUK
Pj4gb3JkZXI/IEFsdGhvdWdoIEkgZ3Vlc3MgaXQgaGVscHMgbWF0Y2ggdGhlIE1pZGdhcmQgYmlu
ZGluZ3MuCj4gCj4gRXhhY3QuCj4gCj4gTmVpbAo+IAo+Pgo+PiBTdGV2ZQo+Pgo+Pj4gKwo+Pj4g
K09wdGlvbmFsIHByb3BlcnRpZXM6Cj4+PiArCj4+PiArLSBjbG9ja3MgOiBQaGFuZGxlIHRvIGNs
b2NrIGZvciB0aGUgTWFsaSBCaWZyb3N0IGRldmljZS4KPj4+ICsKPj4+ICstIG1hbGktc3VwcGx5
IDogUGhhbmRsZSB0byByZWd1bGF0b3IgZm9yIHRoZSBNYWxpIGRldmljZS4gUmVmZXIgdG8KPj4+
ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvcmVndWxhdG9y
LnR4dCBmb3IgZGV0YWlscy4KPj4+ICsKPj4+ICstIG9wZXJhdGluZy1wb2ludHMtdjIgOiBSZWZl
ciB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvb3BwL29wcC50eHQKPj4+ICsg
IGZvciBkZXRhaWxzLgo+Pj4gKwo+Pj4gKy0gcmVzZXRzIDogUGhhbmRsZSBvZiB0aGUgR1BVIHJl
c2V0IGxpbmUuCj4+PiArCj4+PiArVmVuZG9yLXNwZWNpZmljIGJpbmRpbmdzCj4+PiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+PiArCj4+PiArVGhlIE1hbGkgR1BVIGlzIGludGVncmF0ZWQg
dmVyeSBkaWZmZXJlbnRseSBmcm9tIG9uZSBTb0MgdG8KPj4+ICthbm90aGVyLiBJbiBvcmRlciB0
byBhY2NvbW1vZGF0ZSB0aG9zZSBkaWZmZXJlbmNlcywgeW91IGhhdmUgdGhlIG9wdGlvbgo+Pj4g
K3RvIHNwZWNpZnkgb25lIG1vcmUgdmVuZG9yLXNwZWNpZmljIGNvbXBhdGlibGUsIGFtb25nOgo+
Pj4gKwo+Pj4gKy0gImFtbG9naWMsbWVzb24tZzEyYS1tYWxpIgo+Pj4gKyAgUmVxdWlyZWQgcHJv
cGVydGllczoKPj4+ICsgIC0gcmVzZXRzIDogU2hvdWxkIGNvbnRhaW4gcGhhbmRsZXMgb2YgOgo+
Pj4gKyAgICArIEdQVSByZXNldCBsaW5lCj4+PiArICAgICsgR1BVIEFQQiBnbHVlIHJlc2V0IGxp
bmUKPj4+ICsKPj4+ICtFeGFtcGxlIGZvciBhIE1hbGktRzMxOgo+Pj4gKwo+Pj4gK2dwdUBmZmEz
MDAwMCB7Cj4+PiArCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLW1hbGkiLCAiYXJt
LG1hbGktYmlmcm9zdCI7Cj4+PiArCXJlZyA9IDwweGZmZTQwMDAwIDB4MTAwMDA+Owo+Pj4gKwlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTYwIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4gKwkJICAg
ICA8R0lDX1NQSSAxNjEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4+PiArCQkgICAgIDxHSUNfU1BJ
IDE2MiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4+ICsJaW50ZXJydXB0LW5hbWVzID0gImpvYiIs
ICJtbXUiLCAiZ3B1IjsKPj4+ICsJY2xvY2tzID0gPCZjbGsgQ0xLSURfTUFMST47Cj4+PiArCW1h
bGktc3VwcGx5ID0gPCZ2ZGRfZ3B1PjsKPj4+ICsJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1
X29wcF90YWJsZT47Cj4+PiArCXJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfRFZBTElOX0NBUEIzPiwg
PCZyZXNldCBSRVNFVF9EVkFMSU4+Owo+Pj4gK307Cj4+PiArCj4+PiArZ3B1X29wcF90YWJsZTog
b3BwX3RhYmxlMCB7Cj4+PiArCWNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7Cj4+
PiArCj4+PiArCW9wcEA1MzMwMDAwMDAgewo+Pj4gKwkJb3BwLWh6ID0gL2JpdHMvIDY0IDw1MzMw
MDAwMDA+Owo+Pj4gKwkJb3BwLW1pY3Jvdm9sdCA9IDwxMjUwMDAwPjsKPj4+ICsJfTsKPj4+ICsJ
b3BwQDQ1MDAwMDAwMCB7Cj4+PiArCQlvcHAtaHogPSAvYml0cy8gNjQgPDQ1MDAwMDAwMD47Cj4+
PiArCQlvcHAtbWljcm92b2x0ID0gPDExNTAwMDA+Owo+Pj4gKwl9Owo+Pj4gKwlvcHBANDAwMDAw
MDAwIHsKPj4+ICsJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NDAwMDAwMDAwPjsKPj4+ICsJCW9wcC1t
aWNyb3ZvbHQgPSA8MTEyNTAwMD47Cj4+PiArCX07Cj4+PiArCW9wcEAzNTAwMDAwMDAgewo+Pj4g
KwkJb3BwLWh6ID0gL2JpdHMvIDY0IDwzNTAwMDAwMDA+Owo+Pj4gKwkJb3BwLW1pY3Jvdm9sdCA9
IDwxMDc1MDAwPjsKPj4+ICsJfTsKPj4+ICsJb3BwQDI2NjAwMDAwMCB7Cj4+PiArCQlvcHAtaHog
PSAvYml0cy8gNjQgPDI2NjAwMDAwMD47Cj4+PiArCQlvcHAtbWljcm92b2x0ID0gPDEwMjUwMDA+
Owo+Pj4gKwl9Owo+Pj4gKwlvcHBAMTYwMDAwMDAwIHsKPj4+ICsJCW9wcC1oeiA9IC9iaXRzLyA2
NCA8MTYwMDAwMDAwPjsKPj4+ICsJCW9wcC1taWNyb3ZvbHQgPSA8OTI1MDAwPjsKPj4+ICsJfTsK
Pj4+ICsJb3BwQDEwMDAwMDAwMCB7Cj4+PiArCQlvcHAtaHogPSAvYml0cy8gNjQgPDEwMDAwMDAw
MD47Cj4+PiArCQlvcHAtbWljcm92b2x0ID0gPDkxMjUwMD47Cj4+PiArCX07Cj4+PiArfTsKPj4+
Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
