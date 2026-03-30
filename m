Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684AE1061B24
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VXOs+PPJbWGQVixKMKfxLZdJbYcTBbov864R8VBxbM=; b=L4qxqBy5Z6ffgT
	BCZDPS7zPcCN0yKZkuE6JCxClYdhkOxk/dlHmdlcx+78Sxy0t9IxMZxRDz/CKZKWWq9sB0Au//k/i
	A/EY8sdhdvFYXIQjN6fxGM4W8kO1b5Rq0LYyaLoOIkZWBWrpk3/W3kLI7TxnTW7RwrsrSpQ0cT8NI
	+Qg8VT1BsiN2rljmFOKldPfupLAcSIHYfurEUTBASq+gNC7ZdNzzdlfaXCU/xvXowCUSK8j6pQXsf
	t8kdZBPoTGJ5sQgmIdg4J3yn/BN2wUkeJgy6boSfjIaR7mt0qqDSV9bpYxxmud2wU1eHN8il2iLrA
	RRp1oYBpMDAoMFqAlcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KPc-0000000BvH5-3gyG;
	Mon, 30 Mar 2026 21:44:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KPb-0000000BvGR-0uUH
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 21:44:44 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b2589c26e3so9534635ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 14:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907082; cv=none;
        d=google.com; s=arc-20240605;
        b=U6RMGVMR7PhyrbywuelcvoMye72Ngkhq515uCC+yoe67j140p7TLqnS2K7ZyL4FLBH
         qlePypm3fR85c6q+xDmFBM2/9pWeHbpRmSNf+W2wZvKfjNoeCpztXRmTxVlgFkHkbnLE
         cusAhbmQfUnylcpO3qoBVmCmyXRTqhQE6uzlp4NhNNaGIiqKO+Q7UNYpLgUVtSg7uXtn
         IOKeT6eU7qSOe5FGYmhh0m7cYHG7FZVeOfnqFQXIAqU08GdNKNUQL+JOAz9w4XmRQfE3
         1smDgNuehRwSVx0KAxvLybtMzYE6vKVgJZ3Ds8N6JXooLPqmsXeIhGThiWzTGwXUTc5c
         QnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        fh=ZS3dp2DcMcLxL+/ZdCWFe2N5Kal3xfmb4KT9kB8Jz7E=;
        b=B/xtF8l3VPVbFZktkjD3FYwfRNbg2WqOWM9Rh7Md3udF9TrcInO5G81gumtdZ9FOzE
         IaBGRcPWXDvK4RETCUn1myNaWQI+zw9oFigJrur50Zw956wtcuRJvX9/pkWAy1ACF/wi
         +UyMNs3b7MQDgOObgSdplc8OX1GEHj8tvLhRs+3ejPpZowfWBgiEECQhE/7gSOKXszMY
         9Ey2eSVPtiGtkmpmFRjV86iWC6+zg5478o2iPUU5DVrf2BkkkgZ6YDXCKGNZFK145vBR
         MgShHnmlSlQ3G335+Gcu1dCbiJ6u+j0oBgpG78P/DCZd+pbp4Pa58W3VOVLAUEbYoiHJ
         KinQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907082; x=1775511882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=SpN+QQ5NuJM91ngbAkNksJ3VOojl+xHb+3ckMmCNykTWtAZrrThPYFmC2qq1WeOxoU
         uqqFhzcpGcTo8Gg421Rj6b/J+jkDk/mcmRAhiYOXsHMJ6QPlcOG9J/TD/RaCkC0gZaKp
         EM1eANGoYC4bmKZBbUhKGMoSTCKDwERRwQBX+NlxIvifvxctauMh0kR9gfl0a28l6uaI
         8/X3mpWOyxWw9V2tXV2KJAPoYsvVTJ271I9cn1XIL3ELn/h1abPiA53wvNW9zTjgyzE/
         QMU+kO4zwULid8rCGmpbIickdCzcWOqLUn4lU6FpDIxBfDlgVMN8uCxvcRQhxLcr3HDq
         MBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907082; x=1775511882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=Ody8dpUqP4zxGh1h58z0r7xA6wqIypkcF/8JExgwAlouvpCEi5dQxhrtmCamBCMfZz
         T53E//cEESodp8CISQlUCWXtWaGmv6/19hXN3/R9nJ+0BuUyzY7hR9jDu3CPvJrzVAL9
         KGGSVGOMnP3nAfpeR5b8v5qpBAsB/QuWwILKiNRbLhnISn5T3602Y2fGJDEvHZt13gCw
         jr69Ty63Mwg4uuPsddFKfS4Dk5CStR7Nj0jlQnFbnd3ynMsM0pmapDmuF5RmmWoznb8v
         yOBxBEF4KWuR+2N1pGBZtgFGya8UnyABf83Aj25174q6qU+TedE9+bOd8L74XLaPWyuF
         uBgg==
X-Forwarded-Encrypted: i=1; AJvYcCXGo5hNFo58x60npcrQpw5Nb5hnveR0BcI7iAGg4FfTgRukkQvooctGfZAXpz7sFpQJo2vjEZlGc3cT7ymZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu106b+zU3ry5puzPvVgCuoHrYc6otNvDYJPvq49ix6WoengHW
	RLBoqorKdwJfscpIaWBuFPLQ3jPE4/+N+5h7h9Q58QeOA8GoLK9CpVuN64uav+UorRMd0blPtXD
	Dyv6/af0BZgnR4J0HOkcw/VscpwDHGrA=
X-Gm-Gg: ATEYQzzwhES7tiyHtrNj0S2236x30svCvTP8YEBCMXWQnsCmxkBdhSSkIwe6syliksu
	YU/MRZrK06xNS+lacRqFNijqVUXbzrV9aprxlnDjpXlzt730bcPQTupPl86iqEigL6uh/4y+Fwj
	799NSp5nljWR4UlzSECKLi1XccqMrbjCTqgd3bVks4z2ReOdKLrs3w9codarD7SSWAI/NobBqHS
	QVOFulGgwPnkY+afZOLx4smeuR03zchOSjKgMlNI1EZ4NYhV2hurq3n9O0e4A6ciPIcB8J7mPSA
	/0TIX3nIgzMR0A/SAzbXKjlgRAjIo7Mo66emcVCu
X-Received: by 2002:a17:902:e847:b0:2b2:54e5:b3af with SMTP id
 d9443c01a7336-2b254e5b653mr47612585ad.45.1774907082131; Mon, 30 Mar 2026
 14:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:44:31 +0200
X-Gm-Features: AQROBzDFiVgbyoC-RBIZt33tOxsaNE_LH0olelId_HKu2Jck3TyhrNiFIv2aRxY
Message-ID: <CAFBinCD-4dwp7pmM_GHK_N1kag_5VBZbP9VAwQOxcyg6aquj3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: meson: Add support for Amlogic S7
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_144443_262246_527723E4 
X-CRM114-Status: GOOD (  22.30  )
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

SGkgWGlhbndlaSBaaGFvLAoKT24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgNzozNeKAr0FNIFhpYW53
ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1s
b2dpYy5jb20+Cj4KPiBBZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBTNyBQV00uIEFtbG9naWMgUzcg
ZGlmZmVyZW50IGZyb20gdGhlCj4gcHJldmlvdXMgU29DcywgYSBjb250cm9sbGVyIGluY2x1ZGVz
IG9uZSBwd20sIGF0IHRoZSBzYW1lIHRpbWUsCj4gdGhlIGNvbnRyb2xsZXIgaGFzIG9ubHkgb25l
IGlucHV0IGNsb2NrIHNvdXJjZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlh
bndlaS56aGFvQGFtbG9naWMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8
IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBpbmRleCA4YzZiZjNk
NDk3NTMuLjNkMTY2OTRlMjU0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24u
Ywo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gQEAgLTExMyw2ICsxMTMsNyBAQCBz
dHJ1Y3QgbWVzb25fcHdtX2RhdGEgewo+ICAgICAgICAgaW50ICgqY2hhbm5lbHNfaW5pdCkoc3Ry
dWN0IHB3bV9jaGlwICpjaGlwKTsKPiAgICAgICAgIGJvb2wgaGFzX2NvbnN0YW50Owo+ICAgICAg
ICAgYm9vbCBoYXNfcG9sYXJpdHk7Cj4gKyAgICAgICBib29sIHNpbmdsZV9wd207CkF0IGZpcnN0
IEkgd2Fzbid0IHN1cmUgYWJvdXQgdGhpcyBhbmQgdGhvdWdodCB3ZSBzaG91bGQgcmVwbGFjZSBp
dAp3aXRoIGEgbnVtX3B3bXMgKG9yIHNpbWlsYXIpIHZhcmlhYmxlLgpIb3dldmVyLCBJIHRoaW5r
IGl0IHdpbGwgYmUgaGFyZCB0byBhZGQgYSB0aGlyZCAob3IgZXZlbiBtb3JlKQpjaGFubmVscyB0
byB0aGUgUFdNIGNvbnRyb2xsZXIgKG5vdCBqdXN0IGZyb20gZHJpdmVyIHBlcnNwZWN0aXZlIGJ1
dAphbHNvIGZyb20gaGFyZHdhcmUgcGVyc3BlY3RpdmUpLiBTbyBJIHRoaW5rIHRoaXMgaXMgZ29v
ZCBlbm91Z2ggYXMgdGhlCmNob2ljZSB3aWxsIG9ubHkgYmUgMSBvciAyLgoKWy4uLl0KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSBwd21fczdfZGF0YSA9IHsKPiArICAgICAg
IC5jaGFubmVsc19pbml0ID0gbWVzb25fcHdtX2luaXRfY2hhbm5lbHNfczcsCkkgdGhpbmsgeW91
IGNhbiB1c2UgLmNoYW5uZWxzX2luaXQgPSBtZXNvbl9wd21faW5pdF9jaGFubmVsc19zNCwgaWYK
eW91IGNoYW5nZSB0aGUgY29kZSBpbnNpZGUgdGhhdCBmdW5jdGlvbiBmcm9tOgogICAgZm9yIChp
ID0gMDsgaSA8IE1FU09OX05VTV9QV01TOyBpKyspIHsKdG86CiAgICBmb3IgKGkgPSAwOyBpIDwg
Y2hpcC0+bnB3bTsgaSsrKSB7CgpbLi4uXQo+IEBAIC02NTAsOSArNjc0LDEzIEBAIHN0YXRpYyBp
bnQgbWVzb25fcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAg
ICAgICAgIHN0cnVjdCBwd21fY2hpcCAqY2hpcDsKPiAgICAgICAgIHN0cnVjdCBtZXNvbl9wd20g
Km1lc29uOwo+ICsgICAgICAgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhICpwZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAgICAgICAgIGludCBlcnI7Cj4K
PiAtICAgICAgIGNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2MoJnBkZXYtPmRldiwgTUVTT05fTlVN
X1BXTVMsIHNpemVvZigqbWVzb24pKTsKPiArICAgICAgIGlmIChwZGF0YS0+c2luZ2xlX3B3bSkK
PiArICAgICAgICAgICAgICAgY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYygmcGRldi0+ZGV2LCAx
LCBzaXplb2YoKm1lc29uKSk7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGNoaXAg
PSBkZXZtX3B3bWNoaXBfYWxsb2MoJnBkZXYtPmRldiwgTUVTT05fTlVNX1BXTVMsIHNpemVvZigq
bWVzb24pKTsKSSBkb24ndCB0aGluayB0aGlzIGNvZGUgaXMgdG9vIGJhZCBmb3Igbm93LgpIb3dl
dmVyLCBJJ20gd29uZGVyaW5nIGlmIHlvdSB3YW50IHRvIG1ha2UgImNoYW5uZWxzIiBmcm9tIHN0
cnVjdAptZXNvbl9wd20gYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIgaW4gYSBmdXR1cmUgcGF0Y2gu
IEluIHRoYXQgY2FzZSBpdAp3aWxsIGJlIGhlbHBmdWwgdG8gaGF2ZSBhbiAidW5zaWduZWQgaW50
IG5wd20gPSBwZGF0YS0+c2luZ2xlX3B3bSA/IDEKOiBNRVNPTl9OVU1fUFdNUzsiIChvciBzaW1p
bGFyKSB2YXJpYWJsZSB0byBmdXR1cmUtcHJvb2YgeW91ciBjb2RlLgpXaGF0IGRvIHlvdSB0aGlu
az8KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
