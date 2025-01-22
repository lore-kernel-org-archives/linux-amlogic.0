Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02724C02182
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2025 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlE3c1uEyzuDb2L/NSXH32rRFU3rMyJ5gw1yOyKPo2g=; b=tO65I7kac32f5j
	NuHLNyXBIFrIO6yNT8Q5Pr3LbvA8r4Jr9KhcTfeIz/xozZtStjmtdxs3rMocfNgRvIPNjYyxq8X59
	R9OjSH9jTwNCD5XxnJTZGJeqdhsWjcnyfrM+4WLm2QkuQWpy8YTOf8rCh8avZEbf5g6TIIO+Cs008
	u9ZUOmn0nIlzjnQA/vZ/lhMQi7WmLMo7T/I5xLpPgycig4508prM5VrmEMHdmBIaVXMZvL2xstdx2
	1bTCGdH7FZsm8sx57XHKJlNOxz+dqpcFzFpGMqNnRvwWw0aLjPru0Rm/ReeYjWadBm60/Y/9Sr7wJ
	V44ucl3Lfhwv+4EQD7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYD1-00000009z4R-1c8s;
	Wed, 22 Jan 2025 10:43:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taY8I-00000009y5u-1MrT
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Jan 2025 10:38:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361f796586so73454275e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Jan 2025 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737542328; x=1738147128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
        b=iBm3UadQkGDKB/6e8z9COJ9FTNh5dhh6sUkBlLYug5/aZHXtTBaNNbtB9sQX3LQ7KP
         7ne26xu4WUPOQArVLJZwqJBfLl3iFytWPg7THVl6biWAh6/inCF87oYZs20amG2swh4s
         n5RQdJUjGTUEagu/gI1O8dT6gEa9ZZva/0ZSiWYpiYZJmqbGCrsO1NV8vWQtEjlrFx9N
         uoWJ99Nhywu4NitwPL1UEJ+GPlK6/jarJjyoIKiZyPSohefdbmv1AcLyFOVDK9QZC4W4
         J+GVd9y+m0jLlCZCIeKtZnLoo33OIIdf0iW4HgbJ43zM6KDU0b1xVIgUmtug5d7SdX85
         v7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542328; x=1738147128;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
        b=fYvRzMLAu58LhXpupG/9J5Gm1RqIJmsTvV1DKKCOf5AsgE+QjPai/pihz8Xqo3q52v
         yb7PcSnoiJC7j38lun7A/oCTjMxyzPK4bLKyDPD+kctwj4uUXxsZb24576cjLH0yV8G8
         0GJLjq1ecvlDM4MtDph7I+8QrcsGYo5bHDHxzM6k0YYy56jIIsX/CW7q6xWmw/LKJlBn
         gi7aL4ESIkpbZiVm98T/MMvgI6xmysM66MzHPI4lRS/vrsA1fbnYPVH8LsghChsAmnuN
         c/hIJmdFeeyUotpFsWrTNNYdriI8yPEUQZ0AocUMitMZR0IVgVDBqcujnswW3edKLmNM
         RY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTXeEguaMCujGwhpSvAjBHWhEGoHodc6+Vl4SzT6+UnWJJ1iiyyChy3BIsLeQjWm7ipJsp9/rSWEDj9LXx@lists.infradead.org
X-Gm-Message-State: AOJu0YwhijyJsQZAuOWCX3qWs785K03Os9sdV7fCFreZ9BxOMiD5crOq
	Z4FSXkBwoUQmlweorsO+WDwvNhZsfL0f0mggaITWqmD3Rd88aX8OP4+7bjmTdp0=
X-Gm-Gg: ASbGncsHEQGhzHSsvzzTfgeY9Y4SW9odNqX5Cbq0CtPV7RVEOHStRA5sizGaAx4T+g+
	RXhcp9HT72Vm25d4MQgJJegmfiJgTt9Coix2IW9KRWtv2pbQe4by0vTdbNV+c1zF5Uk4M5YmuGa
	TjOUabmFr2A4aYMkdnIyLfqE3ngwO8TRgIOMvn3s0ra8CTyBpxHVc/BkEBw/hkaGtdHbp9l05VQ
	6t1WD2UEFx/y0v7wuLjlaAZ2I6XXflmAN2BiCgbuHVn4yGyWKEVAdfs0JJgOcJ+Pnpe/w==
X-Google-Smtp-Source: AGHT+IGHWICVymyczl4ii8tG0TEJPCRASpGt6Bh6um0Z96LWBrB4SGwG4XeA1Yko2Ghrm1yauaArzQ==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr197285195e9.8.1737542328421;
        Wed, 22 Jan 2025 02:38:48 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c6fe:2fe2:acd6:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31b1566sm19283775e9.24.2025.01.22.02.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:38:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ao Xu <ao.xu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com> (Ao Xu's
	message of "Wed, 22 Jan 2025 17:50:25 +0800")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
	<CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
	<1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
	<3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 11:38:47 +0100
Message-ID: <1jldv3i154.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_023850_368817_E43BD32B 
X-CRM114-Status: GOOD (  31.12  )
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

T24gV2VkIDIyIEphbiAyMDI1IGF0IDE3OjUwLCBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+IHdy
b3RlOgoKPiBPbiAyMDI1LzEvMTUgMTo1MCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4+Cj4+IE9uIFN1biAxMiBKYW4gMjAyNSBhdCAyMzo0NCwgTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4+
Cj4+PiBIZWxsbywKPj4+Cj4+PiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCA2OjM54oCvQU0gQW8g
WHUgdmlhIEI0IFJlbGF5Cj4+PiA8ZGV2bnVsbCthby54dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3Jn
PiB3cm90ZToKPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIERSTSBzdXBwb3J0IGZvciB0aGUg
QW1sb2dpYyBTNC1zZXJpZXMgU29Dcy4KPj4+PiBDb21wYXJlZCB0byB0aGUgQW1sb2dpYyBHMTIt
c2VyaWVzLCB0aGUgUzQtc2VyaWVzIGludHJvZHVjZXMgdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+
Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMuIFdpdGggdGhpcyBtYWlsIEknbGwgdHJ5IHRvIHN1
bW1hcml6ZSBteQo+Pj4gdW5kZXJzdGFuZGluZyBvZiB0aGUgc2l0dWF0aW9uIHdpdGggdGhlIGRy
bS9tZXNvbiBkcml2ZXIgYXMgSSdtIG5vdAo+Pj4gc3VyZSBob3cgZmFtaWxpYXIgeW91IGFyZSB3
aXRoIHByZXZpb3VzIGRpc2N1c3Npb25zLgo+Pj4KPj4+PiAxIFRoZSBTNC1zZXJpZXMgc3BsaXRz
IHRoZSBISVUgaW50byB0aHJlZSBzZXBhcmF0ZSBjb21wb25lbnRzOiBgc3lzX2N0cmxgLCBgcHdy
X2N0cmxgLCBhbmQgYGNsa19jdHJsYC4KPj4+PiAgICBBcyBhIHJlc3VsdCwgVkVOQyBhbmQgVkNM
SyBkcml2ZXJzIGFyZSB1cGRhdGVkIHdpdGggUzQtc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdz
IHRvIGFjY29tbW9kYXRlIHRoZXNlIGNoYW5nZXMuCj4+PiBKZXJvbWUgaGFzIGFscmVhZHkgY29t
bWVudGVkIG9uIHBhdGNoIDMvMTEgdGhhdCB0aGlzIG1peGVzIGluIHRvbyBtYW55Cj4+PiBJUCBi
bG9ja3MgaW50byBvbmUgZHJpdmVyLgo+Pj4gVGhpcyBpcyBub3QgYSBuZXcgc2l0dWF0aW9uLCB0
aGUgZXhpc3RpbmcgY29kZSBpcyBkb2luZyBleGFjdGx5IHRoZSBzYW1lLgo+Pj4KPj4+IEplcm9t
ZSBoYXMgcHJldmlvdXNseSBzZW50IGEgc2VyaWVzIHdoaWNoIHN0YXJ0ZWQgImFuIGVmZm9ydCB0
byByZW1vdmUKPj4+IHRoZSB1c2UgSEhJIHN5c2NvbiIgWzBdIGZyb20gdGhlIGRybS9tZXNvbiBo
ZG1pIGRyaXZlci4KPj4+IEluIHRoZSBzYW1lIG1haWwgaGUgZnVydGhlciBub3RlczogIlt0aGUg
cGF0Y2hzZXRdIHN0b3BzIHNob3J0IG9mCj4+PiBtYWtpbmcgYW55IGNvbnRyb3ZlcnNpYWwgRFQg
Y2hhbmdlcy4gVG8gZGVjb3VwbGUgdGhlIEhETUkKPj4+IHBoeSBkcml2ZXIgYW5kIG1haW4gRFJN
IGRyaXZlciwgYWxsb3dpbmcgdGhlIFBIWSB0byBnZXQgaG9sZCBvZiBpdHMKPj4+IHJlZ2lzdGVy
cywgSSBiZWxpZXZlIGEgRFQgQUJJIGJyZWFrIGlzIGluZXZpdGFibGUuIElkZWFsbHkgdGhlCj4+
PiByZWdpc3RlciByZWdpb24gb2YgdGhlIFBIWSB3aXRoaW4gdGhlIEhISSBzaG91bGQgcHJvdmlk
ZWQsIG5vdCB0aGUKPj4+IHdob2xlIEhISS4gVGhhdCdzIHBhaW4gZm9yIGFub3RoZXIgZGF5IC4u
LiIKPj4+Cj4+PiBGb3Igbm93IEknbSBhc3N1bWluZyB5b3UncmUgZmFtaWxpYXIgd2l0aCBkZXZp
Y2UtdHJlZSBBQkkuCj4+PiBJZiBub3QgdGhlbiBwbGVhc2UgbGV0IHVzIGtub3cgc28gd2UgY2Fu
IGVsYWJvcmF0ZSBmdXJ0aGVyIG9uIHRoaXMuCj4+Pgo+Pj4gTXkgb3duIG5vdGVzIGZvciBtZXNv
bl9kd19oZG1pLmMgYXJlOgo+Pj4gLSB3ZSBzaG91bGQgbm90IHByb2dyYW0gSEhJX0hETUlfQ0xL
X0NOVEwgZGlyZWN0bHkgYnV0IGdvIHRocm91Z2ggQ0NGCj4+PiAoY29tbW9uIGNsb2NrIGZyYW1l
d29yaykgaW5zdGVhZCAod2Ugc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUgZHJpdmVyCj4+PiBmb3Ig
dGhpcyBpbiBwbGFjZSkKPj4+IC0gd2Ugc2hvdWxkIG5vdCBwcm9ncmFtIEhISV9NRU1fUERfUkVH
MCBkaXJlY3RseSBidXQgZ28gdGhyb3VnaCB0aGUKPj4+IGdlbnBkL3BtZG9tYWluIGZyYW1ld29y
ayAod2Ugc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUgZHJpdmVyIGZvciB0aGlzCj4+PiBpbiBwbGFj
ZSkKPj4+IC0gZm9yIHRoZSBIRE1JIFBIWSByZWdpc3RlcnM6IG9uIE1lc29uOC84Yi84bTIgKHRo
b3NlIHdlcmUgMzItYml0IFNvQ3MKPj4+IGluIGNhc2UgeW91J3JlIG5vdCBmYW1pbGlhciB3aXRo
IHRoZW0sIHRoZXkgcHJlZGF0ZSBHWEJCL0dYTC8uLi4pIEkKPj4+IHdyb3RlIGEgUEhZIGRyaXZl
ciAod2hpY2ggaXMgYWxyZWFkeSB1cHN0cmVhbToKPj4+IGRyaXZlcnMvcGh5L2FtbG9naWMvcGh5
LW1lc29uOC1oZG1pLXR4LmMpIGFzIHRoYXQgbWFkZSBtb3N0IHNlbnNlIHRvCj4+PiBtZQo+Pj4K
Pj4+IFRoZW4gdGhlcmUncyBtZXNvbl92ZW5jLmMgd2hpY2ggaGFzIHR3byB3cml0ZXMgdG8gSEhJ
X0dDTEtfTVBFRzIuCj4+PiBJIHRoaW5rIHRob3NlIHNob3VsZCBnbyB0aHJvdWdoIENDRiBpbnN0
ZWFkIG9mIGRpcmVjdGx5IGFjY2Vzc2luZyB0aGlzIHJlZ2lzdGVyLgo+Pj4KPj4+IEFsc28gdGhl
cmUncyB0aGUgVkRBQyByZWdpc3RlcnMgaW4gbWVzb25fZW5jb2Rlcl9jdmJzLmM6Cj4+PiBJIHRo
aW5rIE5laWwgc3VnZ2VzdGVkIGF0IG9uZSBwb2ludCB0byBtYWtlIGl0IGEgUEhZIGRyaXZlci4g
SSBldmVuCj4+PiBzdGFydGVkIHdvcmtpbmcgb24gdGhpcyAoaWYgeW91J3JlIGN1cmlvdXM6IHNl
ZSBbMF0gYW5kIFsxXSkuCj4+PiBEVCBBQkkgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgaXMgYWxz
byBhIGNvbmNlcm4gaGVyZS4KPj4+Cj4+PiBBbmQgZmluYWxseSB0aGVyZSdzIHRoZSB2aWRlbyBj
bG9jayB0cmVlIHByb2dyYW1taW5nIGluIG1lc29uX3ZjbGsuYy4KPj4+IE15IHVuZGVyc3RhbmRp
bmcgaGVyZSBpcyB0aGF0IHZpZGVvIFBMTCBzZXR0aW5ncyBhcmUgdmVyeSBzZW5zaXRpdmUKPj4+
IGFuZCByZXF1aXJlIGZpbmUtdHVuaW5nIGFjY29yZGluZyB0byB0aGUgZGVzaXJlZCBvdXRwdXQg
Y2xvY2suCj4+PiBTaW5jZSBpdCdzIGEgYnVuY2ggb2YgY2xvY2tzIEknZCBzYXkgdGhhdCBkaXJl
Y3QgcHJvZ3JhbW1pbmcgb2YgdGhlCj4+PiBjbG9jayByZWdpc3RlcnMgc2hvdWxkIGJlIGF2b2lk
ZWQgYW5kIHdlIG5lZWQgdG8gZ28gdGhyb3VnaCBDQ0YgYXMKPj4+IHdlbGwuCj4+PiBCdXQgdG8g
bWUgdGhvc2UgcmVnaXN0ZXIgdmFsdWVzIGFyZSBhbGwgbWFnaWMgKGFzIEkgYW0gbm90IGF3YXJl
IG9mCj4+PiBhbnkgZG9jdW1lbnRhdGlvbiB0aGF0J3MgYXZhaWxhYmxlIHRvIG1lIHdoaWNoIGRl
c2NyaWJlcyBob3cgdG8KPj4+IGRldGVybWluZSB0aGUgY29ycmVjdCBQTEwgcmVnaXN0ZXIgdmFs
dWVzIC0gb3RoZXJzaWRlIHRoZSBzdGFuZGFyZAo+Pj4gZW4vbS9uL2ZyYWMvbG9jayBhbmQgcmVz
ZXQgYml0cykuCj4+Pgo+Pj4gSSdtIG5vdCBzYXlpbmcgdGhhdCBhbGwgb2YgbXkgdGhvdWdodHMg
YXJlIGNvcnJlY3QgYW5kIGltbWVkaWF0ZWx5Cj4+PiBuZWVkIHRvIGJlIHB1dCBpbnRvIGNvZGUu
Cj4+PiBUaGluayBvZiB0aGVtIG1vcmUgYXMgYW4gZXhwbGFuYXRpb24gdG8gSmVyb21lJ3MgcmVh
Y3Rpb24uCj4+Pgo+Pj4gSSB0aGluayB3aGF0IHdlIG5lZWQgbmV4dCBpcyBhIGRpc2N1c3Npb24g
b24gaG93IHRvIG1vdmUgZm9yd2FyZCB3aXRoCj4+PiBkZXZpY2UtdHJlZSBBQkkgZm9yIG5ldyBT
b0NzLgo+Pj4gTmVpbCwgSmVyb21lOiBJJ2QgbGlrZSB0byBoZWFyIHlvdXIgZmVlZGJhY2sgb24g
dGhpcy4KPj4gSSBjb21wbGV0ZWx5IGFncmVlIHdpdGggeW91ciBkZXNjcmlwdGlvbiBvZiB0aGUg
cHJvYmxlbSwgdGhhdCBhbmQKPj4gS3J6eXN6dG9mJ3MgcmVtYXJrIG9uIHBhdGNoIDYuIFRoaXMg
aXMgbm90IG5ldyB3aXRoIHRoaXMgc2VyaWVzIGluZGVlZCwKPj4gc28gaXQgZG9lcyBub3QgaW50
cm9kdWNlIG5ldyBwcm9ibGVtcyByZWFsbHkgYnV0IGl0IGNvbXBvdW5kcyB0aGUKPj4gZXhpc3Rp
bmcgb25lcy4KPj4KPj4gQWRkcmVzc2luZyB0aG9zZSBpc3N1ZXMsIGlmIHdlIHdhbnQgdG8sIHdp
bGwgZ2V0IG1vcmUgZGlmZmljdWx0IGFzIG1vcmUKPj4gc3VwcG9ydCBpcyBhZGRlZCBmb3Igc3Vy
ZS4KPgo+IEhp77yMamVyb21lCj4KPiDCoMKgwqAgV2hhdCBhcmUgdGhlIG5leHQgc3RlcHMgZm9y
ICJhbiBlZmZvcnQgdG8gcmVtb3ZlIHRoZSB1c2UgSEhJIHN5c2NvbiIKPiBwYXRjaCBzZXQsIGFu
ZCB3aGF0IGlzIHRoZSBzY2hlZHVsZT8KCkkgaGF2ZSBubyBpZGVhLiBZb3Ugc2hvdWxkIGNoZWNr
IHdpdGggTmVpbCB3aGV0aGVyIG9yIG5vdCBpdCBpcyBzb21ldGhpbmcgaGUKd2FudHMgdG8gZG8g
YW5kIGhvdy4KCklmIHlvdSAob3IgYW55b25lIGVsc2UpIHdhbnQgdG8gbWFrZSBhIHYyIG91dCBv
ZiB0aGUgZmlyc3QgY2xlYW4tdXAgSSd2ZQptYWRlIFsyXSwgeW91IGFyZSB3ZWxjb21lIHRvLiBJ
J20gaGFuZGxpbmcgb3RoZXIgdGhpbmdzIEFUTSBhbmQgSSBkb24ndApleHBlY3QgdG8gZ2V0IHRv
IGl0IGFueSB0aW1lIHNvb24uCgpbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFt
bG9naWMvMjAyNDA3MzAxMjUwMjMuNzEwMjM3LTEtamJydW5ldEBiYXlsaWJyZS5jb20vCgo+Cj4+
Pj4gMiBUaGUgUzQtc2VyaWVzIHNlY3VyZXMgYWNjZXNzIHRvIEhETUlUWCBEV0MgYW5kIFRPUCBy
ZWdpc3RlcnMsCj4+Pj4gICAgcmVxdWlyaW5nIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGRyaXZlciB0
byBoYW5kbGUgdGhpcyBuZXcgYWNjZXNzIG1ldGhvZC4KPj4gUmVnbWFwIGJ1c2VzIGFyZSBtYWRl
IGZvciB0aG9zZSBjYXNlcyB3aGVyZSB0aGUgcmVnaXN0ZXJzIGFyZSB0aGUgc2FtZSwKPj4gYnV0
IGFjY2Vzc2VkIGRpZmZlcmVudGx5LiBUaGVyZSBpcyBhbiBleGFtcGxlIGluIHRoZSBwYXRjaHNl
dCByZWZlcmVuY2VkIGJ5Cj4+IE1hcnRpbiwgdG8gaGFuZGxlIEdYTCBhbmQgRzEyIGRpZmYuCj4+
Cj4+PiBUaGlzIGluZm8gc2hvdWxkIGdvIGludG8gcGF0Y2ggMS8xMSB0byBleHBsYWluIHdoeSB0
aGUgZzEyYSBjb21wYXRpYmxlCj4+PiBzdHJpbmcgY2Fubm90IGJlIHVzZWQgYXMgZmFsbGJhY2su
Cj4+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IE1hcnRpbgo+Pj4KPj4+Cj4+PiBbMF0gaHR0
cHM6Ly9naXRodWIuY29tL3hkYXJrbGlnaHQvbGludXgvY29tbWl0LzM2ZTY5OGVkYzI1ZGM2OThh
MGQ1N2I3MjlhN2E0NTg3ZmFmYzA5ODcKPj4+IFsxXQo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3hk
YXJrbGlnaHQvbGludXgvY29tbWl0LzgyNGI3OTJmZGJkMmQzYzBiNzFiMjFlMTEwNWVjYTBhYWFk
OGRhYTYKPj4gLS0KPj4gSmVyb21lCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
