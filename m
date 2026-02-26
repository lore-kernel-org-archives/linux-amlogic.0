Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92523FD9E1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mf/QpELc7nkNCPDlkUzOt/ufLjVGX0Zm53OzdFHof0g=; b=xKdrzEz3JYR1nx
	Yd822wBD08l+nvX8EG4loK9cW2CuGFPQK4gL8johF4V4dKYvPzT174k9DlL+GZaXqRx2tElTnGy9N
	c1bMXHaMR0NdXpLTXLPxZIIoShgJVMQFNqSu69NPZJXc7riQ5rYX0FphsbEzurI2jvx/mc8A+o7XQ
	U3tW1BKEbXkBcFxQgnJLgES+NT2/nEXxVWONcu76QmVlOh2iQo85w0a6RVe278sPUZzwcZvjdejor
	ydWRSc7K7feTiQbXQ2Jnx3yYOw9bhIWviyjvIbebdbChXe1Bs784wPpR6ZF6y2/22BopkMxYCoYmu
	CPM33ujCbek31jq7g64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjbG-00000007Hr2-3Gae;
	Thu, 26 Feb 2026 22:12:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjbE-00000007Hqf-1XL9
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 22:12:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2adae92249eso14968855ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 14:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772143967; cv=none;
        d=google.com; s=arc-20240605;
        b=QykYdX4OxRdRs3bHfEZxB+Dva9CwE6JgT7/IYZVrsyVRO6iqNQ6PmZ+F4DHaJvj+Du
         CoHyqMdvki76/lj8yJXsRdMw1BJEiLVguUVWyvLEc3V5d2mUGzL0h8yaiRrpbOT4+Cqf
         vNkQNyz6Peb+hdDzPbSs0uHSsuaffKZ4nhywX2D9vA4by1Opjcb4mefIO5NFiNfyLis8
         jJAsu6gWNNW3RgBGAihLzdR2vM45WTCPI+PwBn4IQQZVUNlffaU2gmKGLpBJmwfZaq30
         LtvHmcbBiwFgE0JK1wQ6TRm5wEVRTy/mVIe/m9LOcU4+La4munpz5ZSyulAQpJn4n8JX
         A3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
        fh=tKcqtustbYnBhkb2PY2QXRhoSwYrF6f2tLcSChUeNRk=;
        b=TMwF6xQne0IUAU7i23URyhqHgH2gGsiU0FGhjKOrK3RVMAQngpAUrHw1OfKModNnw1
         KKHoe8GJjbCdmqfTIac+gT6CtgefkHFLLagXN6K71UT0szyd9+9RYb61bphjMLDxEnaC
         E0ul25x6y+0/UGRQRjNG5H42GCbroCzmwv3LfeC/P4SL2eWGAazx3aNakf84WJV/JEKl
         j58SQuXbx3lkftl1ySSsvNXX5mvO4kGb3OBwvg7CM3zrsB+9AU7cjl/GHt0fpsfMlB1+
         oBZaWy+Lu/+9+5hvpCP5GcrV5SUGa9EWVivvS/GvUeNjJQPuO2bhRXEyCogwNsFgrO3d
         RRzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772143967; x=1772748767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
        b=kzV0sXE9OPbcdn4cZ/Hi0zE4ZSeB01CRZoSjqyEImGV3CrER0I33S9sITPG7MTxToJ
         fUfkC7SzcYOOxtzZXka4yM4beXR0589mrbxPPeGAHDQEk3jqR/eKeB7kbtk3Yeco/uYq
         /l3hoXXQx3rCYCG7Fi8vaXV1tnUGLdWMDkqENRpL8JHwDT/2PQpguChlrzE21HrHSjl0
         Yb5Carpt3ypOfWJJjplBIFK7m1qPQqzoopVrKtdQ7HrV9Pj/mT+IYg0xvCGuxKZyWKW0
         1qobRu+0+PNtR9TxO+EhzxsnUEE8cpHJb8qdQfG0lcEtBcnni8atVMHhhyIJjIFtXdCe
         K0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772143967; x=1772748767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
        b=utC2IRVLn6FD296W+YSUDseODX79DsoXUXyK0XfhpfGtv1glHuOOtbR/eQWNa6er8u
         kFnfsYK8kwzMPQ3C3F3cPeTvYjVHQcqsdv+BWv+78Tr3IISXwQg1YsWfj2+jk6ZLFngz
         fBlipdylzjfirPTnZzdWPSJSvxb1FUDCuTOejMMesPg59YE3O9/JuGZgfKTEZHT29/sp
         fnKHL5o+siYR2zHkLetxy80NJYv1GOIEI+KF5UM0cVQ1s0GAY4HPY1LWBqld3HCNTZlW
         o0IRKoTaRc5x7UfmMxpRKHBHduIbAczNilHJK3kmdoC8Gu5FKHgIqmFIxnh/+P7ng9GM
         0JZg==
X-Forwarded-Encrypted: i=1; AJvYcCV7MYkqlkoWjaR0Dso9Q6jY9yLuYrEZeDx9LlGVXuCZAjTRpUBIBM/YRQafj27y3RHqgwfxLcc7ANfH4b1T@lists.infradead.org
X-Gm-Message-State: AOJu0YzAvfB2RgP41krfTjTQXFRIt6/98jX4xD6GbbgrzW7U/ruR3oJa
	KcCa0CvWPtl5M9zPMM0tCp47ujK80PD6XRF1hlePz/tE6ChxZ6pKLSxxQP7DjcE+KQmRnzM/cRD
	SHBjHLadI1HNWbpdMGnYTTBVv6IE7SFs=
X-Gm-Gg: ATEYQzwE4sEXkoQvm8WZm/vpo3WHoesPTjP+2j0Hs+IDeVq+3F79f3Sh2KH94L14rJA
	iVLnyN0MBxQ+S5Vw6m6YwGwiPu0+1qy2CoOwmDRr2jJ4gU/lY4SjN3nZJ6RbBiUF8VuaTf27zRw
	ayEoNDNd5Ilonat1XUtAfRwZJUoPrIQVWFCiJYp/ou6hw0XZD4X+S330n9bcj/rS/YBCJLVp9t5
	O3BdcQvqBv2VIhVZkCoeWsZJMqIE+kkY1oV9QtWlISgT7cFsqX8W7TJcFghBglFIsGRm35wNZh/
	43eygi1qm5MJ8k1SXnyvKZfV6Ramy61OmMYhz0mI
X-Received: by 2002:a17:903:320b:b0:2ad:e02b:4611 with SMTP id
 d9443c01a7336-2ae2e3e72d5mr3996095ad.1.1772143967525; Thu, 26 Feb 2026
 14:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org> <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
 <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com> <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
In-Reply-To: <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 23:12:36 +0100
X-Gm-Features: AaiRm514KD-jvhe4Mc00x3-Pl2br1wbWE2jRwOOzJuKIUOLmGlOAejSAJtw8638
Message-ID: <CAFBinCCcHXtXmgd221tpseUtOiPPgD07BbNvgT=9=739y=xzXQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic S4
To: Ao Xu <ao.xu@amlogic.com>
Cc: neil.armstrong@linaro.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_141248_414630_27A46001 
X-CRM114-Status: GOOD (  35.78  )
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

SGkgQW8gWHUsCgpPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCA3OjA24oCvQU0gQW8gWHUgPGFvLnh1
QGFtbG9naWMuY29tPiB3cm90ZToKWy4uLl0KPiA+IEkgaGF2ZSB0d28gcXVlc3Rpb25zIGhlcmU6
Cj4gPiAtIEhvdyBpcyBwZXItU29DIHJlZ2lzdGVyIGFjY2VzcyBtYW5hZ2VkPwo+ID4gLSBIb3cg
YXJlICJjb21tb24iIChzaGFyZWQgYWNyb3NzIG11bHRpcGxlIC0gb3IgZXZlbiBhbGwgU29DcykK
PiA+IHJlZ2lzdGVycyBtYW5hZ2VkPwo+ID4KPiA+IEl0IHNlZW1zIHRoYXQgdGhlIGtvbWVkYSBk
cml2ZXIgdXNlcyBrb21lZGFfZGV2X2Z1bmNzIGZvciB0aGUKPiA+IHBlci12YXJpYW50IGFjY2Vz
cy4KPiA+IEhvd2V2ZXIsIGl0J3Mgbm90IGNsZWFyIGhvdyB0aGlzIHNjYWxlcyBhcyBvbmx5IHR3
byBtb3N0bHkgaWRlbnRpY2FsCj4gPiBkaXNwbGF5IGNvbnRyb2xsZXJzIChEMzIgYW5kIEQ3MSkg
ZXZlciBtYWRlIGl0IGludG8gdGhlIGRyaXZlci4KPgo+IEkgd291bGQgbGlrZSB0byBmaXJzdCBk
ZXNjcmliZSB0aGUgY3VycmVudCBzdGF0ZS4KPgo+ICAgICBJbiBhdG9taWNfdXBkYXRlIGFuZCBh
dG9taWNfZGlzYWJsZSwgcmVnaXN0ZXIgdmFsdWVzIGFyZSBkZXJpdmVkCj4gICAgIGZyb20gdGhl
IHByb3BlcnR5IGluZm9ybWF0aW9uIGFuZCBzdG9yZWQgaW50byB0aGUgcHJpdi0+dml1IGFuZAo+
ICAgICBwcml2LT5hZmJjIHN0cnVjdHVyZXMuCj4gICAgIEluIG1lc29uX2NydGNfaXJxLCB0aGUg
cHJldmlvdXNseSBzYXZlZCB2YWx1ZXMgYXJlIHRoZW4gd3JpdHRlbiBpbnRvCj4gICAgIHRoZSBo
YXJkd2FyZSByZWdpc3RlcnMuCj4KPiBJbiBmdXR1cmUgU29Dcywgd2UgbWF5IGVuY291bnRlciB0
aGUgZm9sbG93aW5nIHNjZW5hcmlvczoKPgo+ICAgKiBUaGUgcmVnaXN0ZXIgYWRkcmVzc2VzIG9m
IGEgZ2l2ZW4gYmxvY2sgbWF5IGNoYW5nZS4gRm9yIGV4YW1wbGUsIG9uCj4gICAgIFM5MDVYMiwg
dGhlIE9TRDEgc2NhbGVyIHJlZ2lzdGVycyBhcmUgbG9jYXRlZCBhdCAweDFkYzDigJMweDFkY2Qs
Cj4gICAgIHdoaWxlIG9uIEEzMTFEMiwgdGhlIHNhbWUgT1NEMSBzY2FsZXIgcmVnaXN0ZXJzIG1v
dmUgdG8gMHg1YTAw4oCTMHg1YTBkLgo+ICAgKiBBIGJsb2NrJ3MgZnVuY3Rpb25hbGl0eSBtYXkg
YmUgcmVkdWNlZCBvciBleHRlbmRlZCwgd2hpY2ggY2FuCj4gICAgIGluY2x1ZGUgY2hhbmdlcyB0
byBleGlzdGluZyByZWdpc3RlciBiaXRzIG9yIHRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3Cj4gICAg
IGNvbnRyb2wgcmVnaXN0ZXJzLiBGb3IgaW5zdGFuY2UsIHRoZSBPU0QgTUlGIGJsb2NrIHByZXZp
b3VzbHkKPiAgICAgcmVxdWlyZWQgY2FudmFzIGNvbmZpZ3VyYXRpb24sIHdoaWxlIG9uIFQ3QyB0
aGUgY2FudmFzIG1lY2hhbmlzbSBpcwo+ICAgICBjb21wbGV0ZWx5IHJlbW92ZWQuCj4gICAqIEFu
IGVudGlyZSBibG9jayBtYXkgYmUgcmVtb3ZlZCBvciBuZXdseSBhZGRlZC4gRm9yIGV4YW1wbGUs
IEdGQ0QsCj4gICAgIHdoaWNoIGludGVybmFsbHkgaW50ZWdyYXRlcyBBRkJDIGFuZCBBRlJDIGhh
cmR3YXJlIG1vZHVsZXMsIGlzCj4gICAgIHByZXNlbnQgb24gQTkuCj4KPiBSZWdpc3RlciBwcm9n
cmFtbWluZyBpcyBwZXJmb3JtZWQgdGhyb3VnaCBSRE1BIGhhcmR3YXJlLldoZW4gUkRNQSBpcwo+
IGF2YWlsYWJsZSwgdGhlIGZsb3cgaXMgZGlmZmVyZW50Lgo+Cj4gICAgIEluIGF0b21pY191cGRh
dGUgYW5kIGF0b21pY19kaXNhYmxlLCByZWdpc3RlciB2YWx1ZXMgYXJlIHdyaXR0ZW4KPiAgICAg
ZGlyZWN0bHkgaW50byB0aGUgUkRNQSByZWdpc3RlciB0YWJsZSwgYW5kIHRoZXJlIGlzIG5vIG5l
ZWQgdG8gY2FjaGUKPiAgICAgdGhlIHJlZ2lzdGVyIHZhbHVlcyBpbiBzb2Z0d2FyZS4KPiAgICAg
T25jZSBhbGwgcmVnaXN0ZXIgd3JpdGVzIGFyZSBwcmVwYXJlZCwgcmRtYV9jb25maWcgaXMgdXNl
ZCB0byBsZXQKPiAgICAgdGhlIGhhcmR3YXJlIGZsdXNoIHRoZSBSRE1BIHJlZ2lzdGVyIHRhYmxl
IGludG8gdGhlIHJlYWwgcmVnaXN0ZXJzCj4gICAgIG9uIHRoZSBuZXh0IFZTeW5jLgo+Cj4gT24g
YSBnaXZlbiBTb0MsIGVhY2ggaW50ZXJuYWwgYmxvY2sgY29udGFpbnMgZmllbGRzIHRoYXQgZGV0
ZXJtaW5lIHdoaWNoCj4gcmVnaXN0ZXIgc2V0IGl0IHNob3VsZCB1c2UuCj4gVGhpcyBpbmZvcm1h
dGlvbiBpcyBTb0Mtc3BlY2lmaWMgYW5kIG11c3QgYmUgcHJvdmlkZWQgYnkgdGhlIFNvQyBkZXNj
cmlwdGlvbgpUaGFuayB5b3UgZm9yIHByb3ZpZGluZyBtb3JlIGRldGFpbGVkIGluc2lnaHQgaW50
byB5b3VyIGlkZWEuCk92ZXJhbGwgdGhlIGFwcHJvYWNoIG1ha2VzIHNlbnNlIHRvIG1lLiBJbiBt
eSBvd24gd29yZHMgdGhhdCBpczoKc2VwYXJhdGUgY29kZSB0aGF0J3MgZGlmZmVyZW50IHBlci1T
b0MuCgpXaGF0J3MgaW1wb3J0YW50IHRvIG1lIGlzIHRvIHN0aWxsIHJldXNlL3NoYXJlIGNvZGUg
d2hlcmUgcG9zc2libGUuCkknbSB1c2luZyBtZXNvbl9vdmVybGF5LmMgKGV2ZW4gaWYgdGhpcyBp
cyBub3QgaGlnaCBvbiB5b3VyIHByaW9yaXR5Cmxpc3QpIGFzIGFuIGV4YW1wbGU6Ci0gRzEyQSBy
ZXF1aXJlcyBzcGVjaWFsIGhhbmRsaW5nIGluIG1lc29uX292ZXJsYXlfYXRvbWljX2Rpc2FibGUo
KQotIHRoZSByZXN0IG9mIHRoZSBjb2RlIGluIHRoaXMgZmlsZSB3b3JrcyBmb3IgYWxsIFNvQ3MK
Q29weWluZyB0aGUgd2hvbGUgZmlsZSAoODAwKyBsaW5lcyBvZiBjb2RlKSBhbmQgdGhlbiBjaGFu
Z2luZyA1IGxpbmVzCmluIF9hdG9taWNfZGlzYWJsZSgpIChpbiBlYWNoIGNvcHkgb2YgdGhlIGZp
bGUpIHdpbGwgYmUgaGFyZCB0bwp1bmRlcnN0YW5kIGFuZCBtYWludGFpbi4KCk9yIGluIG90aGVy
IHdvcmRzOiBJIGxpa2UgeW91ciBhcHByb2FjaCBvZiBhbGxvd2luZyBtb3JlIGZsZXhpYmlsaXR5
CnRvIGhhbmRsZSBwZXItU29DIHNwZWNpZmljcy4gUGxlYXNlIG1ha2Ugc3VyZSB0byBub3QgZHVw
bGljYXRlCmNvbW1vbi9zaGFyZWQgY29kZS4KCj4gPgo+ID4+IFRoaXMgaXMgYWNoaWV2ZWQgYnkg
aW50cm9kdWNpbmcgZm91ciBjb3JlIG9iamVjdHMsIGFzIHNob3duIGluIHRoZQo+ID4+IGF0dGFj
aGVkIGNsYXNzLWRpYWdyYW0gZG9jdW1lbnQuCj4gPj4KPiA+PiAtIG1lc29uX3ZwdV9ibG9jawo+
ID4+IC0gbWVzb25fdnB1X2Jsb2NrX3N0YXRlCj4gPj4gLSBtZXNvbl9waXBlbGluZQo+ID4+IC0g
bWVzb25fcGlwZWxpbmVfc3RhdGUKPiA+Pgo+ID4+Cj4gPj4gVGhlIGF0b21pYyBmbG93IGlzIHN0
cnVjdHVyZWQgYXMgc2hvd24gaW4gdGhlIGF0dGFjaGVkIGNvbW1pdC1mbG93IGRvY3VtZW50Lgo+
ID4gVGhlIHB1YmxpYyBBMzExRCBkYXRhc2hlZXQgcGFnZSAzMDQgWzBdIHNob3dzIHRoYXQgQ1ZC
UywgSERNSVRYIGFuZAo+ID4gTUlQSV9EU0kgYXJlIHBhcnQgb2YgdGhlIFZQVSBibG9jay4KPiA+
IFRob3NlIGFyZW4ndCBtZW50aW9uZWQgaW4geW91ciBmbG93cy4gSXMgdGhhdCBiZWNhdXNlIHRo
ZXkgYXJlICJhZnRlciIKPiA+IFBPU1RCTEVORCBhbmQgd291bGQgdGhlcmVmb3JlIGJlIHBhcnQg
b2YgYSBmdXR1cmUgcmVmYWN0b3JpbmcKPiA+IGFwcHJvYWNoPwo+IFRoaXMgcHJvcG9zYWwgZm9j
dXNlcyBvbmx5IG9uIFZQVSBPU0QgYW5kIHZpZGVvLXJlbGF0ZWQgYmxvY2tzLgo+IEVuY29kZXIg
YW5kIGNvbm5lY3RvciBoYW5kbGluZyBpcyBhIHNlcGFyYXRlIGFuZCBtdWNoIGxhcmdlciB0b3Bp
Yy4KPiBJIGFtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGhvdyB0byByZXVzZSBleGlzdGluZyBQ
SFkgYW5kIGNsb2NrIHRyZWUKPiBpbnRlcmZhY2VzIGZvciB0aGF0IHBhcnQsIGJ1dCBpdCBpcyBp
bnRlbnRpb25hbGx5IGtlcHQgb3V0IG9mIHRoaXMKPiBwcm9wb3NhbC4KVW5kZXJzdG9vZC4gSSBz
dGFydGVkIGxvb2tpbmcgaW50byBtYW5hZ2luZyB0aGUgUEhZIGNsb2NrcyBhIHdoaWxlIGFnbwpm
b3IgTWVzb244LzhiLzhtMiAodGhvc2UgYXJlIDMyLWJpdCBBUk0gU29DcykgYW5kIGl0J3Mgbm90
IHN0cmFpZ2h0CmZvcndhcmQuIFNvIGxldCdzIGluZGVlZCBzYXZlIHRoZW0gZm9yIGEgbGF0ZXIg
ZGF0ZS4KCj4gPgo+ID4gQWxzbyBSTURBIGlzIHNob3duIGluIHRoZSBzYW1lIGRpYWdyYW0gYXMg
cGFydCBvZiBWUFUuIE5laWwgaGFkIHRvCj4gPiB3b3JrIGhhcmQgdG8gaW1wbGVtZW50IGl0IGJh
Y2sgdGhlbiBmb3IgQUZCQy4KPiA+IFlvdSBoYXZlbid0IGxpc3RlZCBpdCBpbiB5b3VyIGRpYWdy
YW1zIGJ1dCBJIGFzc3VtZSBpdCBpcyBnb2luZyB0byBiZQo+ID4gcGFydCBvZiB0aGUgaW1wbGVt
ZW50YXRpb24gYXMgaXQgaXMvd2FzIG1hbmRhdG9yeSBmb3IgQUZCQy4KPiA+IENhbiB5b3UgY29u
ZmlybSBteSB1bmRlcnN0YW5kaW5nIGhlcmUgKG9yIGNsZWFyIHVwIG15IGNvbmZ1c2lvbik/Cj4g
WWVzLCB3ZSB3aWxsIGFkZCBSRE1BIGZ1bmN0aW9uIHN1cHBvcnQgZmlyc3RseS4KVGhhdCdzIGdy
ZWF0IHRvIGhlYXIgLSB0aGFuayB5b3UhCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
