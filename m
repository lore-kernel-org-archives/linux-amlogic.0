Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C56E7FDFA
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Feb 2026 00:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kACTFLMhA8zpx6Fm3HJSxTmaLhl7GrW/dwa80AVXUpY=; b=EAEiHFRqIX/w5K
	YGRLqCB6MqYbTUwulH3DF9ECE8IgkhOoHRrwk3CIeMpXDyEldA0VPewH+u7Vvv/qLAOoCWIAzPpI8
	uN1KWbE8VTpw2lPEJ1qa2tqC62Fkxe/GS3pyI5424/uP8xz1OCP1DE7zkjo4k2GWckfit1wNZV/AR
	1WIBRR4TOuvVANVMRkkq3DY6LK8E0au7E1TqPAN0pjWPFt/nOgppiPulapfTBlPxrldgrcy4JQ/Wm
	jhdSJ7NwTeLM3s9iFGIiCkHMvJKTCY77MLhNlQ5Yo4z1svcyO4FA4ESSOtuQZB54u/Orbd/5N2W4U
	aEvuId29O8DHStWBfmCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4IR-00000005nxr-2crU;
	Tue, 03 Feb 2026 00:29:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4IP-00000005nxc-3hdq
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Feb 2026 00:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3AF6600B0
	for <linux-amlogic@lists.infradead.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8526CC2BC86
	for <linux-amlogic@lists.infradead.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078572;
	bh=3vm/kv9zRIpvGnIGccp1SO6U/rqiZ7lbmB29xc3r2O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XaBK/mOzkTYhQZqO6JQWlHL58yajICAJIZdpNOopAfmbFcGDwrpEXkaLY7hGkwgpu
	 98KmUDhA3PGE30WGhYR/m5Nj05a2nOAQparfCW1gB1QHr067PweZRjQdd5DVEARIYy
	 hVIPQzyqLmDDgY4FpE0JQbyaQJfWE1wnEgw6UBXwJcx4jtP07Z8eQCNmNJSwjghdFW
	 tYyZ+pfLtTkcKIJs6o21BRPBEThMXpSy29xuJ4DwQnjwsLYnLCW7Q9P9pJpjSvZj13
	 ffS+I+PvSQnhlZsqXSBvLQs03ZEaR+6g0t4RVrH941qOhS/SMkDX+9QcaJnTYem8ah
	 KJ0EbO3mfNYWA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649ba412b8dso2107676d50.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Feb 2026 16:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQ99jxHcOkNJAb/V71e2HhyWMhe5REJpS6tNI6AJPVHlGh4fiBsG/Lo85e2qwi2auh2kXHdhErie22pdBh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz50n46YyG3EDwu9nPS3dH1k+EsCSuVzR2/ttqNdEWG9GdUN+T
	+Su/NC8VVN2gumQrDq7emwOjquG1J7oTn3ztbATDGv2TVL8gMXzvmm+W6iqMeng6s5gmJL7DBi0
	04fTQ441Mv1YJFbxJQYhc4KEDobTGKgQ=
X-Received: by 2002:a05:690e:118d:b0:649:d19d:3b08 with SMTP id
 956f58d0204a3-649d19d3e01mr1760131d50.89.1770078571815; Mon, 02 Feb 2026
 16:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
In-Reply-To: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:29:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
X-Gm-Features: AZwV_QjBQY1gX2gsq14TbI1JTob3bjmO9B641FWFogw9-JRL8gq-V-nd0dVYpsQ
Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in bank helpers
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgNzoyM+KAr1BNIEZlbGl4IEd1IDx1c3RjLmd1QGdtYWls
LmNvbT4gd3JvdGU6Cgo+IG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9maXhlZF9hcmdzKCkgaW5jcmVt
ZW50cyB0aGUgcmVmZXJlbmNlIGNvdW50IG9mIHRoZQo+IHJldHVybmVkIGRldmljZSBub2RlLCBz
byBpdCBtdXN0IGJlIGV4cGxpY2l0bHkgcmVsZWFzZWQgdXNpbmcKPiBvZl9ub2RlX3B1dCgpIGFm
dGVyIHVzZS4KPgo+IEZpeCB0aGUgcmVmZXJlbmNlIGxlYWsgaW4gYW1sX2JhbmtfcGlucygpIGFu
ZCBhbWxfYmFua19udW1iZXIoKSBieQo+IGFkZGluZyB0aGUgbWlzc2luZyBvZl9ub2RlX3B1dCgp
IGNhbGxzLgo+Cj4gRml4ZXM6IDZlOWJlM2FiYjc4YyAoInBpbmN0cmw6IEFkZCBkcml2ZXIgc3Vw
cG9ydCBmb3IgQW1sb2dpYyBTb0NzIikKPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5n
dUBnbWFpbC5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
