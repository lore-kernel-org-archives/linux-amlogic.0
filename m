Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC391CF3189
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 10:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vO3X40lrQ0WaG7chtMYFFXsNe4IbHX+8x9mcV/gA+yU=; b=PPy2DrxwISvrX/
	lopFXmb3ZbnW64rc/o+dFCMunZ/GsUjttXx11ZtBU+tDAe5mYpXDnq7JAmDwXwwAKOBvtMj1p8NjR
	rMK3qGBqV6VzEj1DrE4GeBO+Udi5wecKkJboTczyYrLUwjsBfTLNUeFmYuEQxXxSVVkQGath0Q9aa
	5XQXWjx3Z4InQ6le7O3vdFkKmXeptOXo+PqLUn2X/b0Yt1EzuNhjjAFpsPY7kFcXRaAoil9pd+mEe
	ZqtpyQgMGG9CHY2vxC6WJ+KUY757tZlPcx9LLm+4wj79meXoQqrYYxA4NpZzg3BBWIG1N7M5mkZPF
	vKA57hVrvRTbfsirXQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfPc-00000002y2l-3Rto;
	Wed, 19 Nov 2025 10:27:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfPZ-00000002y1f-40yC
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Nov 2025 10:27:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1524030a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Nov 2025 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763548060; x=1764152860; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
        b=jL5guu3KBnNVXqSN2Ng8xAlI2upG3Exj2EROuql4ZjbPgCh3kgY+XPse33jGs/xSC4
         SMHC/JD3RbEBli3KFVbj+4K3nM/Jqm8oozJ+o3+BWjS7bopgZVsGWjkX3mczh/6hBg6O
         0HEfVXTqneWUxr8CzS+4IOCDHxU9W+au59Y8wCgTkH6gHJR8sdKLZKfjoCQ8dCHz580Z
         JEENjXFjQnaMtPjrojbURzw2bmRlcRP2w3dyyoRZcYlDbZjGmPt+A6yxXELb9YTSmI6v
         8DGElrx6vb+0r6lhQRd/0a7XB+Pj3/4tNrFXqU2hvRvcooeIQqUDW6On7kDSS68RWuSw
         4ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548060; x=1764152860;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
        b=BYLV13SHtdOE4lflGJKWsT52THiEojc9PykjInDFWlDKOVsvKDiLA3BoWe39L4MNCf
         eZbpv9qmQibu90BWTlQM14EoQTgvd6A1Xpd3NjmnWriZpfdbb/Q7JPgkDVEEtLlo24gD
         WoWFWsfY+NbWNrA5mDK1S8GsWRj/ERLCVOVDsjGt9t5HULu3GpYZwgGIwFu0HwARrZqi
         RmyJ+ZdfGtzhMkSV37PT7YCrLJbyja11jCswo537+M62bkd4CjoKdy8M1BPumYGpzfPa
         YCpSwvrN7U0l+I+TOI98Rbet3LoGuAibVjVrm+OvDJ13LYZRz96s4iq0QNg2cJ+G+Y30
         pQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQkpHybzZoBg9Fj8/AWkRef5ERichzYalD4zpCp6TWAn952p63t3lOoOn5rhWyQU2+z2PnhnsRIyYdpTYc@lists.infradead.org
X-Gm-Message-State: AOJu0YxfY01hx1g5sFxuQ8aX6X+Lvm1ZyEjA7p+hvZwTJHzs49WNY2EL
	ZXacS4M7LyBTVQCtzO9HV1pgJRNMXtGH8+pgkwNCO0upRjYCaerZXoFK
X-Gm-Gg: ASbGncv9bXVMEFFpeiw1zc+YcHLl2sqPkr9Mvb/1yytlnEsh89DsbdkpQSEoaX9jswc
	SzVLi1KGZruvaxTeM6INIOO1/xABeGeDZm0f/+2KGsyQFNrFo77q++NMQnEEi7bB1aM6KbT6xx2
	r/d7Y3Lf/0e8Z7UcoN7oFkA5wCWk8g9AwxjsEAWqVfAgW29mHuPrRUvBm0mQXLNfnd9z5yKfJ5u
	EOnQ6RacI6biMvKb+GwneRSOISDirQ4zkad/NCgdqoqfoYTb/GijvhkzW1h+O7D663GCg0c1lT5
	O/CxTYbObL+O351EGSWI5sLTaxugs8VWAP7wPCjVUHNqNtZH76URJn79t5UIhhvvbZIRA9CAq2l
	BQnHzMrH1wqFxoLdkqHdki0TwgJA9KUKAqWxaciv45EBXDkXmeiR5KJnzu7ZacXrSTQaUKVuhD6
	+IDoTU/8Yx7AM+SDSUekzivv7G87pfAOMK6bL3261qjhmSDLUSDFIH04cQpEJLPmJKk3pOAfE5p
	Rw=
X-Google-Smtp-Source: AGHT+IFcsP/JWu7DWWlBu/BkWNRt0LIFSuLh7i2sy3UQ2gmA3tYApcSpm1bJdautTGMK/vyZo0UGug==
X-Received: by 2002:a17:907:7e93:b0:b73:9368:ad44 with SMTP id a640c23a62f3a-b739368aff0mr1299146866b.16.1763548059649;
        Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad4635sm1588133966b.26.2025.11.19.02.27.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
Date: Wed, 19 Nov 2025 11:27:26 +0100
Cc: ao.xu@amlogic.com,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022742_030921_7BBB5040 
X-CRM114-Status: GOOD (  18.80  )
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

UGxzIHNlZSBpbmxpbmUKCj4gV2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQ2h1YW4gTGl1IDxj
aHVhbi5saXVAYW1sb2dpYy5jb20+IHcgZG5pdSAxOSBsaXMgMjAyNSwgbyBnb2R6LiAwMzo1NzoK
PiAKPiBIaSBQaW90ciwKPiAKPiAKPiBPbiAxMS8xOC8yMDI1IDEwOjUwIFBNLCBQaW90ciBPbmlz
emN6dWsgd3JvdGU6Cj4+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcGlvdHIub25p
c3pjenVrQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8v
YWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+IFsgRVhURVJOQUwgRU1B
SUwgXQo+PiBBbywKPj4gSXMgdGhlcmUgYW55IGNoYW5jZSB0byBnZXQgdGhpcyBzNCBkcm0gaGRt
aSBzZXJpZXMgZm9yIGN1cnJlbnQgNi4xOD8KPj4gKGkgdHJpZWQgYmFja3BvcnQgdGhpcyBzZXJp
ZXMgdG8gNi4xOCBidXQgaGF2ZSBzb21lIGlzc3VlcyB3aXRoIHJlcGFyZW50IHZwdV8wX3NlbCB0
byBzeXNjbGtfYl9zZWwpCj4gCj4gV2h5IGRvIHdlIG5lZWQgdG8gcmVwYXJlbnQgdnB1XzBfc2Vs
IHRvIHN5c2Nsa19iX3NlbD8gaXMgdGhlcmUgYW55Cj4gYmFja2dyb3VuZCBoZXJlPwoKV2VsbCAt
IGl0IGxvb2tzIGl0IGlzIGJlY2F1c2UgYnVnLi4uLgpNYXJ0aW4gQmx1bWVuc3RpbmdsIGhhZCBw
ZXJmZWN0IGV5ZSBhbmQgY2F0Y2ggdHlwbyBpbiBwYXRjaCBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTAxMTAtZHJtLXM0LXYxLTExLWNiYzJkNWVkYWFlOEBhbWxvZ2ljLmNvbS86CgpC
eSByZXBsYWNpbmc6CmFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsa2NfcGVyaXBocyBDTEtJ
RF9GQ0xLX0RJVjM+LAo8MD4sIC8qIERvIE5vdGhpbmcgKi8KPCZjbGtjX3BlcmlwaHMgQ0xLSURf
VlBVXzA+LAo8JmNsa2NfcGVyaXBocyBDTEtJRF9GQ0xLX0RJVjQ+LAo8MD4sIC8qIERvIE5vdGhp
bmcgKi8KPCZjbGtjX3BlcmlwaHMgQ0xLSURfVkFQQl8wPjsKCndpdGg6CmFzc2lnbmVkLWNsb2Nr
LXBhcmVudHMgPSA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElWMz4sCjwwPiwgLyogRG8gTm90aGlu
ZyAqLwo8JmNsa2NfcGVyaXBocyBDTEtJRF9WUFVfMD4sCjwmY2xrY19wbGwgQ0xLSURfRkNMS19E
SVY0PiwKPDA+LCAvKiBEbyBOb3RoaW5nICovCjwmY2xrY19wZXJpcGhzIENMS0lEX1ZBUEJfMD47
CgpkbWVzZyBpcyBsaWtlIHRoaXMgaHR0cHM6Ly90ZXJtYmluLmNvbS82MDIwCgpTbyBpJ20gZ2V0
dGluZyBoZG1pIHdvcmtpbmcgLSBidXQgb25seSB3aGVuIGRldmljZSBib290cyBfd2l0aG91dF8g
Y29ubmVjdGVkIGhkbWkgYXQgYm9vdCAoYW5kIGNvbm5lY3RlZCBsYXRlcikKSWYgaGRtaSBpcyBj
b25uZWN0ZWQgYXQgYm9vdCAtIGJvb3QgaGFuZ3MgYXQ6CgogICAgMC4zNDE2NzZdIG1lc29uLWR3
LWhkbWkgZmUzMDAwMDAuaGRtaS10eDogRGV0ZWN0ZWQgSERNSSBUWCBjb250cm9sbGVyIHYyLjAx
YSB3aXRoIEhEQ1AgKG1lc29uX2R3X2hkbWlfcGh5KQpbICAgIDAuMzQyNzUwXSBtZXNvbi1kdy1o
ZG1pIGZlMzAwMDAwLmhkbWktdHg6IHJlZ2lzdGVyZWQgRGVzaWduV2FyZSBIRE1JIEkyQyBidXMg
ZHJpdmVyClsgICAgMC4zNDM2NjBdIG1lc29uLWRybSBmZjAwMDAwMC52cHU6IGJvdW5kIGZlMzAw
MDAwLmhkbWktdHggKG9wcyBtZXNvbl9kd19oZG1pX29wcykKWyAgICAwLjM0NDgzMl0gW2RybV0g
SW5pdGlhbGl6ZWQgbWVzb24gMS4wLjAgZm9yIGZmMDAwMDAwLnZwdSBvbiBtaW5vciAwCgpGWUk6
IEl0IGlzIGFmdGVyIGFwcGx5aW5nIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1hbWxvZ2ljL2NvdmVyLzIwMjUwMTEwLWRybS1zNC12MS0wLWNiYzJkNWVkYWFlOEBh
bWxvZ2ljLmNvbS8gb24gbWFpbmxpbmUgNi4xOCAod2l0aCBzb21lIG15IGFkanVzdG1lbnRzIG9u
IHRoaXMgc2VyaWVzIHJlcXVpcmVkIGJ5IGNoYW5nZXMgaW4gNi4xOCkuIApGb3IgVlBVIGNsayBj
aGFuZ2VzIHNlZSBodHRwczovL2dpdGh1Yi5jb20vd2FycG1lL21pbmlteXRoMi9ibG9iL21hc3Rl
ci9zY3JpcHQva2VybmVsL2xpbnV4LTYuMTgvZmlsZXMvMDMxMi1kcm0tbWVzb24tYWRkLXZwdS1j
bGstc2V0dGluZy1mb3ItUzQucGF0Y2ggCkl0IGlzIDYuMTggYWRhcHRhdGlvbiBvZiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1sb2dpYy9wYXRjaC8yMDI1MDEx
MC1kcm0tczQtdjEtOS1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vCgpBcyBrZXJuZWwgaGFuZ3Mg
LSBpIGhhdmUgbGltaXRlZCBjYXBzIHRvIGRyaWxsIHdoZXJlIHJvb3QgY2F1c2UgaXMuIAogIApN
YXliZSBhYm92ZSBoYW5nIGlzIHJlYXNvbiBvZiBteSBiYWNrcG9ydHMgb3IgbWlzc2luZyBhbnkg
cHJlLXJlcSByZXF1aXJlZCB0byBnZXQgczQgZHJtIHdvcmtpbmc/CkFueXdheSAtIGl0IHdpbGwg
YmUgZ29vZCB0byB0ZXN0IHdpdGggdXBkYXRlZCB0byA2LjE4IHNlcmllcyBvZiBBZGQgRFJNIHN1
cHBvcnQgZm9yIEFtbG9naWMgUzQgKHBsdXMgaW5mbyBhYm91dCBhbnkgcHJlLXJlcSByZXF1aXJl
ZCB0byBnZXQgczQgZHJtIHdvcmtpbmcpICAgCiAgICAgCgo+IAo+IFRoZSB2cHVfY2xrIG9uIFM0
IGRvZXNuJ3Qgc3VwcG9ydCBzeXNjbGtfYl9zZWwgYXMgb25lIG9mIGl0cwo+IHNlbGVjdGFibGUg
Y2xvY2sgc291cmNlcywgc28gdGhpcyByZXBhcmVudCBvcGVyYXRpb24gd2lsbCBkZWZpbml0ZWx5
Cj4gZmFpbC4gVGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBrZXJuZWwgdmVyc2lvbi4K
PiAKPj4+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEFvIFh1IHZpYSBCNCBSZWxheSA8ZGV2
bnVsbCthby54dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3IGRuaXUgMTAgc3R5IDIwMjUsIG8g
Z29kei4gMDY6Mzk6Cj4+PiAKPj4+IEZyb206IEFvIFh1IDxhby54dUBhbWxvZ2ljLmNvbT4KPj4+
IAo+Pj4gQWRkIGRldmljZXRyZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+Pj4g
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24t
ZHctaGRtaS55YW1sIHwgMSArCj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+
IAo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPj4+IGluZGV4IDg0
ZDY4YjhjZmNjYzg2ZmQ4N2E2YTBmZDJiNzBhZjEyZTUxZWI4YTQuLjZlMGE4MzY5ZWVlOTE1ZmFi
NTVhZjI0ZDQ1MGE2YzQwZTA4ZGVmMzggMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxt
ZXNvbi1kdy1oZG1pLnlhbWwKPj4+IEBAIC01NSw2ICs1NSw3IEBAIHByb3BlcnRpZXM6Cj4+PiAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1neC1kdy1oZG1pCj4+PiAgICAgICAtIGVu
dW06Cj4+PiAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHctaGRtaSAjIEcxMkEgKFM5
MDVYMiwgUzkwNVkyLCBTOTA1RDIpCj4+PiArICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1zNC1k
dy1oZG1pICMgUzQgKFM5MDVZNCkKPj4+IAo+Pj4gICByZWc6Cj4+PiAgICAgbWF4SXRlbXM6IDEK
Pj4+IAo+Pj4gLS0KPj4+IDIuNDMuMAo+Pj4gCj4+PiAKPj4+IAo+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0Cj4+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdAo+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
