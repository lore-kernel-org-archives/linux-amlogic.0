Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12EE77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2025 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbtwZp4oFj+QV/vNN6z9fOiHPB6+q8bDgNJNGSc9O60=; b=PLSIgJVeCQBrtM
	kOSuoSO+3LujRAsi75UpwXGneQAnT4mP6K21CssPuRJHrZR4YrdLUzQdg90nA29fgWXHLPCDZaVz9
	RiHjfgmCVByHfNpQ5ydvKb+BfzQEnXrx+33YC+si7hhDzXmkanDCzKBKXtJn12qYHgAPze7sUJDt3
	GW7kwhkBHKsSr072SNQVEDWZ6E1CPTkWaXciFKLOS9BA2i/IC3PgMSTFmez8jQ2UXku6vQy7KleNK
	cZlV2L+UDWDDVs7YupkUE8ufF6L1F0ucYr6nf2x+fBYbmw+6vASaMeWzQHjAXPnHKJQr3xzZK0lMb
	Lzi6LykXZwWHu2fpzJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl4s-00000009FTp-2YYT;
	Tue, 14 Jan 2025 17:51:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl3b-00000009FGl-0KYt
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jan 2025 17:50:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2862261f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2025 09:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736877025; x=1737481825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
        b=JaMwXUnAtRDX6W0nPzDBH7iFKqZxE8zignj6Odn6+NkpikSHb8PVKo7myg9H284f28
         AyBDzSxD+zq0ge2pS5OXbvvc/p7bKRXyamH4NQWJYaFCcW5CqhmUtRyYXbwTIWdit0Nw
         +ukWZTSEx9DJNxBFsAx1hH0UdC3Cmj/0swoxGnQEux34VN2feZ1uxySb5EF7PJUf8EGb
         LuqRocvrILXZg9bs9C7Y8NTssgrMmPlzpo1+x7306ZYozCmwWYNLicXHoo6OG0AsmlZf
         UTuIxgbs30GIPa3xUYJjRQ2c7Hfp5pB97h3h1bQ4lfwEBKWmyCj8fWK8CuttV7ZJY2hI
         +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736877025; x=1737481825;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
        b=CBr7kmbadydGW9RYwaC4dnxj3stXps76GrHcqTrJHsxtYhJwbePmizsUFRJiF/X/CP
         HttvH7jcoJsQEk/+R0bJun27HhGZ/olQDAPi89PgZ7xgIUvwtHnIG3iNwsNZPnJ+sq+x
         kPcpKg0F/Y9HinumuAB3NPjBck5h3VjwgQuZfPKKY6phK2KpTyzsRkiYofvwqjgX+TQ+
         tSmT9HGmn6TLHb/b/H5W1tSf6BzDGtT2XsFwv9lt3vHqm6c6O9PjFpYEXqKQQM0p14DL
         ys2BAZR+diABXZ3oCjSHmMMQZ9z7GFUSs2qCykOP+TW0DFBwGWngdrVdvaqP6edmrg/R
         zj9g==
X-Forwarded-Encrypted: i=1; AJvYcCVDn6oSxjuc4KRXJV+Dssg5LKHPESVVBHV4ACYFni0BdjGAYTt/a6JwPAhA2bMg89+l53p+Plvi2iHLG/fq@lists.infradead.org
X-Gm-Message-State: AOJu0YxYg+0RGpUZMdPk9DaTshR9yGQSYR7Jone19/WtpiWFo2X9Asuq
	YVqXEMv+kYDUHdERVVCjD6N3FdVI9SYl3wWLPx8zJPuH7KNmH9RFKUr61fR3w80=
X-Gm-Gg: ASbGnctEjkIsLPTmeBoQhBV+t0JuZVL8ByxSatRGgRGkHw1xvfRHvCpiMha9vHCc1gg
	rB9PH5qguwsnWA32FQzeZCQZtv0/TuCwddb/p47wxIFIK2xJEBQXziLe3dXJMJFlQU9z1SJrNlN
	pTlUU7NgbV5PaNB1H+xongba/bPtp96ROVf52MvT0ld8FFNOoaAIgTOkTPkMR7UBlEbsVGUDic7
	fV5a395BsczEUnc2r2aPc8m2vNtF51vpAs1GzxATjDKl/PIE3QnNrS/
X-Google-Smtp-Source: AGHT+IGniaS5vKpw5UThOug4qTnk81tkkU2MITchcBy/hQw5sKSXoGOKno5PQ4PZG23+YM4eJ9Ctww==
X-Received: by 2002:a05:6000:1547:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38a872debb2mr24343563f8f.16.1736877025045;
        Tue, 14 Jan 2025 09:50:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm15192221f8f.101.2025.01.14.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:50:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: ao.xu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 12 Jan 2025 23:44:52 +0100")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
	<CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 18:50:23 +0100
Message-ID: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095027_121361_F095BF21 
X-CRM114-Status: GOOD (  42.70  )
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

T24gU3VuIDEyIEphbiAyMDI1IGF0IDIzOjQ0LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBPbiBGcmks
IEphbiAxMCwgMjAyNSBhdCA2OjM54oCvQU0gQW8gWHUgdmlhIEI0IFJlbGF5Cj4gPGRldm51bGwr
YW8ueHUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGFkZHMgRFJNIHN1cHBvcnQgZm9yIHRoZSBBbWxvZ2ljIFM0LXNlcmllcyBTb0NzLgo+PiBD
b21wYXJlZCB0byB0aGUgQW1sb2dpYyBHMTItc2VyaWVzLCB0aGUgUzQtc2VyaWVzIGludHJvZHVj
ZXMgdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLiBXaXRo
IHRoaXMgbWFpbCBJJ2xsIHRyeSB0byBzdW1tYXJpemUgbXkKPiB1bmRlcnN0YW5kaW5nIG9mIHRo
ZSBzaXR1YXRpb24gd2l0aCB0aGUgZHJtL21lc29uIGRyaXZlciBhcyBJJ20gbm90Cj4gc3VyZSBo
b3cgZmFtaWxpYXIgeW91IGFyZSB3aXRoIHByZXZpb3VzIGRpc2N1c3Npb25zLgo+Cj4+IDEgVGhl
IFM0LXNlcmllcyBzcGxpdHMgdGhlIEhJVSBpbnRvIHRocmVlIHNlcGFyYXRlIGNvbXBvbmVudHM6
IGBzeXNfY3RybGAsIGBwd3JfY3RybGAsIGFuZCBgY2xrX2N0cmxgLgo+PiAgIEFzIGEgcmVzdWx0
LCBWRU5DIGFuZCBWQ0xLIGRyaXZlcnMgYXJlIHVwZGF0ZWQgd2l0aCBTNC1zcGVjaWZpYyBjb21w
YXRpYmxlIHN0cmluZ3MgdG8gYWNjb21tb2RhdGUgdGhlc2UgY2hhbmdlcy4KPiBKZXJvbWUgaGFz
IGFscmVhZHkgY29tbWVudGVkIG9uIHBhdGNoIDMvMTEgdGhhdCB0aGlzIG1peGVzIGluIHRvbyBt
YW55Cj4gSVAgYmxvY2tzIGludG8gb25lIGRyaXZlci4KPiBUaGlzIGlzIG5vdCBhIG5ldyBzaXR1
YXRpb24sIHRoZSBleGlzdGluZyBjb2RlIGlzIGRvaW5nIGV4YWN0bHkgdGhlIHNhbWUuCj4KPiBK
ZXJvbWUgaGFzIHByZXZpb3VzbHkgc2VudCBhIHNlcmllcyB3aGljaCBzdGFydGVkICJhbiBlZmZv
cnQgdG8gcmVtb3ZlCj4gdGhlIHVzZSBISEkgc3lzY29uIiBbMF0gZnJvbSB0aGUgZHJtL21lc29u
IGhkbWkgZHJpdmVyLgo+IEluIHRoZSBzYW1lIG1haWwgaGUgZnVydGhlciBub3RlczogIlt0aGUg
cGF0Y2hzZXRdIHN0b3BzIHNob3J0IG9mCj4gbWFraW5nIGFueSBjb250cm92ZXJzaWFsIERUIGNo
YW5nZXMuIFRvIGRlY291cGxlIHRoZSBIRE1JCj4gcGh5IGRyaXZlciBhbmQgbWFpbiBEUk0gZHJp
dmVyLCBhbGxvd2luZyB0aGUgUEhZIHRvIGdldCBob2xkIG9mIGl0cwo+IHJlZ2lzdGVycywgSSBi
ZWxpZXZlIGEgRFQgQUJJIGJyZWFrIGlzIGluZXZpdGFibGUuIElkZWFsbHkgdGhlCj4gcmVnaXN0
ZXIgcmVnaW9uIG9mIHRoZSBQSFkgd2l0aGluIHRoZSBISEkgc2hvdWxkIHByb3ZpZGVkLCBub3Qg
dGhlCj4gd2hvbGUgSEhJLiBUaGF0J3MgcGFpbiBmb3IgYW5vdGhlciBkYXkgLi4uIgo+Cj4gRm9y
IG5vdyBJJ20gYXNzdW1pbmcgeW91J3JlIGZhbWlsaWFyIHdpdGggZGV2aWNlLXRyZWUgQUJJLgo+
IElmIG5vdCB0aGVuIHBsZWFzZSBsZXQgdXMga25vdyBzbyB3ZSBjYW4gZWxhYm9yYXRlIGZ1cnRo
ZXIgb24gdGhpcy4KPgo+IE15IG93biBub3RlcyBmb3IgbWVzb25fZHdfaGRtaS5jIGFyZToKPiAt
IHdlIHNob3VsZCBub3QgcHJvZ3JhbSBISElfSERNSV9DTEtfQ05UTCBkaXJlY3RseSBidXQgZ28g
dGhyb3VnaCBDQ0YKPiAoY29tbW9uIGNsb2NrIGZyYW1ld29yaykgaW5zdGVhZCAod2Ugc2hvdWxk
IGFscmVhZHkgaGF2ZSB0aGUgZHJpdmVyCj4gZm9yIHRoaXMgaW4gcGxhY2UpCj4gLSB3ZSBzaG91
bGQgbm90IHByb2dyYW0gSEhJX01FTV9QRF9SRUcwIGRpcmVjdGx5IGJ1dCBnbyB0aHJvdWdoIHRo
ZQo+IGdlbnBkL3BtZG9tYWluIGZyYW1ld29yayAod2Ugc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUg
ZHJpdmVyIGZvciB0aGlzCj4gaW4gcGxhY2UpCj4gLSBmb3IgdGhlIEhETUkgUEhZIHJlZ2lzdGVy
czogb24gTWVzb244LzhiLzhtMiAodGhvc2Ugd2VyZSAzMi1iaXQgU29Dcwo+IGluIGNhc2UgeW91
J3JlIG5vdCBmYW1pbGlhciB3aXRoIHRoZW0sIHRoZXkgcHJlZGF0ZSBHWEJCL0dYTC8uLi4pIEkK
PiB3cm90ZSBhIFBIWSBkcml2ZXIgKHdoaWNoIGlzIGFscmVhZHkgdXBzdHJlYW06Cj4gZHJpdmVy
cy9waHkvYW1sb2dpYy9waHktbWVzb244LWhkbWktdHguYykgYXMgdGhhdCBtYWRlIG1vc3Qgc2Vu
c2UgdG8KPiBtZQo+Cj4gVGhlbiB0aGVyZSdzIG1lc29uX3ZlbmMuYyB3aGljaCBoYXMgdHdvIHdy
aXRlcyB0byBISElfR0NMS19NUEVHMi4KPiBJIHRoaW5rIHRob3NlIHNob3VsZCBnbyB0aHJvdWdo
IENDRiBpbnN0ZWFkIG9mIGRpcmVjdGx5IGFjY2Vzc2luZyB0aGlzIHJlZ2lzdGVyLgo+Cj4gQWxz
byB0aGVyZSdzIHRoZSBWREFDIHJlZ2lzdGVycyBpbiBtZXNvbl9lbmNvZGVyX2N2YnMuYzoKPiBJ
IHRoaW5rIE5laWwgc3VnZ2VzdGVkIGF0IG9uZSBwb2ludCB0byBtYWtlIGl0IGEgUEhZIGRyaXZl
ci4gSSBldmVuCj4gc3RhcnRlZCB3b3JraW5nIG9uIHRoaXMgKGlmIHlvdSdyZSBjdXJpb3VzOiBz
ZWUgWzBdIGFuZCBbMV0pLgo+IERUIEFCSSBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBpcyBhbHNv
IGEgY29uY2VybiBoZXJlLgo+Cj4gQW5kIGZpbmFsbHkgdGhlcmUncyB0aGUgdmlkZW8gY2xvY2sg
dHJlZSBwcm9ncmFtbWluZyBpbiBtZXNvbl92Y2xrLmMuCj4gTXkgdW5kZXJzdGFuZGluZyBoZXJl
IGlzIHRoYXQgdmlkZW8gUExMIHNldHRpbmdzIGFyZSB2ZXJ5IHNlbnNpdGl2ZQo+IGFuZCByZXF1
aXJlIGZpbmUtdHVuaW5nIGFjY29yZGluZyB0byB0aGUgZGVzaXJlZCBvdXRwdXQgY2xvY2suCj4g
U2luY2UgaXQncyBhIGJ1bmNoIG9mIGNsb2NrcyBJJ2Qgc2F5IHRoYXQgZGlyZWN0IHByb2dyYW1t
aW5nIG9mIHRoZQo+IGNsb2NrIHJlZ2lzdGVycyBzaG91bGQgYmUgYXZvaWRlZCBhbmQgd2UgbmVl
ZCB0byBnbyB0aHJvdWdoIENDRiBhcwo+IHdlbGwuCj4gQnV0IHRvIG1lIHRob3NlIHJlZ2lzdGVy
IHZhbHVlcyBhcmUgYWxsIG1hZ2ljIChhcyBJIGFtIG5vdCBhd2FyZSBvZgo+IGFueSBkb2N1bWVu
dGF0aW9uIHRoYXQncyBhdmFpbGFibGUgdG8gbWUgd2hpY2ggZGVzY3JpYmVzIGhvdyB0bwo+IGRl
dGVybWluZSB0aGUgY29ycmVjdCBQTEwgcmVnaXN0ZXIgdmFsdWVzIC0gb3RoZXJzaWRlIHRoZSBz
dGFuZGFyZAo+IGVuL20vbi9mcmFjL2xvY2sgYW5kIHJlc2V0IGJpdHMpLgo+Cj4gSSdtIG5vdCBz
YXlpbmcgdGhhdCBhbGwgb2YgbXkgdGhvdWdodHMgYXJlIGNvcnJlY3QgYW5kIGltbWVkaWF0ZWx5
Cj4gbmVlZCB0byBiZSBwdXQgaW50byBjb2RlLgo+IFRoaW5rIG9mIHRoZW0gbW9yZSBhcyBhbiBl
eHBsYW5hdGlvbiB0byBKZXJvbWUncyByZWFjdGlvbi4KPgo+IEkgdGhpbmsgd2hhdCB3ZSBuZWVk
IG5leHQgaXMgYSBkaXNjdXNzaW9uIG9uIGhvdyB0byBtb3ZlIGZvcndhcmQgd2l0aAo+IGRldmlj
ZS10cmVlIEFCSSBmb3IgbmV3IFNvQ3MuCj4gTmVpbCwgSmVyb21lOiBJJ2QgbGlrZSB0byBoZWFy
IHlvdXIgZmVlZGJhY2sgb24gdGhpcy4KCkkgY29tcGxldGVseSBhZ3JlZSB3aXRoIHlvdXIgZGVz
Y3JpcHRpb24gb2YgdGhlIHByb2JsZW0sIHRoYXQgYW5kCktyenlzenRvZidzIHJlbWFyayBvbiBw
YXRjaCA2LiBUaGlzIGlzIG5vdCBuZXcgd2l0aCB0aGlzIHNlcmllcyBpbmRlZWQsCnNvIGl0IGRv
ZXMgbm90IGludHJvZHVjZSBuZXcgcHJvYmxlbXMgcmVhbGx5IGJ1dCBpdCBjb21wb3VuZHMgdGhl
CmV4aXN0aW5nIG9uZXMuCgpBZGRyZXNzaW5nIHRob3NlIGlzc3VlcywgaWYgd2Ugd2FudCB0bywg
d2lsbCBnZXQgbW9yZSBkaWZmaWN1bHQgYXMgbW9yZQpzdXBwb3J0IGlzIGFkZGVkIGZvciBzdXJl
LgoKPgo+PiAyIFRoZSBTNC1zZXJpZXMgc2VjdXJlcyBhY2Nlc3MgdG8gSERNSVRYIERXQyBhbmQg
VE9QIHJlZ2lzdGVycywKPj4gICByZXF1aXJpbmcgbW9kaWZpY2F0aW9ucyB0byB0aGUgZHJpdmVy
IHRvIGhhbmRsZSB0aGlzIG5ldyBhY2Nlc3MgbWV0aG9kLgoKUmVnbWFwIGJ1c2VzIGFyZSBtYWRl
IGZvciB0aG9zZSBjYXNlcyB3aGVyZSB0aGUgcmVnaXN0ZXJzIGFyZSB0aGUgc2FtZSwKYnV0IGFj
Y2Vzc2VkIGRpZmZlcmVudGx5LiBUaGVyZSBpcyBhbiBleGFtcGxlIGluIHRoZSBwYXRjaHNldCBy
ZWZlcmVuY2VkIGJ5Ck1hcnRpbiwgdG8gaGFuZGxlIEdYTCBhbmQgRzEyIGRpZmYuCgo+IFRoaXMg
aW5mbyBzaG91bGQgZ28gaW50byBwYXRjaCAxLzExIHRvIGV4cGxhaW4gd2h5IHRoZSBnMTJhIGNv
bXBhdGlibGUKPiBzdHJpbmcgY2Fubm90IGJlIHVzZWQgYXMgZmFsbGJhY2suCj4KPgo+IEJlc3Qg
cmVnYXJkcywKPiBNYXJ0aW4KPgo+Cj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZGFya2xpZ2h0
L2xpbnV4L2NvbW1pdC8zNmU2OThlZGMyNWRjNjk4YTBkNTdiNzI5YTdhNDU4N2ZhZmMwOTg3Cj4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZGFya2xpZ2h0L2xpbnV4L2NvbW1pdC84MjRiNzkyZmRi
ZDJkM2MwYjcxYjIxZTExMDVlY2EwYWFhZDhkYWE2CgotLSAKSmVyb21lCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
