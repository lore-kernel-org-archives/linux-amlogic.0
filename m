Return-Path: <SRS0=laGC=EI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ECEC388F2
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2020 10:47:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8E6206F8
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2020 10:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDhwDbU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8E6206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y2cDx7fkqkIHL6SP20+icgXKic8zhBN0FF8SCV/ofAw=; b=kDhwDbU0IQ25GEK53jIEniFy0
	ew8zwixUCdbKDHS/YOxsIgDm1BfcE+aKh8ufdM2zuVJevvNakfBwQHncWH+Gde1eLtqOuexk6k61o
	0WdCx/xVNaO1BjlkL+SrBbAJl3737YBemtJBL1RpMUWICcKmyTsJQjO22R8DZdppQSISAuayE0SsM
	DaeMe6qkJ1L26w3REpTLxTlaQpSj6oEqiZ2XlbWGyDyPjxaX7UGI6O35tnz+jj8MC9Czfh7L5tQxJ
	jeKghn2yfnAejZadLcG60zl9tyZa0n8NcqMsyLQfNIecFMpeSxSohKwshMvplPb/up4aJYALrl5op
	bRBn0hnyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZXMn-0007Hx-Rs; Mon, 02 Nov 2020 10:47:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZXMl-0007H8-DL
 for linux-amlogic@lists.infradead.org; Mon, 02 Nov 2020 10:47:12 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kZXMj-0002mr-0j; Mon, 02 Nov 2020 11:47:09 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To: Alexander Dahl <ada@thorsis.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
 <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
 <5231529.NqohY00Rok@ada>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <cba67329-d79d-b474-c4b4-77b19aebe52f@pengutronix.de>
Date: Mon, 2 Nov 2020 11:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5231529.NqohY00Rok@ada>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_054711_490305_D31DAA07 
X-CRM114-Status: GOOD (  29.43  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gQWxleGFuZGVyLAoKT24gMTAvMjgvMjAgODozNCBBTSwgQWxleGFuZGVyIERhaGwgd3Jv
dGU6Cj4gSGVsbG8gQWhtYWQsCj4gCj4gQW0gRGllbnN0YWcsIDI3LiBPa3RvYmVyIDIwMjAsIDEx
OjU4OjEwIENFVCBzY2hyaWViIEFobWFkIEZhdG91bToKPj4gSGVsbG8sCj4+Cj4+IE9uIDEwLzI3
LzIwIDExOjA1IEFNLCBBbGV4YW5kZXIgRGFobCB3cm90ZToKPj4+IEhlbGxvIEFobWFkLAo+Pj4K
Pj4+IHRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywgY29tbWVudHMgYmVsb3cuCj4+Pgo+Pj4+PiAt
CWxlZC1yZ2Igewo+Pj4+PiArCWxlZC1jb250cm9sbGVyLTIgewo+Pj4+Cj4+Pj4gSXMgYSBzaW5n
bGUgUkdCIExFRCByZWFsbHkgYSBjb250cm9sbGVyPwo+Pj4KPj4+IEkganVzdCBmb2xsb3dlZCB0
aGUgcmVjb21tZW5kYXRpb25zIGJ5IFJvYiBoZXJlLgo+Pgo+PiBEbyB5b3UgaGFwcGVuIHRvIGtu
b3cgaWYgdGhlIG5ldyBtdWx0aWNvbG9yIExFRCBzdXBwb3J0IGNvdWxkIGJlIHVzZWQgaGVyZT8K
PiAKPiBBRkFJSyBub3QgeWV0LiBUaGUgbXVsdGljb2xvciBjbGFzcyBzaG91bGQgYmUgcmVhZHkg
YW5kIGl0IGlzIHVzZWQgYnkgc29tZSAKPiBkcml2ZXJzIGZvciBJwrJDIGNvbm5lY3RlZCBMRUQg
Y29udHJvbGxlcnMsIGJ1dCBpZiBJIHVuZGVyc3Rvb2QgUGF2ZWwgCj4gY29ycmVjdGx5LCBhZGRp
dGlvbmFsIHdvcmsgaGFzIHRvIGJlIGRvbmUgZm9yIGEgZ3BpbyBhbmQvb3IgcHdtIG11bHRpY29s
b3IgCj4gZHJpdmVyLiBTZWUgdGhpcyB0aHJlYWQgZnJvbSBBdWd1c3QgZm9yIGV4YW1wbGU6Cj4g
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbGVkcy8yNTMwNzg3LmlGQ0Z5V1djU3VA
ZzU1MGprLwoKSSBzZWUuIFRoYW5rcyBmb3IgdGhlIGluZm8uCgo+PiBJIGZpbmQgaXQgdW5mb3J0
dW5hdGUgdGhhdCB0aGUgZGV2aWNlIHRyZWUgbG9zZXMgaW5mb3JtYXRpb24gcmVsZXZhbnQgdG8K
Pj4gaHVtYW5zIHRvIGFkaGVyZSB0byBhIGZpeGVkIG5vbWVuY2xhdHVyZS4gQXBwYXJlbnRseSBs
ZWQtY29udHJvbGxlciBpc24ndAo+PiBldmVuIGNvZGlmaWVkIGluIHRoZSBZQU1MIGJpbmRpbmcg
KEl0J3MganVzdCBpbiB0aGUgZXhhbXBsZXMpLiBJZiB5b3UKPj4gcmVzcGluLCBwbGVhc2UgYWRk
IGEgY29tbWVudCB0aGF0IHRoaXMgaXMgYSBzaW5nbGUgUkdCIGxlZC4gSSdkIHByZWZlciB0bwo+
PiBrZWVwIHRoZSBpbmZvcm1hdGlvbiBpbiB0aGUgRFRCIGFzIHdlbGwgdGhvdWdoLgo+IAo+IFRo
ZSAibmV3IiBhdHRyaWJ1dGVzICdmdW5jdGlvbicgYW5kICdjb2xvcicgYXR0cmlidXRlcyBzaG91
bGQgY292ZXIgdGhpcyAKPiBpbmZvcm1hdGlvbi4gSUlSQyB0aG9zZSB3ZXJlIGludHJvZHVjZWQg
c29tZXRpbWUgYmVmb3JlIHY1LjQgYW5kIGRvY3VtZW50YXRpb24gCj4gaXMgaW4gdGhlIGxlZHMv
Y29tbW9uLnlhbWwgYmluZGluZy4gSSBkb24ndCBzZWUgaXQgaW4gdGhlIHNjb3BlIG9mIHRoaXMg
cGF0Y2ggCj4gc2VyaWVzLCBidXQgaWYgd2Ugd291bGQgbWVyZ2UgdGhpcyB3YXJuaW5nIGZpeCBm
aXJzdCwgdGhlIGluZm9ybWF0aW9uIGlzIGxvc3QsIAo+IHNvIG1heWJlIHRob3NlIGF0dHJpYnV0
ZXMgc2hvdWxkIGJlIGFkZGVkIGJlZm9yZT8KCkRvZXMgaXQ/IFRoZSBsYWJlbCBhbHJlYWR5IHNh
eXMgaXQncyBhIGdyZWVuIExFRCwgYnV0IHRoZSBpbmZvcm1hdGlvbiB0aGF0Cml0J3MgYSBzaW5n
bGUgcGh5c2ljYWwgTEVEICdidWxiJyBpcyBsb3N0LgoKPiAKPiBNeSBoZXVyaXN0aWNzIG9uIHRo
YXQgd291bGQgYmUgbG9va2luZyBhdCB0aGUgbGFiZWwgYW5kIGlmIHRoZXJlJ3MgYSBkaXN0aW5j
dCAKPiBjb2xvciBpbiBpdCwgYWRkIHRoZSBjb2xvciBwcm9wZXJ0eS4gSSBjb3VsZCBkbyB0aGF0
IGZvciBhbGwgcHdtIExFRHMga25vd24gdG8gCj4gdGhlIHRyZWUgY3VycmVudGx5LiBUaGF0IHdv
dWxkIGJlIGEgYmlnZ2VyIHRhc2sgZm9yIEdQSU8gbGVkcyB0aG91Z2guIDstKQoKSSB3b3VsZCBi
ZSBvayB3aXRoIGp1c3QgdGhlIGxlZC1jb250YWluaW5nIG5vZGUgaGludGluZyB0aGF0IGl0J3Mg
YSBzaW5nbGUgUkdCIGxlZC4KCkNoZWVycywKQWhtYWQKCj4gCj4+Cj4+Pj4+ICAJCWNvbXBhdGli
bGUgPSAicHdtLWxlZHMiOwo+Pj4+Pgo+Pj4+PiAtCQlsZWQtcmVkIHsKPj4+Pj4gKwkJbGVkLTIg
ewo+Pj4+Cj4+Pj4gU2hvdWxkbid0IHRoaXMgaGF2ZSBiZWVuIGxlZC0xIGFzIHdlbGwgb3IgaXMg
dGhlIG51bWJlcmluZyAiZ2xvYmFsIiA/Cj4+Pgo+Pj4gQWxzbyBnb29kIHF1ZXN0aW9uLiBUaGlz
IG51bWJlcmluZyBpcyBmb3IgZHRzIG9ubHksIGl0IHVzdWFsbHkgZG9lcwo+Pj4gbm90IGNvcnJl
c3BvbmQgd2l0aCBMRURzIG9uIHRoZSBib2FyZCwgc28gaXQgY291bGQgYmUgbnVtYmVyZWQgcGVy
Cj4+PiBsZWQtY29udHJvbGxlciBhcyB3ZWxsPwo+Pgo+PiBJJ2QgcHJlZmVyIHRoYXQgaXQgc3Rh
cnRzIGJ5IDEuIFRoYXQgd2F5IGl0J3MgYWxpZ25lZCB3aXRoIFBXTSBjaGFubmVsCj4+IElELgo+
IAo+IEFjay4KPiAKPj4KPj4gVGhhbmtzIGZvciBmaXhpbmcgdGhlIGR0c2NoZW1hIHdhcm5pbmdz
IGJ5IHRoZSB3YXkhCj4gCj4gV2VsbCwgSSAiaW50cm9kdWNlZCIgdGhlbSBieSBjb252ZXJ0aW5n
IHRoZSBsZWRzLXB3bSBiaW5kaW5nIHRvIHlhbWwgKG5vdCAKPiBtZXJnZWQgeWV0KSwgc28gSSBj
b3VsZCBhcyB3ZWxsIGZpeCB0aGUgd2FybmluZ3MgdGhlbj8gOy0pCj4gCj4gR3JlZXRzCj4gQWxl
eAo+IAo+Pgo+PiBDaGVlcnMsCj4+IEFobWFkCj4+Cj4+PiBHcmVldHMKPj4+IEFsZXgKPj4+Cj4+
Pj4+ICAJCQlsYWJlbCA9ICJtYzE6cmVkOnJnYiI7Cj4+Pj4+ICAJCQlwd21zID0gPCZsZWRzX3B3
bSAxIDEwMDAwMDAgMD47Cj4+Pj4+ICAJCQltYXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+Pj4+PiAg
CQkJYWN0aXZlLWxvdzsKPj4+Pj4gIAkJCj4+Pj4+ICAJCX07Cj4+Pj4+Cj4+Pj4+IC0JCWxlZC1n
cmVlbiB7Cj4+Pj4+ICsJCWxlZC0zIHsKPj4+Pj4KPj4+Pj4gIAkJCWxhYmVsID0gIm1jMTpncmVl
bjpyZ2IiOwo+Pj4+PiAgCQkJcHdtcyA9IDwmbGVkc19wd20gMiAxMDAwMDAwIDA+Owo+Pj4+PiAg
CQkJbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPj4+Pj4gIAkJCWFjdGl2ZS1sb3c7Cj4+Pj4+ICAJ
CQo+Pj4+PiAgCQl9Owo+Pj4+Pgo+Pj4+PiAtCQlsZWQtYmx1ZSB7Cj4+Pj4+ICsJCWxlZC00IHsK
Pj4+Pj4KPj4+Pj4gIAkJCWxhYmVsID0gIm1jMTpibHVlOnJnYiI7Cj4+Pj4+ICAJCQlwd21zID0g
PCZsZWRzX3B3bSAzIDEwMDAwMDAgMD47Cj4+Pj4+ICAJCQltYXgtYnJpZ2h0bmVzcyA9IDwyNTU+
Owo+IAo+IAoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAg
ICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhp
bGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5
MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZh
eDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
