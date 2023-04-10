Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB4C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMxIBMmeAawXUAlRiqjMDK2W/a0YxpHdcyyt6PDt1io=; b=1cMHdUJ2idUdkY
	31IESxzGMIhzOQaMJ7jjoN6LXqCUIDjzMm3G5uWx/7SDhQRKKwMEpYzK9xUBJQ7ZZM2f+8Vd3EAFk
	hv1hfLyR/KTQrzYIEO18eOW17VPxxxOuh41A4DM3cKxwGJtpnBuOjZMHP3/mKDICrtRhMrZH+ofls
	5GZoLkz4q5sEJV/LPnp0HCz25e9rqZHb9dIh7mEPadv7i/wbFttXE59oRKAUtMXaLw5J33EzkQr6G
	LyrqNtLxHcI/VVVRayNLC5piJA/Y0L7CP3xgrjtPbC/JZ7Rr46EHC9gMR0u9PPHi94e4Si5jlbeJD
	M2a/N5OxBjpVa9WKZLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plr0w-00FFHv-0j;
	Mon, 10 Apr 2023 12:52:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plr0t-00FFH7-0V;
	Mon, 10 Apr 2023 12:52:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC7B361BBC;
	Mon, 10 Apr 2023 12:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DFCC433A1;
	Mon, 10 Apr 2023 12:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681131169;
	bh=qk6WhIKn/+ELvEp+vyHHVRr7i+l4sUrOaHlfuQKbTD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FOc+1DqDaxlZ1pnaeB70DndeLACDRYjTX/jsFCkl5+TGS+We+sbE5zBHfIxbnkSF8
	 ZzPEIhHMVgWtlVXwzVdA0PeKIKSWB1TpjFEeKODs5uRQNcNsX8FbKFkFBF2r5hthn/
	 x15WbbFlfbzCt1OzMD9iZ5Myx2pej8D+8dl6OscBOggH3xxX8bjeGdir59CxO1Fq+V
	 yUhh91NuynM9VBJ6OKQgnDvhH1szftwWapx8yIFYcEZtGHKaRgQjEDGsdD/+p0nff+
	 xM7/TY/h+cwNQtLA6R3QjsFB7MOTWEiL1mwR2rR5f6VcngBtZS8spmXh/qHqmz876v
	 XZOz46hqTbGMw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54e40113cf3so136233607b3.12;
        Mon, 10 Apr 2023 05:52:49 -0700 (PDT)
X-Gm-Message-State: AAQBX9f91ecig9vpBTFKERKpV+KLNKJn59SDC5URYDbPLi998j14lxEp
	RcczzMptozRpSn7SsYATKfBGc4nferGNbrcfAg==
X-Google-Smtp-Source: AKy350aDRyQMV5T6mSbrLN2KN/1UzLpgACW1vknvF/Q03DFMH0R0/3LmWFu9WLLcHlBzT9xv1sRTcG7uq0fWVFnDrNk=
X-Received: by 2002:a81:ad05:0:b0:545:ed8e:f4f6 with SMTP id
 l5-20020a81ad05000000b00545ed8ef4f6mr5632727ywh.5.1681131168306; Mon, 10 Apr
 2023 05:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230410120017.41664-1-tanure@linux.com> <20230410120017.41664-2-tanure@linux.com>
In-Reply-To: <20230410120017.41664-2-tanure@linux.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Apr 2023 07:52:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJZWmy8PGwjjBc7FA2JcgvHqmtgkkuHy=XHMT8bVEAxSA@mail.gmail.com>
Message-ID: <CAL_JsqJZWmy8PGwjjBc7FA2JcgvHqmtgkkuHy=XHMT8bVEAxSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] of: fdt: Scan /memreserve/ last
To: Lucas Tanure <tanure@linux.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jbrunet@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	martin.blumenstingl@googlemail.com, narmstrong@baylibre.com, stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_055251_289323_D675E3A9 
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

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgNzowMOKAr0FNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBDaGFuZ2UgdGhlIG9yZGVyIG9mIHNjYW5uaW5nIC9tZW1yZXNl
cnZlLyBhbmQgL3Jlc2VydmVkLW1lbW9yeSBub2RlLgo+IC9yZXNlcnZlZC1tZW1vcnkgbm9kZSBz
aG91bGQgZ28gZmlyc3QsIGFzIGl0IGhhcyBhIG1vcmUgdXBkYXRlZAo+IGRlc2NyaXB0aW9uIG9m
IHRoZSBtZW1vcnkgcmVnaW9ucyBhbmQgaXQgY2FuIGFwcGx5IGZsYWdzLCBsaWtlIG5vbWFwLgo+
IEFsc28sIC9tZW1yZXNlcnZlLyBzaG91bGQgYXZvaWQgcmVzZXJ2aW5nIHJlZ2lvbnMgZGVzY3Jp
YmVkIGluCj4gL3Jlc2VydmVkLW1lbW9yeSBub2RlLgoKTGlrZSBJIHNhaWQgb24gdjEsIEkgdGhp
bmsgZG9pbmcgdGhpcyBoYXMgYSBoaWdoIGNoYW5jZSBvZiBjYXVzaW5nCnJlZ3Jlc3Npb25zIG9u
IG90aGVyIHBsYXRmb3Jtcy4gSXQgc2hvdWxkIHByb2JhYmx5IG5vdCBnbyB0byBzdGFibGUKZm9y
IHNvbWUgdGltZSBhZnRlciBhIGtlcm5lbCByZWxlYXNlLgoKPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvb2YvZmR0LmMgfCA5
ICsrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZmR0LmMgYi9kcml2ZXJzL29mL2ZkdC5j
Cj4gaW5kZXggZDFhNjhiNmQwM2IzLi4yNmU2MDhkODAyNWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9vZi9mZHQuYwo+ICsrKyBiL2RyaXZlcnMvb2YvZmR0LmMKPiBAQCAtNjM1LDE2ICs2MzUsMjEg
QEAgdm9pZCBfX2luaXQgZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0odm9pZCkKPiAg
ICAgICAgIGlmICghaW5pdGlhbF9ib290X3BhcmFtcykKPiAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+Cj4gKyAgICAgICBmZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPiArICAgICAgIGZkdF9yZXNl
cnZlX2VsZmNvcmVoZHIoKTsKPiArCj4gICAgICAgICAvKiBQcm9jZXNzIGhlYWRlciAvbWVtcmVz
ZXJ2ZS8gZmllbGRzICovCj4gICAgICAgICBmb3IgKG4gPSAwOyA7IG4rKykgewo+ICAgICAgICAg
ICAgICAgICBmZHRfZ2V0X21lbV9yc3YoaW5pdGlhbF9ib290X3BhcmFtcywgbiwgJmJhc2UsICZz
aXplKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFzaXplKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICBpZiAobWVtYmxvY2tfb3ZlcmxhcHNfcmVnaW9u
KCZtZW1ibG9jay5tZW1vcnksIGJhc2UsIHNpemUpICYmCj4gKyAgICAgICAgICAgICAgICAgICBt
ZW1ibG9ja19pc19yZWdpb25fcmVzZXJ2ZWQoYmFzZSwgc2l6ZSkpCgpKdXN0IHRvIG1ha2Ugc3Vy
ZSwgYSBwYXJ0aWFsIG92ZXJsYXAgd2lsbCBzdGlsbCBnZXQgcmVzZXJ2ZWQ/Cgo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwoKU2hvdWxkbid0IHdlIGNvbnRpbnVlIHRvIHRoZSBuZXh0
IGVudHJ5IHJhdGhlciB0aGFuIHN0b3BwaW5nLgoKPiArCj4gICAgICAgICAgICAgICAgIG1lbWJs
b2NrX3Jlc2VydmUoYmFzZSwgc2l6ZSk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGZkdF9zY2Fu
X3Jlc2VydmVkX21lbSgpOwo+IC0gICAgICAgZmR0X3Jlc2VydmVfZWxmY29yZWhkcigpOwo+ICAg
ICAgICAgZmR0X2luaXRfcmVzZXJ2ZWRfbWVtKCk7Cj4gIH0KPgo+IC0tCj4gMi40MC4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
