Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EEC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJgW3lQLXjMtdvc1VgbN2f6wwxbcaRm1yDoj205SiQg=; b=wS8ie9CXYZxAk9LDCUkPwbzbad
	PitSbMf/At0NiG4jnnh6phb/S/sdqKaHUFTsYjwZeh9dIPH7srkW99PjJnAzGV0Gz5F22VwI4brH6
	THMwgJvMxvdbDMBhMnz7Mrt9gM1EGhm4JEpuUkY+xuX2yeWFI+/Q8YKQ66BXsespbJdTEUuOWl5Z7
	JyHlsf2VNgOcqBl9nqkci6X8IZbyU//MrCLi6vLHjFZ+RGW9ddAzThgleqVQEaxn3JOvHza1taED5
	vnRgRrf3ybc7SX/XRhx4aUWf4aXsEpLRY3UwlygtLc8Y2x93OfRueML+99lCWm0oRMhgUZB1zdV9u
	a8XkKVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgH4-005PG0-CQ; Mon, 13 Mar 2023 11:23:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgGr-005PBZ-SD
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 11:23:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso4584871wms.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678706593;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rLGVLPIFgOtKQ1a+wS1BAV+N288Bpp6n/Ucqc35qlWk=;
        b=LsS0c6J+AVoISiWAO7r4b6y6bCk7GMsfZGc+HT6F9Ghm4ywea71Wt7HovQtqwWGROc
         Q2hjYgT7/Un0AsBvQj0fZ7+hSqs38WeJy66EqMxbYvkU1yb+HGmeZ3ES2K3NazYH0106
         nJY2OQbVt5LRHUFJsugUg4sPXII6W+vCYWvqSa2TIR4RFXxA6KvxpTbfO8TfWmhBupge
         uVwgEmEQ4V1KnnftyXU7njK+XK09JvHVigQvuFM+RZTuMSj7RQEHmNsR2sAquNqI4vBB
         LhUlonJ1aGQTYIPSV5ceWrMQ6O8Y/xwtUA9Khu26iA6KZmWtYLUve1CHvx8LKYvkwcGT
         hHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678706593;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLGVLPIFgOtKQ1a+wS1BAV+N288Bpp6n/Ucqc35qlWk=;
        b=3PYKTUVQKODuSff6PI5Zh/sdklXoBUuhbwXHP+Te080fg5SbzAnttA90vaF4AK+MZQ
         leAaGjIbHBOnKwUC+PjI06U/chiZlYNIE/fhWDmY5Ga/yjBw5o6RZX2DZTUapEqomZ/1
         NryK0eWUQOtFBrDEWufz9998Y/PVi6WDXIkU/cpdhbymzjUFI0TFhoTH78u9CP591gaj
         5pHMU+42fEnZ5EhyHHND17EwickPaWzTVhe5VjfhstV+cEO/Ey0sphyfe7MjgL6A8Pac
         SkXC/uuKhHLdBsLSFH5/Yu0JCPrh4wnXH7MJKkjpJ+8On6cnhl/GyNsd/bjFc8eg5Pp8
         sHnQ==
X-Gm-Message-State: AO0yUKVdKQaLs5LvJrjxh1L1YACC1jSLb0uKVs2vVc7ARP0LIfH1bamX
	Bi/AFDjkwJzWGaUHKBchwwt5Sw==
X-Google-Smtp-Source: AK7set+23Z30ivSz/1PYJXbplwwpSZTCzPnvJWfBTeRwlu6P8xmv+JHCm0PNCVihMych6X7TsW8vSA==
X-Received: by 2002:a05:600c:314c:b0:3eb:29fe:70df with SMTP id h12-20020a05600c314c00b003eb29fe70dfmr10583571wmo.35.1678706593364;
        Mon, 13 Mar 2023 04:23:13 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b002c567881dbcsm7529470wrs.48.2023.03.13.04.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 04:23:13 -0700 (PDT)
Message-ID: <dc46c06f-6b36-3c1c-bf96-2ef37e29dfdb@linaro.org>
Date: Mon, 13 Mar 2023 12:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling
 ECC bit
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru, oxffffaa@gmail.com
References: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
 <20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
 <20230313121808.27170d1b@xps-13>
Organization: Linaro Developer Services
In-Reply-To: <20230313121808.27170d1b@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_042317_922261_52FA3833 
X-CRM114-Status: GOOD (  19.75  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTMvMDMvMjAyMyAxMjoxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBBcnNlbml5LAo+
IAo+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDEzIE1hciAyMDIzIDEw
OjM2OjExICswMzAwOgo+IAo+PiBIZWxsbywKPj4KPj4gd2UgcmVwcm9kdWNlZCB0aGlzIHByb2Js
ZW0gb24gb25lIG9mIG91ciBib2FyZHMuIEl0IHRyaWdnZXJzIHZlcnkgcmFyZQo+PiB3aGVuICd1
c2xlZXBfcmFuZ2UoKScgaXMgcHJlc2VudCwgYnV0IHdoZW4gc2xlZXBpbmcgaXMgcmVtb3ZlZCAt
IGl0IGZpcmVzCj4+IGFsd2F5cy4gSSBzdXBwb3NlIHByb2JsZW0gaXMgd2l0aCBjYWNoaW5nLCBh
cyAnaW5mb19idWYnIG1lbW9yeSBpcyBtYXBwZWQgYnkKPj4gJ2RtYV9tYXBfc2luZ2xlKCknLgo+
IAo+IFRoZSBmaXggbG9va3MgcmVhbGx5IGxlZ2l0aW1hdGUsIGluZGVlZCBJIGdldCB0aGF0IHRo
ZSB1c2xlZXBfcmFuZ2UoKQo+IG1pZ2h0IG1ha2UgaXQgd29yayBtb3N0IG9mIHRoZSB0aW1lIGJ1
dCBub3QgYWx3YXlzLiBIYXZpbmcgdGhpcyBiaXQgaW4KPiBhIERNQSBidWYgYXJlYSBpcyBhIGJp
dCBzdHJhbmdlLiBXZWxsLCB0aGUgZml4IExHVE0gYW55d2F5LgoKWWVwIGl0IGxvb2tzIGxlZ2l0
aW1hdGUhCgpMR1RNCgoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9u
Z0BsaW5hcm8ub3JnPgoKPiAKPj4KPj4gVGhhbmtzLCBBcnNlbml5Cj4+Cj4+IE9uIDEzLjAzLjIw
MjMgMTA6MzIsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+ICdpbmZvX2J1ZicgbWVtb3J5IGlz
IGNhY2hlZCBhbmQgZHJpdmVyIHBvbGxzIEVDQyBiaXQgaW4gaXQuIFRoaXMgYml0Cj4+PiBpcyBz
ZXQgYnkgdGhlIE5BTkQgY29udHJvbGxlci4gSWYgJ3VzbGVlcF9yYW5nZSgpJyByZXR1cm5zIGJl
Zm9yZSBkZXZpY2UKPj4+IHNldHMgdGhpcyBiaXQsICdpbmZvX2J1Zicgd2lsbCBiZSBjYWNoZWQg
YW5kIGRyaXZlciB3b24ndCBzZWUgdXBkYXRlIG9mCj4+PiB0aGlzIGJpdCBhbmQgd2lsbCBsb29w
IGZvcmV2ZXIuCj4+Pgo+Pj4gRml4ZXM6IDhmYWU4NTZjNTM1MCAoIm10ZDogcmF3bmFuZDogbWVz
b246IGFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIE5BTkQgZmxhc2ggY29udHJvbGxlciIpCj4+PiBT
aWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4K
Pj4+IC0tLQo+Pj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA4ICsrKysr
KystCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+PiBpbmRleCA1ZWUwMTIzMWFjNGMu
LjJjMDVjMDhhMGVhZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+PiBA
QCAtMTc2LDYgKzE3Niw3IEBAIHN0cnVjdCBtZXNvbl9uZmMgewo+Pj4gICAKPj4+ICAgCWRtYV9h
ZGRyX3QgZGFkZHI7Cj4+PiAgIAlkbWFfYWRkcl90IGlhZGRyOwo+Pj4gKwl1MzIgaW5mb19ieXRl
czsKPj4+ICAgCj4+PiAgIAl1bnNpZ25lZCBsb25nIGFzc2lnbmVkX2NzOwo+Pj4gICB9Owo+Pj4g
QEAgLTUwMyw2ICs1MDQsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY19kbWFfYnVmZmVyX3NldHVw
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHZvaWQgKmRhdGFidWYsCj4+PiAgIAkJCQkJIG5mYy0+
ZGFkZHIsIGRhdGFsZW4sIGRpcik7Cj4+PiAgIAkJCXJldHVybiByZXQ7Cj4+PiAgIAkJfQo+Pj4g
KwkJbmZjLT5pbmZvX2J5dGVzID0gaW5mb2xlbjsKPj4+ICAgCQljbWQgPSBHRU5DTURJQUREUkwo
TkZDX0NNRF9BSUwsIG5mYy0+aWFkZHIpOwo+Pj4gICAJCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jh
c2UgKyBORkNfUkVHX0NNRCk7Cj4+PiAgIAo+Pj4gQEAgLTUyMCw4ICs1MjIsMTAgQEAgc3RhdGlj
IHZvaWQgbWVzb25fbmZjX2RtYV9idWZmZXJfcmVsZWFzZShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5k
LAo+Pj4gICAJc3RydWN0IG1lc29uX25mYyAqbmZjID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRh
KG5hbmQpOwo+Pj4gICAKPj4+ICAgCWRtYV91bm1hcF9zaW5nbGUobmZjLT5kZXYsIG5mYy0+ZGFk
ZHIsIGRhdGFsZW4sIGRpcik7Cj4+PiAtCWlmIChpbmZvbGVuKQo+Pj4gKwlpZiAoaW5mb2xlbikg
ewo+Pj4gICAJCWRtYV91bm1hcF9zaW5nbGUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIGluZm9sZW4s
IGRpcik7Cj4+PiArCQluZmMtPmluZm9fYnl0ZXMgPSAwOwo+Pj4gKwl9Cj4+PiAgIH0KPj4+ICAg
Cj4+PiAgIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIHU4ICpidWYsIGludCBsZW4pCj4+PiBAQCAtNzEwLDYgKzcxNCw4IEBAIHN0YXRpYyB2b2lk
IG1lc29uX25mY19jaGVja19lY2NfcGFnZXNfdmFsaWQoc3RydWN0IG1lc29uX25mYyAqbmZjLAo+
Pj4gICAJCXVzbGVlcF9yYW5nZSgxMCwgMTUpOwo+Pj4gICAJCS8qIGluZm8gaXMgdXBkYXRlZCBi
eSBuZmMgZG1hIGVuZ2luZSovCj4+PiAgIAkJc21wX3JtYigpOwo+Pj4gKwkJZG1hX3N5bmNfc2lu
Z2xlX2Zvcl9jcHUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIG5mYy0+aW5mb19ieXRlcywKPj4+ICsJ
CQkJCURNQV9GUk9NX0RFVklDRSk7Cj4+PiAgIAkJcmV0ID0gKmluZm8gJiBFQ0NfQ09NUExFVEU7
Cj4+PiAgIAl9IHdoaWxlICghcmV0KTsKPj4+ICAgfQo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
