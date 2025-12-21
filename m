Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4174E67482
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Dec 2025 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMgIcdow2Xeiv/2THA468m9/S8LKZLL9DoDK7kn1V9E=; b=svhv9cQbhtKD30
	WOtXa++eYv2vqlG4LZjWHseW3atPTug/n4e5g7YWbnVIwKj9WUPk9Q7I4SE3gyUOYnvUuMdJTtMdz
	KRVIUJx4DTIiVqZi75CoNF4I8LkA7u2wuuHm10Jl9UkKxZCmyJzCsJy3RAhoiiQlj0AJxaF1FCqzL
	QEbCcEzoKf2ZSvzrJzj9rHUb+TLoruFI6bqp3Phjx3GOShn4F73KHDZwmxfeTf14Lv/4Gt2eXlIS0
	3Ih72QGEAXPfHzMVfoc8v6yJhyINdNGqsRUEMB/+IdSPzWlcNTnS+h8K2tyiAC9T8mNUYUri/QBpG
	RZF1VJjYuMJEjgIqHIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRLN-0000000CnpU-33Ux;
	Sun, 21 Dec 2025 21:52:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRLL-0000000CnoU-0EDB
	for linux-amlogic@lists.infradead.org;
	Sun, 21 Dec 2025 21:52:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0834769f0so32539815ad.2
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Dec 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353918; x=1766958718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=VWN1XRT9pC4VMWG32lWWb1I60dFZXiyQ2aAlQCotk0/PRbnugxagLjgUPKbXH04IcD
         IGArAMyv4IKKPpUkDs4bbTJGpxFfteLbDbFvQ/F5v5G7zzezJpud9o9ZMdwnHl0e5szp
         jz+qcHLNOc0FYXXn0X2oNTR5+1UZMfP3Fa54yN6EXvcFZ5Q2uYbhEgBYSgdL6oDIIwdB
         Eiil+IfEdDjiq8OJKs1xBkDN1ZPUrQyQ0NS4qO+/Tj7O2Bz4zmE3L0a+F7O9c0IT7jm7
         Qy6GqVQL4RAxSErWlJk5RD1bO6mVebQdzwY9sLax2PIocT4cyyNGL0TylRKQUV8PBRI1
         wv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353918; x=1766958718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=bNuT5nTho9pNwTqWD9TFieQWSm3X02+dwC5+hALPxlTAztf8biSMPQPWgHgjBtXbRb
         2SurYAEmvfdX9kcRLuoSvrwRttw2Xn8ZnrsvL4L67l+NUC7853maCWs+emUghbKo1wgJ
         TNfTnBAulG8bc/gH5Fq/V/nc7CoCZg6ikzCJsniUhq/ZaVthKh0DgPFG9dO2DaN2tYNc
         hVDfTcubqH6p59aLll9h0Ab/ZZWM1nAK+dC1Tkf4D/JZl8Lcyti5nYN70a0hg+zxx0gI
         9n/ii6Igv14Q4em8gLEecxDnGWZ+WIxd/Ze+abzQwivYmHYX/NF3mv4e0sX133xcBAuO
         uSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW6H+XhrSK/q3B3XpglTtRRCh+esN5taW4kNSQc7ZWHP6RaykF3YCRWoo99ilc2DpvYpZIh/iFwN5DS/fX@lists.infradead.org
X-Gm-Message-State: AOJu0YxKIR8UpN8k5GEBJCYz9KaGislIh+32e+zNewPXqsxx4fa7VTR5
	m3TU+lkGNiVzx40tquk6/42ZOOj73aVgGey5Vh3t+zW/8bSLT6jZ2c1IVigEnAR/UPjO9aOTELU
	Ra4r5zW516odPig3F8NSoSwFxSgVW6XQ=
X-Gm-Gg: AY/fxX582EPzxWha4FeHMQbtbGP5RODIKAbLMfsvTdMcCJ8xlPPYBCZ42mAwtBLEA7K
	f2T1dlGEglBylMiplf70lyh0QhJ19TqEfKecJAG1hZY77u9GBafHN+vKeyzI1QpEmq6bKu5wTZt
	cTYgqUthWpRIkpbV6afoWKYAMLPOSvlwmiG7VrbfYeKb9So7bgo4pDTbbuarD4/8D1999bzPF0C
	tqzsi94gRhPv970frdgsLudpq0DGL1dSvYa9CW4A4GDm4FvwaEs4LyOjgwvN+Uh3nJwLgW16uQY
	BGefLtKBfAQKsobu5WLYNbIvIs+i
X-Google-Smtp-Source: AGHT+IFhVsKQ8B8hFSiqKoLGfXbsRY75c2m0MOxZCySUkGexjvaMcQL0jHgp8m1+S1WmJwyBE3X0eYB56oovc6ceHh8=
X-Received: by 2002:a17:902:ccc7:b0:2a0:9759:66fe with SMTP id
 d9443c01a7336-2a2f2735242mr95258195ad.32.1766353917909; Sun, 21 Dec 2025
 13:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:51:46 +0100
X-Gm-Features: AQt7F2rrzqrcB2CqEcsVtsm58CwTVijhfO5EKXQK9KI68D9dnI-HolBL_A2auf8
Message-ID: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251221_135159_091402_13799171 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgNzowMOKAr1BNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBkcml2ZXIgb2J0YWlucyBhIGJyaWRn
ZSBwb2ludGVyIGZyb20gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaW4gdGhlIHByb2JlCj4gZnVuY3Rp
b24gYW5kIHN0b3JlcyBpdCB1bnRpbCBkcml2ZXIgcmVtb3ZhbC4gb2ZfZHJtX2ZpbmRfYnJpZGdl
KCkgaXMKPiBkZXByZWNhdGVkLiBNb3ZlIHRvIG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKCkg
Zm9yIHRoZSBicmlkZ2UgdG8gYmUKPiByZWZjb3VudGVkIGFuZCB1c2UgYnJpZGdlLT5uZXh0X2Jy
aWRnZSB0byBwdXQgdGhlIHJlZmVyZW5jZSBvbgo+IGRlYWxsb2NhdGlvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+ClJldmlld2Vk
LWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwu
Y29tPgpBbmQgYWRkaXRpb25hbGx5IEkgcnVudGltZSB0ZXN0ZWQgdGhpcyBvbiBtZXNvbi1neGwt
czkwNXgtbGlicmV0ZWNoLWNjCndoZXJlIEkgc3RpbGwgaGF2ZSBIRE1JIG91dHB1dCwgc286ClRl
c3RlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
