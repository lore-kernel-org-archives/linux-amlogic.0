Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2494C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2024 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZRaw+KRDAER6FJDDt6FSJMFGPdvbSRDo3WOqPQgFJc=; b=MOkKq4pilxSCHb
	h1/jN1NzwNHmNnoT7z4Jj0Ga87oYvicVx9TfA9f5zDbmh9WDKCo4pLsExlqPlcjvnDayX68MXr5IH
	DIYqW5XXcamiXHimynuVRjKsQiVAhV59lFuqTaZntLffPrEPdXswKo0jB2x7fBPy4Tox82XIWpbse
	h5nSGzoN4L4Vf/w+g7Ony1JLtkPhpfg5OgNxljX0UMb9MkPh4zffHk+AEryqaJ6tOLW4aEidDUfuB
	2eq2kruBBoMmkebxzdk+mMl3DVq+9prW1O+PWpMOUZ6uGwkn+6zZr+/4KXbPGD4+JNrvPBmma+Iqx
	RlSlnZ69vNWQc4JgyalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAdw-0000000HJOp-2pI7;
	Wed, 17 Apr 2024 19:08:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAds-0000000HJNs-2kEe
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Apr 2024 19:08:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2a502547460so101489a91.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2024 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713380903; x=1713985703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JOv0r8oGsd8Uwgzx+OALcEdGHkc+iXwkzkwevk9XaMU=;
        b=haQz5nBD3Hum61xnL/BWJqpN4TR20JzR+BbvhO/1+OyJInievVg3CC/4saZGFXoBQ7
         sAhZ6FMa5a+GtqEQdFzS9ctrU5p7DDfTbrTf7gJ4zypeHlX3uWpAD7LTEqMmjMBKlQD6
         Q2ErFF+B3aHKEY3gzQu5NujpM17p2QZxU8cloSu07H24ZaY3HHQ805AU0YFK86foykt4
         Ns3zY8Z3LBczcG9nOFe38189IqHFIzn2ad1Pl7V+mbC8/zeUG4U/prVEqSTrjrXowaiM
         kniXOAcGpV4lJvD6M3+bI2rC8OjnogTWwMOnpIOGqIpCP5ZWMEuhnkM1J+hl0BEOjlvx
         Iocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713380903; x=1713985703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOv0r8oGsd8Uwgzx+OALcEdGHkc+iXwkzkwevk9XaMU=;
        b=P7mDwb9xSGgDyX1mdT68hsM+abHOLeHkIaKyasGeYIR5NIfBWrCQr8rRpAUMy6z1fZ
         +Fua4QTiu61uK14uXIKOtU7nLX2Iqu5Ujw6yuntYkLX9Glho+1FhC5BmwlmwIE4GaCb/
         yk0/HkldgbVLzEQ/N8Hqut0VClsBPcgMSGTT3WIoopc0zBT6ATvXPg5u5zrKE+U2FadG
         kFJl/a+tcf+pu9MsTVhTjImwQwgk03MMd9XVCCaPrereW3R9+36AdMQB19syESojQSlT
         U2+JKXR7jCDb8crsJtvyMpS+0+k0hgjuMe4AYB3b94fxfOG5ynmyu9DzeBfdsYMpNsTp
         9csQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPC2sWvkGthEhdvTCHae3EakVt9hVvSPEKzjiZimaXM5ao9ksQid0tc69ogdKfY9lUgx1hblgDs05GMUqmt77DRjAgAQA29+XN+0beZBnBed4=
X-Gm-Message-State: AOJu0YzEs/l2C4X6nAoiAWyHM0asdRduLyg7rIomljIRDECt61Um0TQZ
	nQ5QEHyDAGCvDy1GZQM8/NNnnCXMYasacgMbxWUGhMqBOeLV4LNpmX03figBG0E=
X-Google-Smtp-Source: AGHT+IEZ9I8GXKv1tI1iGj/oovu6lXliOy6VrsjcJ0Zg7yQygT1RWqtVAHKDFKbCaeQAOFUXmGUiUg==
X-Received: by 2002:a17:90b:782:b0:2a4:6c87:7c81 with SMTP id l2-20020a17090b078200b002a46c877c81mr321296pjz.22.1713380902656;
        Wed, 17 Apr 2024 12:08:22 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.154])
        by smtp.gmail.com with ESMTPSA id c16-20020a17090aa61000b002aac2aaf4c5sm3286pjq.7.2024.04.17.12.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 12:08:22 -0700 (PDT)
Message-ID: <f845db57-64dc-4127-ab8d-9a038fd8d35b@linaro.org>
Date: Wed, 17 Apr 2024 21:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Amlogic T7 Reset Controller
To: neil.armstrong@linaro.org, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-1-4c6e2e68359e@amlogic.com>
 <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
 <10650c59-96f2-4234-b5fd-aa8efec90e5b@linaro.org>
 <579a1569-7bba-491f-ba5e-7cfcb34ccc1f@linaro.org>
 <c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org>
 <48005005-54ad-473b-826d-23b0b3f3a52c@amlogic.com>
 <64c765e4-698f-49d6-8d17-4b512c3dc8ec@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <64c765e4-698f-49d6-8d17-4b512c3dc8ec@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_120824_869646_C1BC80AA 
X-CRM114-Status: GOOD (  29.66  )
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

T24gMTYvMDQvMjAyNCAwMTozMCwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAxNS8wNC8yMDI0IDEyOjMxLCBLZWx2aW4gWmhhbmcgd3JvdGU6Cj4+Cj4+IE9uIDIwMjQvNC8x
MyAwMjowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwg
XQo+Pj4KPj4+IE9uIDEyLzA0LzIwMjQgMTk6NTcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
Cj4+Pj4gT24gMTIvMDQvMjAyNCAxNToxMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IEhp
LAo+Pj4+Pgo+Pj4+PiBPbiAyOS8wMy8yMDI0IDIwOjM5LCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+Pj4+Pj4gT24gMjkvMDMvMjAyNCAxMDoxNywgS2VsdmluIFpoYW5nIHZpYSBCNCBSZWxh
eSB3cm90ZToKPj4+Pj4+PiBGcm9tOiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5j
b20+Cj4+Pj4+Pj4KPj4+Pj4+PiBBZGQgYSBuZXcgY29tcGF0aWJsZSBhbmQgdGhlIHJlbGF0ZWQg
aGVhZGVyIGZpbGUKPj4+Pj4+PiBmb3IgQW1sb2dpYyBUNyBSZXNldCBDb250cm9sbGVyLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWmVsb25nIERvbmcgPHplbG9uZy5kb25nQGFtbG9n
aWMuY29tPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtlbHZpbiBaaGFuZyA8a2VsdmluLnpoYW5n
QGFtbG9naWMuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IMKgwqAgLi4uL2JpbmRpbmdzL3Jlc2V0
L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+Pj4+
IMKgwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLHQ3LXJlc2V0LmjCoMKgwqDC
oMKgwqAgfCAxOTcgKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4gwqDCoCAyIGZpbGVzIGNo
YW5nZWQsIDE5OCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1l
c29uLXJlc2V0LnlhbWwKPj4+Pj4+PiBpbmRleCBmMGM2YzBkZjBjZTMuLmZlZmUzNDNlNWFmZSAx
MDA2NDQKPj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVz
ZXQvYW1sb2dpYyxtZXNvbi1yZXNldC55YW1sCj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+Pj4+
IEBAIC0xOSw2ICsxOSw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAt
IGFtbG9naWMsbWVzb24tYTEtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIEExIGFuZCBjb21w
YXRpYmxlIFNvQ3MKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1zNC1y
ZXNldCAjIFJlc2V0IENvbnRyb2xsZXIgb24gUzQgYW5kIGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLGMzLXJlc2V0ICMgUmVzZXQgQ29udHJvbGxlciBv
biBDMyBhbmQgY29tcGF0aWJsZSBTb0NzCj4+Pj4+Pj4gK8KgwqDCoMKgwqAgLSBhbWxvZ2ljLHQ3
LXJlc2V0ICMgUmVzZXQgQ29udHJvbGxlciBvbiBUNyBhbmQgY29tcGF0aWJsZSBTb0NzCj4+Pj4+
Pj4KPj4+Pj4+Cj4+Pj4+PiBJZiB0aGVyZSBpcyBnb2luZyB0byBiZSBhbnkgcmVzZW5kLCBwbGVh
c2UgZHJvcCB0aGUgY29tbWVudC4gSXQncyBub3QKPj4+Pj4+IHJlYWxseSBoZWxwZnVsIGFuZCBt
YWtlcyBpdCB0cmlja2llciB0byByZWFkLgo+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqDCoCByZWc6Cj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyx0Ny1yZXNldC5oIGIvaW5jbHVkZS9kdC1iaW5k
aW5ncy9yZXNldC9hbWxvZ2ljLHQ3LXJlc2V0LmgKPj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2E0YTgzMmVlZWVjCj4+Pj4+Pj4gLS0tIC9k
ZXYvbnVsbAo+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyx0
Ny1yZXNldC5oCj4+Pj4+Pj4gQEAgLTAsMCArMSwxOTcgQEAKPj4+Pj4+PiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgTUlUKSAqLwo+Pj4+Pj4+ICsvKgo+Pj4+
Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgo+Pj4+Pj4+ICsgKi8KPj4+Pj4+PiArCj4+Pj4+Pj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdT
X0FNTE9HSUNfVDdfUkVTRVRfSAo+Pj4+Pj4+ICsjZGVmaW5lIF9EVF9CSU5ESU5HU19BTUxPR0lD
X1Q3X1JFU0VUX0gKPj4+Pj4+PiArCj4+Pj4+Pj4gKy8qIFJFU0VUMCAqLwo+Pj4+Pj4+ICsvKsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAwLTPCoMKgwqDCoCAqLwo+Pj4+Pj4KPj4+Pj4+IEkgYXNzdW1l
IHRoaXMgbWF0Y2hlcyBleGlzdGluZyBkcml2ZXJzIHdoaWNoIGRvIG5vdCB1c2UgSURzIGJ1dCBt
YXAgdGhlCj4+Pj4+PiBiaW5kaW5nIHRvIGhhcmR3YXJlIHZhbHVlPyBJIHJlbWVtYmVyIHdlIHRh
bGtlZCBhYm91dCBjaGFuZ2luZyBpdCwgc28gaWYKPj4+Pj4+IHNvbWV0aGluZyBoYXBwZW5lZCBh
Ym91dCB0aGlzIGFuZCBpdCBjb3VsZCBiZSBjaGFuZ2VkOiBwbGVhc2UgY2hhbmdlLgo+Pj4+Pgo+
Pj4+PiBJJ20gbm90IGF3YXJlIG9mIHN1Y2ggZGlzY3Vzc2lvbiwgYW5kIEkgZG9uJ3QgcmVhbGx5
IHNlZSB0aGUgaXNzdWUuLi4KPj4+Pj4gdGhvc2VzIGFyZSBJRHMsIGFuZCB5ZXMgdGhleSBtYXRj
aCB0aGUgSGFyZHdhcmUgb2Zmc2V0cywgYW5kID8KPj4+Pgo+Pj4+IEJpbmRpbmdzIGFyZSBub3Qg
Zm9yIGhhcmR3YXJlIG9mZnNldHMvdmFsdWVzL2FkZHJlc3Nlcy4gSXQncyBqdXN0IG5vdCBhCj4+
Pj4gYmluZGluZy4KPj4+Pgo+Pj4+IEkgcXVpY2tseSBsb29rZWQgYXQgeW91ciBkcml2ZXIgcGF0
Y2ggYW5kIGl0IGNvbmZpcm1zOiBub3QgYSBiaW5kaW5nLgo+Pj4+IEJpbmRpbmcgY29uc3RhbnQg
aXMgdXNlZCBieSB0aGUgZHJpdmVyIGFuZCBEVFMgY29uc3VtZXIuCj4+Pj4KPj4+PiBJIGFtIHJl
YWxseSBzdXJlIHdlIGhhZCB0aGlzIHRhbGsgaW4gdGhlIHBhc3QsIGJ1dCBjb3VsZCBiZSBJIHRo
aW5rCj4+Pj4gYWJvdXQgZGlmZmVyZW50IHBsYXRmb3JtLiBTaW5jZSB0aGlzIGlzIG5vdCBhIGJp
bmRpbmcsIEkgZG8gbm90IHRoaW5rCj4+Pj4gY2xhaW1pbmcgdGhlcmUgaXMgYW55IEFCSSBoZXJl
IGlzIHJlYXNvbmFibGUuIEZlZWwgZnJlZSB0byBzdG9yZSB0aGVtCj4+Pj4gd2l0aCBvdGhlciBo
YXJkd2FyZSB2YWx1ZXMsIGxpa2UgaW4gRFRTIGhlYWRlcnMgZXRjLiBXZSBhbHJlYWR5IG1vdmVk
IHRvCj4+Pj4gRFRTIGhlYWRlcnMgc2V2ZXJhbCBzdWNoICJub24tYmluZGluZyIgY29uc3RhbnRz
Lgo+Pj4KPj4+IFVuLWFja2VkLgo+Pj4KPj4+IEkgbG9va2VkIGF0IG15IGFyY2hpdmVzIGFuZCB3
ZSBkaWQgdGFsayBhYm91dCBpdCBhbmQgeW91IHdlcmUgQ0NlZDoKPj4+Cj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlL2MwODhlMDFjLTA3MTQtODJiZS04MzQ3LTYx
NDBkYWY1NjY0MEBsaW5hcm8ub3JnLwo+Pj4gc2ltcGxlLXJlc2V0IGlzIGFuIGV4Y2VwdGlvbi4K
Pj4+Cj4+PiBTbyB0byByZWNhcDoKPj4+IFRoYXQncyBub3QgYSBiaW5kaW5nLiBEb24ndCBhZGQg
c29tZSByZWFsIHZhbHVlcyB0byBiaW5kaW5nIGhlYWRlcnMKPj4+IGJlY2F1c2UgaXQgaXMgbm90
IGEgYmluZGluZyB0aGVuLgo+IAo+IFNvIHdoYXQncyBleGFjdGx5IGEgYmluZGluZyB0aGVuPwoK
QmluZGluZyBoZWFkZXJzIGlzIGludGVyZmFjZSBuZWVkZWQgKG5lY2Vzc2FyeSkgYmV0d2VlbiBp
bXBsZW1lbnRhdGlvbgoobGlrZSBMaW51eCBkcml2ZXJzKSBhbmQgRFRTLgoKPiByYW5kb20gbGlu
ZWFyIG51bWJlcnMgdGhhdCBtZWFucyBub3RoaW5nIGNhbiBiZSBhIGJpbmRpbmcKPiBidXQgcmVn
aXN0ZXJzIG51bWJlcnMgY2FuJ3QgYmUgPyB3aHkgPyBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQs
IHdoeSB0aGlzIHN1ZGRlbmx5IGdldHMgcHJvYmxlbWF0aWMgPwoKVGhlcmUgaXMgbm8gaW50ZXJm
YWNlIGhlcmUuIERyaXZlcnMgZG9uJ3QgdXNlIHRoZW0uIEl0J3Mgbm90ICJzdWRkZW5seSIKcHJv
YmxlbWF0aWMsIEkgY29tbWVudGVkIG9uIHRoaXMgeWVhciBvciB0d28geWVhcnMgYWdvIGFuZCB3
ZSBhbHNvCnN0YXJ0ZWQgbW92aW5nIHN1Y2ggaGVhZGVyLWFidXNlcnMgb3V0IG9mIGJpbmRpbmdz
LgoKPiAKPj4+Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlL0NB
SzhQM2ExQVB6czc0WVRjWj1tNDNHM3pybXdKWktjWVNUdlY1ZUREUVgtMzdVWTdUd0BtYWlsLmdt
YWlsLmNvbS8KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvQ0FL
OFAzYTBmREpRdkdMRXRHMGZ4TGtHMDhGaDlWN0xFTVBzeDRBYVMrMkxkb194V3h3QG1haWwuZ21h
aWwuY29tLwo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9iNjBm
NWZkMi1kYzQ4LTkzNzUtZGExYy1mZmNmZTgyOTI2ODNAbGluYXJvLm9yZy8KPj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvNDE4YzVmMGMtNTI3OS00MWY1LTM3MDUt
MzQ1ZWM5YTk3ZWEyQGxpbmFyby5vcmcvCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAxNDAxMTExNDE1LjI5Mzk1LmFybmRAYXJuZGIuZGUvCj4+Pgo+PiBHb3QgaXQuIFdpbGwgZGVs
ZXRlIGFtbG9naWMsdDctcmVzZXQuaCBhbmQgdXNlIHRoZSBoYXJkd2FyZSBudW1iZXJzCj4+IGRp
cmVjdGx5IGluIHRoZSBEVC4gPgo+PiBIaSBOZWlsLAo+PiBBcyB5b3Uga25vdywgQW1sb2dpYyBy
ZXNldCBjb250cm9sbGVyIGlzIGRpdmlkZWQgaW50byBzZXZlcmFsIGdyb3VwczogcmVzZXQwLCBy
ZXNldDEsIC4uLiwgcmVzZXROLiBJJ2QgbGlrZSB0byBkaXNjdXNzIHRoZSByYXRpb25hbGl0eSBv
ZiBzcGxpdHRpbmcgdGhlIG9uZSBkZXZpY2Ugbm9kZSBvZiByZXNldCBjb250cm9sbGVyIGludG8g
ZGV2aWNlIG5vZGVzIGFjY29yZGluZyB0byB0aGUgZ3JvdXBzLiBUaGVuIHdlIGNhbiB1c2UgdGhl
IGJpdCBudW1iZXIgd2l0aGluIHRoZSAncmVzZXRzJyBwcm9wZXJ0eS4KPj4gcmVzZXQwOiByZXNl
dC1jb250cm9sbGVyQDIwMDAgewo+PiAuLi4KPj4gfTsKPj4KPj4gcmVzZXQxOiByZXNldC1jb250
cm9sbGVyQDIwMDQgewo+PiAuLi4KPj4gfTsKPj4gLi4uCj4+Cj4+IFdoYXQgZG8geW91IHRoaW5r
Pwo+IAo+IE5vIHNpbmNlIHlvdSdsbCBiYXNpY2FsbHkgYWRkIGEgbm9kZSBwZXIgcmVnaXN0ZXIs
IHlvdSBuZWVkIHRvIGFkZCBhIG5vZGUgZm9yIHRoZSB3aGlsZSByZXNldCBIVyBmdW5jdGlvbiwg
YW5vdGhlcgo+IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHNwbGl0IHRoZSBwaGFuZGxlIGFyZ3VtZW50
cyBpbiAyLCB0aGUgZmlyc3QgZmlyc3Qgd291bGQgYmUgdGhlIHJlc2V0IGJhbmssIGFuZCB0aGUg
c2Vjb25kIG9uZQo+IHRoZSByZXNldCBsaW5lIGZvciB0aGUgYmFuay4KPiAKPiBCdXQgc3RpbGwg
aXQncyBhIHJlZ3Jlc3Npb24gaW4gcmVhZGFiaWxpdHkgdG8gZHJvcCB0aGUgbWFjcm9zLCB1bnRp
bCBncGlvcyBvciBwaW5zIHRoZSByZXNldCBudW1iZXIgZG9lc24ndCBtZWFuIGFueXRoaW5nIHBl
ciBzZS4KCgpXaGF0IHN0b3BzIHlvdSBmcm9tIHB1dHRpbmcgdGhlIGhlYWRlciBpbiB0aGUgRFRT
PyBKdXN0IGxpa2Ugb3RoZXJzIGFyZQpkb2luZz8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
