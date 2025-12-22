Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D33E6748D
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Dec 2025 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wuHaMB/7wNXhCkFxlXpb92r0bgPlb78KY5vBeWhSaE=; b=rFVU40jMYjbFL5
	Ch3x27b72CDuloUpXqbfLh+5PYzA5kKcH3BF3aUTXivy/QvqrtCjJr7sffly7K7yGqBk447Khkpod
	hfo4SGhad7hdkeTBMWzEUrY+RjdpyGBz0Mowou6xwQFF5O8nLxlppx5CKWkmr/qYvFCCCrwrYrkak
	h6pjVrXfteBb+4likZwIBgHtWg+PB4avAmAQDmSeBha0xITCNEw+AvtpXWZdJPRGDi9gFsIFo8Az0
	dyRhQluWTJIjsSgEN+BK26NL8pYQfA78WuChY9yyD9o+RKxEM8wlcfBuZtrGYKem2N0jIn5HILIs4
	5dAbfXTxhwgpshlY71DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdJC-0000000DdKb-0Eju;
	Mon, 22 Dec 2025 10:38:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdJ9-0000000DdJO-16hL
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Dec 2025 10:38:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a2ea96930cso42047355ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Dec 2025 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766399910; x=1767004710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=Vf6W+zd9Rylp9bo/e4btQ44sFwrKsd5cloPVLmnkMdoS3595atFPn7xMGXnk7HPDbm
         pyOITX4WAGcuX1eD+3hMcK3EIW0ufqGByrJ8b6HYesWEzr0oQOfRTdoXuwL65B6yOv1H
         +oNbnGCuYUGANwkEE8/4Qmqyg+RI9IyOTsVp9kxVNeNNHaRgK7a0KsISg6h071vkDYXr
         YKIOAgqAS6B6MPBEc6qtVlh7YphTOmTq6/8HMm1RtsSj1vgm6bjVxzw/eJ+Zbbf9CJq/
         se66cypkl6RYrnPGFGWWOTM+RPvhPs3TitpNOx9dymZPdPLJHw4kyMiVojnzr3guIWih
         k9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399910; x=1767004710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=e0spjNtMhlbbk8Mw082Tpyy5EvwbbBfnGkKyVulutwSMfAJAcDg/ksR9P9Hs6Mphsh
         elEZQrMQwDD/H7Dv5ACbU0UAfuV62hudnsgx1qGzjfNbBLi9uhw/xK1hU9n2VPtC6+uc
         1IXXnRAAFetAA6Q5D+DmkGd/Q2R8oDnstAswh118lbb3OZcV3T+t8yG7Hu9pc11eQlrL
         Fw2dsOX1mR2OYs17S8pjzPN7Y7UEkP5jyprqInje3qTNznuT2bQbqLMUtR3Fj0ZphjT5
         zJwaiZtFlOItOHeIOOcOMl/D/6z4unVzaw4I7rI7xOJUjHFuJa4zjv7O+af+qFpIXJjE
         iydA==
X-Forwarded-Encrypted: i=1; AJvYcCUGa7EAbbmSnCP9WJXYVE+9NSBTeZt3vC5obayELN9Zr0SBtWU1hchVDgEXUJmgrKolXJHwPyqUh8n6BybJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo78MusRlYUqoRKatiELR8peD34ifVg3TnR5jyV+RqFWegQAaO
	KhFwS2+u0XiifYw8b4PE4xY/OzSs9EzI2nlTGOzOjOUwmJLysjT3af6WIf3NXOoAbCGYbY2z/aq
	/YjJ0Es66D5CyjZ0BSOxEsRCStInycZo=
X-Gm-Gg: AY/fxX46oUVgcvGLwj4rwHbVDQEKw05uDLpMnPV9MRRaeMZvbiudhshVL6xfYHK2epB
	R6AnAWyfjiNt0QY0os4FLHFjv7RddYcH3MxkwKtE4KcV9X7a/OUMiy+djB1EIMDtD4iB/ZUQRnI
	Fuluhlk9fWGKsPz3K7h/bz2ltIe8UAx7u8eI+NhrBErPmsa6NtAdsmK+kpsjFBfFwdSonBo4+++
	Wt4+bwwh0Y99RY61lIomm0o5iei3mpBhyJB6w1e/qRFEOXGsup5ea5gQdOjPortSQNj4mAOuOH5
	G56brPGjHVLesY3c52mfztMaz19j
X-Google-Smtp-Source: AGHT+IEO/ZgFQp5AyfAAtwrHxXoiHa/X/03D0WDYxc4kBLqyULymzY/eR1r0RM8KzOikMvm9YYXtJ3AkgKqBI277jTk=
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2a2f2736bc0mr91265875ad.36.1766399910127; Mon, 22 Dec 2025
 02:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com> <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
In-Reply-To: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Dec 2025 11:38:19 +0100
X-Gm-Features: AQt7F2oefOvD1VauOsJ6RYNy_cI4jR0Cqg9gQFauSbHiZ7j1ecdJHG9Us9r2rRA
Message-ID: <CAFBinCBX+DA71OA79SqrE20Nd=QUrU86SmYGXu0dAYG-R5nZ4Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_023831_306508_34CBCC18 
X-CRM114-Status: GOOD (  16.04  )
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

SGkgTHVjYSwKCk9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDg6MzHigK9BTSBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIE1hcnRpbiwKPgo+
IE9uIFN1biBEZWMgMjEsIDIwMjUgYXQgMTA6NTEgUE0gQ0VULCBNYXJ0aW4gQmx1bWVuc3Rpbmds
IHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgNzowMOKAr1BNIEx1Y2EgQ2VyZXNv
bGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhpcyBkcml2
ZXIgb2J0YWlucyBhIGJyaWRnZSBwb2ludGVyIGZyb20gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaW4g
dGhlIHByb2JlCj4gPj4gZnVuY3Rpb24gYW5kIHN0b3JlcyBpdCB1bnRpbCBkcml2ZXIgcmVtb3Zh
bC4gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaXMKPiA+PiBkZXByZWNhdGVkLiBNb3ZlIHRvIG9mX2Ry
bV9maW5kX2FuZF9nZXRfYnJpZGdlKCkgZm9yIHRoZSBicmlkZ2UgdG8gYmUKPiA+PiByZWZjb3Vu
dGVkIGFuZCB1c2UgYnJpZGdlLT5uZXh0X2JyaWRnZSB0byBwdXQgdGhlIHJlZmVyZW5jZSBvbgo+
ID4+IGRlYWxsb2NhdGlvbi4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkg
PGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1l
bnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiA+IEFuZCBhZGRp
dGlvbmFsbHkgSSBydW50aW1lIHRlc3RlZCB0aGlzIG9uIG1lc29uLWd4bC1zOTA1eC1saWJyZXRl
Y2gtY2MKPiA+IHdoZXJlIEkgc3RpbGwgaGF2ZSBIRE1JIG91dHB1dCwgc286Cj4gPiBUZXN0ZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+Cj4KPiBUaGFuayB5b3UgZm9yIHRoZSBxdWljayB0ZXN0aW5nIQpUaGFuayB5b3UgZm9yIGRv
aW5nIHRoZSBoYXJkIHdvcmsgOy0pCgo+IEkgdGhpbmsgSSBjYW4gYXBwZW5kICcjIG1lc29uLWd4
bC1zOTA1eC1saWJyZXRlY2gtY2MnIHRvIHlvdXIgJ1Rlc3RlZC1ieTonCj4gbGluZSB3aGVuIEkn
bGwgYXBwbHkgdGhlIHBhdGNoLCB0byBtYWtlIGl0IG1vcmUgaW5mb3JtYXRpdmUuClN1cmUsIHBs
ZWFzZSBnbyBhaGVhZCB3aXRoIHRoYXQhCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
