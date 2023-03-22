Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E0C76196
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZHPqUqHaSdOQbKxGQNlR5TWvn+fZpxTJfldQe/J4DQ=; b=uJ9lQ48uS9Uaxh
	Gu5w/Mox2bzqe+hGRxA6oEi4B+uAUd2LUHCBoqy2e/XrNoiKZiM5Jc05en3+U7yq3WoDScAfvZk90
	DZ9Z5klL9iH6YrsVf3LKiQpnwakOYNoWK6Fyr3Jv5apZhODSrlOVVUwWDd144c3QOrZ7VAC7uBuS7
	mAFD5QW3G2D2vRpvOkBXa2pjMII7DpbwboXEJ7hSllitYczXqPWCmvJHeJyg6AlKyTg+189sZX0gp
	fpdp0RRPITYz/1cGGKzK6wUvkCYuSEWRSrM6RcsofJuLAJPMAt5aeFvp+m881RtyvCdW45eKsx11J
	qYrue5ZuXWMqGY+MkMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4n0-00HIpj-27;
	Wed, 22 Mar 2023 20:10:30 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4mv-00HImZ-1c;
	Wed, 22 Mar 2023 20:10:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id y4so77886032edo.2;
        Wed, 22 Mar 2023 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679515823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO+RxVHj93oqiOjN3tvlrX0xqusRwNw2CRPttJ0nsbE=;
        b=f21cfHvZpvxODQkPMeHZw0VVc7+hdYHVEuQrlKDrGD/COeQVOhKdoDJfgdUtV2TnVg
         wO5SEK5cPVhSnvlyG5LGJLwWFrNlWcPZ8uwu8NBbuSQZQRe+vMJRlsuvYZizBoV4E3q6
         Rb5CtVZE66GOuBy5hxIF/0Gv2y1LIf9vLDPxLSFwnMGVYqGHTA3hz7w3KP3d0gIeCtFq
         t0xf28qfjXHsLnD8hGV5bJuKt8h/RO6vBzQwLkk/EfXZgrVy+jsITd0Gec1PT5oX6U+g
         7krNRgyEAX7j5+qxlHL3lrp7ZgglHS6keLKOTmjH4s/AzA094WiQz9Zk6FZfp/8iGskg
         J1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679515823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO+RxVHj93oqiOjN3tvlrX0xqusRwNw2CRPttJ0nsbE=;
        b=lBVxFbHful64d1y7smk/vbYhi9VgUkA8UNPqQdHXfWpkUwfrmVjBZRpPloOsFPSeqA
         EU4BnwBdWz0s3ulNbXY8DtQqpPD5BRylqffbx0x7xT9VibmSyuJ+Yu/LDMth+LGAr+NF
         Ga5x78b6NtWrns1USDMg7aDVtIOvD/QO+gB9bh8wA+1JVJ2ktosYz8+D55po8KN2B547
         vjtlT3+kBx2K3uxwDrQQbo03Zxsg7FpMGCV1lWWRxAg24HCBSyq6brTYE8EnLVLuZ5el
         Kfqw7i8Osbz2WoUR/qxpIHhL/S1tFy2B0vxbAqXyk+3xVStX6WgGlx1fNnGCvMPAef07
         l3Ag==
X-Gm-Message-State: AO0yUKV+8IYY5FhCOui6IGuVAvM+KPXOCoanAVJE5/6xjNSVYzX3GY37
	XBd8CRBb3LXKPu9/UCgGsRhcFzd/NuyciSYNahA=
X-Google-Smtp-Source: AK7set/0TeN0zr8cVu1eyLlBoDyP0EfiM6Qqt0rJeFiCyF/NYwC7cB4mSBs7WoqIFgnDZFFXTgGzjTITMMXf7hXth5w=
X-Received: by 2002:a17:907:788e:b0:932:4577:6705 with SMTP id
 ku14-20020a170907788e00b0093245776705mr4082690ejc.6.1679515823192; Wed, 22
 Mar 2023 13:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
In-Reply-To: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Mar 2023 21:10:12 +0100
Message-ID: <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command word
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	Yixun Lan <yixun.lan@amlogic.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru, oxffffaa@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_131025_560142_B5D7B520 
X-CRM114-Status: GOOD (  13.62  )
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

SGVsbG8gQXJzZW5peSwKCnRoYW5rIHlvdSBmb3Igc3VibWl0dGluZyB0aGlzIGZpeCEKCk9uIFdl
ZCwgTWFyIDIyLCAyMDIzIGF0IDc6NDXigK9QTSBBcnNlbml5IEtyYXNub3YKPGF2a3Jhc25vdkBz
YmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4KPiBWYWxpZCBtYXNrIGlzIDB4M0ZGRiwgd2l0aG91dCB0
aGlzIHBhdGNoIHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMgd2VyZQo+IGZvdW5kOgo+Cj4gMSkgWyAg
ICAwLjkzODkxNF0gQ291bGQgbm90IGZpbmQgYSB2YWxpZCBPTkZJIHBhcmFtZXRlciBwYWdlLCB0
cnlpbmcKPiAgICAgICAgICAgICAgICAgICBiaXQtd2lzZSBtYWpvcml0eSB0byByZWNvdmVyIGl0
Cj4gICAgWyAgICAwLjk0NzM4NF0gT05GSSBwYXJhbWV0ZXIgcmVjb3ZlcnkgZmFpbGVkLCBhYm9y
dGluZwo+Cj4gMikgUmVhZCB3aXRoIGRpc2FibGVkIEVDQyBtb2RlIHdhcyBicm9rZW4uCj4KPiBG
aXhlczogOGZhZTg1NmM1MzUwICgibXRkOiByYXduYW5kOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9y
IEFtbG9naWMgTkFORCBmbGFzaCBjb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5
IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KVGhpcyBtYXRjaGVzIHdoYXQgSSBj
YW4gc2VlIGluIHRoZSBvbGQgdmVuZG9yIGRyaXZlciwgc286CkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKWy4uLl0KPiAt
ICAgICAgICAgICAgICAgY21kID0gKGxlbiAmIEdFTk1BU0soNSwgMCkpIHwgc2NyYW1ibGVyIHwg
RE1BX0RJUihkaXIpOwo+ICsgICAgICAgICAgICAgICBjbWQgPSAobGVuICYgR0VOTUFTSygxMywg
MCkpIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwpNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSB2
ZW5kb3IgZHJpdmVyIGlzIHRoYXQgdGhpcyAibGVuIiBpcyBvbmx5IHVzZWQKZm9yICJyYXciIGFj
Y2VzcyAobXkgb3duIHdvcmRzOiBhbnkgYWNjZXNzIHRoYXQgZG9lc24ndCB1c2UgdGhlIEhXIEVD
QwplbmdpbmUpLgpBcyBhIGZ1dHVyZSBpbXByb3ZlbWVudCAobm8gbmVlZCB0byB1cGRhdGUgcmUt
c2VuZCB0aGlzIHBhdGNoKSBpdAp3b3VsZCBiZSBncmVhdCB0byBoYXZlIGEgI2RlZmluZSB3aXRo
IGEgbWVhbmluZ2Z1bCBuYW1lIGZvcgoiR0VOTUFTSygxMywgMCkiIChtYXliZSBzb21ldGhpbmcg
bGlrZSBORkNfQ01EX1JBV19MRU5HVEgpIGFzIGl0J3MKdXNlZCBpbiBtdWx0aXBsZSBwbGFjZXMg
bm93CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
