Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08919C3ABA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWFF1hkpHYwp+sCuYzMZ3ONkA8frlv21SuQHBy0UWzw=; b=uZJSH5rZ5jA9Vt
	Z+zesd1H9zs6SBNICERpG7voWNJoCYE6+ler7eil9Ix5vHov3fmQbIpc2rx9jO30GdTkKUyYf7B5O
	/WYeO1F5C8iSPTnUzgju8kP8auebcNbNIhtaQTxtWBCnuGjPFsqWMwlWwbV38qjGSDgYUPsASVVgG
	ug6hIMlt5P6PEwkUCwnnM6Bx8KNX8IX0UKB3e0h2IT538XJ/uejSs/+/OgD5Ln4FukOrQ8jVIwlmD
	DxhYxGYQss2v7255XJNMxXasCNqSxQ8NH7b3ggmWTc/lK9pVOteFwnDOEGPC01xvr0uK4fkIeJ4wu
	AYMWxnso96/J0TH7AtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QkR-00000006pBI-1I2H;
	Mon, 28 Apr 2025 15:50:23 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Qfd-00000006oJq-3sur
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 15:45:27 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e637edaa652so3629315276.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745855125; x=1746459925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=nIa6WAOh3JYC2P+IK4xQy99LDDdJw/KC9mRQwBHX9E57HF4zBKFWVADK5i3jV9+29W
         q20OYhlTxvp0vid80DdGj4cJSQt24PRdQpE8Uhredp8vI5jgaGkIdcUsxLsNFkKuEmW6
         7CttjoilXIxveoRh8t9bdmgodd1ESgyGazMcBLImDMmv/kztbltzEiVWqfyD1oIfrLDa
         nUOnkvZAZfz8z0SNWxqzEfgatmceWtswkoI94d32JKlX3NZY9HTTm0qG6dI8zp2zCKvo
         5g0DcDvm1lKATAi9QhdeO5ShUNkt1HWz8rErO4WPF3exhzGZchLniTVIO4fZAljXx4lg
         MTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855125; x=1746459925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=tiWTLz1yGqPVzEEL5afKlLYToiBiey1cAcGkzwCKpvmTp4OG5atiw75kVBkrg3XSEg
         0RBdAy0UY4j1yp2MhuuaCd2o/F64uy9abhiUff0O09L0TiiqTXmvg2ddZmVUyT88qxoA
         9x7IfyV+nq7qirgLy9b3jZ0ryfICOnsOD4hRsMBNFDgcGqyLznzcvtX72kgyrfqL4oQE
         UlWBMf8BRQvbS8l64nHzNNc82nKDKi0pCt2b9hMr5kKtRcTonY3wSSp24mwIgYve60M+
         pvmfb3k3x6edLbXKcylWWbVSPA0jeDh+0bd+7mhvnRRMnw5wovbV20b8JmkGuHEgB6OK
         W63w==
X-Forwarded-Encrypted: i=1; AJvYcCWgyJPyNxlcrsHbEVp5WypzOnaYIgkD3NdhsDX0OXgxzGGHUj5ZmYH+Aerd7qE3Fif7mDwFJqi1OpGLlFxx@lists.infradead.org
X-Gm-Message-State: AOJu0YwWg7YA6Nc70z6iRiUQDmXzEn72IgT80gDpqXEa7js0pbh/fH76
	KHkspwAsgUMiEYeTDjjhdlnykgqrIpjazajhKodRQqJzIxd6McILG1xlj2W1ZytlbliCqawvCv7
	d3wzyK8amv0AEAe8SIVLeskUWviYJBcqDzj3oMA==
X-Gm-Gg: ASbGncuf1a2IAzBxb2i0jXwmv1olrWw1dHUU+biXAd4jNPMWPNRK4my7G9OG8Rb3ODC
	001abWI8p5sGm/6QQyp4b2dASrwg68VDf45fJRyjNYD2vg6ew1mnsr2SfFpfQsU8biFVKbUphEN
	kGHJ7RAZosAkCi71E2XqXxApGck3Jpim2gUEjyBoRmBqbTACQgRrlitoFbTeqolV0=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_084526_047036_5B6259E8 
X-CRM114-Status: GOOD (  20.76  )
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

T24gVGh1LCAyNCBBcHIgMjAyNSBhdCAyMDowMSwgTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29s
aUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBuZXcgQVBJIGZvciBhbGxvY2F0
aW5nIERSTSBicmlkZ2VzLgo+Cj4gVGhpcyBkcml2ZXIgYWxyZWFkeSBpbXBsZW1lbnRzIHJlZmNv
dW50aW5nIG9mIHRoZSBzdHJ1Y3QgdmM0X2RzaSwgd2hpY2gKPiBlbWJlZHMgc3RydWN0IGRybV9i
cmlkZ2UuIE5vdyB0aGlzIGlzIGEgZHVwbGljYXRlIG9mIHRoZSByZWZjb3VudGluZwo+IGltcGxl
bWVudGVkIGJ5IHRoZSBEUk0gYnJpZGdlIGNvcmUsIHNvIGNvbnZlcnQgdGhlIHZjNF9kc2lfZ2V0
L3B1dCgpIGNhbGxzCj4gaW50byBkcm1fYnJpZGdlX2dldC9wdXQoKSBjYWxscyBhbmQgZ2V0IHJp
ZCBvZiB0aGUgZHJpdmVyLXNwZWNpZmljCj4gcmVmY291bnRpbmcgaW1wbGVtZW50YXRpb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
PgoKQWNrZWQtYnk6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5j
b20+CgpUaGFua3MuCgo+IC0tLQo+Cj4gQ2M6ICJNYcOtcmEgQ2FuYWwiIDxtY2FuYWxAaWdhbGlh
LmNvbT4KPiBDYzogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNv
bT4KPiBDYzogUmFzcGJlcnJ5IFBpIEtlcm5lbCBNYWludGVuYW5jZSA8a2VybmVsLWxpc3RAcmFz
cGJlcnJ5cGkuY29tPgo+Cj4gQ2hhbmdlZCBpbiB2MjoKPiAtIGZpeCBlcnJvciBjb2RlIGNoZWNr
aW5nCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzQgKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCj4gaW5kZXggZWZjNmY2
MDc4YjAyNjc2NGM1OWNmYjJhMzNiMjhhODhiNzAxOGMzYS4uNDU4ZTVkOTg3OTY0NWYxOGJjYmNh
ZWViNzFiNWYxMDM4Zjk1ODFkYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCj4gQEAgLTU1Miw4
ICs1NTIsNiBAQCBzdHJ1Y3QgdmM0X2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgdmM0X2VuY29kZXIg
ZW5jb2RlcjsKPiAgICAgICAgIHN0cnVjdCBtaXBpX2RzaV9ob3N0IGRzaV9ob3N0Owo+Cj4gLSAg
ICAgICBzdHJ1Y3Qga3JlZiBrcmVmOwo+IC0KPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXY7Cj4KPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpvdXRfYnJpZGdlOwo+IEBA
IC0xNjIyLDI5ICsxNjIwLDExIEBAIHN0YXRpYyB2b2lkIHZjNF9kc2lfZG1hX2NoYW5fcmVsZWFz
ZSh2b2lkICpwdHIpCj4gICAgICAgICBkc2ktPnJlZ19kbWFfY2hhbiA9IE5VTEw7Cj4gIH0KPgo+
IC1zdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gLXsKPiAt
ICAgICAgIHN0cnVjdCB2YzRfZHNpICpkc2kgPQo+IC0gICAgICAgICAgICAgICBjb250YWluZXJf
b2Yoa3JlZiwgc3RydWN0IHZjNF9kc2ksIGtyZWYpOwo+IC0KPiAtICAgICAgIGtmcmVlKGRzaSk7
Cj4gLX0KPiAtCj4gLXN0YXRpYyB2b2lkIHZjNF9kc2lfZ2V0KHN0cnVjdCB2YzRfZHNpICpkc2kp
Cj4gLXsKPiAtICAgICAgIGtyZWZfZ2V0KCZkc2ktPmtyZWYpOwo+IC19Cj4gLQo+IC1zdGF0aWMg
dm9pZCB2YzRfZHNpX3B1dChzdHJ1Y3QgdmM0X2RzaSAqZHNpKQo+IC17Cj4gLSAgICAgICBrcmVm
X3B1dCgmZHNpLT5rcmVmLCAmdmM0X2RzaV9yZWxlYXNlKTsKPiAtfQo+IC0KPiAgc3RhdGljIHZv
aWQgdmM0X2RzaV9yZWxlYXNlX2FjdGlvbihzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpw
dHIpCj4gIHsKPiAgICAgICAgIHN0cnVjdCB2YzRfZHNpICpkc2kgPSBwdHI7Cj4KPiAtICAgICAg
IHZjNF9kc2lfcHV0KGRzaSk7Cj4gKyAgICAgICBkcm1fYnJpZGdlX3B1dCgmZHNpLT5icmlkZ2Up
Owo+ICB9Cj4KPiAgc3RhdGljIGludCB2YzRfZHNpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gQEAgLTE2NTUsNyArMTYzNSw3IEBA
IHN0YXRpYyBpbnQgdmM0X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyID0gJmRzaS0+ZW5jb2Rlci5iYXNlOwo+ICAgICAgICAgaW50IHJldDsKPgo+IC0gICAgICAg
dmM0X2RzaV9nZXQoZHNpKTsKPiArICAgICAgIGRybV9icmlkZ2VfZ2V0KCZkc2ktPmJyaWRnZSk7
Cj4KPiAgICAgICAgIHJldCA9IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldChkcm0sIHZjNF9kc2lf
cmVsZWFzZV9hY3Rpb24sIGRzaSk7Cj4gICAgICAgICBpZiAocmV0KQo+IEBAIC0xODEwLDE1ICsx
NzkwLDEyIEBAIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4g
ICAgICAgICBzdHJ1Y3QgdmM0X2RzaSAqZHNpOwo+Cj4gLSAgICAgICBkc2kgPSBremFsbG9jKHNp
emVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIWRzaSkKPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICBkc2kgPSBkZXZtX2RybV9icmlkZ2VfYWxs
b2MoJnBkZXYtPmRldiwgc3RydWN0IHZjNF9kc2ksIGJyaWRnZSwgJnZjNF9kc2lfYnJpZGdlX2Z1
bmNzKTsKPiArICAgICAgIGlmIChJU19FUlIoZHNpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoZHNpKTsKPiAgICAgICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGRzaSk7Cj4KPiAt
ICAgICAgIGtyZWZfaW5pdCgmZHNpLT5rcmVmKTsKPiAtCj4gICAgICAgICBkc2ktPnBkZXYgPSBw
ZGV2Owo+IC0gICAgICAgZHNpLT5icmlkZ2UuZnVuY3MgPSAmdmM0X2RzaV9icmlkZ2VfZnVuY3M7
Cj4gICNpZmRlZiBDT05GSUdfT0YKPiAgICAgICAgIGRzaS0+YnJpZGdlLm9mX25vZGUgPSBkZXYt
Pm9mX25vZGU7Cj4gICNlbmRpZgo+IEBAIC0xODM2LDcgKzE4MTMsNiBAQCBzdGF0aWMgdm9pZCB2
YzRfZHNpX2Rldl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAg
IHN0cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+ICAgICAgICAg
bWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsKPiAtICAgICAgIHZjNF9k
c2lfcHV0KGRzaSk7Cj4gIH0KPgo+ICBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZjNF9kc2lfZHJp
dmVyID0gewo+Cj4gLS0KPiAyLjQ5LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
