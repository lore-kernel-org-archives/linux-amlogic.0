Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049D7C3ABC9
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 May 2025 20:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Idyr/qjkIOOO4BDluRzS74a4IHNWzDCBlwKpi72Xnj8=; b=KwXvtLaiWhIczR
	7puROi2bu9YWSOVqu8AI7Gj3MPlQxTRJE8qq6BUnWe3yCaMDiPIXweL5I2bVF37wDPQoOcwTpEM2u
	fSm4YWjVRC91DX88UkHFkQTBwfBmLoFR134C4wcyhj9g8WYcOtVPc3u+BR/JfPYOwOyOAz6gVOSuK
	FNFtbOLG0y4zi+3Fnkf2lB1kOBFYPdiEdn93cdgxGyG9N6srwTD6emXpTL4/DWBploxPBI6KSTjTz
	NgiiAhBwOl8x7ZOdVL6yY3VAlgWc3LAz1cDgId3At/zyhTs9A/pj5Lf15NbLCJ7Pmckqnv5SGy+Fb
	n6vK2dIh1xw4ppOyHv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqht-00000006LPQ-40d3;
	Sat, 10 May 2025 20:22:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqhr-00000006LOm-11Qr
	for linux-amlogic@lists.infradead.org;
	Sat, 10 May 2025 20:22:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so6986546a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 May 2025 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chewies-net.20230601.gappssmtp.com; s=20230601; t=1746908517; x=1747513317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghFoxlYELDJTH8sQXcJctO6qyyJl1AJpsH25aK+VUgs=;
        b=CKkJ4nT1CF2C2vtyEOrvHEK2P8pCmFq3tiHBuE8UlerTaQKd+obcZc8+hTayLmne1J
         9OW6x+P2C1w0zgBiR4blh8MZJM+NnoRCh4JNPywCjW26k2MM1iiif8oFjyfh2Xoc+zpR
         ARJBEB+Rxy771hezSreowSf8NqaTKPwaloT7xoGyk3z4XS83tdrqcgQC0XRT5Q3ViTGb
         dJhBvMiK9pLR0wT1yn6AIT03i0N5c861qKrW63KIq1zNl36TnprAc5Eg97k1sDlbn4rI
         o9rkk7HpWSzytRuCIXWUt7Ilon2vRNwMfz3M/Wecu5Dr2SqIRATr47ZvsbOiijhRf47p
         Zj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746908517; x=1747513317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghFoxlYELDJTH8sQXcJctO6qyyJl1AJpsH25aK+VUgs=;
        b=UWOpGiw7HtD+e8FsLPbiM/9WzverwFoHtXcyyPuZyhQ9vsVK3oLvPAYrGz7moB2ubC
         /wbI3np33bTAwa3LVf4/c7TETbVQncGRsFV1+ComCtC6kv9OYY2eQ1APPxsH9u/UwCG+
         ZbBqFPs8ykTyx9G4YlbqMZcUsgPCm8aAAsbZZ3celfLhYfWXCWha66fzM6Gz9JBr/OAO
         h+1Xg4bhA0zMN+fC018r7njAK0yI2+m2a01JVgFMrkUCGUXxGAQ2Aug11y+gEOTcmLFr
         c3G6TJBACLa6mqimMu0PDgPlfR76flKueVXIjiNAIiUPou6ZWRToiP200LVQGlB8Nk+5
         PedA==
X-Forwarded-Encrypted: i=1; AJvYcCVUbb3d1y45osYipxpjBG1nh0G3lFx/qUtiVPSjxBmIj5WGmsQ7MCSPbag23chIOJNbmzeRQiwHBVvRaKad@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6fzyIk+CskWGrLv9rtXi6ODRzups3EK72MRb8H/kzAUWmSB7B
	GVhQith83+Jsqpyq0BcdCjN7pl2gtbC5++n99139oeqW2d8FjdsGQN8k0G4zQsNkuVPectLTCf+
	bHL+syjTWbeRPfy5+VGcc4EVUj6GxRcWABRAq
X-Gm-Gg: ASbGnctEhQQ7v+uInI3MLL1wJloiwYMMCba3cQ8MkYhhK8yPu0RJic03qb+mVyk+y4O
	oTfspTqSYlnUoU7jq9gvNsJ9f9L2R4gNi2KsGzL2VEEGk/rpFLTXtbHnAWURYLlZsDCeuBqKr4v
	6f6eYK0ELtm4ml8D846kSq3PPzcEroQA==
X-Google-Smtp-Source: AGHT+IHrmIxpu89JcXp8pTsYpjYQ52JP4jQJB6ftV4JyF40SXcxgujBoCYyks/9VE96AKLi7tzU34e4CP9TYSNEW1s0=
X-Received: by 2002:a17:907:c317:b0:ace:8176:9870 with SMTP id
 a640c23a62f3a-ad21b16d832mr722442266b.9.1746908516933; Sat, 10 May 2025
 13:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org> <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
 <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com> <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com>
In-Reply-To: <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com>
From: Wayne Schroeder <raz@chewies.net>
Date: Sat, 10 May 2025 15:21:44 -0500
X-Gm-Features: AX0GCFutdAtYDL586PDSub990CVv4WeGORcasNYzmQIEdeFBm-BEawgbOOwFLNY
Message-ID: <CAEUiLuY2D_CzkEH0+gCvkbC_MtJ4B-MLYYkx_r2E9BHxPvuVjg@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Anand Moon <linux.amoon@gmail.com>
Cc: Ferass El Hafidi <funderscore@postmarketos.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_132159_549597_0D196C7B 
X-CRM114-Status: GOOD (  24.90  )
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

QXBwbGllZCBwYXRjaGVzIHRvIDIwMjUuMDQgcmVsZWFzZSAoYXBwbGllZCBjbGVhbikuICBNYWRl
IHN0b2NrCmRlZmNvbmZpZyBmb3Igb2Ryb2lkIG4yLCBidWlsdCwgc2lnbmVkLCBpbnN0YWxsZWQu
ICBUaGUgcmVib290IGlzc3VlCnJlbWFpbnMgYW5kIHVzYiBwb3J0cyBhcmUgdW5hdmFpbGFibGUg
dG8gbGludXgga2VybmVsIGFmdGVyIHJlYm9vdC4KCkl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IGxp
bnV4IGRvZXMgc2VlIHNvbWUgZW51bWVyYXRpb24gb2YgZGV2aWNlcwphZnRlciBhIHdoaWxlLCBi
dXQgZXZlbiBpZiBpdCBsb2dzIHRvIHRoZSBjb25zb2xlIGFib3V0IGRldmljZQphdHRhY2htZW50
LCB0aGUgZGV2aWNlcyBkb24ndCBhY3R1YWxseSBmdW5jdGlvbi4gIFRoaXMgd2FzIHRoZSBzYW1l
CmJlaGF2aW9yIHdpdGggdGhlIHJlbGVhc2UgdmVyc2lvbi4KCldheW5lCgpPbiBGcmksIE1heSA5
LCAyMDI1IGF0IDEwOjAx4oCvQU0gV2F5bmUgU2Nocm9lZGVyIDxyYXpAY2hld2llcy5uZXQ+IHdy
b3RlOgo+Cj4gWWVzLiAgV2lsbCByZXBvcnQgYmFjayBob3cgaXQgd29ya3Mgb24gdGhlIG4yKy4K
Pgo+Cj4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjA44oCvQU0gQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBXYXluZSwKPiA+Cj4gPiBPbiBGcmks
IDkgTWF5IDIwMjUgYXQgMDE6MjUsIFdheW5lIFNjaHJvZWRlciA8cmF6QGNoZXdpZXMubmV0PiB3
cm90ZToKPiA+ID4KPiA+ID4gSSBhY3R1YWxseSBhbHJlYWR5IGhhdmUgYSB3b3JraW5nIHNvbHV0
aW9uIHRoYXQgSSBkb2N1bWVudGVkIGluIG15Cj4gPiA+IGdpdGh1YiByZXBvIChkdWJzY2hyby9v
ZHJvaWQtbjIpLiAgQWxsIEkgZG8gaXMgc2V0IEJPT1RDT01NQU5EIHRvCj4gPiA+IGNoZWNrL2Rl
bGV0ZSBhIGZsYWcgZmlsZSBvbiBteSBib290IHBhcnRpdGlvbiBhbmQgaWYgaXQgaXMgZm91bmQs
IHRoZW4KPiA+ID4gcmVzZXQgdXNiIGFuZCBzbGVlcCBmb3IgMTAgc2Vjb25kcy4gIEkgdGhlbiBo
YXZlIGEgc3lzdGVtZCBzaHV0ZG93bgo+ID4gPiBzY3JpcHQgb25seSBvbiByZWJvb3QgdG8gdG91
Y2ggdGhhdCBmaWxlLgo+ID4gPgo+ID4gPiBDT05GSUdfQk9PVENPTU1BTkQ9ImZhdHJtIG1tYyAw
OjEgcmVib290ICYmIGVjaG8gUmVzZXR0aW5nIFVTQiBvbgo+ID4gPiByZWJvb3QuLi4gJiYgdXNi
IHJlc2V0ICYmIHNsZWVwIDEwOyBydW4gZGlzdHJvX2Jvb3RjbWQiCj4gPiA+Cj4gPiA+IEl0IGlz
IGEgaGFjaywgYnV0Li4uIHRoZSBzeXN0ZW0gcmVsaWFibHkgcmVib290cyByZW1vdGVseSBub3cs
IGFuZAo+ID4gPiB0aGF0J3MgdGhlIGltcG9ydGFudCBwYXJ0IGZvciBub3cuCj4gPiA+Cj4gPiA+
IFdheW5lCj4gPiA+Cj4gPiA+IE9uIFRodSwgTWF5IDgsIDIwMjUgYXQgMTE6MjLigK9BTSBGZXJh
c3MgRWwgSGFmaWRpCj4gPiA+IDxmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IE9uIFdlZCBNYXkgNywgMjAyNSBhdCAxOjAzIFBNIFVUQywgV2F5bmUg
U2Nocm9lZGVyIHdyb3RlOgo+ID4gPiA+ID4gSXQncyBoYXJkIGZvciBtZSB0byBxdWFudGlmeSBp
ZiB1c2Igd29ya3MgaW4gdS1ib290IGFzIEknbSBub3QgbG9hZGluZwo+ID4gPiA+ID4gb2ZmIG9m
IGFueSB1c2Igc3RvcmFnZSBkZXZpY2VzLiAgSXQgY2VydGFpbmx5IG5ldmVyIGxldHMgbWUgdXNl
IHRoZQo+ID4gPiA+ID4ga2V5Ym9hcmQgdG8gYWJvcnQgYXV0byBib290LCBhbmQgbmV2ZXIgaGFz
LiAgT24gcmVib290LCB0byByZWxpYWJseQo+ID4gPiA+Cj4gPiA+ID4gWW91IGNhbiBzZW5kIGJ5
dGVzIHZpYSBVQVJUIHRvIGFib3J0IGJvb3QsIGlmIHlvdSBoYXBwZW4gdG8gaGF2ZSBhIFVBUlQK
PiA+ID4gPiBhZGFwdGVyIGFyb3VuZC4KPiA+ID4KPiA+IENhbiB5b3UgdGVzdCB0aGlzIHNlcmll
cyB0byBzZWUgaWYgdGhpcyByZXNvbHZlcyB0aGUgaXNzdWU/Cj4gPgo+ID4gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L2xpc3QvP3Nlcmllcz00NTYwODgKPiA+Cj4g
PiBUaGFua3MKPiA+IC1BbmFuZAo+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+ID4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiA+
ID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
