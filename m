Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4485DCD128A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZaj0bHHP3+f7YA+yIDFTYYdzmJXwCP6PvHFTVjjukc=; b=rpipNlp7whumqU
	Mkf3pAfI6l64CuXC1g0nz2QqF2rnQ6Dp/Mu1R61Wk557ATyXwUkO/vP7dnd2YSnpRAr/Q0zh0C1pv
	1wjk9vpZN7ZAUmaC3IT3iG9v6Gs0qb4rbuk0nW+LV8Rsx+uzy89Olau5P21qJoeoznFYJdHNjsA6L
	vmIcSUTXpK6t7i81UtWrS5BhRntEfBmuessNORWMIqLVNUGT1lrr1j/QDCoiaXxEGIsBw8jJuF/X3
	OfjPhGLYxyXqA6doBCFv2aM1SsN+FckSWgKY2RyA0mgtUug1dQZpbibIVsu1mXjcLGHx5LnqRm8yG
	W3X20FHmw4BBRFrVVtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rud8G-00000008ZR7-3vmm;
	Wed, 10 Apr 2024 18:57:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rud8C-00000008ZQP-1fI2
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 18:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 976BC60AD7;
	Wed, 10 Apr 2024 18:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E824CC433C7;
	Wed, 10 Apr 2024 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712775431;
	bh=1pr4aMZSU4Lugs+zJr+eQADtuseadL78E1eXv5pdPnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hovp2kNJfByBs6PovxEnzv77Oi7dLKzGioqq8cnRVAbWvYammQeTdAZUz7LbSYHJS
	 TQibzE8+e4nkwjZgpqqk45lyZyKh994lb/tBcoe8PDjeGbqM3OR7052ceNgTp4Z49O
	 L/jjrJd615oT7fC9j8wodlmvgT+djN+tcbj0MAWR804lSIV0TPXRHCvenPQPXFzY80
	 jkLAUOZt+hU15V6lHF3+vqOBZcJMuuapmNtBNDse6bZ9/Q4B19ZphBv0NvIRRLPx6m
	 Xme5V4x94QDqXiqtR0Hyw8Zb1Ydqq2ynC9SFEc1ma0x/HSPUobTSYzERBnWQ6WI35u
	 gC5UEGuKQTPZA==
Date: Wed, 10 Apr 2024 13:57:08 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Jacobe Zang <jacobe.zang@wesion.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_jesszhan@quicinc.com,
	sam@ravnborg.org, nick@khadas.com, thierry.reding@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	AML <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple-dsi: add New Khadas TS050
 panel bindings
Message-ID: <20240410185708.GA884726-robh@kernel.org>
References: <20240409082641.359627-1-jacobe.zang@wesion.com>
 <3CCAF214-09FE-4580-99CD-AB95E78FFB8F@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CCAF214-09FE-4580-99CD-AB95E78FFB8F@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_115714_419347_DE4D7285 
X-CRM114-Status: GOOD (  17.06  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDg6MjI6MjVBTSArMDQwMCwgQ2hyaXN0aWFuIEhld2l0
dCB3cm90ZToKPiA+IE9uIDkgQXByIDIwMjQsIGF0IDEyOjI24oCvUE0sIEphY29iZSBaYW5nIDxq
YWNvYmUuemFuZ0B3ZXNpb24uY29tPiB3cm90ZToKPiA+IAo+ID4gVGhpcyBhZGQgdGhlIGJpbmRp
bmdzIGZvciB0aGUgTmV3IEtoYWRhcyBUUzA1MCAxMDgweDE5MjAgNSIgTENEIERTSSBwYW5lbAo+
ID4gZGVzaWduZWQgdG8gd29yayB3aXRoIHRoZSBLaGFkYXMgVklNMyBhbmQgVklNM0wgU2luZ2xl
IEJvYXJkIENvbXB1dGVycy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFjb2JlIFphbmcgPGph
Y29iZS56YW5nQHdlc2lvbi5jb20+Cj4gPiAtLS0KPiA+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sICAgICB8IDIgKysKPiA+IDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2ku
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLXNpbXBsZS1kc2kueWFtbAo+ID4gaW5kZXggZjkxNjBkN2JhYzNjYS4uZTE5NDMwOWYzMWI3
MiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2kueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCj4g
PiBAQCAtMzYsNiArMzYsOCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgLSBqZGksZmhkLXI2MzQ1
Mgo+ID4gICAgICAgICAjIEtoYWRhcyBUUzA1MCA1IiAxMDgweDE5MjAgTENEIHBhbmVsCj4gPiAg
ICAgICAtIGtoYWRhcyx0czA1MAo+ID4gKyAgICAgICAgIyBLaGFkYXMgTkVXIFRTMDUwIDUiIDEw
ODB4MTkyMCBMQ0QgcGFuZWwKPiA+ICsgICAgICAtIGtoYWRhcyxuZXd0czA1MAo+IAo+IFByb2R1
Y3RzIGFyZSBvbmx5IG5ldyB1bnRpbCB0aGV5IGFyZSBvbGQuIEF0IHNvbWUgZnV0dXJlIHBvaW50
IHRoZXJlIHdpbGwKPiBpbmV2aXRhYmx5IGJlIGEgdGhpcmQgaXRlcmF0aW9uIHJlcXVpcmluZyBh
IOKAmG5ldyBuZXfigJkgbmFtZS4gSU1ITyBpdCB3b3VsZAo+IGJlIGJldHRlciB0byB1c2Ugc29t
ZXRoaW5nIGxpa2Uga2hhZGFzLHRzMDUwdjIuCgpJIG9ubHkgc2VlIHBhdGNoIDEsIHNvIHRoZSB0
aHJlYWRpbmcgaXMgbWVzc2VkIHVwLi4uCgpJbiBhbnkgY2FzZSwgVGhlIGNvbW1pdCBtZXNzYWdl
IHNob3VsZCBzYXkgc29tZXRoaW5nIGFib3V0IGhvdyB0aGV5IGFyZSAKZGlmZmVyZW50PyBJcyB0
aGUgbmV3IG9uZSBub3QgY29tcGF0aWJsZSB3aXRoIHRoZSBvbGQ/IFRoYXQncyB3aGF0IHRoaXMg
CmNoYW5nZSB0ZWxscyBtZS4gT3RoZXJ3aXNlLCBpdCBzaG91bGQgaGF2ZSBhIGZhbGxiYWNrLiAK
ClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
