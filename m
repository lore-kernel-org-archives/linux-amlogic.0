Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BAEE77188
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jan 2025 22:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ymhz6ijx5mL/ttwhi04v07Rfdh18BDUj8oTY+9tXQNs=; b=fCFmVoQf1fdN6c
	P3qSRQeUo0RXrnDEoidIvxTiOlVILKVu2Cy5ecPmefJeJ2DpjT6bFwE+jsmWhLk6JBKjQ5v2Fj6Jw
	Wp8EG6+6VkQqVReaD625nPuCzroAjfVhHllmZpNv5QW3SMeH8Kee/S3KvL7anWCtE/snp7L8OAdDd
	GY5YOSU3KS/D23NYl/p1YumZoScOw+yLVmPMGeltX80JIhv75lRtpkfFCiJq8aFLm4QE8e9T6NA2t
	8/ScV3SiSjUGGDntj7Ktfcgvogl2go/+Wgp4sjH52N99ipfTN8UjDjLe8r5/ricp9ciFzPyCOVjIF
	u6drfHqGPV+bpUp2d2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6i0-00000003Yy9-0R9T;
	Sun, 12 Jan 2025 22:45:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6hc-00000003Yua-2fjG;
	Sun, 12 Jan 2025 22:45:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21669fd5c7cso63884815ad.3;
        Sun, 12 Jan 2025 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736721903; x=1737326703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
        b=A1UrZTBQwgCo/+3rmx/hB6Qm2/ZeVbSMfv7H8AymP2m3LYrNGTUCTPyuPUn/xVtMV/
         xcg6ndvbqJa2JcGsTFEan0gVBMrXIYDIlM0psG+Ws18X3f+gNQyOnPC+QgpNfdkTQKZl
         uozNk9so0AKoUulODuz/vsEZDs96MjFqzdwkqZDTO7b03ZKBYNu6oGPfVXenWprabHME
         WNXfs18/xSfTyQ/+fUdNBsLlxWXQUZia8OT+WlmPGG+kruNzTduvLJqGeUfA4KKGhkW1
         mCFgTMReV6jQGhQ/xmxxM337Y8F1FkOepGf5ij9MbgOw6OYcqZiWN4dFa9aq8hh1gekc
         sFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736721903; x=1737326703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
        b=sJHM5DRJQode7brZMlofSDJbczuVd0AQavFfqo9TDOzZP0P3HIHPPFbiaj7KgZteI6
         55e8LWxthMOjDUu14QpEUOEchxrzMhg4OMdSdLURQEATCJAgMXLRRHQJkHOUemzeDRa1
         YR27xBY6NmkeHw53snckxDyWQj/7gP6Osd8mvvM+rViIv8tie9ehO8xcVdR5BKjj4vUV
         nj6Jl3VubjCfUfJhPPXQQbyn5+fTTVr229Q8Air480XbE8Z0HtBojI50ZRHF0zRGBg8P
         Eh25UkxWJwe7STDTsDQtMq9zHE1484+D1xZ7hIQUpP+7VGEBeM8WVWXzqoL2o3E3XlMh
         f/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVkFI+s8D9ueksQPboyDjLU+bDZPa+CbXNYpBLqYZn105hwmMo7L0r6S0wX0mkGrnXY0n6ZkOAqhYaGogOQ@lists.infradead.org, AJvYcCVz5ogLwxIt302FVWWnpWv/qGrZ/28CVlUn5OK4nNHjzaJS1a7pawmcy6RKAq/mQwE5ENdcGt0nEJ+EMb2TOaQRVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXVdmxZOO5ACr/cDDMC5exDyckWwzFui+HRTfwJD2xj5dpeix+
	WAMu3fr+azxlTs5fgMgqXY80O5hMksvQID2SaAIyCWkntTIjiLcOq+uiopaDw4KBkss6EIP+q4r
	0MqNpmXUsJYrX7Zmv6fukrWfFQNI=
X-Gm-Gg: ASbGnct80ClVuFseKsufOtgI+qASDnFnytyT7StlHmW7ArM45a3qQUVcOVI3vLHoEIV
	M0AgBHcSX5fCT72ZKqWjoieYP2TmSrc26oTg2/OgNqCjeKj1QdWSn92M+NZp4pPecOKSIBog=
X-Google-Smtp-Source: AGHT+IGNz3Ruf0X+gVj7nBY3APrFarUB7thQVZMZ4m+s7QUu/pm1goAfZAGCOZYY8Z7GpsZnqZtOgbL3BA33uqULwts=
X-Received: by 2002:a17:902:d510:b0:216:5568:38c9 with SMTP id
 d9443c01a7336-21a83f765dbmr291330955ad.31.1736721903273; Sun, 12 Jan 2025
 14:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jan 2025 23:44:52 +0100
X-Gm-Features: AbW1kvZsSUpdzbvzbuZJcXAZ1UAOMHLx_A3msCo-ZlE0wKJxebqo01Qyaki1jEQ
Message-ID: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic S4
To: ao.xu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_144504_706648_92BE79E3 
X-CRM114-Status: GOOD (  25.31  )
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

SGVsbG8sCgpPbiBGcmksIEphbiAxMCwgMjAyNSBhdCA2OjM54oCvQU0gQW8gWHUgdmlhIEI0IFJl
bGF5CjxkZXZudWxsK2FvLnh1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhp
cyBwYXRjaCBzZXJpZXMgYWRkcyBEUk0gc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgUzQtc2VyaWVz
IFNvQ3MuCj4gQ29tcGFyZWQgdG8gdGhlIEFtbG9naWMgRzEyLXNlcmllcywgdGhlIFM0LXNlcmll
cyBpbnRyb2R1Y2VzIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
ZXMuIFdpdGggdGhpcyBtYWlsIEknbGwgdHJ5IHRvIHN1bW1hcml6ZSBteQp1bmRlcnN0YW5kaW5n
IG9mIHRoZSBzaXR1YXRpb24gd2l0aCB0aGUgZHJtL21lc29uIGRyaXZlciBhcyBJJ20gbm90CnN1
cmUgaG93IGZhbWlsaWFyIHlvdSBhcmUgd2l0aCBwcmV2aW91cyBkaXNjdXNzaW9ucy4KCj4gMSBU
aGUgUzQtc2VyaWVzIHNwbGl0cyB0aGUgSElVIGludG8gdGhyZWUgc2VwYXJhdGUgY29tcG9uZW50
czogYHN5c19jdHJsYCwgYHB3cl9jdHJsYCwgYW5kIGBjbGtfY3RybGAuCj4gICBBcyBhIHJlc3Vs
dCwgVkVOQyBhbmQgVkNMSyBkcml2ZXJzIGFyZSB1cGRhdGVkIHdpdGggUzQtc3BlY2lmaWMgY29t
cGF0aWJsZSBzdHJpbmdzIHRvIGFjY29tbW9kYXRlIHRoZXNlIGNoYW5nZXMuCkplcm9tZSBoYXMg
YWxyZWFkeSBjb21tZW50ZWQgb24gcGF0Y2ggMy8xMSB0aGF0IHRoaXMgbWl4ZXMgaW4gdG9vIG1h
bnkKSVAgYmxvY2tzIGludG8gb25lIGRyaXZlci4KVGhpcyBpcyBub3QgYSBuZXcgc2l0dWF0aW9u
LCB0aGUgZXhpc3RpbmcgY29kZSBpcyBkb2luZyBleGFjdGx5IHRoZSBzYW1lLgoKSmVyb21lIGhh
cyBwcmV2aW91c2x5IHNlbnQgYSBzZXJpZXMgd2hpY2ggc3RhcnRlZCAiYW4gZWZmb3J0IHRvIHJl
bW92ZQp0aGUgdXNlIEhISSBzeXNjb24iIFswXSBmcm9tIHRoZSBkcm0vbWVzb24gaGRtaSBkcml2
ZXIuCkluIHRoZSBzYW1lIG1haWwgaGUgZnVydGhlciBub3RlczogIlt0aGUgcGF0Y2hzZXRdIHN0
b3BzIHNob3J0IG9mCm1ha2luZyBhbnkgY29udHJvdmVyc2lhbCBEVCBjaGFuZ2VzLiBUbyBkZWNv
dXBsZSB0aGUgSERNSQpwaHkgZHJpdmVyIGFuZCBtYWluIERSTSBkcml2ZXIsIGFsbG93aW5nIHRo
ZSBQSFkgdG8gZ2V0IGhvbGQgb2YgaXRzCnJlZ2lzdGVycywgSSBiZWxpZXZlIGEgRFQgQUJJIGJy
ZWFrIGlzIGluZXZpdGFibGUuIElkZWFsbHkgdGhlCnJlZ2lzdGVyIHJlZ2lvbiBvZiB0aGUgUEhZ
IHdpdGhpbiB0aGUgSEhJIHNob3VsZCBwcm92aWRlZCwgbm90IHRoZQp3aG9sZSBISEkuIFRoYXQn
cyBwYWluIGZvciBhbm90aGVyIGRheSAuLi4iCgpGb3Igbm93IEknbSBhc3N1bWluZyB5b3UncmUg
ZmFtaWxpYXIgd2l0aCBkZXZpY2UtdHJlZSBBQkkuCklmIG5vdCB0aGVuIHBsZWFzZSBsZXQgdXMg
a25vdyBzbyB3ZSBjYW4gZWxhYm9yYXRlIGZ1cnRoZXIgb24gdGhpcy4KCk15IG93biBub3RlcyBm
b3IgbWVzb25fZHdfaGRtaS5jIGFyZToKLSB3ZSBzaG91bGQgbm90IHByb2dyYW0gSEhJX0hETUlf
Q0xLX0NOVEwgZGlyZWN0bHkgYnV0IGdvIHRocm91Z2ggQ0NGCihjb21tb24gY2xvY2sgZnJhbWV3
b3JrKSBpbnN0ZWFkICh3ZSBzaG91bGQgYWxyZWFkeSBoYXZlIHRoZSBkcml2ZXIKZm9yIHRoaXMg
aW4gcGxhY2UpCi0gd2Ugc2hvdWxkIG5vdCBwcm9ncmFtIEhISV9NRU1fUERfUkVHMCBkaXJlY3Rs
eSBidXQgZ28gdGhyb3VnaCB0aGUKZ2VucGQvcG1kb21haW4gZnJhbWV3b3JrICh3ZSBzaG91bGQg
YWxyZWFkeSBoYXZlIHRoZSBkcml2ZXIgZm9yIHRoaXMKaW4gcGxhY2UpCi0gZm9yIHRoZSBIRE1J
IFBIWSByZWdpc3RlcnM6IG9uIE1lc29uOC84Yi84bTIgKHRob3NlIHdlcmUgMzItYml0IFNvQ3MK
aW4gY2FzZSB5b3UncmUgbm90IGZhbWlsaWFyIHdpdGggdGhlbSwgdGhleSBwcmVkYXRlIEdYQkIv
R1hMLy4uLikgSQp3cm90ZSBhIFBIWSBkcml2ZXIgKHdoaWNoIGlzIGFscmVhZHkgdXBzdHJlYW06
CmRyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uOC1oZG1pLXR4LmMpIGFzIHRoYXQgbWFkZSBt
b3N0IHNlbnNlIHRvCm1lCgpUaGVuIHRoZXJlJ3MgbWVzb25fdmVuYy5jIHdoaWNoIGhhcyB0d28g
d3JpdGVzIHRvIEhISV9HQ0xLX01QRUcyLgpJIHRoaW5rIHRob3NlIHNob3VsZCBnbyB0aHJvdWdo
IENDRiBpbnN0ZWFkIG9mIGRpcmVjdGx5IGFjY2Vzc2luZyB0aGlzIHJlZ2lzdGVyLgoKQWxzbyB0
aGVyZSdzIHRoZSBWREFDIHJlZ2lzdGVycyBpbiBtZXNvbl9lbmNvZGVyX2N2YnMuYzoKSSB0aGlu
ayBOZWlsIHN1Z2dlc3RlZCBhdCBvbmUgcG9pbnQgdG8gbWFrZSBpdCBhIFBIWSBkcml2ZXIuIEkg
ZXZlbgpzdGFydGVkIHdvcmtpbmcgb24gdGhpcyAoaWYgeW91J3JlIGN1cmlvdXM6IHNlZSBbMF0g
YW5kIFsxXSkuCkRUIEFCSSBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBpcyBhbHNvIGEgY29uY2Vy
biBoZXJlLgoKQW5kIGZpbmFsbHkgdGhlcmUncyB0aGUgdmlkZW8gY2xvY2sgdHJlZSBwcm9ncmFt
bWluZyBpbiBtZXNvbl92Y2xrLmMuCk15IHVuZGVyc3RhbmRpbmcgaGVyZSBpcyB0aGF0IHZpZGVv
IFBMTCBzZXR0aW5ncyBhcmUgdmVyeSBzZW5zaXRpdmUKYW5kIHJlcXVpcmUgZmluZS10dW5pbmcg
YWNjb3JkaW5nIHRvIHRoZSBkZXNpcmVkIG91dHB1dCBjbG9jay4KU2luY2UgaXQncyBhIGJ1bmNo
IG9mIGNsb2NrcyBJJ2Qgc2F5IHRoYXQgZGlyZWN0IHByb2dyYW1taW5nIG9mIHRoZQpjbG9jayBy
ZWdpc3RlcnMgc2hvdWxkIGJlIGF2b2lkZWQgYW5kIHdlIG5lZWQgdG8gZ28gdGhyb3VnaCBDQ0Yg
YXMKd2VsbC4KQnV0IHRvIG1lIHRob3NlIHJlZ2lzdGVyIHZhbHVlcyBhcmUgYWxsIG1hZ2ljIChh
cyBJIGFtIG5vdCBhd2FyZSBvZgphbnkgZG9jdW1lbnRhdGlvbiB0aGF0J3MgYXZhaWxhYmxlIHRv
IG1lIHdoaWNoIGRlc2NyaWJlcyBob3cgdG8KZGV0ZXJtaW5lIHRoZSBjb3JyZWN0IFBMTCByZWdp
c3RlciB2YWx1ZXMgLSBvdGhlcnNpZGUgdGhlIHN0YW5kYXJkCmVuL20vbi9mcmFjL2xvY2sgYW5k
IHJlc2V0IGJpdHMpLgoKSSdtIG5vdCBzYXlpbmcgdGhhdCBhbGwgb2YgbXkgdGhvdWdodHMgYXJl
IGNvcnJlY3QgYW5kIGltbWVkaWF0ZWx5Cm5lZWQgdG8gYmUgcHV0IGludG8gY29kZS4KVGhpbmsg
b2YgdGhlbSBtb3JlIGFzIGFuIGV4cGxhbmF0aW9uIHRvIEplcm9tZSdzIHJlYWN0aW9uLgoKSSB0
aGluayB3aGF0IHdlIG5lZWQgbmV4dCBpcyBhIGRpc2N1c3Npb24gb24gaG93IHRvIG1vdmUgZm9y
d2FyZCB3aXRoCmRldmljZS10cmVlIEFCSSBmb3IgbmV3IFNvQ3MuCk5laWwsIEplcm9tZTogSSdk
IGxpa2UgdG8gaGVhciB5b3VyIGZlZWRiYWNrIG9uIHRoaXMuCgo+IDIgVGhlIFM0LXNlcmllcyBz
ZWN1cmVzIGFjY2VzcyB0byBIRE1JVFggRFdDIGFuZCBUT1AgcmVnaXN0ZXJzLAo+ICAgcmVxdWly
aW5nIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGRyaXZlciB0byBoYW5kbGUgdGhpcyBuZXcgYWNjZXNz
IG1ldGhvZC4KVGhpcyBpbmZvIHNob3VsZCBnbyBpbnRvIHBhdGNoIDEvMTEgdG8gZXhwbGFpbiB3
aHkgdGhlIGcxMmEgY29tcGF0aWJsZQpzdHJpbmcgY2Fubm90IGJlIHVzZWQgYXMgZmFsbGJhY2su
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL3hkYXJrbGln
aHQvbGludXgvY29tbWl0LzM2ZTY5OGVkYzI1ZGM2OThhMGQ1N2I3MjlhN2E0NTg3ZmFmYzA5ODcK
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZGFya2xpZ2h0L2xpbnV4L2NvbW1pdC84MjRiNzkyZmRi
ZDJkM2MwYjcxYjIxZTExMDVlY2EwYWFhZDhkYWE2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
