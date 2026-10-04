Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE71CA5FE6
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttnjrim86rfgtyfl2Ayrj04uPVwCYpy+lShEPVpCTYw=; b=EfSBQe0p5j1RoZ
	if8/5gss6RpAACIkDuwuplnsShTIOA28JHX2AraZbPYaZnVKzcUvBH5j1U1KHTAdEubut1mzSQS++
	LC+AH4ZElRce0Mer/UAghUfZIW7QMI4QaYDdqTb1Dc0Q2gcgnJhT6MS79R90qKu3BFtZ2EzAo+d+C
	OrbZI4xLRpg+0WZXH/WZHwCo6RZDZGZO8P+Ff+WzwBEMg9St8VdC2toCt6RJEwmCq1lxgDYwOg0TN
	/lVKPWunVlEREC/Zy+005rysim+6/tHAsX7avoVkl87YVZsy27d0qxntmuXI+KzIca4Tsxh6KahQC
	4ygLQLwmRbH/IgSCqkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL65-0000000EmZA-2qac;
	Sun, 04 Oct 2026 12:13:41 +0000
Received: from mail-yx2-f40.google.com ([74.125.224.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL62-0000000EmYK-2MfS
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 12:13:40 +0000
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab42612328so5298597b3.0
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116016; x=1791720816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=;
        b=SmREYAmWYgR63t9Jn/l9G3nsOihTb7IRE5EQs37eqiLdIRHFDZdHSOP5/uT1KXD3Z2
         brMhhAvabRSMVPYC7y/nzl0RXyKJNcBknG1y8K5n8pY/jZgUvVkt1O48MqKnCdWK+Ezh
         B8E4/oO53I/MeiJ3E7/k3OcQZvz5KVpIDVzoeuQLnhUFSgleFubOOOWPGNYLY+cXxtWU
         QKAWE4U7ieqz34bDGDAffqq+ttM/Va+xCQZ7lHQpSjG659oDnOvunkjVwzKsq7nJTbxF
         PZQxAqgc5u7A+koqCF3cHVCStuJ2ULyUc7izYyiFQWcUsmjy8epnXCQApFBt6K88/qgS
         59Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzXCVaAdnGcekg9vnNee119GOi3nJW8Zy8mL3KC6MpfFTZ8BKODgFJfdS+VFhBw0wj2Nmg+2D4qJ+gnmObY@lists.infradead.org
X-Gm-Message-State: AFq9FYKN8nj10SvFeDBJ+oOkJnhRhceBm1tXkplkHVPnanWtPNYvQUKQ
	MXbNzsjpulRTo9dqjVbaVVh3MqqyQGGx0wi5zRbWtKKyK+bWpBkV4Cvn5TZTruGvB1U=
X-Gm-Gg: AYBFou027nYYDGDZSXe2Wahfmg+9mjxaREjjoI2U1KLIrSLjvQ42LgzNO9MVvqYYfmw
	4m1NDJbHQFq6rKYgobnuLE0D8NWm9PagV+v7iLoRLqg0tnHRwwxY9Ot1Kr5EeJ6n8te6sTn/8h6
	pXArtrmcDUQfPr0zgLkX8vvoMxgtcTAE7chnvOgQ90XKip4grCZyG1/pDY8amxdLB2Otyme9xsT
	43E8jo9Iybj/j8yTvAq36oZB0E9BWVhdj/4ZYPUpnFnmrAj2cL9gsdG2vVAKsCDL55ktFkuqvoM
	/zgwTNMnyUhbqf/QVG/2DBsNOajpc39YtP3seclk9DnDZHAVJtSv3qrsrceiYYEtNSK6MhDfxeS
	uHkV/4cb/GS7fjOiEKiOScJXhXEEc4oIGY9B7r0+z02I3HjQppJNmYvIVivHiKeIdl96E6Q3R/h
	NJMiNtu10baTxI19AffKLCqxj2UGDxvPJsFsuN/JtJg9/xmsK/7cHhVIgLwEN4oSrR7xue4bFfT
	vt0ZfecNP2NYVXrjtKnN0FwWei2l8bfFmP428R/LASmnZct3SWfBkEfCtL2Fzm5WuT8/GsYk08=
X-Received: by 2002:a05:690c:6893:b0:8ab:3d6a:a3f7 with SMTP id 00721157ae682-8ae39bea648mr28949237b3.26.1791116016310;
        Sun, 04 Oct 2026 05:13:36 -0700 (PDT)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com. [74.125.224.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33be0e58sm28681547b3.43.2026.10.04.05.13.34
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:13:35 -0700 (PDT)
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab42612328so5298437b3.0
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0md0LGkp0P1S9v1weAZDZrLGOAsx/WP2nnAwOel2qYwZAvkgLHEVqhJ1ZdW2CpzruSKMo666tCikO4Udg@lists.infradead.org
X-Received: by 2002:a05:690e:d01:b0:66f:7e05:c3f8 with SMTP id
 956f58d0204a3-677ac00785emr2680725d50.42.1791116014048; Sun, 04 Oct 2026
 05:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com> <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
 <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 4 Oct 2026 13:13:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
X-Gm-Features: AclHuK8rosb4K--WkyZLuEcRV46M1KSWdwcM-4rWMY7HfYobH2sNfTEc1o2MX3w
Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_051338_623296_129BFE47 
X-CRM114-Status: GOOD (  32.20  )
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

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgNDo1MeKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIHNhbS4gMTIgc2VwdC4gMjAyNiBhdCAwODo1MCwg
THVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToKPgo+ID4gT24gU2F0LCBTZXAg
MTIsIDIwMjYgYXQgMTowOOKAr0FNIEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPiB3
cm90ZToKPiA+Pgo+ID4+IEhpIEx1Y2FzLAo+ID4+Cj4gPj4gT24gU2F0LCBTZXAgMDUsIDIwMjYg
YXQgMDQ6MzI6MzRQTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4+ID4gc3lzX2FtcGlw
ZV9uYW5kIGNsb2NrcyB0aGUgcGlwZWxpbmUgc3RhZ2UgaW5zZXJ0ZWQgaW4gdGhlIGJ1cyBwYXRo
Cj4gPj4gPiBiZXR3ZWVuIHRoZSBTRC9lTU1DIGNvbnRyb2xsZXJzIGFuZCB0aGUgTklDX01BVFJJ
WCBmYWJyaWMuIEl0IGRvZXMgaGF2ZQo+ID4+ID4gaWRlbnRpZmlhYmxlIGNvbnN1bWVycyAtIHRo
ZSB0aHJlZSBNTUMgY29udHJvbGxlcnMgLSBzbyBtYXJraW5nIGl0Cj4gPj4gPiBjcml0aWNhbCB3
YXMgdGhlIHdyb25nIHRvb2w6IHRoZSBjbG9jayBzaG91bGQgYmUgcmVmZXJlbmNlZCBmcm9tIHRo
ZQo+ID4+ID4gY29uc3VtZXIgbm9kZXMgYW5kIGNsYWltZWQgYnkgdGhlIG1tYyBkcml2ZXIgaW5z
dGVhZC4KPiA+PiA+Cj4gPj4gPiBEcm9wIHRoZSBDTEtfSVNfQ1JJVElDQUwgZmxhZyBhbmQgdXBk
YXRlIHRoZSBjb21tZW50IGFjY29yZGluZ2x5Lgo+ID4+ID4gc3lzX2FtMmF4aTAuLjIgcmVtYWlu
IGNyaXRpY2FsIGFzIHRoZXkgY2xvY2sgdGhlIEFYSSBETUEgYnVzIGl0c2VsZiBhbmQKPiA+PiA+
IGhhdmUgbm8gc2luZ2xlIGlkZW50aWZpYWJsZSBjb25zdW1lci4KPiA+PiA+Cj4gPj4gPiBBc3Np
c3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1mYWJsZS01Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPj4gPiAtLS0KPiA+PiA+IFRoaXMgcGF0Y2gg
ZGVwZW5kcyBvbiB0aGUgTU1DIGNvbnRyb2xsZXJzIGFjdHVhbGx5IHJlZmVyZW5jaW5nIHRoZSBj
bG9jazoKPiA+PiA+IHRoZSBkdC1iaW5kaW5ncywgbW1jIGRyaXZlciBhbmQgdDcgRFRTIGNoYW5n
ZXMgYWRkaW5nIHRoZSAicGlwZWxpbmUiCj4gPj4gPiBjbG9jayBtdXN0IGxhbmQgYmVmb3JlIHRo
aXMgcGF0Y2gsIG90aGVyd2lzZSB0aGUgYm9vdCBoYW5ncyBhbmQgbWVtb3J5Cj4gPj4gPiBjb3Jy
dXB0aW9uIHRoaXMgY2xvY2sgY2F1c2VkIGFyZSByZWludHJvZHVjZWQuCj4gPj4KPiA+PiBUaGlz
IHNlcmllcyBzaG91bGQgYmUgbWVyZ2VkIHRvZ2V0aGVyIGluIG9uZSB0cmVlPyBXaGljaCB0cmVl
PyBJIGNhbgo+ID4+IHByb3ZpZGUgYW4gQWNrZWQtYnkgaWYgaXQgc2hvdWxkIGdvIHRocm91Z2gg
dGhlIG1tYyB0cmVlLgo+ID4+Cj4gPj4gQnJpYW4KPiA+Pgo+ID4gSXQncyBkZWZpbml0ZWx5IGJl
c3QgdG8ga2VlcCB0aGUgc2VyaWVzIHRvZ2V0aGVyIGluIG9uZSB0cmVlIHRvIGF2b2lkCj4gPiBi
b290IHJlZ3Jlc3Npb25zLAo+ID4gYnV0IEkgdGhpbmsgdGhlIGNsayB0cmVlIGlzIHRoZSBiZXR0
ZXIgZml0IHNpbmNlIHRoZSBjb3JlIGNoYW5nZXMKPiA+IHJldm9sdmUgYXJvdW5kIGNsb2NrIGxv
Z2ljLgo+ID4gQ291bGQgeW91IGFjY2VwdCBpdCA/Cj4KPiBOby4gVGhpcyBhcHBsaWVzIG9uIHRv
cCBvZiBhbm90aGVyIGNoYW5nZSBhbHJlYWR5IHF1ZXVlZCBpbiB0aGUgYW1sb2dpYwo+IGNsb2Nr
IHRyZWUuIEl0IGNhbid0IGdvIHRocm91Z2ggdGhlIE1NQyB0cmVlIGF0IHRoZSBtb21lbnQuCj4K
PiBUaGlzIGNsb2NrIGlzIG5vdCBjcml0aWNhbCBpbiBtYWlubGluZSByaWdodCBub3csIHNvCj4g
MSkgSSBjb3VsZCBtZXJnZSB0aGlzIGFuZCBpdCBhbmQgaW4gcHJhY3RpY2UgdGhlcmUgd291bGQg
YmUgbm8KPiAgICByZWdyZXNzaW9uLiBUaGUgcHJvYmxlbSB5b3UgaGFkIHdvdWxkIHN0aWxsIGJl
IHRoZXJlIHVudGlsIHRoZSBNTUMKPiAgICBjaGFuZ2UgbGFuZHMKPgo+IDIpIE9yIHlvdSBjYW4g
d2FpdCBmb3IgdGhlIE1NQyBzdHVmZiB0byBsYW5kIGFuZCByZS1zdWJtaXQgdGhpcyBpbgo+ICAg
IHRoZSBuZXh0IGN5Y2xlLgo+Cj4gWW91ciBjaG9pY2UuIElNTywgKDEpIGlzIGZpbmUuCj4KPiA+
Cj4gPiB0aGFua3MKPiA+IGx1Y2FzCj4KPiAtLQo+IEplcm9tZQpIaSBKZXJvbWUsCgpTb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHkuIFRoZSBNTUMgc2lkZSBpcyBpbiBuZXh0IG5vdywgc28gdGhlIGNs
b2NrIGhhcwphIHJlYWwgY29uc3VtZXIuCgpDYW4geW91IHRha2UgdGhpcyBwYXRjaCBkcm9wcGlu
ZyB0aGUgc3lzX2FtcGlwZV9uYW5kIHBhcnQgb3IKc2hvdWxkIEkgcmUtc3VibWl0IGEgbmV3IHZl
cnNpb24gZHJvcHBpbmcgc3lzX2FtcGlwZV9uYW5kIGNoYW5nZSBhbmQKb25seSBtYXJraW5nIHN5
c19hbTJheGkwLzEvMiBhcyBjcml0aWNhbD8KClRoYW5rcwpMdWNhcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
