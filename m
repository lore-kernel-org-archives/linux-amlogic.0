Return-Path: <SRS0=o1hk=ZH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B769FC432C3
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 08:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEA720732
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 08:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPKHSD7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEA720732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuFl4PQowSRz+Iu3qtIuHxxYBS6Zv8gysCub1LToAz0=; b=SPKHSD7mMr0fn4
	KxkUKbbuneFMBWdkjpheHshrvqjeQ1sF2BqGPkdQ9bjSazvujk2S0nmQeFVea0HtAbNLxLSBL1Hfq
	rAz5WRKK/EYiWxSjKeb6R4XtRLpo5L2khXw6deGnB3Jjnlbr/5QV/l9M1LnYgRaoz7HEzQ6i9rHIz
	0pa3YP+cv+9u7KBj2CMFAgT86La163DNPW9TBvHFRN01lkTIZNgt+OmgTyeV4Czn4L5YvGncv1ttP
	AXOepwWArlXdTklAI/f7IRLGSSgrTFk8WFbxUEBEiIkwrgyBslVJQ19G1ZpqT7W8V/l2A4LOsqo2U
	6q4e6DuTePnGGD9inhcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVXR4-0005M1-6c; Fri, 15 Nov 2019 08:58:34 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXR0-0005LE-SU; Fri, 15 Nov 2019 08:58:32 +0000
Received: by mail-oi1-f194.google.com with SMTP id a14so8006221oid.5;
 Fri, 15 Nov 2019 00:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zn7WrxLK4MTi/FcCsuiZYs1yzwoKl8BPahIjYaZmH0g=;
 b=aJLVBeq4gxWiW7I8e19TZobDMgyrL7VHUrYoPO/I1Ae8b2MucRu/M3LeW/6RhxlYhx
 b71hAvSHP3ZrdXJFPSDEEDImXcrVp8BAk224ZD4xCo69QRw8B31IEu6WwllvVGT34TRc
 73yvF9Jw7nyhsLxOLS72iLs02KdcEmrJpDFoKulSwf1cqD6+Q6f+dH392+5++l71mpMI
 qEE5essuMmX6g4lrx5lFq7rfbW8PZ3I1VQ5JbY93EivdEEG6r6JQApuPAQc2Nzrez1Gt
 seFdPpivll0rSg7xmXhBUqpZGx1xOfUCj0hoRxGUCuEY7Bnr7JLCDErfaSaZu7zZorW/
 wiyQ==
X-Gm-Message-State: APjAAAXZk1WdN2EQAH9am0TmVqiK0Jq6YEtEM/mHcugm67S7DkPnVR1J
 N+iN302EciHx/94pei9gBg1+V5SDDElYvixtrAE=
X-Google-Smtp-Source: APXvYqygX6C8ca63U0v9UoSCGiVQc2gEez+mz4CCLxyFtXa8fZ2wlKY1CkWK7xdqGGGRQvfwgeZd2SrZqZ4mrdB7zr8=
X-Received: by 2002:a05:6808:b17:: with SMTP id
 s23mr7271243oij.102.1573808309767; 
 Fri, 15 Nov 2019 00:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
In-Reply-To: <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Nov 2019 09:58:18 +0100
Message-ID: <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_005830_921164_668639BF 
X-CRM114-Status: GOOD (  25.11  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-realtek-soc@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 boot-architecture@lists.linaro.org, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIEZyaSwgTm92IDE1LCAyMDE5IGF0IDk6NTIgQU0gTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiBPbiAxMi8xMS8yMDE5IDExOjQ3LCBB
bmRyZWFzIEbDpHJiZXIgd3JvdGU6Cj4gPiBBbSAxMi4xMS4xOSB1bSAwODoyOSBzY2hyaWViIFV3
ZSBLbGVpbmUtS8O2bmlnOgo+ID4+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDA2OjIzOjQ3QU0g
KzAxMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+Pj4gT24gTW9uLCBOb3YgMTEsIDIw
MTkgYXQgMDk6MTA6NDFQTSArMDEwMCwgQW5kcmVhcyBGw6RyYmVyIHdyb3RlOgo+ID4+Pj4gQW0g
MTEuMTEuMTkgdW0gMDc6NDAgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46Cj4gPj4+Pj4gT24g
TW9uLCBOb3YgMTEsIDIwMTkgYXQgMDY6NDI6MDVBTSArMDEwMCwgQW5kcmVhcyBGw6RyYmVyIHdy
b3RlOgo+ID4+Pj4+PiBBbSAxMS4xMS4xOSB1bSAwNjoyNyBzY2hyaWViIEdyZWcgS3JvYWgtSGFy
dG1hbjoKPiA+Pj4+Pj4+IE9uIE1vbiwgTm92IDExLCAyMDE5IGF0IDA1OjU2OjA5QU0gKzAxMDAs
IEFuZHJlYXMgRsOkcmJlciB3cm90ZToKPiA+Pj4+Pj4+PiBVc2Ugb2Ygc29jX2RldmljZV90b19k
ZXZpY2UoKSBpbiBkcml2ZXIgbW9kdWxlcyBjYXVzZXMgYSBidWlsZCBmYWlsdXJlLgo+ID4+Pj4+
Pj4+IEdpdmVuIHRoYXQgdGhlIGhlbHBlciBpcyBuaWNlbHkgZG9jdW1lbnRlZCBpbiBpbmNsdWRl
L2xpbnV4L3N5c19zb2MuaCwKPiA+Pj4+Pj4+PiBsZXQncyBleHBvcnQgaXQgYXMgR1BMIHN5bWJv
bC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBJIHRob3VnaHQgd2Ugd2VyZSBmaXhpbmcgdGhlIHNvYyBk
cml2ZXJzIHRvIG5vdCBuZWVkIHRoaXMuICBXaGF0Cj4gPj4+Pj4+PiBoYXBwZW5lZCB0byB0aGF0
IGVmZm9ydD8gIEkgdGhvdWdodCBJIGhhZCBwYXRjaGVzIGluIG15IHRyZWUgKG9yCj4gPj4+Pj4+
PiBzb21lb25lJ3MgdHJlZSkgdGhhdCBkaWQgc29tZSBvZiB0aGlzIHdvcmsgYWxyZWFkeSwgc3Vj
aCB0aGF0IHRoaXMKPiA+Pj4+Pj4+IHN5bWJvbCBpc24ndCBuZWVkZWQgYW55bW9yZS4KPiA+Pj4+
Pj4KPiA+Pj4+Pj4gSSBkbyBzdGlsbCBzZWUgdGhpcyBmdW5jdGlvbiB1c2VkIGluIG5leHQtMjAx
OTExMDggaW4gZHJpdmVycy9zb2MvLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJJ2xsIGJlIGhhcHB5IHRv
IGFkanVzdCBteSBSRkMgZHJpdmVyIGlmIHNvbWVvbmUgcG9pbnRzIG1lIHRvIGhvdyEKPiA+Pj4+
Pgo+ID4+Pj4+IExvb2sgYXQgYzMxZTczMTIxZjRjICgiYmFzZTogc29jOiBIYW5kbGUgY3VzdG9t
IHNvYyBpbmZvcm1hdGlvbiBzeXNmcwo+ID4+Pj4+IGVudHJpZXMiKSBmb3IgaG93IHlvdSBjYW4g
anVzdCB1c2UgdGhlIGRlZmF1bHQgYXR0cmlidXRlcyBmb3IgdGhlIHNvYyB0bwo+ID4+Pj4+IGNy
ZWF0ZSB0aGUgbmVlZGVkIHN5c2ZzIGZpbGVzLCBpbnN0ZWFkIG9mIGhhdmluZyB0byBkbyBpdCAi
YnkgaGFuZCIKPiA+Pj4+PiB3aGljaCBpcyByYWN5IGFuZCBpbmNvcnJlY3QuCj4gPj4+Pgo+ID4+
Pj4gVW5yZWxhdGVkLgo+ID4+Pj4KPiA+Pj4+Pj4gR2l2ZW4gdGhlIGN1cnJlbnQgc3RydWN0IGxh
eW91dCwgYSB0eXBlIGNhc3QgbWlnaHQgd29yayAoYnV0IHVnbHkpLgo+ID4+Pj4+PiBPciBpZiB3
ZSBzdGF5IHdpdGggbXkgY3VycmVudCBSRkMgZHJpdmVyIGRlc2lnbiwgd2UgY291bGQgdXNlIHRo
ZQo+ID4+Pj4+PiBwbGF0Zm9ybV9kZXZpY2UgaW5zdGVhZCBvZiB0aGUgc29jX2RldmljZSAod2hp
Y2ggd291bGQgY2x1dHRlciB0aGUKPiA+Pj4+Pj4gc2NyZWVuIG1vcmUgdGhhbiAic29jIHNvYzA6
Iikgb3IgcmVzb3J0IHRvIHByX2luZm8oKSB3L28gZGV2aWNlLgo+ID4+Pj4+Cj4gPj4+Pj4gSWNr
LCBubywgZG9uJ3QgY2FzdCBibGluZGx5LiAgV2hhdCBkbyB5b3UgbmVlZCB0aGUgcG9pbnRlciBm
b3I/ICBJcyB0aGlzCj4gPj4+Pj4gZm9yIGluLXRyZWUgY29kZT8KPiA+Pj4+Cj4gPj4+PiBObywg
YW4gUkZDIHBhdGNoc2V0OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMjI0
MjYxLwo+ID4+Pj4KPiA+Pj4+IEFzIEkgaW5kaWNhdGVkIGFib3ZlLCBJIHVzZWQgaXQgZm9yIGEg
ZGV2X2luZm8oKSwgd2hpY2ggSSBjYW4gZWFzaWx5Cj4gPj4+PiBhdm9pZCBieSB1c2luZyBwcl9p
bmZvKCkgaW5zdGVhZDoKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcmVh
bHRlay9jaGlwLmMgYi9kcml2ZXJzL3NvYy9yZWFsdGVrL2NoaXAuYwo+ID4+Pj4gaW5kZXggZTUw
NzhjNjczMWZkLi5mOTM4MGU4MzE2NTkgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL3NvYy9y
ZWFsdGVrL2NoaXAuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9zb2MvcmVhbHRlay9jaGlwLmMKPiA+
Pj4+IEBAIC0xNzgsOCArMTc4LDcgQEAgc3RhdGljIGludCBydGRfc29jX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4+Pgo+ID4+Pj4gICAgICAgICBwbGF0Zm9ybV9zZXRf
ZHJ2ZGF0YShwZGV2LCBzb2NfZGV2KTsKPiA+Pj4+Cj4gPj4+PiAtICAgICAgIGRldl9pbmZvKHNv
Y19kZXZpY2VfdG9fZGV2aWNlKHNvY19kZXYpLAo+ID4+Pj4gLSAgICAgICAgICAgICAgICIlcyAl
cyAoMHglMDh4KSByZXYgJXMgKDB4JTA4eCkgZGV0ZWN0ZWRcbiIsCj4gPj4+PiArICAgICAgIHBy
X2luZm8oIiVzICVzICgweCUwOHgpIHJldiAlcyAoMHglMDh4KSBkZXRlY3RlZFxuIiwKPiA+Pj4+
ICAgICAgICAgICAgICAgICBzb2NfZGV2X2F0dHItPmZhbWlseSwgc29jX2Rldl9hdHRyLT5zb2Nf
aWQsIGNoaXBfaWQsCj4gPj4+PiAgICAgICAgICAgICAgICAgc29jX2Rldl9hdHRyLT5yZXZpc2lv
biwgY2hpcF9yZXYpOwo+ID4+Pgo+ID4+PiBGaXJzdCBvZmYsIHRoZSBkcml2ZXIgc2hvdWxkIG5v
dCBiZSBzcGl0dGluZyBvdXQgbm9pc2UgZm9yIHdoZW4gYWxsIGdvZXMKPiA+Pj4gd2VsbCBsaWtl
IHRoaXMgOikKPiA+Pgo+ID4+IEkgZGlkbid0IGZvbGxvdyB0aGUgZGlzY3Vzc2lvbiBjbG9zZWx5
LCBidXQgSSB0aGluayBJIHdhbnQgdG8gb2JqZWN0Cj4gPj4gaGVyZSBhIGJpdC4gV2hpbGUgSSBh
Z3JlZSB0aGF0IGVhY2ggZHJpdmVyIGVtaXR0aW5nIHNvbWUgc3R1ZmYgdG8gdGhlCj4gPj4gbG9n
IGJ1ZmZlciBpcyBoYXJkbHkgaGVscGZ1bCwgc2VlaW5nIHRoZSBleGFjdCBTb0MgZGV0YWlscyBp
cyBpbmRlZWQKPiA+PiB1c2VmdWwgYXQgdGltZXMuIFdpdGggbXkgRGViaWFuIGtlcm5lbCB0ZWFt
IG1lbWJlciBoYXQgb24sIEknZCBzYXkKPiA+PiBrZWVwIHRoaXMgaW5mb3JtYXRpb24uIFRoaXMg
d2F5IHRoZSBTb0MgZGV0YWlscyBtYWtlIGl0IGludG8ga2VybmVsIGJ1Zwo+ID4+IHJlcG9ydHMg
d2l0aG91dCBlZmZvcnQgb24gb3VyIHNpZGUuCj4gPgo+ID4gU2Vjb25kZWQuIEZvciBleGFtcGxl
LCBSVEQxMjk1IHdpbGwgc3VwcG9ydCBMU0FEQyBvbmx5IGZyb20gcmV2aXNpb24gQjAwCj4gPiBv
biAoYW5kIGl0J3Mgbm90IHRoZSBmaXJzdCB0aW1lIEknbSBzZWVpbmcgc3VjaCB0aGluZ3MgaW4g
dGhlIGluZHVzdHJ5KS4KPiA+IFNvIGlmIGEgdXNlciBjb21wbGFpbnMsIGl0IHdpbGwgYmUgaGVs
cGZ1bCB0byBzZWUgdGhhdCBpbmZvcm1hdGlvbi4KPiA+Cj4gPiBSZWZlcmVuY2luZyB5b3VyIEFt
bG9naWMgcmV2aWV3LCB3aXRoIGFsbCBkdWUgcmVzcGVjdCBmb3IgaXRzIGF1dGhvcnMsCj4gPiB0
aGUgY29tbW9uIGZyYW1ld29yayBoZXJlIGp1c3QgbGV0cyB0aGF0IGluZm9ybWF0aW9uIGV2YXBv
cmF0ZSBpbnRvIHRoZQo+ID4gZGVlcHMgb2Ygc3lzZnMuCj4KPiBIb3BlZnVsbHkgd2UgbmV2ZXIg
aGFkIHRoZSBjYXNlIHdoZXJlIG5lZWRlZCB0byB1c2UgdGhlIHNvYyBpbmZvIGluIGRyaXZlcnMs
Cj4gYnV0IG5vdyB3ZSBoYXZlIG9uZSBhbmQgaGF2aW5nIHN1Y2ggaW5mcmFzdHJ1Y3R1cmUgYWxy
ZWFkeSBpbi1wbGFjZSB3aWxsIGhlbHAuCj4KPiBSZW5lc2FzIHBsYXRmb3JtcyBtYWtlcyBhIGV4
dGVuc2l2ZSB1c2FnZSBvZiB0aGUgc29jIGluZm8gaW5mcmFzdHJ1Y3R1cmUgdG8KPiBmaWd1cmUg
b3V0IHBsZW50eSBvZiBIVyBwYXJhbWV0ZXJzIGF0IHJ1bnRpbWUgYW5kIGxvd2VyIHRoZWlyIERU
IGNoYW5nZXMuCgpXZSBkbyBvdXIgYmVzdCB0byB1c2UgaXQgc29sZWx5IGZvciBkZXRlY3Rpbmcg
cXVpcmtzIGluIGVhcmx5IFNvQyByZXZpc2lvbnMuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
