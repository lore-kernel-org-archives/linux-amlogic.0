Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609F8E67482
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Dec 2025 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqhJox1sooc1EBau6ZO4GeSZUifk+ZUoAx276qfRQGA=; b=Ejm0kq9Nde78Jh
	a2BYCah4D9DdB6Zt6/lKjYiwcvNipSIVTaxGSBE516AWklWtes5Sd5sRHFDjn5kcskfZ52hpzVzL2
	2oy4iPHHSVny7Y/x3EE4wk1Lni2srdj3KsJ9YIhMFJyMGMNeuEZs90rT4dlO9PlwzEhwsEbSaVGbK
	NG72wwxrY/8D60NG2G3x7KnPJ6DGeptVydAEc4u2WeOxS4448Tpwnj5R6GLRHIkLuEgoepXxT4Fq6
	JcjVIvt5TVjltawaTfa0vlwcrKyN25SrSVNkWppWgcLij6kI/t2+MuLuDYKYMIjP1dHU68P9JQGPA
	hWl51BudDl1laggeR4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRKH-0000000CnbV-3JxZ;
	Sun, 21 Dec 2025 21:50:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRKF-0000000CnaL-0Tsj
	for linux-amlogic@lists.infradead.org;
	Sun, 21 Dec 2025 21:50:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a1388cdac3so31966215ad.0
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Dec 2025 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353850; x=1766958650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=IqPg5dTJXdxX+0OWQ4CZajN6/vgRxMxYfdNOGXa+bg0xZy7lgk9ppZ8dCtmYN+QM/M
         U6dhlYLdx4i5Q9iHyKkq+6UN5GI14sWyyEdPe5xeQJDlMHuRLapZS1RdeqrjXkvMC0bc
         lYT6SvVOmTjB6tBJGEVixqm2eOuyNrHfA7aQDvnA4C1W2WKc6ciZqVMAclm7FXXjq5OV
         nYK0egMN7o0MSqbnCdrf+N75aodoerBwQLrnsn4vk3XnqiN3eWZSBVwYl7oE4oeugThE
         17YxN0t876GItH8U2eovQkkR+y3t3Gt4p4TP/Fxh/Iz7uDcweKm6tBGoF1JgMXiL6+H8
         QnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353850; x=1766958650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=j/FKQs+FZhFYov915UdQdnKRBS/0oMyGRc9wpmasyMKZEBv+HFxfvOJrhWz2dqMpI6
         NkgTLF79Ac1P7UoUeSh1Y8wxWfySXw0jzy/aHZv0Ei3z+qMovMWT2qHPrJa1duuetWyn
         5kwa7sruk7T17shtx+CeVpWUFgNLPtkP4CcWTCy265GdGZN9jCXvUVaJpKZK390x4/pd
         sF/9bDDgwLhVzt7uKaP43wZsJzujzQ6FykPViY7pEmK4OdAIfnCtlqsINLQ1DjhGL4CJ
         qzRc/yctD4njVUM47WUwPbjJ0oyCK2ukScVDJiS7G0mMpO6aB68TJJ/iMjeFOQ298lrz
         ctyA==
X-Forwarded-Encrypted: i=1; AJvYcCWKfyAAsaB5/oCs6FaqrJpna4kUYj1WgSPNxcXn5JbWobEGc6gmyeDcI8T7lzlL7FkLjTNyKjCXdCoc4nuC@lists.infradead.org
X-Gm-Message-State: AOJu0YwDD37n7FBLXjMKFcHtC+0La3MI1KH36ZPxOzEVSQqp8Au6/SIO
	EbQ6X1GFw3nD7lIaL8bobf5apzCgX2Lbq+H2GYGgeRTG2K3euzSlDBkltDJd+GtNa6XjL7Xr+Ml
	VvAB+vPrKGix0cIJqd0s4d9+q+1e1txU=
X-Gm-Gg: AY/fxX4AznK6y9MvEvEmeFX7m1IGKfzD7yyuqxHFaFNc4IMPz/uvAvuz1h9HYTs3PY5
	n0lLDnPQPHiKcR7WKoJlya30C0Ltvkw6tRstArcLxGTPRH3Lt30cO9f5rzikUwhNbCyeXEntu6a
	HADFzHua/1m13h04epqWRr4HD+eYiDa6+v/2vNykK9IzmjNW9LyhPz7R0b1ihSpaOcG+vQVb+X3
	U06G4N2ExemWWvkrjFtBnbAaOZZ9Aixkc5LdeqY/UqsTuEsTgrdH1OBN3yzgUmJmYhvpUgv9vSn
	FqdwC4VmO/dxlDksAER740Ug9IIx
X-Google-Smtp-Source: AGHT+IFmGLO1ppe7sd+ZWkCXr5M/lVGVTY4CkYOHQyHuMOoqYtObXJlv15dAaXOXobOy5zBtPFDXPUKZsDC8LF455xI=
X-Received: by 2002:a17:902:d2d2:b0:294:f310:5218 with SMTP id
 d9443c01a7336-2a2f1f904a0mr102182675ad.0.1766353850211; Sun, 21 Dec 2025
 13:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:39 +0100
X-Gm-Features: AQt7F2oD-fq9YbJ8bBaEtNQvS-l_6JEvIhNv2LhoefMzto1ImTx3Z1Dec3fhOSc
Message-ID: <CAFBinCArG=-pNRHZTdZX1CDDPrs02zpRJ29GSEUA6TcUckQvww@mail.gmail.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
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
X-CRM114-CacheID: sfid-20251221_135051_151312_17A6624E 
X-CRM114-Status: UNSURE (   7.44  )
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
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
