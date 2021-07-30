Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FUZZY_ANDROID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9BAC4320A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 08:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF3C360F48
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 08:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF3C360F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Dy5LOkQnVAQLjrOaZLdgDGS+5AqWi1Up7/VCekb3Pqs=; b=Cp3AlYA+Tl4qHFmpitDa+JKGsU
	KiXKE5N5RGPnjr11FB5XmwXT1uLZGmscPCoS7X7zfBwm8va3j2ameVLsN4Vv6MA97OIgAWi3ntSkK
	XBMZDHgfuWKovnyO8UL1DrVskUSFGJY6yKvHepHp9EIJ+oYyGYh0ap8imNuqZia8DimZPFHHsk3mq
	LBXSVQS7i79FoTWggmHKAQu/wuhlzbtbbRSKusUuJMq+fN9VRMTrigxc3mV9VZuuhf7ox5GF3wXI5
	DzWQCh8paYj3CaY7arWzshJJ8osskcHhL21Kz9o0E3WstFaxMcuPRUwDnU0oVRNIWmgicg4gEhzQA
	9ZbUfuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Nmo-007gtH-AH; Fri, 30 Jul 2021 08:22:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Nml-007gsf-Gb
 for linux-amlogic@lists.infradead.org; Fri, 30 Jul 2021 08:22:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n12so10234638wrr.2
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Jul 2021 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mj6B0T9vqFCA2tSBUU7I5RxwO7ePk66yyZ5em+HYDNY=;
 b=bXZE3vlpOAsOP5MYcgFrjpVVp29gkP4i2s1nOJFDpip2cCbvTQ3NMxSWNeT7yw0yHt
 dAqoDCMKlOEGkqlaYNXJaujDkcKkdDl/hAKLRUNpeJdI45OX0JtYe403ZmN4MXrvXXMe
 CV358dTTOHJcTfNE4IDSUwLsHPebOtpuK98Lc3M9T39HMQMxLHLLIkpaD2LTHgh9qFL9
 gC1Csz1gtwtyUe+R/LUK4kV/mIVd+eSrKDuDbWukA1yKDVUsPZ6Itmj89UxgwJE+p77B
 lIDQdwicLZOrVByh6PHJ/184mLQq9FmAMOM2droE+IZ+fkJeupqjhXT7jqhZB8ltMTZk
 9u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Mj6B0T9vqFCA2tSBUU7I5RxwO7ePk66yyZ5em+HYDNY=;
 b=gVMfY1oZs5aONVDb9gwzsE4LtZd5PJwd4fSWlrdqZd8gc/AJz//p5I20/y3Mk8Bpi6
 edYkzboI0wJVy7EjqygOzJla1hjhnZpX9xz7+9YvtNbBIXV2yT1H6Esb0pEaAJ3fFruQ
 OUQe8YRvUQEdta8fR5L69sY+4NYt38S6lwTRPwYhOwb+L2/ZLXbwbNpxmDulrl7zvmut
 85zCmwtLJfKjmyDRtqmHi72v4JhZh5Hz4jX58tEdZ3DOlKGAmwPVXyqVrHnKyBUhlgDO
 fHh1B2s2ITS8rRsxx6ktIuPfgVVtXZLoVD+bqq6NE0Vg+oL3TDykHKRlHNg9gdJ5BNUq
 fHiA==
X-Gm-Message-State: AOAM530/CBN4ltPn5c42a3brP8c98UjYQi77jzKdqFidAUIYGaTim5+9
 VEtkLZhdngeZBPDGOJwmK9nq5CURgysTI1em
X-Google-Smtp-Source: ABdhPJzcx3m4IQDWNDBuJlDFlPdkFQ8o8LrnnKqP5UE15rYOLe6BMtm9QZDFFREKjg6JEyJgvoIIYA==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr1685563wru.421.1627633345551; 
 Fri, 30 Jul 2021 01:22:25 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0?
 ([2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0])
 by smtp.gmail.com with ESMTPSA id h4sm905828wru.2.2021.07.30.01.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 01:22:25 -0700 (PDT)
Subject: Re: amlogic-meson-g12b USB does not work
To: =?UTF-8?B?0KTQtdC00L7RgNC+0LIg0JPRgNC40LPQvtGA0LjQuQ==?=
 <elektromonder@yandex.ru>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <8833871627419165@myt5-76cfa60c365b.qloud-c.yandex.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6421c1c3-9a68-9364-9b99-aa4cf5f73d24@baylibre.com>
Date: Fri, 30 Jul 2021 10:22:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8833871627419165@myt5-76cfa60c365b.qloud-c.yandex.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_012227_600673_487B3218 
X-CRM114-Status: GOOD (  22.16  )
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

SGksCgpbYWRkZWQgdGhlIGxpbnV4LWFtbG9naXggTUwgaW4gQ0NdCgpPbiAyNy8wNy8yMDIxIDIz
OjAwLCDQpNC10LTQvtGA0L7QsiDQk9GA0LjQs9C+0YDQuNC5IHdyb3RlOgo+IEhpISBJIHdhbnQg
dG8gbGF1bmNoIExpbnV4IG9uIHRoZSB4ODhLaW5nIHM5MjJ4IGJvYXJkLCBidXQgZm9yIGl0IHRo
ZXJlIGlzIG5vIERUQiBmaWxlcyBhbmQgSSBkbyBub3Qga25vdyBob3cgdG8gY29ycmVjdGx5IGRl
c2lnbmF0ZSB0aGUgcGFyYW1ldGVycyBvZiB0aGUgVVNCLiBJIGV4cGVyaW1lbnRlZCBhIGxvdCwg
YnV0IEkgbmV2ZXIgYWNoaWV2ZWQgdGhhdCB0aGUgVVNCIHBvcnRzIGZ1bmN0aW9uLiBJIGdvdHRl
biB0aGUgRFRCIGZyb20gYW5kcm9pZCBmb3IgdGhpcyBib2FyZCwgYnV0IExpbnV4IGtlcm5lbCBk
b2VzIG5vdCB3b3JrIHdpdGggdGhpcyBEVEIuIEkgdHJpZWQgdG8gcmV3cml0ZSB3aXRoIHRoZSBw
cmVzZXJ2YXRpb24gb2YgcmVjdXJzaW9uIHRvIHRoZSBub2RlcywgZXZlcnl0aGluZyBpcyBhc3Nv
Y2lhdGVkIHdpdGggVVNCIHdpdGggYW5kcm9pZCBEVEIgb24gTGludXggdG8gZGlmZmVyZW50IGJv
YXJkcywgYnV0IGl0IGRvZXMgbm90IHR1cm4gb24gSFNCIQo+IEJ5IHRoZSBleHBlcmltZW50cywg
SSBhY2hpZXZlZCB0aGF0IHRoZSBzeXN0ZW0gcmVjb2duaXplcyBVU0IgaHViLCB0aGUgbHN1c2Ig
Ym9uZGluZyB0ZWFtIHNob3dzIGEgaHViIDIuMCBhbmQgYSBodWIgMy4wLCBidXQgdGhlIGRldmlj
ZSBpcyBub3QgZGVmaW5lZC4gVGhlIGNvbmNsdXNpb24gb2YgZG1lc2c6Cj4gIyBkbWVzZyB8IGdy
ZXAgLWkgdXNiCj4gWyAgICAwLjA0Mzg5Nl0gT0Y6IC9zb2MvdXNiQGZmZTA5MDAwOiBjb3VsZCBu
b3QgZmluZCBwaGFuZGxlIDQKPiBbICAgIDAuMDc5MjE1XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5l
dyBpbnRlcmZhY2UgZHJpdmVyIHVzYmZzCj4gWyAgICAwLjA3OTI1MV0gdXNiY29yZTogcmVnaXN0
ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBodWIKPiBbICAgIDAuMDc5Mjg3XSB1c2Jjb3JlOiBy
ZWdpc3RlcmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYgo+IFsgICAgMS4zNTc0NjBdIGVoY2lfaGNk
OiBVU0IgMi4wICdFbmhhbmNlZCcgSG9zdCBDb250cm9sbGVyIChFSENJKSBEcml2ZXIKPiBbICAg
IDEuMzcyNDk4XSBvaGNpX2hjZDogVVNCIDEuMSAnT3BlbicgSG9zdCBDb250cm9sbGVyIChPSENJ
KSBEcml2ZXIKPiBbICAgIDEuMzg4NDM0XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZh
Y2UgZHJpdmVyIHVzYi1zdG9yYWdlCj4gWyAgICAxLjQ1MTM3Ml0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JoaWQKPiBbICAgIDEuNDU2ODEyXSB1c2JoaWQ6IFVT
QiBISUQgY29yZSBkcml2ZXIKPiBbICAgIDEuNTI3NTg2XSBVU0IxX1BPVzogc3VwcGxpZWQgYnkg
VkNDXzVWCj4gWyAgICAxLjUzMTM2Nl0gVVNCX1BXUl9FTjogc3VwcGxpZWQgYnkgVkNDXzVWCj4g
WyAgICAxLjU0NjI2OV0gZHdjMy1tZXNvbi1nMTJhIGZmZTA5MDAwLnVzYjogVVNCMiBwb3J0czog
Mgo+IFsgICAgMS41NTAyMTRdIGR3YzMtbWVzb24tZzEyYSBmZmUwOTAwMC51c2I6IFVTQjMgcG9y
dHM6IDAKPiBbICAgIDEuNTU4MDk4XSBkd2MyIGZmNDAwMDAwLnVzYjogc3VwcGx5IHZ1c2JfZCBu
b3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgo+IFsgICAgMS41NjI1MjVdIGR3YzIgZmY0
MDAwMDAudXNiOiBzdXBwbHkgdnVzYl9hIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9y
Cj4gWyAgICAxLjU2OTY1MV0gZHdjMiBmZjQwMDAwMC51c2I6IEVQczogNywgZGVkaWNhdGVkIGZp
Zm9zLCA3MTIgZW50cmllcyBpbiBTUFJBTQo+IFsgICAgMS41ODE5NTRdIHhoY2ktaGNkIHhoY2kt
aGNkLjAuYXV0bzogbmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAx
Cj4gWyAgICAxLjYwNDg0MF0gdXNiIHVzYjE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0xZDZiLCBpZFByb2R1Y3Q9MDAwMiwgYmNkRGV2aWNlPSA1LjEzCj4gWyAgICAxLjYxMjkwOF0g
dXNiIHVzYjE6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0zLCBQcm9kdWN0PTIsIFNlcmlh
bE51bWJlcj0xCj4gWyAgICAxLjYyMDA2OV0gdXNiIHVzYjE6IFByb2R1Y3Q6IHhIQ0kgSG9zdCBD
b250cm9sbGVyCj4gWyAgICAxLjYyNDg5M10gdXNiIHVzYjE6IE1hbnVmYWN0dXJlcjogTGludXgg
NS4xMy40LWdlbnRvby1idXIgeGhjaS1oY2QKPiBbICAgIDEuNjMxMTg4XSB1c2IgdXNiMTogU2Vy
aWFsTnVtYmVyOiB4aGNpLWhjZC4wLmF1dG8KPiBbICAgIDEuNjM2MjI5XSBodWIgMS0wOjEuMDog
VVNCIGh1YiBmb3VuZAo+IFsgICAgMS42NDkxMzVdIHhoY2ktaGNkIHhoY2ktaGNkLjAuYXV0bzog
bmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAyCj4gWyAgICAxLjY1
NjcyNF0geGhjaS1oY2QgeGhjaS1oY2QuMC5hdXRvOiBIb3N0IHN1cHBvcnRzIFVTQiAzLjAgU3Vw
ZXJTcGVlZAo+IFsgICAgMS42NjMyMTBdIHVzYiB1c2IyOiBXZSBkb24ndCBrbm93IHRoZSBhbGdv
cml0aG1zIGZvciBMUE0gZm9yIHRoaXMgaG9zdCwgZGlzYWJsaW5nIExQTS4KPiBbICAgIDEuNjcx
MjQ3XSB1c2IgdXNiMjogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTFkNmIsIGlkUHJv
ZHVjdD0wMDAzLCBiY2REZXZpY2U9IDUuMTMKPiBbICAgIDEuNjc5NDA0XSB1c2IgdXNiMjogTmV3
IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTEKPiBb
ICAgIDEuNjg2NTYxXSB1c2IgdXNiMjogUHJvZHVjdDogeEhDSSBIb3N0IENvbnRyb2xsZXIKPiBb
ICAgIDEuNjkxMzkxXSB1c2IgdXNiMjogTWFudWZhY3R1cmVyOiBMaW51eCA1LjEzLjQtZ2VudG9v
LWJ1ciB4aGNpLWhjZAo+IFsgICAgMS42OTc2ODddIHVzYiB1c2IyOiBTZXJpYWxOdW1iZXI6IHho
Y2ktaGNkLjAuYXV0bwo+IFsgICAgMS43MDI2ODZdIGh1YiAyLTA6MS4wOiBVU0IgaHViIGZvdW5k
Cj4gWyAgICAyLjY4MjY2N10gdXNiIHVzYjEtcG9ydDE6IENhbm5vdCBlbmFibGUuIE1heWJlIHRo
ZSBVU0IgY2FibGUgaXMgYmFkPwo+IFsgICAgMy41ODY2NzRdIHVzYiB1c2IxLXBvcnQxOiBDYW5u
b3QgZW5hYmxlLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8KPiBbICAgIDMuNTg4NDIzXSB1
c2IgdXNiMS1wb3J0MTogYXR0ZW1wdCBwb3dlciBjeWNsZQo+IFsgICAgNC41NzQ2NzJdIHVzYiB1
c2IxLXBvcnQxOiBDYW5ub3QgZW5hYmxlLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8KPiBX
aGF0IGFtIEkgZG9pbmcgd3Jvbmc/IFdoYXQgZG8geW91IG5lZWQgdG8gZG8gdG8gTGludXggd29y
ayB3ZWxsIHdpdGggVVNCIHBvcnRzIG9uIHRoaXMgYm9hcmQ/IFVTQiBwb3J0cyAxMDAlIGFyZSBn
b29kLCB0aGV5IHdvcmsgb24g0JBuZHJvaWQuCj4gCgpJdCBtYXkgYmUgYW4gaXNzdWUgd2l0aCBy
ZWd1bGF0b3JzIG5vdCBlbmFibGluZyBwb3dlciB0byB0aGUgUEhZcyBhbmQgdG8gdGhlIGRldmlj
ZXMsIHBsZWFzZSBjaGVjayBob3cgVVNCIGlzIGVuYWJsZWQgb24gdGhlIHZlbmRvciBrZXJuZWwu
CgpOZWlsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
