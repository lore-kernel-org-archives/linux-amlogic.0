Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2338FECAAD2
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 04:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT9+H+HvBNa2aJEJ2QupFPmqtJw4zl4BOYDAqg6r9ZU=; b=SIpZuhUIKuMdxFrQH4Bgh/Bp38
	wrnvz7CoTrkEOclbpX7LMhToXV3bqtippUPva8WQzSBqnYILKT8eWSEBi0vSe5RDOrvK8SOkpmg3D
	AIxECBco90TTIti08NH6v3gak8Q2mjroIZfpdVYXbOKoisJGVAl+ZwGpWIzdY5Qz6XRT5nPtkuQYD
	8EL78rK9l2UoYvxlQn/vLp8a2eYjJZOHevimqL87GizQsR167xDFgD2liEjgtPKsy3VqSqZRXs3Vi
	hEHdoe+2vUz0z+alK5jbHBvSdGzqP5PZ9iTHq2umzgT23//NWq4sAFuwJkYu5+hel+dAujLFdlQHj
	uF4XI+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRQdh-00CTxU-8o; Fri, 26 Aug 2022 04:08:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRQdS-00CSYE-Hy; Fri, 26 Aug 2022 04:08:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id w22so455723ljg.7;
        Thu, 25 Aug 2022 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=lG3KBGxgM0IZ0jal5mxcI9GiPn0tOppPs9EWUxXKMzc=;
        b=EUXkPEtjiOsAOCIESOEqHeNyhWwNegFwwh3Lj8+SDfQogvhW95SYMog+dzO7ZbJlkl
         cnmlffs10Jy62yQ3vsjLGkVxplEH9hCSxi9kEtmnyx+CJSFO4+MKYKXjFvCNrS0EaYrl
         bmagE/DzPD/eD08koEKLBZ66Q/TTC19wW9aW9k6RCKYWgaaBKcmTirXuLrNH60BuPpYk
         wimXNdhDydQARpFtKvG1++3xm4MOOSAyltOgd8bEQywrwEP+7vl6FslX5gvxg8WQZspJ
         ehCG3TToh9lrHtn7KzIr5mPP4gDdPhyUpoUn9ISNB9VaGwkQmf/Lbuj0jOVZAUv0M2SM
         9UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=lG3KBGxgM0IZ0jal5mxcI9GiPn0tOppPs9EWUxXKMzc=;
        b=HZnWEYvHj/paekwMyY28eBfouon2Nbx/E3CRq4fZ3cuBO2SrLykZWo257Qb27Ft+jz
         znJyyAmz0KB4yqiWXJouEkWb/zzqvv4RjpanykIj+inqJwUdXMzbVYm5Hhf18IfTXQKk
         ZQwciIF/ZCzNytSm5vZWnJThpByFPbyfnkfpIVSvfZjTbigua1+8IeW6BGb+W1zsPkKf
         ix6HdCEE1XD/EMcBXLbmKrcOge3uxyzClhhfHb3k1SCRXV2wGmpKDgc8mLcYhlX2DeXw
         cLwv80s9FLsDJK1PHMYHoMSyEYGiP66hWkzzpqCaoTXsvJ7iWDWujoRo7xzViIonHgMT
         kXSg==
X-Gm-Message-State: ACgBeo2FDHtFfgIo2tGCfJZFY2aGhSKJhkdQt1wJtrgJ5XDOn0kwEf11
	zY6gXPq2m+4cLXySPYIpXYo=
X-Google-Smtp-Source: AA6agR6KtaCESfzpTHDLkoCDLh4paQXM/kfy5jk3CTr71K94Vrr2wmpHWobsZfb+FPRxr4a/5jN0Jw==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr1851650ljp.500.1661486870019;
        Thu, 25 Aug 2022 21:07:50 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:7563:5c5e:5903:bdb? ([2a02:a31a:a240:1700:7563:5c5e:5903:bdb])
        by smtp.googlemail.com with ESMTPSA id k8-20020a2ea268000000b0025e304903f5sm264075ljm.6.2022.08.25.21.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 21:07:49 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
Date: Fri, 26 Aug 2022 06:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
In-Reply-To: <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_210758_619558_D1AEA72D 
X-CRM114-Status: GOOD (  29.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLCBOb3JhbGYgYW5kIGV2ZXJ5b25lLAoKSnVzdCBhcyBhIHF1aWNrIHVwZGF0ZS4g
SSBpc29sYXRlZCB0aGUgaXNzdWUgdG8gdGhlIHBvd2VyIG1hbmFnZW1lbnQgc3Vic3lzdGVtLgpV
bmZvcnR1bmF0ZWx5IEkga25vdyB2ZXJ5IGxpdHRsZSBhYm91dCB0aGUgcG93ZXIgbWFuYWdlbWVu
dCBzdWJzeXN0ZW0gc28KSSBkb24ndCB0aGluayBJIGNhbiBoZWxwLgoKVGhlcmUgYXJlIHR3byBh
bHRlcm5hdGl2ZSBkaXJ0eSBhZC1ob2MgaGFja3MgdGhhdCBnZXQgdGhpbmdzIHdvcmtpbmcuCgot
IENvbW1lbnRpbmcgb3V0IHRoZSBwbV9ydW50aW1lX3B1dCgpIC8gcG1fcnVudGltZV9nZXRfc3lu
YygpIGNhbGxzIGluIHZjNF92ZWMuYwotIFJldmVydGluZyB0aGlzIFBSIGJ5IERvbSBDb2JsZXkg
YS5rLmEuIHBvcGNvcm5taXg6CiDCoCBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGlu
dXgvcHVsbC80NjM5CgpFaXRoZXIgb2YgdGhlc2UgYXBwcm9hY2hlcyBtYWtlcyBWRUMgbW9kZSBz
d2l0Y2hpbmcgd29yayBhZ2Fpbi4gT2J2aW91c2x5Cm5laXRoZXIgaXMgYXBwcm9wcmlhdGUgZm9y
IGEgcGVybWFuZW50IHNvbHV0aW9uLgoKSSB0cmllZCBzb21lIHJhbmRvbSBjb2RlIHBlcm11dGF0
aW9ucyB0aGF0IGNhbWUgdG8gbXkgbWluZCwgbGlrZSB1c2luZyB0aGUKdmM0X2VuY29kZXIgY2Fs
bGJhY2tzIChlLmcuIHBvc3RfY3J0Y19wb3dlcmRvd24pIGluc3RlYWQgb2YgdGhlIHN0YW5kYXJk
CmVuYWJsZS9kaXNhYmxlIGVuY29kZXIgY2FsbGJhY2tzLCBidXQgdG8gbm8gYXZhaWwuCgpTaW5j
ZSB0aGUgY2xvY2tzIGFuZCBwb3dlciBtYW5hZ2VtZW50IHNlZW0gdG8gYmUgZGVsZWdhdGVkIHRv
IHRoZSBmaXJtd2FyZSBub3csCm15IGd1ZXNzIGlzIHRoYXQgdGhpcyBtaWdodCBiZSBhIGZpcm13
YXJlIGlzc3VlLCBidXQgSSBjYW4ndCByZWFsbHkgY2hlY2sgYWxsCnRoZSBmaXJtd2FyZSB2ZXJz
aW9ucy4gSXQgY2VydGFpbmx5IGNyYXNoZXMgb24gdGhlIHZlcnNpb24gY3VycmVudGx5IGF2YWls
YWJsZQppbiBSYXNwYmVycnkgUGkgT1MgcmVwb3MsIGFuZCBvbiB0aGlzIG9uZToKaHR0cHM6Ly9n
aXRodWIuY29tL3Jhc3BiZXJyeXBpL3JwaS1maXJtd2FyZS9jb21taXQvNGRkZTc1MS4gTXkgUGk0
IGRvZXNuJ3QgYm9vdAp1c2luZyBhbnkgbmV3ZXIgZmlybXdhcmUsIGF0IGxlYXN0IG5vdCBmcm9t
IFVTQiAtIEkgbWlnaHQgdHJ5IHNvbWUgU0QgY2FyZAphZnRlciB0aGUgd2Vla2VuZC4KCkJlc3Qg
cmVnYXJkcywKTWF0ZXVzeiBLd2lhdGtvd3NraQoKVyBkbml1IDI1LjA4LjIwMjIgb8KgMTg6MTcs
IE1hdGV1c3ogS3dpYXRrb3dza2kgcGlzemU6Cj4gSGkgTWF4aW1lLAo+Cj4gVyBkbml1IDI1LjA4
LjIwMjIgbyAxNzo1NSwgTWF4aW1lIFJpcGFyZCBwaXN6ZToKPj4gSGkgTWF0ZXVzeiwKPj4KPj4g
T24gTW9uLCBBdWcgMjIsIDIwMjIgYXQgMTA6NTc6MjZBTSArMDIwMCwgTWF0ZXVzeiBLd2lhdGtv
d3NraSB3cm90ZToKPj4+IEhpIE1heGltZSwKPj4+Cj4+PiBJIHRyaWVkIHRlc3RpbmcgYW5kIHJl
dmlld2luZyB5b3VyIGNoYW5nZXMgcHJvcGVybHkgb3ZlciB0aGUgbGFzdCB3ZWVrZW5kLCBidXQK
Pj4+IHVsdGltYXRlbHkgcmFuIGludG8gdGhpcyAoImZsaXBfZG9uZSB0aW1lZCBvdXQiIGV0Yy4p
IGlzc3VlIGFuZCB3YXMgdW5hYmxlIHRvCj4+PiBtaXRpZ2F0ZSBpdCwgYXQgbGVhc3Qgc28gZmFy
LiBUaGlzIHNlZW1zIHRvIHBvcCB1cCBldmVyeSB0aW1lIEkgdHJ5IHRvIGNoYW5nZQo+Pj4gbW9k
ZXMgaW4gYW55IHdheSAoZWl0aGVyIGNoYW5nZSB0aGUgVFYgbm9ybSwgb3IganVzdCB0cnkgZG9p
bmcKPj4+ICJ4cmFuZHIgLS1vdXRwdXQgQ29tcG9zaXRlLTEgLS1vZmYiIGZvbGxvd2VkIGJ5IGJy
aW5naW5nIGl0IGJhY2sgb247IGl0IGFsc28KPj4+IG1lYW5zIHRoYXQgdGhlIFBpIGdvZXMgdW51
c2FibGUgd2hlbiB0aGUgREUncyBzY3JlZW4gc2F2aW5nIHJvdXRpbmUga2lja3MgaW4pLgo+Pj4K
Pj4+IEknbSB1c2luZyBhIFBpIDQsIGFuZCBpdCB3b3JrcyB3aXRoIHRoZSBycGktNS4xMy55IGJy
YW5jaAo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4LCBidXQgc2VlbWlu
Z2x5IG5vdGhpbmcgbmV3ZXIuCj4+PiBJIHNwZWNpZmljYWxseSB0cmllZCBycGktNS4xNC55LCBy
cGktNS4xNS55IGFuZCBycGktNS4xOS55IC0gcnBpLTUuMTUueSwKPj4+IHdoaWNoIGlzIHRoZSBj
dXJyZW50IG1haW4gYnJhbmNoIGluIFJhc3BiZXJyeSBQaSBPUywgc2VlbXMgdG8gYmUgYnJva2Vu
IHNpbmNlCj4+PiBmb3JldmVyOyBhdCBsZWFzdCBzaW5jZSBteSBwYXRjaGVzIChvcmlnaW5hbGx5
IHdyaXR0ZW4gZm9yIDUuMTApIGxhbmRlZCB0aGVyZS4KPj4+Cj4+PiBJJ2xsIHRyeSBpZGVudGlm
eWluZyB0aGUgaXNzdWUgZnVydGhlciwgcG9zc2libHkgbGF0ZXIgdG9kYXksIGFuZCBtYXliZSBj
aGVjawo+Pj4gdGhlIHJwaS02LjAueSBicmFuY2ggYXMgd2VsbC4KPj4gSSd2ZSB0cmllZCBpdCB0
aGlzLCBhbmQgSSBjYW4ndCByZXByb2R1Y2UgaXQgaGVyZS4gQnV0IEknbSBjdXJpb3VzLCBob3cK
Pj4gZGlkIHlvdSBhcHBseSB0aGlzIHNlcmllcz8gcnBpLTUuMTMueSBpcyBwcm9iYWJseSBmdWxs
IG9mIGNvbmZsaWN0cwo+PiBldmVyeXdoZXJlPwo+IEkgYXBwbGllZCB5b3VyIHBhdGNoZXMgb250
byBycGktNS4xNS55LiBUaGVyZSB3ZXJlIGNvbmZsaWN0cywgYnV0IHRoZXkgc2VlbWVkCj4gcmVs
YXRpdmVseSBtaW5vci4gSSdtIG5vdCBzdXJlIGlmIEkgZGlkIGEgZ29vZCBqb2IgYXQgcmVzb2x2
aW5nIHRoZW0gLSBJIHJhbgo+IGludG8gdmFyaW91cyBwcm9ibGVtcyB0cnlpbmcgdG8gdGVzdCB5
b3VyIGNoYW5nZXMsIGJ1dCBJIGNob3NlIG5vdCB0byBjcml0aWNpemUKPiB5b3UgYmVmb3JlIG1h
a2luZyBzdXJlIHRoYXQgaXQncyByZWFsbHkgZHVlIHRvIHlvdXIgY2hhbmdlcywgb3Igd2l0aG91
dCBzb21lCj4gcmVtYXJrcyBtb3JlIGNvbnN0cnVjdGl2ZSB0aGFuICJkb2Vzbid0IHdvcmsiIDst
KQo+Cj4gSSBjYW4gcHVzaCBteSByZWJhc2Ugb250byBzb21lIEdpdGh1YiBmb3JrIGlmIHlvdSdy
ZSBpbnRlcmVzdGVkLgo+Cj4gSSB3YXMgYWJsZSB0byB3b3JrIGFyb3VuZCBzb21lIG9mIHRob3Nl
IHByb2JsZW1zLCBhbmQgYWxzbyBzYXcgdGhhdCBzb21lCj4gb2YgdGhlbSB3ZXJlIGFscmVhZHkg
bWVudGlvbmVkIGJ5IG90aGVyIHJldmlld2VycyAoc3VjaCBhcyB0aGUgZ2VuZXJpYyBtb2Rlcwo+
IG5vdCBtYXRjaGluZyBkdWUgdG8gdGhlIGFzcGVjdCByYXRpbyBzZXR0aW5nKS4KPgo+IFVsdGlt
YXRlbHkgSSBnb3Qgc3R1Y2sgb24gdGhpcyBidWcsIHNvIEkgcHV0IHRlc3RpbmcgdGhpcyBzZXJp
ZXMgb24gaG9sZAo+IGluIGZhdm9yIG9mIGRlYnVnZ2luZyB0aGUgYmlnZ2VyIGlzc3VlLiBTbyBm
YXIgdW5mb3J0dW5hdGVseSBubyBsdWNrIHdpdGggaXQuCj4KPiBJIGRpZCBub3QgdHJ5IHJlYmFz
aW5nIHlvdXIgY2hhbmdlcyBvbnRvIDUuMTMgb3Igb2xkZXIuCj4KPj4gTWF4aW1lCj4gQmVzdCBy
ZWdhcmRzLAo+IE1hdGV1c3ogS3dpYXRrb3dza2kKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
