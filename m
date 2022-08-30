Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F5ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8aobAOD0Ie9YF2kqfWX0wdhCS1d6Y0w797qv9J4EH8=; b=ZHlKqWS7cd083M
	UK7NBmbxjr0KXg55sC1VpqDX65tcazxi1r/KCqY/Db/ThkK8UIWR9W3pS++AZAJERChmgJQWjT/8y
	k1jPwKfBdDpWrj9MLGgb1UOdq3dGLko9VM4sKVMlm0Ds9wsSPB70RJJoomE7Q3S6fiAz4AAFACgny
	26SM3zZwVuFhw4cfZBNfct01EfGzHDPZFXUEjmFQJOCnniKX+6le7lEhS1A40eRoENEvHROA3Vdyx
	XZ5U6vp2LfBWenis3yrOavJYWEwy493+OmgJs9hN1Yae1dEU1NDQqqTkFXJ1PJ7NbRMOJ9uOJAxIJ
	Xm2gRLvYrG3on0sc2CnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT8pg-00246g-U3; Tue, 30 Aug 2022 21:31:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT8pV-00243E-2k; Tue, 30 Aug 2022 21:31:30 +0000
Received: by mail-lj1-x235.google.com with SMTP id p18so9394112ljc.9;
        Tue, 30 Aug 2022 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
        b=kSqNn3A96fFfYAvZMnZM6fCkCnjNdGOAfgbjh9xsCUhPlw304ML9UOEGEq0noWgIeP
         e8mzpa9LJOTPz3mo314puee4Fei78Xd3dwfhduIl+R9me/flZOEnbstk45R5T8xMBH5j
         qj1SBot1DkuqGKcyF7RI8id8AqXjy7LQG9OWw/dcdOmtkhYzextF2jhnGSmja1hGlzqs
         8uFyhJM+XooSUzJnWBsnt2T9p8alpMeedc8qVliCE16DCl0Nea+DeCk5ybxPVZk/RlN9
         3wS6qGlyAK0i3imci6ec/k3ZZuvuHvx8V/aL+wP4XOiVLZG8emIw8ni+mIZBgQVmJWF/
         gsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
        b=ujkZb/KAdhLOQbAlQABZXKAWy37FzRdri9TItLuLRhwHG/PGfiefTPR+bjn/dXNksM
         tmQcnzv3MOnot6UU+YMfRGjGEHuqrG6YEx15gMvaBFBTbDiyA4vILIJVpaDYchyaPaDt
         awK1R6fh8OpOhjtgyXSE2V+bs9A3WAaRt3tgKFXeWC9xjqntaO4sU/o4DvylLRI3VIj2
         JZGw6Lml2QNgTdX1WdzusF/YJ+jUQf0yuLNqMyaa0ZmG/UAe2uZiIwqGqsKqqEfh2E3x
         OuHUpvsT6VAbnhEtNXDfr0GuXlYrn6ewkpXFLdJHjK2MQ+5yPQRHYX+ulJFV2Km4qroN
         PXiA==
X-Gm-Message-State: ACgBeo3gRe26HxOd6vHh2VO53+ur1SzKv+ECFwpNTaKmaynriMXK59q0
	iRMw7PHUiYfshmioAkPTmF0=
X-Google-Smtp-Source: AA6agR4S4WuypWhRAErxoi920Fo8fv4SJcbnBpQK5wzzMSWUXZMHydNeVYFmYA2Bqfe1pnKLfGrkYg==
X-Received: by 2002:a05:651c:507:b0:25e:73af:1661 with SMTP id o7-20020a05651c050700b0025e73af1661mr8063374ljp.195.1661895086153;
        Tue, 30 Aug 2022 14:31:26 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:d40b:b088:5bfe:3b81? ([2a02:a31a:a240:1700:d40b:b088:5bfe:3b81])
        by smtp.googlemail.com with ESMTPSA id x7-20020a056512078700b0048b0aa2f87csm1733424lfr.181.2022.08.30.14.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 14:31:25 -0700 (PDT)
From: kFYatek <kfyatek@gmail.com>
X-Google-Original-From: kFYatek <kfyatek+publicgit@gmail.com>
Message-ID: <a2ebfb0b-7b54-8059-036b-7aa1bdf4dd78@gmail.com>
Date: Tue, 30 Aug 2022 23:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: pl
To: Dom Cobley <dom@raspberrypi.com>
Cc: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
 <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
In-Reply-To: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_143129_144980_EDD38518 
X-CRM114-Status: GOOD (  13.80  )
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

VyBkbml1IDI2LjA4LjIwMjIgb8KgMTY6NTYsIERvbSBDb2JsZXkgcGlzemU6Cj4gT24gRnJpLCAy
NiBBdWcgMjAyMiBhdCAwNTowOCwgTWF0ZXVzeiBLd2lhdGtvd3NraSA8a2Z5YXRla0BnbWFpbC5j
b20+IHdyb3RlOgo+PiAtIENvbW1lbnRpbmcgb3V0IHRoZSBwbV9ydW50aW1lX3B1dCgpIC8gcG1f
cnVudGltZV9nZXRfc3luYygpIGNhbGxzIGluIHZjNF92ZWMuYwo+PiAtIFJldmVydGluZyB0aGlz
IFBSIGJ5IERvbSBDb2JsZXkgYS5rLmEuIHBvcGNvcm5taXg6Cj4+ICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS9saW51eC9wdWxsLzQ2MzkKPj4KPj4gRWl0aGVyIG9mIHRoZXNlIGFw
cHJvYWNoZXMgbWFrZXMgVkVDIG1vZGUgc3dpdGNoaW5nIHdvcmsgYWdhaW4uIE9idmlvdXNseQo+
PiBuZWl0aGVyIGlzIGFwcHJvcHJpYXRlIGZvciBhIHBlcm1hbmVudCBzb2x1dGlvbi4KPiBNaWdo
dCBiZSB3b3J0aCB0cnlpbmcgdGhlIGxhdGVzdCBycGktdXBkYXRlIGZpcm13YXJlLgo+IFRoZXJl
IHdhcyBhIGNoYW5nZSB0aGF0IGFmZmVjdHMgcmVzdG9yaW5nIFBJWEVML1ZFQyBjbG9ja3MgYWZ0
ZXIgYQo+IHBvd2VyIGRvbWFpbiBjeWNsZS4KPiBUaGVyZSBpcyBhbHNvIGEgZml4IGZvciBhIFVT
QiBib290IGJyZWFrYWdlLgo+Cj4gSWYgeW91IHN0aWxsIGhhdmUgYW4gaXNzdWUgdGhhdCBvY2N1
cnMgaW4gZG93bnN0cmVhbSBwaSB0cmVlIGJ1dCBub3QKPiB1cHN0cmVhbSwgdGhlbiBjcmVhdGUg
YSBsaW51eCBnaXRodWIgaXNzdWUuCgpIaSBEb20sCgpJIGp1c3QgdGVzdGVkIHRoZSA4NjhmMWNm
IGZpcm13YXJlIGFuZCBpdHMgYXNzb2NpYXRlZCBrZXJuZWwsIGFuZCBldmVyeXRoaW5nCndvcmtz
IGxpa2UgYSBjaGFybSBmb3IgbWUsIGJvdGggVVNCIGJvb3QgYW5kIFZFQyBwb3dlciBtYW5hZ2Vt
ZW50LgoKVGhhbmtzIQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
