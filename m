Return-Path: <SRS0=KJO1=4O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9C7C4BA12
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 14:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1451B24680
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 14:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbFmdQXc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgf1A5us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1451B24680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjuqCWjjb1BmSJOWpzWPsO6RkCUDi8ivf1UjniZMVCU=; b=NbFmdQXcRunqEN
	8f3YBa47DCElj987Zn8FMtb4WzPnwjVHIRexEm3ZTVDWn9PyOqQDzWNNEJnukiAoR/3IljajNZ0Ws
	OUuy+tBi53htl7pHeClS+30/arlhMqRwI7GBgymEhX22uhdULZYE0vJW/fsKuXAmCX1p+i1lkD9pS
	HF2pu/3V886cmpxEesdd+oIoG5onpznZzBEAOyxR4ptBCgb3Exx3EwRiXevlvbdGBdlzGiKIKE+cn
	+w5oYObvcJgRSKfOneqJjbHJKLxEKWDsKdJpI3JIkU5fKJWPhoz3qsDvJgVC7k9cSifjdW5iN8l14
	tV8BTtEMFafjXq7LHqJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6y7K-0006cO-6J; Wed, 26 Feb 2020 14:56:54 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6y7E-0006Zu-Vy
 for linux-amlogic@lists.infradead.org; Wed, 26 Feb 2020 14:56:51 +0000
Received: by mail-lf1-x144.google.com with SMTP id v6so1262110lfo.13
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Feb 2020 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2/QJ7qneGgZqHBfg/JeUxK+PnqdeXh8I7JayjH2DAAk=;
 b=tgf1A5us8lqNpmexYFG5Q12HV9cxSK7xP47154fKzLMHEGi+WF1zpVkRi/ROUfb2tu
 M4kZQ5sEHPEU+K9Fkg4D+fVwymV4tHMZZxDBYFkiMEvSKqd8u3WQcFW5lL3iQ9nHUJv4
 KVnlA7+FFUQ6NfqSJmYDYsuKJp6/FCv7dUpSH3tFTbWuhKMVXYmvvvO6Zk9I9kY7DpuE
 cOH27GChwSYm17N6YerQ6arYLDUd2VqUX8CIYENfiiCBWAbXciEQoCHhBzWFsH3ASMe6
 m99lKeXtqvoGzO5fAg0BNlczd/KZ1XvyYTglHBHYIVQrbIgfdbUf9oNIKSj8nwSdWDKv
 vctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2/QJ7qneGgZqHBfg/JeUxK+PnqdeXh8I7JayjH2DAAk=;
 b=b8AZpGFSPcTNhzT6YMESamXeXh/4xUhJhrSiWiUUiE9NoA5Y8by7efVV+Wz4DGmYJZ
 ez5RD4218fobXewYPU4b5lF/VkoXtb1Qw4Ui/qx0fAxzCQlNNNyFc+h2p87Ny6i/yk4Z
 ibfMRJPZKJTGeVUyVpgyYhAMR9gwlSolW+5P/TciR1ILKeKPEwvENi5jCFabQhplbMD8
 PVWbnVzBdkCfbHxOgUurUgpROlwz7y3EFA7XWjUBsrupFWKS5TDzD2SPfkxgp6Sn6uyR
 5WW04ZoXlmJazfKgShsx4bmHE++9WGhioP82Io2+iNHeG60qoS3ETbLGruc9BYcuUDbD
 Czqg==
X-Gm-Message-State: APjAAAV3/k9LNUKp2wMeUhF8gvEx9+nosvxc1+vCaF5yehaOqCBusgeE
 OTtrLETyqfO8fSAQIUhdClRnISbANOm2AUw2w87Mmw==
X-Google-Smtp-Source: APXvYqxugddSDx0KpCsivrnIWfVdfRPBLi9YTA6pB7mkbI7w3gfaVV9vjpWWz0qhLNNr/jRaahCfwcHQv0tC+t2sbmE=
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr2751538lfy.77.1582729007166; 
 Wed, 26 Feb 2020 06:56:47 -0800 (PST)
MIME-Version: 1.0
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
 <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
 <20200226143409.GJ13686@intel.com>
In-Reply-To: <20200226143409.GJ13686@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2020 15:56:36 +0100
Message-ID: <CACRpkdZSapEh3sCqGjpnOuX-vbf1C=AjzN7Ryu2v6V5npoWgoA@mail.gmail.com>
Subject: Re:
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_065649_104431_B0463882 
X-CRM114-Status: GOOD (  24.13  )
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Eric Anholt <eric@anholt.net>,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Gustaf_Lindstr=C3=B6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMzozNCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAw
MTowODowNlBNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMjYs
IDIwMjAgYXQgMTI6NTcgUE0gVmlsbGUgU3lyasOkbMOkCj4gPiA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAxMDo1Mjoy
NVBNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4KPiA+ID4gPiBJIGhhdmUgbG9uZyBz
dXNwZWN0ZWQgdGhhdCBhIHdob2xlIGJ1bmNoIG9mIHRoZSAic2ltcGxlIiBkaXNwbGF5cwo+ID4g
PiA+IGFyZSBub3Qgc2ltcGxlIGJ1dCBjb250YWlucyBhIGRpc3BsYXkgY29udHJvbGxlciBhbmQg
bWVtb3J5Lgo+ID4gPiA+IFRoYXQgbWVhbnMgdGhhdCB0aGUgc3BlZWQgb3ZlciB0aGUgbGluayB0
byB0aGUgZGlzcGxheSBhbmQKPiA+ID4gPiBhY3R1YWwgcmVmcmVzaCByYXRlIG9uIHRoZSBhY3R1
YWwgZGlzcGxheSBpcyBhc3ltbWV0cmljIGJlY2F1c2UKPiA+ID4gPiB3ZWxsIHdlIGFyZSBqdXN0
IHVwZGF0aW5nIGEgUkFNLCB0aGUgcmVzb2x1dGlvbiBqdXN0IGxpbWl0cyBob3cKPiA+ID4gPiBt
dWNoIGRhdGEgd2UgYXJlIHNlbmRpbmcsIHRoZSBjbG9jayBsaW1pdHMgdGhlIHNwZWVkIG9uIHRo
ZQo+ID4gPiA+IGJ1cyBvdmVyIHRvIHRoZSBSQU0gb24gdGhlIG90aGVyIHNpZGUuCj4gPiA+Cj4g
PiA+IElNTyBldmVuIGluIGNvbW1hbmQgbW9kZSBtb2RlLT5jbG9jayBzaG91bGQgcHJvYmFibHkg
YmUgdGhlIGFjdHVhbAo+ID4gPiBkb3RjbG9jayB1c2VkIGJ5IHRoZSBkaXNwbGF5LiBJZiB0aGVy
ZSdzIGFub3RoZXIgY2xvY2sgZm9yIHRoZSBidXMKPiA+ID4gc3BlZWQvZXRjLiBpdCBzaG91bGQg
YmUgc3RvcmVkIHNvbWV3aGVyZSBlbHNlLgo+ID4KPiA+IEdvb2QgcG9pbnQuIEZvciB0aGUgRFNJ
IHBhbmVscyB3ZSBoYXZlIHRoZSBmaWVsZCBoc19yYXRlCj4gPiBmb3IgdGhlIEhTIGNsb2NrIGlu
IHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugd2hpY2ggaXMgYmFzZWQKPiA+IG9uIGV4YWN0bHkgdGhp
cyByZWFzb25pbmcuIEFuZCB0aGF0IGlzIHdoYXQgSSBhY3R1YWxseSB1c2UgZm9yCj4gPiBzZXR0
aW5nIHRoZSBIUyBjbG9jay4KPiA+Cj4gPiBUaGUgcHJvYmxlbSBpcyBob3dldmVyIHRoYXQgd2Ug
aW4gbWFueSBjYXNlcyBoYXZlIHNvCj4gPiBzdWJzdGFuZGFyZCBkb2N1bWVudGF0aW9uIG9mIHRo
ZXNlIHBhbmVscyB0aGF0IHdlIGhhdmUKPiA+IGFic29sdXRlbHkgbm8gaWRlYSBhYm91dCB0aGUg
ZG90Y2xvY2suIE1heWJlIHdlIHNob3VsZAo+ID4ganVzdCBzZXQgaXQgdG8gMCBpbiB0aGVzZSBj
YXNlcz8KPgo+IERvbid0IHlvdSBhbHdheXMgaGF2ZSBhIFRFIGludGVycnVwdCBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Cj4gYXZhaWxhYmxlPyBDb3VsZCBqdXN0IG1lYXN1cmUgaXQgZnJvbSB0aGF0
IGlmIG5vIGJldHRlcgo+IGluZm9ybWF0aW9uIGlzIGF2YWlsYWJsZT8KClllcyBhbmQgSSBkaWQg
ZXhhY3RseSB0aGF0LCBzbyB0aGF0IGlzIHdoeSB0aGlzIGNvbW1lbnQgaXMgaW4KdGhlIGRyaXZl
cjoKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzb255X2FjeDQyNGFrcF9j
bWRfbW9kZSA9IHsKKC4uLikKICAgICAgICAvKgogICAgICAgICAqIFNvbWUgZGVzaXJlZCByZWZy
ZXNoIHJhdGUsIGV4cGVyaW1lbnRzIGF0IHRoZSBtYXhpbXVtICJwaXhlbCIKICAgICAgICAgKiBj
bG9jayBzcGVlZCAoSFMgY2xvY2sgNDIwIE1IeikgeWllbGRzIGFyb3VuZCAxMTdIei4KICAgICAg
ICAgKi8KICAgICAgICAudnJlZnJlc2ggPSA2MCwKCkkgZ290IGEgcmV2aWV3IGNvbW1lbnQgYXQg
dGhlIHRpbWUgc2F5aW5nIDExNyBIeiB3YXMgd2VpcmQuCldlIGRpZG4ndCByZWFjaCBhIHByb3Bl
ciBjb25jbHVzaW9uIG9uIHRoaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9D
QUNScGtkWVczWU5QU05NWTNBNDRHUW44RHFLLW45VEx2cjd1aXBGN0xNX0RIWjU9TGdAbWFpbC5n
bWFpbC5jb20vCgpUaGllcnJ5IHdhc24ndCBzdXJlIGlmIDYwSHogd2FzIGdvb2Qgb3Igbm90LCBz
byBJIGp1c3QgaGFkIHRvCmdvIHdpdGggc29tZXRoaW5nLgoKV2UgY291bGQgY2FsY3VsYXRlIHRo
ZSByZXN1bHRpbmcgcGl4ZWwgY2xvY2sgZm9yIH4xMTcgSHogd2l0aAp0aGlzIHJlc29sdXRpb24g
YW5kIHB1dCB0aGF0IGluIHRoZSBjbG9jayBmaWVsZCBidXQgLi4uIGRvbid0IGtub3cKd2hhdCBp
cyB0aGUgYmVzdD8KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
