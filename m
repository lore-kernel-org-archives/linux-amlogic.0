Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EDFC79FB6
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Sep 2026 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig5nnbLvfdUu0ZLJacEfxHECuqg2lX7pyMibvM6U+5s=; b=cxSs9SVxrkFPur
	cjGRZ3w6ik4gNsrRQ7CUt/bJiLbw1l9R6w7/Z1gDmCp314N+qsRdzTgCzUkQ7ZGDcbf2wNXEMMK9F
	WyI7gwJ05eSxsA2sbg/d/doqb7iyPZ3WqKe32PcwlIqi5oEl3A7r+5K6bjBO6IjfQl+ReOairAs+c
	C1PIU/jP9uUWgWqZvPNOcGkhcpFdMBhDQNFzkIjcIPALibJXgFoDvQAIslSmdnWAIMN5g2yLYlB9s
	dPW+8rz/mGNyPYgtIIq2FoOGAMmUYOGX2balgstp2jwqiw2vNpmnXlSlisjB2m3rUgFSrahqYUivp
	nx6RQoOl+e57byibOj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IaO-00000000fXo-2kQ3;
	Sat, 12 Sep 2026 07:55:46 +0000
Received: from mail-oo2-f43.google.com ([74.125.231.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IaM-00000000fXT-2nrL
	for linux-amlogic@lists.infradead.org;
	Sat, 12 Sep 2026 07:55:43 +0000
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so616394a34.3
        for <linux-amlogic@lists.infradead.org>; Sat, 12 Sep 2026 00:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789199741; x=1789804541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
        b=L+EWY1QUMQbS2JpFmXN6VHKRGTWElAS4n0yEbUx3L9RIRWPaVYFZOea7BWGDVyYP68
         pYMvq8prMMJtEUIQzF67HkDpBtca+vHDFzg6GlCq0JHV854kejqTMRRNb08DBv6nbYcf
         OmO89ju5z6NxfSWWtdMA7VgAitkUnzTI0eDYjXV9/PYYEYDj4cuoVumqhVBP+I7lBzss
         2UqySMxjNZdxlH3o8RXQXOXIO7oYFVWCQVXcvNweNIucGZ0sGu0O8Zd6XZ+mhSSn9vby
         dABdKhTH5B5Wh3lfpINJDDD/fsKn6aPG2MkUnntlwC4u72w4jIa9z0e73XyDDLrEsLPd
         c1/A==
X-Forwarded-Encrypted: i=1; AKwUvBxY9qukeVcyy+1FT0aNAjjKUpWWh/a61NLL1nUX5C6sV3RUdHJhzG0pTu3UbseKgGCmFFQhdI9IcmpScitl@lists.infradead.org
X-Gm-Message-State: AFuF++k3zK/vDLmym5UdECn6Ga5d0JtAfvNt4D36fJGhCG+x6mJCwIqG
	7Ufo3avzMwVbaJOvm0WSevcC4+F729mYEUOx8pWzwcIhrW69ix626gWaCw+B7fWQp8VjgQ==
X-Gm-Gg: AYBFou1kKV2CFsQ9VkUCVEAL8QFFDYOB732PI8/8cHgu4CQUJxRp/H1BfK6QuhdpcrB
	w5oTrMxJIfBEb8bWZQzYFvBOC2vbD31uh2kLE5LNlL/JzOZlfdnM/Sc7qmkiAOT/hWPwBoNTkL5
	GQbUS/b41SPPdVjTgRHr98ebxcHnJuU2Z2UKW83EvhZeHymvIXqSNK3UTCPoyCqaKbi4AfSB1fM
	JjkHVSfyl8zUnY3WNUuKtokwEZedZQOj5jjDXBrExMGaR5P1bSvakxN5QwsdPB4Caz2eiKeVeTX
	xkA0p474oKipdynTT8vpuxgVkwuUchEOPM7pCFVFySgQVciKizToeu9e+Hl0TQpemVas8m1+bgV
	G86A+ALIQ93bxP8carxX1ywFH3kgmRk2cH9vswAnRTIB/KB3NjKscGBceVo0L5FxvQp3UCy9lpV
	b0yCF6ssUVhEbAl0oH6XoDwULG67B9PTnewj3XsWOv/T3BJQbJDGfywc4/DyQiDNop6Pl5IGUy0
	4DjGcRCISoVSa0C3I0SduqEP8RFywC2Bs5syjqBBozLu8BkSyTPeW/8rNOe4dZX
X-Received: by 2002:a05:6830:2690:b0:7e6:d384:459e with SMTP id 46e09a7af769-803fdfc94ffmr11482367a34.3.1789199741222;
        Sat, 12 Sep 2026 00:55:41 -0700 (PDT)
Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com. [74.125.231.170])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670eeccsm4907397a34.21.2026.09.12.00.55.40
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:55:40 -0700 (PDT)
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso513067a34.0
        for <linux-amlogic@lists.infradead.org>; Sat, 12 Sep 2026 00:55:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzQ6Y4g6eU4lwYF2MOVFUhIxmtnLs8Is324MKcNCMxdCYf/Iie0/tVSvuKOCb05S6LbhC2oPdoYw31LGD3@lists.infradead.org
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id
 00721157ae682-884b4b01ddamr30061107b3.33.1789199423193; Sat, 12 Sep 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com>
In-Reply-To: <aqSX-kUvYaixESxe@redhat.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 12 Sep 2026 08:50:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
X-Gm-Features: AcwNN1V-hZOzugyfoJiJeFS5rmMdeoAyBQ6wZJLEfk_Dvgzhb0zC99WtQCvbVRg
Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_005542_711357_638797F4 
X-CRM114-Status: GOOD (  21.58  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMTowOOKAr0FNIEJyaWFuIE1hc25leSA8Ym1hc25leUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpIEx1Y2FzLAo+Cj4gT24gU2F0LCBTZXAgMDUsIDIwMjYg
YXQgMDQ6MzI6MzRQTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gc3lzX2FtcGlwZV9u
YW5kIGNsb2NrcyB0aGUgcGlwZWxpbmUgc3RhZ2UgaW5zZXJ0ZWQgaW4gdGhlIGJ1cyBwYXRoCj4g
PiBiZXR3ZWVuIHRoZSBTRC9lTU1DIGNvbnRyb2xsZXJzIGFuZCB0aGUgTklDX01BVFJJWCBmYWJy
aWMuIEl0IGRvZXMgaGF2ZQo+ID4gaWRlbnRpZmlhYmxlIGNvbnN1bWVycyAtIHRoZSB0aHJlZSBN
TUMgY29udHJvbGxlcnMgLSBzbyBtYXJraW5nIGl0Cj4gPiBjcml0aWNhbCB3YXMgdGhlIHdyb25n
IHRvb2w6IHRoZSBjbG9jayBzaG91bGQgYmUgcmVmZXJlbmNlZCBmcm9tIHRoZQo+ID4gY29uc3Vt
ZXIgbm9kZXMgYW5kIGNsYWltZWQgYnkgdGhlIG1tYyBkcml2ZXIgaW5zdGVhZC4KPiA+Cj4gPiBE
cm9wIHRoZSBDTEtfSVNfQ1JJVElDQUwgZmxhZyBhbmQgdXBkYXRlIHRoZSBjb21tZW50IGFjY29y
ZGluZ2x5Lgo+ID4gc3lzX2FtMmF4aTAuLjIgcmVtYWluIGNyaXRpY2FsIGFzIHRoZXkgY2xvY2sg
dGhlIEFYSSBETUEgYnVzIGl0c2VsZiBhbmQKPiA+IGhhdmUgbm8gc2luZ2xlIGlkZW50aWZpYWJs
ZSBjb25zdW1lci4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1mYWJsZS01Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiAtLS0K
PiA+IFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiB0aGUgTU1DIGNvbnRyb2xsZXJzIGFjdHVhbGx5IHJl
ZmVyZW5jaW5nIHRoZSBjbG9jazoKPiA+IHRoZSBkdC1iaW5kaW5ncywgbW1jIGRyaXZlciBhbmQg
dDcgRFRTIGNoYW5nZXMgYWRkaW5nIHRoZSAicGlwZWxpbmUiCj4gPiBjbG9jayBtdXN0IGxhbmQg
YmVmb3JlIHRoaXMgcGF0Y2gsIG90aGVyd2lzZSB0aGUgYm9vdCBoYW5ncyBhbmQgbWVtb3J5Cj4g
PiBjb3JydXB0aW9uIHRoaXMgY2xvY2sgY2F1c2VkIGFyZSByZWludHJvZHVjZWQuCj4KPiBUaGlz
IHNlcmllcyBzaG91bGQgYmUgbWVyZ2VkIHRvZ2V0aGVyIGluIG9uZSB0cmVlPyBXaGljaCB0cmVl
PyBJIGNhbgo+IHByb3ZpZGUgYW4gQWNrZWQtYnkgaWYgaXQgc2hvdWxkIGdvIHRocm91Z2ggdGhl
IG1tYyB0cmVlLgo+Cj4gQnJpYW4KPgpJdCdzIGRlZmluaXRlbHkgYmVzdCB0byBrZWVwIHRoZSBz
ZXJpZXMgdG9nZXRoZXIgaW4gb25lIHRyZWUgdG8gYXZvaWQKYm9vdCByZWdyZXNzaW9ucywKYnV0
IEkgdGhpbmsgdGhlIGNsayB0cmVlIGlzIHRoZSBiZXR0ZXIgZml0IHNpbmNlIHRoZSBjb3JlIGNo
YW5nZXMKcmV2b2x2ZSBhcm91bmQgY2xvY2sgbG9naWMuCkNvdWxkIHlvdSBhY2NlcHQgaXQgPwoK
dGhhbmtzCmx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
