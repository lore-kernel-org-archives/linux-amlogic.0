Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BA2C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 15:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF06217F4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 15:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S7fks7GR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IP8CqWll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF06217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Y5Vi9dYouC75duivLHEJJ4SPRyhztcZi5jn4b2lrdU=; b=S7fks7GRMV3EE7
	8NYF1Sthrii8rQRyjuMuUpOg7Q9EFLIxK6G5eql62UB/VSsqKdcCoNAY8REKcva2c8V+H++0ggoM0
	JgNatAyqIasal/vgyy/dtL5voYidoZg3rkxnO5cyUMlsGJmTq0BJa5eXfp0IZMa9au1ir3Oxwayow
	K6JNpR270WNKW4lB63D9YFVk9EfRZis5daxAneymY9YNcV6Ug3whdRxt7qXzcD3GmF2/tfXQaKv04
	EfAT0mjKm4w7mPFG/7nqZwWk5ouCWr8IXDjn9IN+3DLZXokjmua54hR1n6WWs0xfw9odNeAOP9E7O
	7A5+ygPLzBINXseIWQ4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nPy-0003H6-Ix; Mon, 02 Mar 2020 15:55:42 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nPw-0003Gj-HI
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 15:55:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id m3so11152394wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJNCFnFx75P4PmGSwBJn8FFP/mBUf8whYY9xEyY9kl4=;
 b=IP8CqWll/Znb5Z4OyMw1XQLoWy9UTYCxFID1QGp417UWkkYSjz8F0WB409mkwq7XH9
 PkQ6l2vDZMHOkjGyoMdy+LAVp+dZyXYSu5eq+0nlAxiqWXl/geWsVB+O+7xzhv88n74M
 jE2jExW548WZ1fMRJfWwVBBY0OooEvuAixNGLv2ALvid2XxiuSJ4idZw5GRXqy1vsnUQ
 cscvJyzse8PMRTJoCklIFD4pAOrxF2Etq5k+wZfDBimEfO3hdeysDIDnoiMXKscXqiNp
 Z3VGWg0luw5/Fd+mNnGjhXXdv4des+Simsby4oPcnzQp3aa/3f2PAghfnd2TKtXBKjuI
 U1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oJNCFnFx75P4PmGSwBJn8FFP/mBUf8whYY9xEyY9kl4=;
 b=jj70jBEcCBY+IJ1NZ2sVzTqOVW2I6o+HjM/7rR0U+wnjyXdWUUzo9ghhPcuV1IzDx+
 lB7ofxNN9bwsiD0m/DU1mArpdyLytq21JFcimInRLZBETgdY6VMXPthCHPFRGsQOhBXv
 caMUWKTpf1w+q2V4ssqAurm27RWPJsv5Or8PqbAbwfPz3pbG1EAxp8B+nbSBBES+GoYZ
 q7/VYE/kRGKVPJovjYOODEkkcxTX8G9SfQRtug4Za8EX3/gqsY8+RPxfwr/8MIKH7IFl
 H7Ueor2a4JZdd+9rX8q5ypiK5VPowpuxkPj2ysOUkReaIyy4seyWafYTG4DSdFzYOqAM
 vlBw==
X-Gm-Message-State: ANhLgQ2Z8ICNXxslfrA/G97TL3hrb1ievgU4KYw/qIzHICg+WHwcu3Jr
 +xL4LOErwhWb5zG9Kr6qVvxOzA==
X-Google-Smtp-Source: ADFU+vtfL1A+tLoqufxEudSmCG7N8M+9lw4QmtwvS2TSlV0UP83Rz3UrCVjL2ufzUIU5hEpeAJkSWA==
X-Received: by 2002:a7b:ca58:: with SMTP id m24mr86848wml.129.1583164538850;
 Mon, 02 Mar 2020 07:55:38 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n3sm1106457wrv.91.2020.03.02.07.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 07:55:38 -0800 (PST)
Subject: Re: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector
 property
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-3-narmstrong@baylibre.com>
 <11463907.O9o76ZdvQC@jernej-laptop>
 <09d315b8-22f3-a25a-1aea-9c5d50c634d6@baylibre.com>
 <20200302091818.GC11960@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <6eede520-cbd8-51e5-6b56-afd727d50ab0@baylibre.com>
Date: Mon, 2 Mar 2020 16:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302091818.GC11960@pendragon.ideasonboard.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_075540_575984_D2BC5FA6 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, boris.brezillon@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDIvMDMvMjAyMCAxMDoxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBOZWlsIGFu
ZCBKb25hcywKPiAKPiAoQ0MnaW5nIERhbmllbCBmb3IgYSBmcmFtZXdvcmsgcXVlc3Rpb24pCj4g
Cj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQg
MDk6NTA6MThBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IE9uIDE3LzAyLzIwMjAg
MDc6MzgsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPj4+IERuZSDEjWV0cnRlaywgMDYuIGZlYnJ1
YXIgMjAyMCBvYiAyMDoxODoyNSBDRVQgamUgTmVpbCBBcm1zdHJvbmcgbmFwaXNhbChhKToKPj4+
PiBGcm9tOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4+Pj4KPj4+PiBBZGQgdGhl
IG1heF9icGMgcHJvcGVydHkgdG8gdGhlIGR3LWhkbWkgY29ubmVjdG9yIHRvIHByZXBhcmUgc3Vw
cG9ydAo+Pj4+IGZvciAxMCwgMTIgJiAxNmJpdCBvdXRwdXQgc3VwcG9ydC4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNCArKysr
Cj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+Pj4+IGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgaW5kZXgKPj4+PiA5ZTA5Mjdk
MjJkYjYuLjA1MTAwMWY3N2RkNCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4+Pj4gQEAgLTI0MDYsNiArMjQwNiwxMCBAQCBzdGF0aWMgaW50
IGR3X2hkbWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZQo+Pj4+ICpicmlkZ2UpIERS
TV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKPj4+PiAgCQkJCSAgICBoZG1pLT5kZGMpOwo+Pj4+Cj4+
Pj4gKwlkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoY29ubmVjdG9yKTsKPj4+Cj4+
PiBXaHkgaXMgdGhpcyByZXNldCBuZWVkZWQ/Cj4+Cj4+IEkgYXNzdW1lIGl0J3MgdG8gYWxsb2Nh
dGUgYSBuZXcgY29ubmVjdG9yIHN0YXRlIHRvIGF0dGFjaCBhIHRoZSBicGMgcHJvcGVyeS4KPj4K
Pj4gQnV0IGluZGVlZCwgdGhpcyBoZWxwZXIgaXMgbmV2ZXIgdXNlZCBoZXJlLCBidXQgb25seSBh
cyBjYWxsYmFjayB0byB0aGUgZHJtX2Nvbm5lY3Rvcl9mdW5jcy0+cmVzZXQuCj4+Cj4+IEJ1dCwg
YW1kZ3B1IGNhbGxzIDoKPj4gCS8qCj4+IAkgKiBTb21lIG9mIHRoZSBwcm9wZXJ0aWVzIGJlbG93
IHJlcXVpcmUgYWNjZXNzIHRvIHN0YXRlLCBsaWtlIGJwYy4KPj4gCSAqIEFsbG9jYXRlIHNvbWUg
ZGVmYXVsdCBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZSB3aXRoIG91ciByZXNldCBoZWxwZXIuCj4+
IAkgKi8KPj4gCWlmIChhY29ubmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNldCkKPj4gCQlhY29ubmVj
dG9yLT5iYXNlLmZ1bmNzLT5yZXNldCgmYWNvbm5lY3Rvci0+YmFzZSk7Cj4+Cj4+IHdoaWNoIGlz
IHRoZSBzYW1lLgo+IAo+IEEgY29tbWVudCB3b3VsZCBiZSB1c2VmdWw6Cj4gCj4gCS8qCj4gCSAq
IGRybV9jb25uZWN0b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoKSByZXF1aXJlcyB0aGUKPiAJ
ICogY29ubmVjdG9yIHRvIGhhdmUgYSBzdGF0ZS4KPiAJICovCj4gCWRybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9yZXNldChjb25uZWN0b3IpOwo+IAo+IAlkcm1fY29ubmVjdG9yX2F0dGFjaF9t
YXhfYnBjX3Byb3BlcnR5KGNvbm5lY3RvciwgOCwgMTYpOwo+IAoKRG9uZQoKPiBJIGRvbid0IGxp
a2UgdGhpcyBtdWNoIHRob3VnaCwgaXQgZmVlbHMgbGlrZSB0aGUgaW5pdGlhbCByZXNldCBwZXJm
b3JtZWQKPiBieSBkcm1fbW9kZV9jb25maWdfcmVzZXQoKSBzaG91bGQgc2V0IGRlZmF1bHQgdmFs
dWVzIGZvciBhbGwgc3RhdGUKPiBtZW1iZXJzIHRoYXQgYXJlIHJlbGF0ZWQgdG8gcHJvcGVydGll
cy4gRGFuaWVsLCB3aGF0J3MgdGhlIHJhdGlvbmFsZQo+IGJlaGluZCB0aGUgY3VycmVudCBpbXBs
ZW1lbnRhdGlvbiA/Cj4gCj4gVGhpcyBpcyBhIERSTSBjb3JlIGlzc3VlIHRoYXQgc2hvdWxkbid0
IGJsb2NrIHRoaXMgcGF0Y2ggdGhvdWdoLCBzbwoKSSdsbCBpbnZlc3RpZ2F0ZSB3aHksIGJ1dCBJ
IGhhdmVuJ3QgZm91bmQgb3V0IGhvdyB0aGUgaW50ZWwgZHJpdmVyIGdvdCB0aGUKY29ubmVjdG9y
IHN0YXRlIGluaXRpYWxpemVkIHNpbmNlIHRoZXkgZG9uJ3QgdXNlIHRoZSBhdG9taWMgaGVscGVy
cy4uLi4KCj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAKPj4+PiArCj4+Pj4gKwlkcm1fY29ubmVjdG9yX2F0dGFj
aF9tYXhfYnBjX3Byb3BlcnR5KGNvbm5lY3RvciwgOCwgMTYpOwo+Pj4+ICsKPj4+PiAgCWlmICho
ZG1pLT52ZXJzaW9uID49IDB4MjAwYSAmJiBoZG1pLT5wbGF0X2RhdGEtPnVzZV9kcm1faW5mb2Zy
YW1lKQo+Pj4+ICAJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZjb25uZWN0b3ItPmJhc2Us
Cj4+Pj4gIAkJCWNvbm5lY3Rvci0+ZGV2LQo+Pj4+IG1vZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0
YWRhdGFfcHJvcGVydHksIDApOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
