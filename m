Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A81C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3486721903
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bpX94cUs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HShqtnHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3486721903
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6d+zbbPEJn16imktSBj3HLEQwHD7XvZeJscH87oj1w=; b=bpX94cUswjuvi4
	98os/qX8jOJFtPdhIwzqczj2HpTdPzCsWV1VRVN1QyF3YA9IktTMPVzfw1TvXbJxfJkbiq8ezEC6S
	broPUoeoGF2GZMtl6JbYlb9sFFISMkzpwdlbWbCnlWHy1L2b1+P/ub4G9iWzYVgQFXnXexc4k/eTI
	TM++UYeYN6uYrkk6criZFeV/Bd/8nwmeT/YHNORDHK+REGOgk9NNVJAoHGV67HJ6sB3HkjYaX4yHq
	20jK22YYCg0d4QUOJ57oO6rhTY917l+adj1z+Cs62D/lir1YhgcXgMZslEVBxJFz410RenbrgPRCv
	vwHmpr46FSyuRVAFBltQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AUk-0001q6-9q; Sat, 16 Mar 2019 14:41:06 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AUa-0001gA-2C
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:40:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id i8so12471423wrm.0
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=kZtPyGv3piHGTEPU4vYi+v8Hf0ZG/pFYCfiuoXCBihw=;
 b=HShqtnHbGuCCgCo1puPdNXB8SXviGvSVKIfiLn/yuO9Q6hv/33Opfgf+WQ9vSp9gQL
 FzpyV4X8k3sKIgL1HRNiYdMGxOluEhfDI5d9JIJwCz946vaV56RH/fprWKH/a9oZ9mE2
 WfAs4CUVzgKsUOKPHe1NHe04t1dJH8ym66NIRoat6XmFcMrlfWM//ivDpHig8OjOIC8r
 mBt5bP+ezFPRImnDOH9U8hI2WzcxeesSFieWsLOK+G/yy8ACqhfoLUwOXZnSGd2LhoY0
 STKbogJiHoxj7uOg3DDJYKYI4yEhY/tGv/PU0dMGU5ErDE/u7k781OlEZk1JbFaQyRC4
 2/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=kZtPyGv3piHGTEPU4vYi+v8Hf0ZG/pFYCfiuoXCBihw=;
 b=bfL+fMEg8LUTkC9DyyROyW08iQsfOVqzzhpZY4+JeJZRqQP9dhla4tDUNmAQtoXxtf
 8HZyHengrmqkMnnXJ4HZ18ZEghCIwdnQ9cZOCKi6HhR6UKzyRTbRpVc8iBzauedRfC9h
 KQd7E/taFNgTaUsqzr7by2IOREcPxOraPOCL7ZQExYJk1J0GXGqUQLDvD8Zxct3GU1pG
 hXKz5BXhXdLnhXtb7i0oOfcXjKrv3jM/ccTDXlWV9YrWIfuQ5uKCobnE1LcbL0CsgUiy
 4B+WSrmF0OjMSK+9OaKL5Zjv84atbYkressBjDjtWnfiaTBgLQq94XqDFSy4jWmDjHjz
 7uew==
X-Gm-Message-State: APjAAAV6B9jdaYnwf2yx+QxV+9H7rdCRuNp+6fQ5qw4wrVyHpgDnZ1s7
 9ovS4l+ZNSgFdW6mD0mjBzOLwA==
X-Google-Smtp-Source: APXvYqyRHd8f8YmeeSJEpz5UzV8ASz+zBVO0fsnhCoYAu4liDXxG4fdTvxZHzkJUs/BT7SWuQ7ecgw==
X-Received: by 2002:a5d:6252:: with SMTP id m18mr5795078wrv.199.1552747254481; 
 Sat, 16 Mar 2019 07:40:54 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 z12sm4388781wrt.10.2019.03.16.07.40.53
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:40:53 -0700 (PDT)
Message-ID: <5C8D0AF5.5040101@baylibre.com>
Date: Sat, 16 Mar 2019 15:40:53 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 04/11] arm64: dts: meson-g12a-u200: add regulators
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-5-narmstrong@baylibre.com>
 <CAFBinCCiV21kB38SXqVYMmQ5YkK2MxXKhiTJrVP3jOCLDtuBBg@mail.gmail.com>
In-Reply-To: <CAFBinCCiV21kB38SXqVYMmQ5YkK2MxXKhiTJrVP3jOCLDtuBBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_074056_172392_9EBA518D 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SEksCgpMZSAxNS8wMy8yMDE5IDIzOjAxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoK
PiBIaSBOZWlsLAo+IAo+IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDEwOjU3IEFNIE5laWwgQXJt
c3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206IEplcm9t
ZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+Pgo+PiBBZGQgc3lzdGVtIHJlZ3VsYXRv
cnMgZm9yIHRoZSBTOTA1RDIgVTIwMCByZWZlcmVuY2UgZGVzaWduLgo+IEkgZmluZCB0aGUgaGlu
dCBpbiB0aGUgbWVzb24tZzEyYS1zZWk1MTAgcmVndWxhdG9ycyBwYXRjaCB2ZXJ5IGdvb2Q6Cj4g
ICBTdGlsbCBtaXNzaW5nCj4gICAqIFZERF9FRSAoMC44ViAtIFBXTSBjb250cm9sbGVkKQo+ICAg
KiBWRERfQ1BVKFBXTSBjb250cm9sbGVkKQo+ICAgKiBWRERRMV81CgpJIHdpbGwgYWRkIHRoZSBz
YW1lIGNvbW1lbnQgaGVyZQoKPiAKPiBWRERfRUUgYW5kIFZERF9DUFUgYXJlICpwcm9iYWJseSog
Z29pbmcgdG8gYmUgdmVyeSBzaW1pbGFyIGFjcm9zcyBhbGwKPiBib2FyZHMgKE1lc29uOGIgdXNl
cyB0d28gc2xpZ2h0bHkgZGlmZmVyZW50IFBXTSByZWd1bGF0b3JzIG9uIGFsbAo+IGJvYXJkcyBz
dXBwb3J0ZWQgYnkgbWFpbmxpbmUsIGJ1dCB0aGUgYmFzaWMgY29uY2VwdCBpcyBhbHdheXMgdGhl
Cj4gc2FtZSkKCk5vdCBuZWNlc3NhcmlseSwgaXQgY2FuIGNoYW5nZSwgaXQgdXNlZCB0byBjaGFu
Z2UgYWNyb3NzIEdYQkIgYm9hcmRzLCBidXQKc2VlbXMgdG8gYmUgbW9yZSBjb2hlcmVudCBhY3Jv
c3MgR1hML0dYTS9HMTJBIHJlZiBkZXNpZ25zIGFuZCBkZXJpdmF0aXZlCmJvYXJkcywgYnV0IGl0
IGNhbiBzdGlsbCBjaGFuZ2UgaWYgdGhlIEhXIGRlc2lnbmVyIGRlY2lkZXMgdG8gYmUgY3JlYXRp
dmUgIQoKPiBJJ20gbm90IHN1cmUgaWYgVkREUTFfNSBpcyBzcGVjaWZpYyB0byB0aGUgU0VJNTEw
IGJvYXJkIHRob3VnaC4KCkkgdGhpbmsgVkREUTFfNSBpcyBzcGVjaWZpYyB0byBTRUk1MTAsIHdp
bGwgY2hlY2sgb24gdGhlIHNjaGVtYXRpY3MKCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBC
cnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiAgLi4uL2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyYS11MjAwLmR0cyAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKwo+
PiAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLXUyMDAuZHRzIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtdTIwMC5kdHMKPj4gaW5kZXggZjJhZmQwYmYz
ZTI4Li4xNzY5NmYzNTZmZjIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJhLXUyMDAuZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJhLXUyMDAuZHRzCj4+IEBAIC0xNCwxMyArMTQsOTIgQEAKPj4gICAgICAg
ICBhbGlhc2VzIHsKPj4gICAgICAgICAgICAgICAgIHNlcmlhbDAgPSAmdWFydF9BTzsKPj4gICAg
ICAgICB9Owo+PiArCj4+ICAgICAgICAgY2hvc2VuIHsKPj4gICAgICAgICAgICAgICAgIHN0ZG91
dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwo+PiAgICAgICAgIH07Cj4+ICsKPj4gICAgICAg
ICBtZW1vcnlAMCB7Cj4+ICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+
PiAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDAgMHgwIDB4NDAwMDAwMDA+Owo+PiAgICAg
ICAgIH07Cj4gdGhlcmUgYXJlIHR3byB1bnJlbGF0ZWQgd2hpdGVzcGFjZSBjaGFuZ2VzIGFib3Zl
Lgo+IHBsZWFzZSBjbGVhbiB0aGVtIHVwIGlmIHlvdSBoYXZlIHRvIHJlLXNlbmQgdGhpcyBmb3Ig
d2hhdGV2ZXIgcmVhc29uCgpZZXAsIHdpbGwgY2xlYW51cAoKPiAKPiAKPiBSZWdhcmRzCj4gTWFy
dGluCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
