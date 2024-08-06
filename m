Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D2CC52D6F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 20:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg3ZE1spY6DzOwlNECjhkZcVntYRjGCSWpjPb6vEfZw=; b=SGDMk+gas1G+Rl
	6/n0dCTyX0PdPmOufugRCX+jWZRH3XJUuvkhMM6SdpezahK+VUJjD7aW1ppC9rwwjaRfPRp0zv1o3
	UMNfSbdzgwO/bBNtE79tjeanazjZ++H16LaVCEBwbqgTeIv7iRAffeCFAGNJpTOo8FP37dR1N++E/
	QSKc4346r5ETnCW2xsTCGf36XteXUzvJy5dMM9AqvmdUN5YtJI9oR2oOZs0U2VYtAUowu5iHwIEQA
	N5hSmTtQ6MWGMz2apNhM97zdneSifGgFq2IdgS6XWlzTDV3bK4TOl8dOwJIcJIkb7eu1SIcfsqa4h
	9YmNtOJXbujFhEL5ajBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbR80-00000002shh-13eU;
	Tue, 06 Aug 2024 20:49:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbR7w-00000002sfi-3eS8
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 20:49:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fc66fc35f2so1932835ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1722977392; x=1723582192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOb7yzxJR8v2Ep13bBP5suT1y7mTdVA2Wy56PSiUs5w=;
        b=FjptyQvHNHLd5NFlEI7PtrL2ZtslD0taTixByaeRO/JOu1hsoPqRkd++rFDBz3xMoo
         HVn0jLHKRh6UdBJpIZYqa2Fb5jJKnLMGf8nqbif7mucVdTXP9siAzRIFCmeCnQk8+o/3
         zgRRyUBhhwcSvCQojjWqv2NmDUfF3JcVHEk8VulvUEDwfc2A8bpcrNrH4HSXsvV+0OlX
         rgEmcwqfdLY2skzSJDqXWZb+8QxIgmE+oXFQEjwVe6N2lYKTDFXhhSeCLTmG8VVzfQzE
         xSHsk5lzIUF10GRDeXPu7HLtHBwBINFOkUlYSi8REvs6Tls8GJH9bIIC9f/MaTjd8l6k
         ZfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722977392; x=1723582192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOb7yzxJR8v2Ep13bBP5suT1y7mTdVA2Wy56PSiUs5w=;
        b=CQ79jo0DYfCrmFOsUfsjBjJzrc+X5RU6DrYXWhFFVJcq16V0JhSFDh2yPtUQXpIz7g
         q0qjtC9/C2p9IxoOKHHgskS5OzTpGPRrA6GRXywjf3dCCrTAK8z2X4wy47i2y2SPEdxG
         kvZDce2OV0cN+oqVUiZTBt6wIzDrtluL8fCMeAK/Ef53x9mo9viWX2WqbZ84hzSSF2Nq
         EshQylHDFwUapd1/bCPhMxvqmB7PNqQ8aiKz4ha5wkl2NGBP9Pf0CXWh6baZIBckQtu4
         234Zv0p7t6EV6W79unug/d0FREb+7vw2lJ1Mdoj3nw1ncm6pYS0C4GKixkA+E/+z7zfj
         8OTw==
X-Forwarded-Encrypted: i=1; AJvYcCVLurGVl4J5d2Jcxmgrv1NFTJVMMEiA8PhXwH7HpcdskjaSdpeskIPlSMd81ZPP/BcKsvU5u3+xVXe2ZB8uPsFv7iJ6Bd+ZuFoFRC9tZ7eInAY=
X-Gm-Message-State: AOJu0YygrPKeirAeeYaww30XozsNsIidGUe2EXNmacRnSFchsgo+Ct1I
	ovq7kK4A5P2hWfMIpwjv4T6AKUynlP9K7f2JcDm+TTt+kDiUR3tg46aKV3N31/BOcx4neBfItcs
	MT/agZDKvZnP5xu0DGK6aYuZAeFU=
X-Google-Smtp-Source: AGHT+IEWfPRU2iaveYmuat0ybCTueo7tRCzgALc58m0y0WIi4uI64eQxtPbB6Cb9+AleElQR9RrKgLFpgvj4b6HwZRI=
X-Received: by 2002:a17:902:ec86:b0:1ff:39d7:a1c4 with SMTP id
 d9443c01a7336-2008552d030mr595535ad.25.1722977391739; Tue, 06 Aug 2024
 13:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com> <20240730125023.710237-6-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-6-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:49:40 +0200
Message-ID: <CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_134952_934233_C7AA1E06 
X-CRM114-Status: GOOD (  21.18  )
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

SGkgSmVyb21lLAoKT24gVHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVu
ZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoaXMgcHJlcGFyZXMgdGhlIG1p
Z3JhdGlvbiB0byByZWdtYXAgdXNhZ2UuCj4KPiBUbyBwcm9wZXJseSBzZXR1cCByZWdtYXAsIHRo
ZSBBUEIgbmVlZHMgdG8gYmUgaW4gd29ya2luZyBvcmRlci4KPiBUaGlzIGlzIGVhc2llciBoYW5k
bGVkIGlmIHRoZSByZXNldHMgYXJlIG5vdCBtaXhlZCB3aXRoIGh3IGluaXQuCj4KPiBNb3JlIGNo
ZWNrcyBhcmUgcmVxdWlyZWQgdG8gZGV0ZXJtaW5lIGlmIHRoZSByZXNldHMgYXJlIG5lZWRlZAo+
IG9uIHJlc3VtZSBvciBub3QuIEFkZCBhIG5vdGUgZm9yIHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDE0ICsrKysrKysrKy0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiBpbmRleCA1Y2QzMjY0YWI4NzQuLjQ3YWEzZTE4NGU5
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC01ODEsMTEg
KzU4MSw2IEBAIHN0YXRpYyB2b2lkIG1lc29uX2R3X2hkbWlfaW5pdChzdHJ1Y3QgbWVzb25fZHdf
aGRtaSAqbWVzb25fZHdfaGRtaSkKPiAgICAgICAgIC8qIEJyaW5nIEhETUlUWCBNRU0gb3V0cHV0
IG9mIHBvd2VyIGRvd24gKi8KPiAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5oaGks
IEhISV9NRU1fUERfUkVHMCwgMHhmZiA8PCA4LCAwKTsKPgo+IC0gICAgICAgLyogUmVzZXQgSERN
SVRYIEFQQiAmIFRYICYgUEhZICovCj4gLSAgICAgICByZXNldF9jb250cm9sX3Jlc2V0KG1lc29u
X2R3X2hkbWktPmhkbWl0eF9hcGIpOwo+IC0gICAgICAgcmVzZXRfY29udHJvbF9yZXNldChtZXNv
bl9kd19oZG1pLT5oZG1pdHhfY3RybCk7Cj4gLSAgICAgICByZXNldF9jb250cm9sX3Jlc2V0KG1l
c29uX2R3X2hkbWktPmhkbWl0eF9waHkpOwo+IC0KPiAgICAgICAgIC8qIEVuYWJsZSBBUEIzIGZh
aWwgb24gZXJyb3IgKi8KPiAgICAgICAgIGlmICghbWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJp
diwgVlBVX0NPTVBBVElCTEVfRzEyQSkpIHsKPiAgICAgICAgICAgICAgICAgd3JpdGVsX2JpdHNf
cmVsYXhlZChCSVQoMTUpLCBCSVQoMTUpLAo+IEBAIC02NzUsNiArNjcwLDEwIEBAIHN0YXRpYyBp
bnQgbWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihtZXNvbl9kd19oZG1pLT5o
ZG1pdHhfcGh5KTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgcmVzZXRfY29udHJvbF9yZXNldCht
ZXNvbl9kd19oZG1pLT5oZG1pdHhfYXBiKTsKPiArICAgICAgIHJlc2V0X2NvbnRyb2xfcmVzZXQo
bWVzb25fZHdfaGRtaS0+aGRtaXR4X2N0cmwpOwo+ICsgICAgICAgcmVzZXRfY29udHJvbF9yZXNl
dChtZXNvbl9kd19oZG1pLT5oZG1pdHhfcGh5KTsKVGhlIG9sZCBvdXQgb2YgdHJlZSB2ZW5kb3Ig
ZHJpdmVyIFswXSBlbmFibGVzIHRoZSAiaXNmciIgYW5kICJpYWhiIgooaW4gUF9ISElfSERNSV9D
TEtfQ05UTCBhbmQgUF9ISElfR0NMS19NUEVHMikgY2xvY2tzIGJlZm9yZSB0cmlnZ2VyaW5nCnRo
ZSByZXNldHMuClByZXZpb3VzbHkgbWVzb25fZHdfaGRtaSdzIGJlaGF2aW9yIHdhcyBpZGVudGlj
YWwgYXMgaXQgZW5hYmxlZCB0aGUKY2xvY2tzIGluIG1lc29uX2R3X2hkbWlfYmluZCgpIGFuZCBv
bmx5IGxhdGVyIHRyaWdnZXJlZCB0aGUgcmVzZXRzLgoKSSdtIHRvdGFsbHkgZmluZSB3aXRoIG1v
dmluZyB0aGUgcmVzZXRzIHRvIG1lc29uX2R3X2hkbWlfYmluZCgpIGJ1dCBJCnRoaW5rIGl0IHNo
b3VsZCBoYXBwZW4gYWZ0ZXIgZGV2bV9jbGtfYnVsa19nZXRfYWxsX2VuYWJsZSgpIGhhcyBiZWVu
CmNhbGxlZCAodG8ga2VlcCB0aGUgb3JkZXIgYW5kIHRodXMgYXZvaWQgc2lkZS1lZmZlY3RzIHRo
YXQgd2UgZG9uJ3QKa25vdyBhYm91dCB5ZXQpLgoKQWxzbyBvdXQgb2YgY3VyaW9zaXR5OiBhcmUg
eW91IHBsYW5uaW5nIHRvIGNvbnZlcnQgdGhlIGRyaXZlciB0byB1c2UKZGV2bV9yZXNldF9jb250
cm9sX2J1bGtfZ2V0X2V4Y2x1c2l2ZSgpPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgoKWzBdIGh0
dHBzOi8vZ2l0aHViLmNvbS9lbmRsZXNzbS9saW51eC1zOTA1eC9ibG9iL21hc3Rlci9kcml2ZXJz
L2FtbG9naWMvaGRtaS9oZG1pX3R4XzIwL2h3L2hkbWlfdHhfaHcuYyNMNDcwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
