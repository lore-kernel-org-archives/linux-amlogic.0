Return-Path: <SRS0=7ebA=ES=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81012C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 13:44:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99F520825
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 13:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zn8vBGkZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W+PD2VKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99F520825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WqC0XRB6cbm3os1XMLWDDnV9UA77WkrFbjJSmX3Xj28=; b=zn8vBGkZ/7aqGxet4vBhlkV/Q
	rw1wCNn09HNguwaRtEK9z+OIIy/+kbPCfdjcQ6b2WnTsXhYAdHTKCnO9UHKEBBqx1ZSVdCppIt5xb
	ts4IT5FJV4cHXKLekC/hz12Y8szdXXpnxZJgw/C2d80MpW9w8I8Ju8mQKCFJFagUgTjboF1WWa2sI
	2zmwqfJhKKBZ0of2FKkXW5Hzd+pqLGltHierVpMvc0nowPHyWmaEucu2fftFwBuywaQUAadCRxKhc
	AD/eUPsW/RZDKzrYHxLOZzlVNfiyt57HBs7gyJ16NSEgXedxCkNHQlZXAHjJ4u1PVw9nSJ25YaZk5
	MPGUHgFNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdCu5-00062q-N3; Thu, 12 Nov 2020 13:44:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdCu3-00062G-5e
 for linux-amlogic@lists.infradead.org; Thu, 12 Nov 2020 13:44:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id b8so6079809wrn.0
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=To+ZcG/r9vVpmGTgBDlDgjUCMbHCTExbI20k8BWQjAw=;
 b=W+PD2VKQasIWpPzZDio9fbNElNIoCjulot3D66PEGLZAkugr3AWKAB3XypmeTTfnF8
 c6woS+AwCDqSmXQRClfHXVpv7YM3NA3VoziRWWORy8nOETQebySVUvGVd/nTRK4rGWRB
 Cnux95sw7lFkrZQaD8W1dhPKakcMa7M3+6QksDbq1wnjKX7FCpYOysy0vIt1WEVwNFCw
 JUT0FPxJQgZdQ7BTUjydi2GJOswAD6jKJt/yM29jAJgTxN8HFlUUezJUcKn9q5/Ox72N
 IQH+rRwsW+lwfAOijCg/UfyKPkL1gOnrEGySIftwvbtpXwXdLnWfN5Za0/fD6e1BOO1f
 PDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=To+ZcG/r9vVpmGTgBDlDgjUCMbHCTExbI20k8BWQjAw=;
 b=NeApqqxITaGLXXpdp4ThMAfaw48grOzC7TqQPW8JgEtfN6uP09+6adeqAbZxm74IDy
 qSVHIReD7YHAFGB0JZTmAEa889GAQXnTT6RYP16Dry2OgcBpBM51sBqJScku87WhvWUx
 9B9SARSvQqe4RtoRVY2AxltvIwfEz25Nu0MEgID4BTy7ZMrRpS61aQkm6F4GRpKW5qiY
 pM7ItEEgvYa6fPmtOuOhw3XWV28VbpJ0/OsZNtOCA5CnZMedLS90c37I4Rf0l37Gr7rH
 UjHHhrpidLM7iRer+5XJOlbIno1VXzhdfS/SmxF7VSbxujQKRNq8wtYxAvQwuxU59Z7C
 35uQ==
X-Gm-Message-State: AOAM533qr1D/JwIdN29tnJosdHgTX7pNNtFdlkctwV+S1OQ5e5H854Sg
 OM1aa5m9Qwwj3oW8ommpK+zVGw==
X-Google-Smtp-Source: ABdhPJx5CbQywNCBG7tQePsWuRkCM0wYavBBbiZJXSc5QgZNhdOAjtuKa7umBsaCO2JeXLOhnsnTgw==
X-Received: by 2002:adf:fc48:: with SMTP id e8mr27381460wrs.313.1605188682181; 
 Thu, 12 Nov 2020 05:44:42 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5d3c:83d5:8524:33ca?
 ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.gmail.com with ESMTPSA id t9sm6744292wrr.49.2020.11.12.05.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 05:44:41 -0800 (PST)
Subject: Re: [PATCH] reset: Add reset controller API
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20201001132758.12280-1-aouledameur@baylibre.com>
 <CAHNvnFO=kH25CqrAcndVO4xTQ2pGDFi5ZHEALpFaZaGL=e_c0Q@mail.gmail.com>
 <87ac087154f461b6cac632bb62b92b8b94d90a67.camel@pengutronix.de>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <9eb59bf5-0b13-c830-dfe0-a20549769a5b@baylibre.com>
Date: Thu, 12 Nov 2020 14:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87ac087154f461b6cac632bb62b92b8b94d90a67.camel@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_084443_420529_B5E4D604 
X-CRM114-Status: GOOD (  33.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUGhpbGlwcCwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZpZXcuCgpQbGVhc2Ug
ZmluZCBteSBjb21tZW50cyBiZWxvdzoKCk9uIDAyLzEwLzIwMjAgMTM6MTQsIFBoaWxpcHAgWmFi
ZWwgd3JvdGU6Cgo+IEhpIEFtamFkLAo+Cj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIGNvbW1l
bnRzIGJlbG93Ogo+Cj4gT24gVGh1LCAyMDIwLTEwLTAxIGF0IDE1OjU1ICswMjAwLCBBbWphZCBP
dWxlZC1BbWV1ciB3cm90ZToKPj4gQW4gdXBkYXRlIG9uIHRoZSBwYXRjaCB0aXRsZSwgc2luY2Ug
d2UgZG9uJ3QgYWRkIGFuIEFQSSBidXQgZXh0ZW5kIGl0LAo+PiBUaGUgdGl0bGUgc2hvdWxkIHJh
dGhlciBiZTogQWRkIGEgbmV3IGNhbGwgdG8gdGhlIHJlc2V0IGZyYW1ld29yawo+IEkgdGhpbmsg
aXQgc2hvdWxkIGV2ZW4gc2F5IHdoYXQgZnVuY3Rpb25hbGl0eSBpcyBhZGRlZCwgZm9yIGV4YW1w
bGUKPgo+ICJyZXNldDogbWFrZSBzaGFyZWQgcHVsc2VkIHJlc2V0IGNvbnRyb2xzIHJlLXRyaWdn
ZXJhYmxlIgoKV2lsbCBkbyAhCgo+PiBMZSBqZXUuIDEgb2N0LiAyMDIwIMOgIDE1OjI4LCBBbWph
ZCBPdWxlZC1BbWV1cgo+PiA8YW91bGVkYW1ldXJAYmF5bGlicmUuY29tPiBhIMOpY3JpdCA6Cj4+
PiBUaGUgY3VycmVudCByZXNldCBmcmFtZXdvcmsgQVBJIGRvZXMgbm90IGFsbG93IHRvIHJlbGVh
c2Ugd2hhdCBpcyBkb25lIGJ5Cj4+PiByZXNldF9jb250cm9sX3Jlc2V0KCksIElPVyBkZWNyZW1l
bnQgdHJpZ2dlcmVkX2NvdW50LiBBZGQgdGhlIG5ldwo+Pj4gcmVzZXRfY29udHJvbF9yZXNldHRh
YmxlKCkgY2FsbCB0byBkbyBzby4KPj4+Cj4+PiBXaGVuIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSBo
YXMgYmVlbiBjYWxsZWQgb25jZSwgdGhlIGNvdW50ZXIKPj4+IHRyaWdnZXJlZF9jb3VudCwgaW4g
dGhlIHJlc2V0IGZyYW1ld29yaywgaXMgaW5jcmVtZW50ZWQgaS5lIHRoZSByZXNvdXJjZQo+Pj4g
dW5kZXIgdGhlIHJlc2V0IGlzIGluLXVzZSBhbmQgdGhlIHJlc2V0IHNob3VsZCBub3QgYmUgZG9u
ZSBhZ2Fpbi4KPj4+IHJlc2V0X2NvbnRyb2xfcmVzZXR0YWJsZSgpIHdvdWxkIGJlIHRoZSB3YXkg
dG8gc3RhdGUgdGhhdCB0aGUgcmVzb3VyY2UgaXMKPj4+IG5vIGxvbmdlciB1c2VkIGFuZCwgdGhh
dCBmcm9tIHRoZSBjYWxsZXIncyBwZXJzcGVjdGl2ZSwgdGhlIHJlc2V0IGNhbiBiZQo+Pj4gZmly
ZWQgYWdhaW4gaWYgbmVjZXNzYXJ5Lgo+Pj4KPj4+IFRoaXMgcGF0Y2ggd2lsbCBmaXggYSB1c2Ig
c3VzcGVuZCB3YXJuaW5nIHNlZW4gb24gdGhlIGxpYnJldGVjaC1jYwo+Pj4gcmVsYXRlZCB0byB0
aGUgc2hhcmVkIHJlc2V0IGxpbmUuIFRoaXMgd2FybmluZyB3YXMgYWRkcmVzc2VkIGJ5IHRoZQo+
Pj4gcHJldmlvdXNseSByZXZlcnRlZCBjb21taXQgN2E0MTA5NTNkMWZiICgidXNiOiBkd2MzOiBt
ZXNvbi1nMTJhOiBmaXggc2hhcmVkCj4+PiByZXNldCBjb250cm9sIHVzZSIpCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQW1qYWQgT3VsZWQtQW1ldXIgPGFvdWxlZGFtZXVyQGJheWxpYnJlLmNvbT4K
Pj4+IFJlcG9ydGVkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4+
IC0tLQo+Pj4gICBkcml2ZXJzL3Jlc2V0L2NvcmUuYyAgfCA1NyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgIGluY2x1ZGUvbGludXgvcmVzZXQuaCB8ICAx
ICsKPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVzZXQvY29yZS5jIGIvZHJpdmVycy9yZXNldC9jb3JlLmMKPj4+IGlu
ZGV4IDAxYzBjN2FhODM1Yy4uNTM2NTNkNGI1NWM0IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9y
ZXNldC9jb3JlLmMKPj4+ICsrKyBiL2RyaXZlcnMvcmVzZXQvY29yZS5jCj4+PiBAQCAtMjA3LDYg
KzIwNywxOSBAQCBzdGF0aWMgaW50IHJlc2V0X2NvbnRyb2xfYXJyYXlfcmVzZXQoc3RydWN0IHJl
c2V0X2NvbnRyb2xfYXJyYXkgKnJlc2V0cykKPj4+ICAgICAgICAgIHJldHVybiAwOwo+Pj4gICB9
Cj4+Pgo+Pj4gK3N0YXRpYyBpbnQgcmVzZXRfY29udHJvbF9hcnJheV9yZXNldHRhYmxlKHN0cnVj
dCByZXNldF9jb250cm9sX2FycmF5ICpyZXNldHMpCj4+PiArewo+Pj4gKyAgICAgICBpbnQgcmV0
LCBpOwo+Pj4gKwo+Pj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgcmVzZXRzLT5udW1fcnN0Y3M7
IGkrKykgewo+Pj4gKyAgICAgICAgICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXR0YWJs
ZShyZXNldHMtPnJzdGNbaV0pOwo+Pj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gKyAgICAgICB9Cj4gVGhpcyBpcyB0
cmlja3ksIGFzIHdlIGNhbid0IHJlYWxseSByb2xsIGJhY2sgZGVjcmVtZW50aW5nCj4gdHJpZ2dl
cmVkX2NvdW50IGluIGNhc2UganVzdCBvbmUgb2YgdGhvc2UgZmFpbHMuCj4KPiBJIHRoaW5rIHJl
c2V0X2NvbnRyb2xfYXJyYXlfcmVzZXR0YWJsZSBoYXMgdG8gYmUgb3BlbiBjb2RlZCB0byBmaXJz
dAo+IGNoZWNrIGZvciBlcnJvcnMgYW5kIG9ubHkgdGhlbiBsb29wIHRocm91Z2ggYWxsIGNvbnRy
b2xzIGFuZCBkZWNyZW1lbnQKPiB0aGVpciB0cmlnZ2VyZWRfY291bnQuCgpJIGFncmVlIHdpdGgg
dGhpcywgaXQgaXMgcmlza3kgdG8gc3RhcnQgZGVjcmVtZW50aW5nIGJlZm9yZSBjaGVja2luZyBm
b3IKZXJyb3JzLiBUaGUgVjIgd2lsbCBpbmNsdWRlIGFuIG9wZW4gY29kZWQgdmVyc2lvbiBvZiB0
aGlzIGZ1bmN0aW9uLgoKPj4+ICsKPj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwo+
Pj4gICBzdGF0aWMgaW50IHJlc2V0X2NvbnRyb2xfYXJyYXlfYXNzZXJ0KHN0cnVjdCByZXNldF9j
b250cm9sX2FycmF5ICpyZXNldHMpCj4+PiAgIHsKPj4+ICAgICAgICAgIGludCByZXQsIGk7Cj4+
PiBAQCAtMzI0LDYgKzMzNyw1MCBAQCBpbnQgcmVzZXRfY29udHJvbF9yZXNldChzdHJ1Y3QgcmVz
ZXRfY29udHJvbCAqcnN0YykKPj4+ICAgfQo+Pj4gICBFWFBPUlRfU1lNQk9MX0dQTChyZXNldF9j
b250cm9sX3Jlc2V0KTsKPj4+Cj4+PiArLyoqCj4+PiArICogcmVzZXRfY29udHJvbF9yZXNldHRh
YmxlIC0gZGVjcmVtZW50cyB0cmlnZ2VyZWRfY291bnQgb2YgdGhlIGNvbnRyb2xsZWQgZGV2aWNl
Cj4+PiArICogQHJzdGM6IHJlc2V0IGNvbnRyb2xsZXIKPiBJdCBpcyBtb3JlIGltcG9ydGFudCB0
byBkb2N1bWVudCB0aGUgcHVycG9zZSBvZiB0aGUgZnVuY3Rpb24gdGhhbiB0aGUKPiBtZWNoYW5p
c20gYnkgd2hpY2ggaXQgaXMgYWNoaWV2ZWQuIHRyaWdnZXJlZF9jb3VudCBpcyBhbiBpbXBsZW1l
bnRhdGlvbgo+IGRldGFpbC4KPgo+IE1heWJlICJhbGxvdyBzaGFyZWQgcmVzZXQgbGluZSB0byBi
ZSB0cmlnZ2VyZWQgYWdhaW4iIG9yIHNpbWlsYXIuCgpSb2dlciB0aGF0LCB3aWxsIGRvIGluIFYy
LgoKPgo+Pj4gKyAqCj4+PiArICogT24gYSBzaGFyZWQgcmVzZXQgbGluZSB0aGUgYWN0dWFsIHJl
c2V0IHB1bHNlIGlzIG9ubHkgdHJpZ2dlcmVkIG9uY2UgZm9yIHRoZQo+Pj4gKyAqIGxpZmV0aW1l
IG9mIHRoZSByZXNldF9jb250cm9sIGluc3RhbmNlLCBleGNlcHQgaWYgdGhpcyBmdW5jdGlvbiBp
cyB1c2VkLgo+Pj4gKyAqIEluIGZhY3QsIEl0IGRlY3JlbWVudHMgdHJpZ2dlcmVkX2NvdW50IHRo
YXQgbWFrZXMgc3VyZSBvZiBub3QgYWxsb3dpbmcKPj4+ICsgKiBhIHJlc2V0IGlmIHRyaWdnZXJl
ZF9jb3VudCBpcyBub3QgbnVsbC4KPj4+ICsgKgo+Pj4gKyAqIFRoaXMgaXMgYSBuby1vcCBpbiBj
YXNlIHRyaWdnZXJlZF9jb3VudCBpcyBhbHJlYWR5IG51bGwgaS5lIHNoYXJlZCByZXNldCBsaW5l
Cj4+PiArICogaXMgcmVhZHkgdG8gYmUgdHJpZ2dlcmVkLgo+IFRoaXMgaXMgbm90IGEgZ29vZCBp
ZGVhIElNSE8uIEl0IHdvdWxkIGJlIGJldHRlciB0byBkb2N1bWVudCB0aGF0IGNhbGxzCj4gdG8g
dGhpcyBmdW5jdGlvbiBtdXN0IGJlIGJhbGFuY2VkIHdpdGggY2FsbHMgdG8gcmVzZXRfY29udHJv
bF9yZXNldCwgYW5kCj4gdGhlbiB0aHJvdyBhIGJpZyB3YXJuaW5nIGJlbG93IGluIGNhc2UgZGVh
c3NlcnRfY291bnQgZXZlciBkaXBzIGJlbG93IDAuCj4KPiBPdGhlcndpc2Ugbm90aGluZyBzdG9w
cyBkcml2ZXJzIGZyb20gc2lsZW50bHkgZGVjcmVtZW50aW5nIG90aGVyCj4gZHJpdmVyJ3MgdHJp
Z2dlciBjb3VudCBieSBhY2NpZGVudGFsbHkgY2FsbGluZyB0aGlzIG11bHRpcGxlIHRpbWVzLgoK
SSBkbyBhZ3JlZSwgYWNjaWRlbnRhbCBjYWxscyBzaG91bGQgYmUgcmVwb3J0ZWQgYnkgd2Fybmlu
Z3MuCgo+Pj4gKyAqCj4+PiArICogQ29uc3VtZXJzIG11c3Qgbm90IHVzZSByZXNldF9jb250cm9s
XyhkZSlhc3NlcnQgb24gc2hhcmVkIHJlc2V0IGxpbmVzIHdoZW4KPj4+ICsgKiByZXNldF9jb250
cm9sX3Jlc2V0IGhhcyBiZWVuIHVzZWQuCj4+PiArICoKPj4+ICsgKiBJZiByc3RjIGlzIE5VTEwg
aXQgaXMgYW4gb3B0aW9uYWwgY2xlYXIgYW5kIHRoZSBmdW5jdGlvbiB3aWxsIGp1c3QKPj4+ICsg
KiByZXR1cm4gMC4KPj4+ICsgKi8KPj4+ICtpbnQgcmVzZXRfY29udHJvbF9yZXNldHRhYmxlKHN0
cnVjdCByZXNldF9jb250cm9sICpyc3RjKQo+Pj4gK3sKPj4+ICsgICAgICAgaWYgKCFyc3RjKQo+
Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4gKwo+Pj4gKyAgICAgICBpZiAoV0FSTl9P
TihJU19FUlIocnN0YykpKQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4g
Kwo+Pj4gKyAgICAgICBpZiAocmVzZXRfY29udHJvbF9pc19hcnJheShyc3RjKSkKPj4+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcmVzZXRfY29udHJvbF9hcnJheV9yZXNldHRhYmxlKHJzdGNfdG9f
YXJyYXkocnN0YykpOwo+Pj4gKwo+Pj4gKyAgICAgICBpZiAocnN0Yy0+c2hhcmVkKSB7Cj4+PiAr
ICAgICAgICAgICAgICAgaWYgKFdBUk5fT04oYXRvbWljX3JlYWQoJnJzdGMtPmRlYXNzZXJ0X2Nv
dW50KSAhPSAwKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Pj4gKwo+Pj4gKyAgICAgICAgICAgICAgIGlmIChhdG9taWNfcmVhZCgmcnN0Yy0+dHJpZ2dlcmVk
X2NvdW50KSA+IDApCj4+PiArICAgICAgICAgICAgICAgICAgICAgICBhdG9taWNfZGVjKCZyc3Rj
LT50cmlnZ2VyZWRfY291bnQpOwo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUKPgo+IAkJV0FSTl9P
TihhdG9taWNfZGVjX3JldHVybigmcnN0Yy0+dHJpZ2dlcmVkX2NvdW50KSA8IDApOwoKVGhhdCBp
cyBldmVuIGJldHRlciwgaGF2aW5nIHRoaXMgd2FybmluZyBtZWFucyB0aGF0IHRoZSBjYWxsIGhh
cyBub3QKCmJlZW4gcHJvcGVybHkgdXNlZC4KCj4KPiByZWdhcmRzCj4gUGhpbGlwcAoKTmV4dCB2
ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aWxsIGJlIHNlbnQgc29vbiwgaW5jbHVkZSBldmVyeXRoaW5n
IHdlCgpoYXZlIGRpc2N1c3NlZC4KClNpbmNlcmVseSwKCkFtamFkCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
