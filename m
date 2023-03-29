Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888DDC74A5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uocjy2ZFj0NTGBjGv3vEaV5gT2L3fu2ubkJjnitJSxQ=; b=3TCyTGS281iD1l
	N7ppXRrBQSTihOO5q/zAECHi5rGTzOyFdKHWp1B4FqiCkv7qVvPKo2inaPRZs7amMXCZFYFArC4qK
	ygMJW/YCGavLqs5hThoaAHBr5VQAWdUxfVrvNmATFVq2N6ytcG7G7S8GgVfVrq9p6v4hKerpqD5ul
	V+2mPYHhZg9s2C7NtDFR2eaIfQDpu8wltoSMvtXO5kx6BEwrvNc8nPABR0aixyUuKZmW8HTNSUiMy
	xabhNbKqKYnbroHWuyigAWxbhgC4+2ouS9oacXXIMreD22yfw3oJ/LOJcjEEVqGr1oKQ2ptFs7rUd
	rdPh0lMWTVEocOFbTjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phR2b-00H5BB-1U;
	Wed, 29 Mar 2023 08:20:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phR2X-00H58z-2g
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Mar 2023 08:20:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso10900268wms.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Mar 2023 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvevLPkyczLsyt+0gtz8D9GannpbiOBakYnWLTwfesc=;
        b=Bni9ZHRAc38ZPg+EmrwbsRDu9WtLWVZ2xqHWMDG7wtee4IwFeIpbFUlSx/cCkg6HUH
         Xf1CNVf74sNr4fDhQ7k++YeMOTIztlACIfisxb8UvX1U35KOaNtUl0xVoamcG7Gg91dR
         cbC5tGfcwtdXDj3WIR1otn5Azy6NGyKrMARRPzPyRrTdCWhIWx7HkqbZ1dvWfBqKZRt2
         GU7NenbRpRDmlKBiq/uCJIjfK88RaayGYkJA1oa5QRHjs2cYxeiWbUxfoWolanSqdDBw
         Xg7A5VxZ1OWfvC7cWc7bJEWEJahnBIB5mSBZ+M/mixM7ueGYmQa12geIPt0EYnfNuB48
         l1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvevLPkyczLsyt+0gtz8D9GannpbiOBakYnWLTwfesc=;
        b=Sau0cJX6Jsm846jhuBlTFCbEp82Ao+qf6K/x5y5YLKLGl/sBnYDgt8NFqGgV6kqQ2v
         UadW0E3I9YH5uRRGWG0hY4im8TKbqti5zhRwzaNYYwHXQNk/unMaRLMQMB0VhI3CxReo
         v5xXDee/Lvoz5mJQXZoavH9CmcILpTHWPZyAJ3knJbOxk4qfTvz9aV7RF9Tkc3g0rJSC
         0pCxp7zLJjFKyMx72/mGmCIK0otfUqaizyMHgitjvk+WOH6FOFpSqy1UQF21Tzmz9j2M
         1o24GOmxLGC7UciqeQwG/VHXLLgV/Q4BKLZdAqnlhbnoG03P7FW4G2Iq4WhSeu7pMRrd
         5oGA==
X-Gm-Message-State: AAQBX9feToJt7yA2bcNxZmXR9FOsuf5c3ihTWnSmD1OLeYCvi4fJ91vu
	BJbrSugKcjGWXJoj8+v3TVzYUQ==
X-Google-Smtp-Source: AKy350ZWoR/Y88UzmnTa/XtNhAyjFirNPw6uwmMQjtSuHbx5S4jniKWcHdT7mZv8stfMg9KPoqbQAQ==
X-Received: by 2002:a7b:cd8f:0:b0:3ef:6396:d9c8 with SMTP id y15-20020a7bcd8f000000b003ef6396d9c8mr10457044wmj.5.1680078016199;
        Wed, 29 Mar 2023 01:20:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm1415902wmb.28.2023.03.29.01.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:20:15 -0700 (PDT)
Message-ID: <9c7ef736-527b-1659-88d8-cedf56458c30@linaro.org>
Date: Wed, 29 Mar 2023 09:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru, oxffffaa@gmail.com
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
 <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13>
 <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
 <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
 <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
 <20230329093145.52790647@xps-13>
 <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_012017_866166_6FFDE824 
X-CRM114-Status: GOOD (  18.73  )
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

CgpPbiAzLzI5LzIzIDA5OjE3LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBPbiBXZWQsIE1hciAy
OSwgMjAyMyBhdCAwOTozMTo0NUFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIZWxs
bywKPj4KPj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjkgTWFyIDIw
MjMgMTA6MTI6MTAgKzAzMDA6Cj4+Cj4+PiBPbiAyOC4wMy4yMDIzIDIzOjI1LCBNYXJ0aW4gQmx1
bWVuc3RpbmdsIHdyb3RlOgo+Pj4+IEhpIEFyc2VuaXksCj4+Pj4KPj4+PiBPbiBUdWUsIE1hciAy
OCwgMjAyMyBhdCA4OjM54oCvUE0gQXJzZW5peSBLcmFzbm92Cj4+Pj4gPGF2a3Jhc25vdkBzYmVy
ZGV2aWNlcy5ydT4gd3JvdGU6Cj4+Pj4gWy4uLl0gIAo+Pj4+Pj4KPj4+Pj4+IEJ5IHRoZSB3YXkg
YW55IHJlYXNvbiBub3QgdG8gaGF2ZSBDYydlZCBzdGFibGU/ICAKPj4+Pj4KPj4+Pj4gU29ycnks
IHdoYXQgZG8gWW91IG1lYW4/IEkndmUgaW5jbHVkZWQgbGludXgtbXRkIG1haWxpbmcgbGlzdHMs
IHRoZXJlIGlzCj4+Pj4+IG9uZSBtb3JlIGxpc3QgZm9yIG10ZCByZXZpZXdzPyBJIHdpbGwgYXBw
cmVjaWF0ZSBpZiBZb3UgY2FuIHBvaW50IG1lICAKPj4+PiAic3RhYmxlIiB0eXBpY2FsbHkgcmVm
ZXJzIHRvIHRoZSBzdGFibGUgdHJlZSB3aGVyZSBmaXhlcyBmb3IgYWxyZWFkeQo+Pj4+IHJlbGVh
c2VkIGtlcm5lbCB2ZXJzaW9ucyBhcmUgbWFpbnRhaW5lZC4KPj4+PiBXaGVuIE1pcXVlbCBhcHBs
aWVzIHRoZSBwYXRjaCBpdCB3aWxsIGVpdGhlciBsYW5kIGluIHRoZSBuZXh0IC1yYyBvZgo+Pj4+
IHRoZSBjdXJyZW50IGRldmVsb3BtZW50IGN5Y2xlICh0eXBpY2FsbHkgYXBwbGllcyB0byBmaXhl
cyAtIGN1cnJlbnRseQo+Pj4+IDYuMy1yYzUpIG9yIC1yYzEgb2YgdGhlIG5leHQga2VybmVsIHZl
cnNpb24gKHR5cGljYWxseSBhcHBsaWVzIHRvIG5ldwo+Pj4+IGZlYXR1cmVzLCBjbGVhbnVwcywg
ZXRjLiAtIGN1cnJlbnRseSA2LjQtcmMxKS4KPj4+Pgo+Pj4+IExldCdzIHNheSB5b3UgYXJlIGZp
eGluZyBhIGJ1ZyBub3cgYnV0IHdhbnQgdGhlIGZpeCB0byBiZSBpbmNsdWRlZCBpbgo+Pj4+IDYu
MSBMVFMgKGxvbmcgdGVybSBzdGFibGUpIG9yIG90aGVyIHN0YWJsZSByZWxlYXNlLgo+Pj4+IElu
IHRoaXMgY2FzZSBpdCdzIHJlY29tbWVuZGVkIHRvIENjIHRoZSBtYWludGFpbmVycyBvZiB0aGUg
c3RhYmxlCj4+Pj4gdHJlZXMgYXMgcGFydCBvZiB5b3VyIHBhdGNoLCBzZWUgWzBdLgo+Pj4+IFRo
YXQgd2F5IG9uY2UgdGhlIGNvbW1pdCB3aXRoIHlvdXIgZml4IGhpdHMgTGludXMgVG9ydmFsZHMg
bGludXggdHJlZQo+Pj4+IGl0IHdpbGwgYmUgYmFja3BvcnRlZCBieSB0aGUgc3RhYmxlIHRlYW0g
d2l0aGluIGEgZmV3IGRheXMgKGFzc3VtaW5nCj4+Pj4gb2YgY291cnNlIHRoYXQgdGhlIHBhdGNo
IGFwcGxpZXMgY2xlYW5seSB0byBvbGRlciB2ZXJzaW9ucywgaWYgbm90Cj4+Pj4gdGhleSdyZSBu
b3RpZnlpbmcgeW91KS4KPj4+PiBOb3RlOiBldmVuIHdpdGhvdXQgQ2MnaW5nIHRoZSBzdGFibGUg
bWFpbnRhaW5lcnMgeW91ciBjb21taXQgbWF5IGJlCj4+Pj4gYmFja3BvcnRlZCAoc2VtaS1hdXRv
bWF0aWNhbGx5KSBpZiBpdCBoYXMgYSBGaXhlcyB0YWcgYW5kIHRoZSBzdGFibGUKPj4+PiBtYWlu
dGFpbmVycyBmaW5kIHlvdXIgY29tbWl0LiBCdXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0
J3MKPj4+PiBlYXNpZXN0IGZvciB0aGVtIGlmIHRoZXkncmUgZXhwbGljaXRseSBDYydlZCBvbiB0
aGUgcGF0Y2guCj4+Pj4KPj4+PiBJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYgbm90OiBkb24n
dCBoZXNpdGF0ZSB0byBhc2suICAKPj4KPj4gVGhhdCBpcyBhbiBleGNlbGxlbnQgc3VtbWFyeSwg
SSBzaG91bGQgY29weS9wYXN0ZSBpdCBzb21ldGltZXMgOikKPj4KPiAKPiBGaW5hbGx5IEkgZnVs
bHkgdW5kZXJzdGFuZCB3aHkgJ0ZpeGVzJyB0YWcgaXMgc28gaGVscGZ1bCEKPiBUaGFuayB5b3Ug
TWFydGluIQo+IAoKSGVyZSdzIHRoZSBvZmZpY2lhbCBkb2N1bWVudGF0aW9uOgpodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMu
aHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
