Return-Path: <SRS0=49YJ=DI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A4EC4727C
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 13:55:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D079A206E3
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 13:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ueEP7KD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QU8ojKUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D079A206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ITtqQHqXTUEB+vlQKGuNkFrEMm90rngcnnBOfa6zp8Q=; b=2ueEP7KD1EKIBXTizxO7T2AJW
	Y5JRVzMinr5B+UlmAAykx+yPrrw0NevUQ8AtTKexxYmF9CKe5D8An5G5FruP1hpfODwXraxNxVM0Y
	SlUa5OFo29N5+Isoz7DLWksIT1AJR3Zf4IfzqtJwy8o3XaBgwkFpFdRKlvvlCqHg6WadFF8c05w1E
	HvxgX5LXUaj5nI90MvrkGkoRNjY4IAOwOOEHC0mxVUo3OjYCVj14m51weqeN67PsF3U3a5sy0GRmX
	rOhsHv29+qA5jNLgDErdhSWpbc3VFOVQ9RHOcue3lHd0X3b4WBqslP+4D76Z1EIgEk9Fk1ye+zKrQ
	pukdwgB1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNz3O-00050R-SF; Thu, 01 Oct 2020 13:55:26 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNz3M-0004zq-Up
 for linux-amlogic@lists.infradead.org; Thu, 01 Oct 2020 13:55:26 +0000
Received: by mail-vk1-xa44.google.com with SMTP id a16so1046351vke.3
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2020 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y9wXc2FL41clBWsp7rvXXZv0AtepezSEVuo0O/dks5k=;
 b=QU8ojKUo1IKM4m+9xmGFyhjLAgwLGZ8/lgfMKhKu/eJCkfcHqYBgx9MzdTwNj6D6Pt
 HEydpLCUaOLBglg7GnCsW+IiSOGSvOqeAOL/Qc39KndUMe0g5FyVnRIByXrLMXhJ3LAd
 xq9DoPQ0BRLl31KnCk8at7/DwrItAFExlUW934H7zxd8FDPotNw1A1E+06tF/tUUho02
 RCxJF+Ysai4yHjIxrYpYPmFj2a/OO/xukDKEIsOdMgCTwQRUn7Bww+NSD6v2kbHjnDrB
 bdsmPGOqWPirU/uDbZJUWj9phxavANppXzHFsJBh+B2VKgIzEad1U5MM2e+S+kqsMUpR
 VE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y9wXc2FL41clBWsp7rvXXZv0AtepezSEVuo0O/dks5k=;
 b=kXsMvM4GEmSJDF0Pk8yj7MXPDqHvq8fHaaGryIai2+i/yOj/CqN57vlvrcK10wYoyQ
 Ql17+RtfM5BhDH8cCykwVeFYPQPcQ5jN2Q1f8fpZsOQy1bqYR9lnBst3fYkkU3YlwGvS
 SLeA0FKU8xTzaKcRSMLo5nLlCu7VhW8lSu94369QXk3GUgmApb+L6/XAoqpZ37EKqCg2
 tOb4cqP6J45hni8QTUnidEKJ0XE44RSqX05XLjye+Y5fErBciu3/dzbP8EEESJH+ot7W
 jSFNoefITmPClpV+tZ0hoSbAshNX0L0ESuRWAHR4kGomJPbCVRGuvzwcvX+kTM7Yfn89
 K7YA==
X-Gm-Message-State: AOAM531RHStLbMZtSCh3kd+LUagc1WXL6BnjN2gypl+zQMQLIlq9tOS8
 f5qp7vUmAieTy7i6PFlPuOTUxpT5B8IihTrnM8tZ4w==
X-Google-Smtp-Source: ABdhPJx90eHaIEvg1hFaxASdCVIylukofMwKDlZ7N7MQ6og3cNUASp0AJvobq/ik+73iaUTJ+jVSmoV3KLpyUYQIQIg=
X-Received: by 2002:a1f:9913:: with SMTP id b19mr4797101vke.4.1601560523107;
 Thu, 01 Oct 2020 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201001132758.12280-1-aouledameur@baylibre.com>
In-Reply-To: <20201001132758.12280-1-aouledameur@baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Thu, 1 Oct 2020 15:55:11 +0200
Message-ID: <CAHNvnFO=kH25CqrAcndVO4xTQ2pGDFi5ZHEALpFaZaGL=e_c0Q@mail.gmail.com>
Subject: Re: [PATCH] reset: Add reset controller API
To: Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_095525_013103_4475B22A 
X-CRM114-Status: GOOD (  30.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW4gdXBkYXRlIG9uIHRoZSBwYXRjaCB0aXRsZSwgc2luY2Ugd2UgZG9uJ3QgYWRkIGFuIEFQSSBi
dXQgZXh0ZW5kIGl0LApUaGUgdGl0bGUgc2hvdWxkIHJhdGhlciBiZTogQWRkIGEgbmV3IGNhbGwg
dG8gdGhlIHJlc2V0IGZyYW1ld29yawoKTGUgamV1LiAxIG9jdC4gMjAyMCDDoCAxNToyOCwgQW1q
YWQgT3VsZWQtQW1ldXIKPGFvdWxlZGFtZXVyQGJheWxpYnJlLmNvbT4gYSDDqWNyaXQgOgo+Cj4g
VGhlIGN1cnJlbnQgcmVzZXQgZnJhbWV3b3JrIEFQSSBkb2VzIG5vdCBhbGxvdyB0byByZWxlYXNl
IHdoYXQgaXMgZG9uZSBieQo+IHJlc2V0X2NvbnRyb2xfcmVzZXQoKSwgSU9XIGRlY3JlbWVudCB0
cmlnZ2VyZWRfY291bnQuIEFkZCB0aGUgbmV3Cj4gcmVzZXRfY29udHJvbF9yZXNldHRhYmxlKCkg
Y2FsbCB0byBkbyBzby4KPgo+IFdoZW4gcmVzZXRfY29udHJvbF9yZXNldCgpIGhhcyBiZWVuIGNh
bGxlZCBvbmNlLCB0aGUgY291bnRlcgo+IHRyaWdnZXJlZF9jb3VudCwgaW4gdGhlIHJlc2V0IGZy
YW1ld29yaywgaXMgaW5jcmVtZW50ZWQgaS5lIHRoZSByZXNvdXJjZQo+IHVuZGVyIHRoZSByZXNl
dCBpcyBpbi11c2UgYW5kIHRoZSByZXNldCBzaG91bGQgbm90IGJlIGRvbmUgYWdhaW4uCj4gcmVz
ZXRfY29udHJvbF9yZXNldHRhYmxlKCkgd291bGQgYmUgdGhlIHdheSB0byBzdGF0ZSB0aGF0IHRo
ZSByZXNvdXJjZSBpcwo+IG5vIGxvbmdlciB1c2VkIGFuZCwgdGhhdCBmcm9tIHRoZSBjYWxsZXIn
cyBwZXJzcGVjdGl2ZSwgdGhlIHJlc2V0IGNhbiBiZQo+IGZpcmVkIGFnYWluIGlmIG5lY2Vzc2Fy
eS4KPgo+IFRoaXMgcGF0Y2ggd2lsbCBmaXggYSB1c2Igc3VzcGVuZCB3YXJuaW5nIHNlZW4gb24g
dGhlIGxpYnJldGVjaC1jYwo+IHJlbGF0ZWQgdG8gdGhlIHNoYXJlZCByZXNldCBsaW5lLiBUaGlz
IHdhcm5pbmcgd2FzIGFkZHJlc3NlZCBieSB0aGUKPiBwcmV2aW91c2x5IHJldmVydGVkIGNvbW1p
dCA3YTQxMDk1M2QxZmIgKCJ1c2I6IGR3YzM6IG1lc29uLWcxMmE6IGZpeCBzaGFyZWQKPiByZXNl
dCBjb250cm9sIHVzZSIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbWphZCBPdWxlZC1BbWV1ciA8YW91
bGVkYW1ldXJAYmF5bGlicmUuY29tPgo+IFJlcG9ydGVkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1
bmV0QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9yZXNldC9jb3JlLmMgIHwgNTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4
L3Jlc2V0LmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvY29yZS5jIGIvZHJpdmVycy9yZXNldC9jb3JlLmMK
PiBpbmRleCAwMWMwYzdhYTgzNWMuLjUzNjUzZDRiNTVjNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3Jlc2V0L2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvcmVzZXQvY29yZS5jCj4gQEAgLTIwNyw2ICsy
MDcsMTkgQEAgc3RhdGljIGludCByZXNldF9jb250cm9sX2FycmF5X3Jlc2V0KHN0cnVjdCByZXNl
dF9jb250cm9sX2FycmF5ICpyZXNldHMpCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0
YXRpYyBpbnQgcmVzZXRfY29udHJvbF9hcnJheV9yZXNldHRhYmxlKHN0cnVjdCByZXNldF9jb250
cm9sX2FycmF5ICpyZXNldHMpCj4gK3sKPiArICAgICAgIGludCByZXQsIGk7Cj4gKwo+ICsgICAg
ICAgZm9yIChpID0gMDsgaSA8IHJlc2V0cy0+bnVtX3JzdGNzOyBpKyspIHsKPiArICAgICAgICAg
ICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldHRhYmxlKHJlc2V0cy0+cnN0Y1tpXSk7Cj4g
KyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3Rh
dGljIGludCByZXNldF9jb250cm9sX2FycmF5X2Fzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbF9h
cnJheSAqcmVzZXRzKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0LCBpOwo+IEBAIC0zMjQsNiArMzM3
LDUwIEBAIGludCByZXNldF9jb250cm9sX3Jlc2V0KHN0cnVjdCByZXNldF9jb250cm9sICpyc3Rj
KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKHJlc2V0X2NvbnRyb2xfcmVzZXQpOwo+Cj4gKy8q
Kgo+ICsgKiByZXNldF9jb250cm9sX3Jlc2V0dGFibGUgLSBkZWNyZW1lbnRzIHRyaWdnZXJlZF9j
b3VudCBvZiB0aGUgY29udHJvbGxlZCBkZXZpY2UKPiArICogQHJzdGM6IHJlc2V0IGNvbnRyb2xs
ZXIKPiArICoKPiArICogT24gYSBzaGFyZWQgcmVzZXQgbGluZSB0aGUgYWN0dWFsIHJlc2V0IHB1
bHNlIGlzIG9ubHkgdHJpZ2dlcmVkIG9uY2UgZm9yIHRoZQo+ICsgKiBsaWZldGltZSBvZiB0aGUg
cmVzZXRfY29udHJvbCBpbnN0YW5jZSwgZXhjZXB0IGlmIHRoaXMgZnVuY3Rpb24gaXMgdXNlZC4K
PiArICogSW4gZmFjdCwgSXQgZGVjcmVtZW50cyB0cmlnZ2VyZWRfY291bnQgdGhhdCBtYWtlcyBz
dXJlIG9mIG5vdCBhbGxvd2luZwo+ICsgKiBhIHJlc2V0IGlmIHRyaWdnZXJlZF9jb3VudCBpcyBu
b3QgbnVsbC4KPiArICoKPiArICogVGhpcyBpcyBhIG5vLW9wIGluIGNhc2UgdHJpZ2dlcmVkX2Nv
dW50IGlzIGFscmVhZHkgbnVsbCBpLmUgc2hhcmVkIHJlc2V0IGxpbmUKPiArICogaXMgcmVhZHkg
dG8gYmUgdHJpZ2dlcmVkLgo+ICsgKgo+ICsgKiBDb25zdW1lcnMgbXVzdCBub3QgdXNlIHJlc2V0
X2NvbnRyb2xfKGRlKWFzc2VydCBvbiBzaGFyZWQgcmVzZXQgbGluZXMgd2hlbgo+ICsgKiByZXNl
dF9jb250cm9sX3Jlc2V0IGhhcyBiZWVuIHVzZWQuCj4gKyAqCj4gKyAqIElmIHJzdGMgaXMgTlVM
TCBpdCBpcyBhbiBvcHRpb25hbCBjbGVhciBhbmQgdGhlIGZ1bmN0aW9uIHdpbGwganVzdAo+ICsg
KiByZXR1cm4gMC4KPiArICovCj4gK2ludCByZXNldF9jb250cm9sX3Jlc2V0dGFibGUoc3RydWN0
IHJlc2V0X2NvbnRyb2wgKnJzdGMpCj4gK3sKPiArICAgICAgIGlmICghcnN0YykKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgaWYgKFdBUk5fT04oSVNfRVJSKHJzdGMp
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgaWYgKHJl
c2V0X2NvbnRyb2xfaXNfYXJyYXkocnN0YykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXNl
dF9jb250cm9sX2FycmF5X3Jlc2V0dGFibGUocnN0Y190b19hcnJheShyc3RjKSk7Cj4gKwo+ICsg
ICAgICAgaWYgKHJzdGMtPnNoYXJlZCkgewo+ICsgICAgICAgICAgICAgICBpZiAoV0FSTl9PTihh
dG9taWNfcmVhZCgmcnN0Yy0+ZGVhc3NlcnRfY291bnQpICE9IDApKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGF0b21p
Y19yZWFkKCZyc3RjLT50cmlnZ2VyZWRfY291bnQpID4gMCkKPiArICAgICAgICAgICAgICAgICAg
ICAgICBhdG9taWNfZGVjKCZyc3RjLT50cmlnZ2VyZWRfY291bnQpOwo+ICsgICAgICAgfSBlbHNl
IHsKPiArICAgICAgICAgICAgICAgaWYgKCFyc3RjLT5hY3F1aXJlZCkKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVQRVJNOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVy
biAwOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHJlc2V0X2NvbnRyb2xfcmVzZXR0YWJsZSk7
Cj4gKwo+ICAvKioKPiAgICogcmVzZXRfY29udHJvbF9hc3NlcnQgLSBhc3NlcnRzIHRoZSByZXNl
dCBsaW5lCj4gICAqIEByc3RjOiByZXNldCBjb250cm9sbGVyCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvcmVzZXQuaCBiL2luY2x1ZGUvbGludXgvcmVzZXQuaAo+IGluZGV4IDA1YWE5ZjQ0
MGY0OC4uZmZhNDQ3ZDBkMWQ2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcmVzZXQuaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvcmVzZXQuaAo+IEBAIC0xMyw2ICsxMyw3IEBAIHN0cnVjdCBy
ZXNldF9jb250cm9sOwo+ICAjaWZkZWYgQ09ORklHX1JFU0VUX0NPTlRST0xMRVIKPgo+ICBpbnQg
cmVzZXRfY29udHJvbF9yZXNldChzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Yyk7Cj4gK2ludCBy
ZXNldF9jb250cm9sX3Jlc2V0dGFibGUoc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGMpOwo+ICBp
bnQgcmVzZXRfY29udHJvbF9hc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGMpOwo+ICBp
bnQgcmVzZXRfY29udHJvbF9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Yyk7Cj4g
IGludCByZXNldF9jb250cm9sX3N0YXR1cyhzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Yyk7Cj4g
LS0KPiAyLjE3LjEKPgoKCi0tIApBbWphZCBPdWxlZC1BbWV1cgpFbWJlZGRlZCBMaW51eCBFbmdp
bmVlciAtIFZpbGxlbmV1dmUgTG91YmV0LCBGUgpFbmdpdEBCYXlMaWJyZSAtIEF0IHRoZSBIZWFy
dCBvZiBFbWJlZGRlZCBMaW51eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
