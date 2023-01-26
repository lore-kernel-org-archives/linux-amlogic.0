Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC4C54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S95B+rEWeovXexalywJ9HKFt/SwMbpw/H5bYyQe1bz0=; b=IonD6P0N0ma42x5Bc52zq7gbXS
	QS6SKGSRtGt79J0/CkqMw2zx5HH+ADGQx2SJ60OjxQiOg9f2CytX0GkUAHY3mC2djR87Y+QbGIZrA
	/tKTmoGJ4ZfAEDALMd1IzESUBJe8A+7RKtuTpmRS3xf7lGdoSwt/6UIugdIOyMS/kRVt1YLPKrcRO
	cQCHJEq4lm/0Cvi9JI/AKvAAG1NHGTLBCLjcWmdyq6mEWut9jMwMq/kjBhD5Xic81FIDksFYK1NNz
	SBQCBVLvtxoMggVXBsl73KBnHAJYESu2bzxi0JkqOyd5RHpnrFGfdfRm13kwIjnkSphYmrr7CCcFd
	DroCdbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy84-00ABWo-9k; Thu, 26 Jan 2023 09:01:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy1b-00A8eO-1W
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 08:54:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z5so1012958wrt.6
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 00:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/yomjLl0UqeDwQFZM4SnBExhoHB/3ysiOZb01/B7mAQ=;
        b=IKtouoBc4MjdbUJNK5+NfYtKz9rU+WSR/T37nlK9G05BVyrJc6mbcKmZD2DBTglgYY
         Eg5cNQumh+Le+b2pAG67B3I9eaXi2j6lJbA/JF9hVsdgnVcixSmne1jvPoehTFCMKwyl
         TcR532v1flutrycL+HyK/NtHSbdSC/19Ai/VX2+SbR4xtiJ0ltaxoEIWjmvjFnb5HdKz
         bEI6q9o2uFs2T+QiCxHNXRityxJoP/Imje4fS5d2YNSwwyjjMpQv8lJoeZYqYd7z4LGP
         zkWwYS/lxZgUeo85y6qSvkXC2fmqiPneZc97LMdjQeMCsrRBoWyICKO6pvlDH2/x5DVJ
         6WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yomjLl0UqeDwQFZM4SnBExhoHB/3ysiOZb01/B7mAQ=;
        b=fHIWkCYiKuAAL+mMhSPsJrWNeja43wuzfq8Vn5YdDweiyNiHk64v/yFr4Y8pebRhO/
         xz3yrCgy0BBFHtdA1KB2TmyVPuGOyZfqmXAEqxqKUNcAXs8kRdHgMf4/Rg0UoWkYzTn3
         RGXDocU5ME/h/RjxUcFliJwAamwS1+YJSq23FZ+giqIUmSE5mLGoQe5Wf/V8Wgw7cDLs
         IL3o65NjUfMkDpQ6ojiFnyPgsVw72TQElwvji+fgUe3zQtczmN//9aGg6Yk5O+6V7Xmf
         gAzPOKOiG/NxiXuziqi6on8dx4Aie/ZsKC5Uqm4WkOOrXQOvhM655Sw+J+NPUoNDWQyK
         /I0Q==
X-Gm-Message-State: AO0yUKUjEwQoEVlO2vKJg+4l9kHlsH14Zn5TW7ygH6iGPx/Z+V0zSoBd
	ZLd/d6SEflOu2fazCoBkGgL+Bg==
X-Google-Smtp-Source: AK7set8C0+kqD0yODwoj3uN1fi+XGdbuddXx3D4XKoMTWfc/S4zPBzTohrRgE47bYgdegBAPK4ySPQ==
X-Received: by 2002:a5d:66d0:0:b0:2bf:adfb:58cd with SMTP id k16-20020a5d66d0000000b002bfadfb58cdmr8856285wrw.30.1674723259185;
        Thu, 26 Jan 2023 00:54:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aa89:e801:e296:9b7c? ([2a01:e0a:982:cbb0:aa89:e801:e296:9b7c])
        by smtp.gmail.com with ESMTPSA id q12-20020a056000136c00b002882600e8a0sm705401wrz.12.2023.01.26.00.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:54:18 -0800 (PST)
Message-ID: <0f7c5e1c-cff4-9213-e47b-19b57264a933@linaro.org>
Date: Thu, 26 Jan 2023 09:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
 <6055791c-68d8-987b-0f2c-0526fde9686e@linaro.org>
 <4f9839a9-66e7-bdde-f33d-0798bf363b17@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <4f9839a9-66e7-bdde-f33d-0798bf363b17@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005427_120360_62B4C9B7 
X-CRM114-Status: GOOD (  23.23  )
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

T24gMjYvMDEvMjAyMyAwOTo0NCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDI2LjAxLjIw
MjMgMDg6NTcsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBIaSBIZWluZXIsCj4+Cj4+IE9uIDI1
LzAxLzIwMjMgMDg6MDAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4+IFNESU8gc3BlY2lmaWNh
dGlvbiBkZWZpbmVzIHRoYXQgdGhlIGludGVycnVwdCBpcyBsZXZlbC1zZW5zaXRpdmUuCj4+PiBG
aXggdGhlIGludGVycnVwdCB0cmlnZ2VyIHR5cGUgZm9yIGVtbWNfYSBhY2NvcmRpbmdseS4KPj4+
IFNlZSBjb21tZW50IGF0IGJlZ2lubmluZyBvZiB0aGUgZmlsZSB3cnQgd2hpY2ggaXMgdGhlIFNE
SU8gcG9ydC4KPj4+IG1tYzIgPSAmc2RfZW1tY19hOyAvKiBTRElPICovCj4+Pgo+Pj4gVGhlIHVz
YWdlIG9mIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMgbGVhZCB0byBsb3N0IGludGVycnVwdHMg
dW5kZXIgbG9hZCwKPj4+IHNlZSBbMF0uIFRoaXMgd2FzIGNvbmZpcm1lZCB0byBiZSBmaXhlZCBi
eSB1c2luZyBsZXZlbC10cmlnZ2VyZWQKPj4+IGludGVycnVwdHMuCj4+Pgo+Pj4gTm90ZToKPj4+
IFNESU8gaW50ZXJydXB0IHN1cHBvcnQgd2FzIGFkZGVkIGluIExpbnV4IGp1c3QgcmVjZW50bHks
IGhvd2V2ZXIgb3RoZXIKPj4+IHVzZXJzIG9mIHRoaXMgZHRzIG1heSBiZSBhZmZlY3RlZCB0b28u
Cj4+Cj4+IFN3aXRjaGluZyBmcm9tIGVkZ2UgdG8gbGV2ZWwgaGFzIGFscmVhZHkgZml4ZWQgcGVy
Zm9ybWFuY2UgaXNzdWVzIG9uIGV0aGVybmV0LAo+PiBzbyBJIHRoaW5rIHRoaXMgd291bGQgYmUg
dGhlIHJpZ2h0IGRpcmVjdGlvbiwgYnV0IHNpbmNlIHRoZSBTRElPLCBlTU1DIGFuZCBTRCBjb250
cm9sbGVycwo+PiBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lIElQLCB0aGV5IHNob3VsZCBoYXZlIHRo
ZSBzYW1lIGludGVycnVwdCBzZXR1cC4KPj4KPj4gSXQgbWFrZXMgbm8gc2Vuc2UgdG8gaGF2ZSBs
ZXZlbCBvbmx5IGZvciBTRElPLCBzbyBwZXJoYXBzIGl0IHdvdWxkIGJlIHJpZ2h0IHRvCj4+IHN3
aXRjaCBldmVyeSBjb250cm9sbGVycyB0byBMRVZFTCAoaW5jbHVkaW5nIEFYRykgYW5kIHRlc3Qg
dG8gc2VlIGlmIHRoZXJlJ3Mgbm8gcmVncmVzc2lvbnMuCj4+Cj4gQWZ0ZXIgdGhpbmtpbmcgYSBt
aW51dGUgYWJvdXQgaXQgSSB0aGluayB5b3UncmUgcmlnaHQuIEkgdGVzdGVkIG9uIG15IHN5c3Rl
bSBhbmQKPiBzZWUgbm8gZGlmZmVyZW5jZSBpbiBiZWhhdmlvciBubyBtYXR0ZXIgd2hldGhlciBl
bW1jIGludGVycnVwdCBpcyBsZXZlbCBvciBlZGdlLgo+IERvIHlvdSB3YW50IHRvIG1ha2UgZnVy
dGhlciB0ZXN0cyBvbiB5b3VyIHRlc3Qgc3lzdGVtcz8KPiBBbmQgSSdtIHdvbmRlcmluZyB3aGV0
aGVyIHRoZXJlJ3Mgc3Ryb25nZXIgZXZpZGVuY2UgdGhhbiBqdXN0IHRlc3Rpbmcgd2hpY2ggdHJp
Z2dlcgo+IHR5cGUgd29ya3MgYmV0dGVyLiBEb24ndCB0aGUgZGF0YXNoZWV0cyBnaXZlIGEgaGlu
dD8KCk5vcCB0aGUgZGF0YXNoZWV0IGRvZXNuJ3QgaGVscCBoZXJlIGF0IGFsbCwgSSBjYW4gdG90
YWxseSBhcHBseSBhIHBhdGNoIHlvdSBzZW5kIG9uCm15IGZvci1uZXh0IGJyYW5jaCBmb3IgdGVz
dGluZyBhbmQgc2VlIGlmIGl0IGJyZWFrcyBzb21ldGhpbmcgb24gdGhlIHZhcmlvdXMgQ0lzIHJ1
bm5pbmcKb24gbGludXgtbmV4dC4KCkknZCBzYXkgYWxsIGludGVycnVwdHMgYXJlIGxldmVsIG9u
IGFtbG9naWMgU29DcywgbWFpbmx5IGJlY2F1c2UgdGhlIGludGVycnVwdCBzaWduYWwKc3RheXMg
aGlnaCB1bnRpbCB3ZSBjbGVhciBhbGwgdGhlIHN0YXR1cyBiaXRzLCBidXQgdGhlIHdheSB3ZSBk
ZXNpZ24gdGhlIGludGVycnVwdApoYW5kbGVyIHdvcmtzIHdpdGggYm90aC4KCkluIGVkZ2UsIHlv
dSBnZXQgdGhlIGludGVycnVwdCBldmVudCBvbiBhIHRyYW5zaXRpb24gZnJvbSBsb3cgdG8gaGln
aCwgc28gaWYgeW91IG1pc3MKYW4gaW50ZXJydXB0IHN0YXR1cyB0aGF0IGFycml2ZXMgYmV0d2Vl
biB0aGUgdGltZSB5b3UgcmVhZCB0aGUgc3RhdHVzIGFuZCB5b3UgY2xlYXIgaXQsCnlvdSdsbCB0
b3RhbGx5IG1pc3MgaXQgYW5kIHByb2JhYmx5IGFsbCBmdXR1cmUgZXZlbnRzLgoKT24gbGV2ZWws
IHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB3aWxsIGZpcmUgdW50aWwgdGhlIHN0YXR1cyBiaXRzIGFy
ZSBub3QgY2xlYXJlZCwgc28geW91CmNhbid0IG1pc3MgYW4gaW50ZXJydXB0LgoKVGhlIHdheSBB
bWxvZ2ljIGRlc2lnbnMgdGhlaXIgaW50ZXJydXB0cyBtYXNrL2NsZWFyL3N0YXR1cyBtYXRjaGVz
IHRoZSBsZXZlbCBzZXR1cC4KClNvIHByb3ZpZGUgYSBwYXRjaCBjaGFuZ2luZyB0aGUgbW1jIGNv
bnRyb2xsZXIncyB0cmlnZ2VyIHR5cGUsIGFuZCBJJ2xsIHB1c2ggaXQgdG8KbGludXgtbmV4dCBm
b3IgdGVzdGluZy4KCk5laWwKCj4gCj4+IE5laWwKPj4KPj4+Cj4+PiBbMF0gaHR0cHM6Ly93d3cu
c3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbW1jL21zZzczOTkxLmh0bWwKPj4+Cj4+PiBGaXhlczog
MTQ5OTIxOGM4MGM5ICgiYXJtNjQ6IGR0czogbW92ZSBjb21tb24gRzEyQSAmIEcxMkIgbW9kZXMg
dG8gbWVzb24tZzEyLWNvbW1vbi5kdHNpIikKPj4+IFJlcG9ydGVkLWJ5OiBQZXRlciBTdXRpIDxw
ZXRlci5zdXRpQHN0cmVhbXVubGltaXRlZC5jb20+Cj4+PiBUZXN0ZWQtYnk6IFBldGVyIFN1dGkg
PHBldGVyLnN1dGlAc3RyZWFtdW5saW1pdGVkLmNvbT4KPj4+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPgo+Pj4gLS0tCj4+PiB2MjoKPj4+IC0gcmViYXNlIGNvbnNpZGVyaW5nIHJlY2VudCBu
b2RlIG5hbWUgY2hhbmdlIHNkIC0+IG1tYyBmb3Igc2RfZW1tY19hCj4+PiAtLS0KPj4+ICDCoCBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIHwgMiArLQo+
Pj4gIMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpwqDCoMKgwqDC
oMKgwqDCoCB8IDIgKy0KPj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPj4+IGluZGV4IDFhOTMxZDVjMi4uYzA5ZWI5ZjZmIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21t
b24uZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1j
b21tb24uZHRzaQo+Pj4gQEAgLTIzMjQsNyArMjMyNCw3IEBAIHVhcnRfQTogc2VyaWFsQDI0MDAw
IHsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc2RfZW1tY19hOiBtbWNAZmZlMDMwMDAgewo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1h
eGctbW1jIjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4ZmZl
MDMwMDAgMHgwIDB4ODAwPjsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAxODkgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE4OSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9TRF9FTU1D
X0E+LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNsa2MgQ0xL
SURfU0RfRU1NQ19BX0NMSzA+LAo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWd4LmR0c2kKPj4+IGluZGV4IGE3OWEzNWU4NC4uYWUxYTVhNTY4IDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kKPj4+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCj4+PiBAQCAtNjAzLDcgKzYwMyw3
IEBAIGFwYjogYXBiQGQwMDAwMDAwIHsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
ZF9lbW1jX2E6IG1tY0A3MDAwMCB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3gtbW1jIiwgImFtbG9naWMsbWVzb24t
Z3hiYi1tbWMiOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDB4MCAweDcwMDAwIDB4MCAweDgwMD47Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyMTYgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjE2
IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9Owo+Pj4gICAgCj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
