Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7DE66886
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Dec 2025 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqhJox1sooc1EBau6ZO4GeSZUifk+ZUoAx276qfRQGA=; b=Yo8qUYH0q+K7zz
	nNLRhb0i0XLgDrMLMHQ9YhBNNHY1CGv5pfy4ZmDDS4KbMzv1O4IHkx3+y5ZiiVjMbw8kHRRxBD67e
	Z1NpVnaXYNFCHLHNcRyu0IaB0LgALNr4pynY7VRz/N9Q66pEzbLvHGsYWwLhMO8+tJcMPrRnQfreF
	0hTH9N6rP4y34ZIW/9oAl44Bj36bdo3WU0kxJLlfpbqxTGoU8ZWiCHLonOdkpHWvH49UDdkx7HiBc
	YW68v+X0zEwSDEiqOOJ1KscjzeSMIgNo7c/zgSdoyb6wZHPizD3f7mYF929UOUHVg917pM7tDoqm3
	LtwtH01SO9+FpEhv1DnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRK4-0000000CnY0-2Dc9;
	Sun, 21 Dec 2025 21:50:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRK1-0000000CnWl-01mQ
	for linux-amlogic@lists.infradead.org;
	Sun, 21 Dec 2025 21:50:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso35881365ad.1
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Dec 2025 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353836; x=1766958636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=R8diVP2UnJvaJRud5OWcUmknmUFQ5bXSpp/FJ9NbimiaLORYKy85A6YpMQgwBFnmeu
         GaWQiWpjpm9taiLT+wbC9csKmDGICYU+R9mZ6pjD7Fc6xsNkBMW1rN2KFCrsJxZOPVTE
         6InrPqROscqqorM4spjtLRhg2MDteooFJlgqJ4Xyr6QVJlWvDZs0ekTXHsDpg1eGA3Sg
         iNFSUKxlSXU4SMy1NV9Ge5FOF3oMZp/PMEaIpZaKtxr5iGHVrlJtOTQ6YE73B902y5yn
         3x0IQnAOoUHsH+TNDGWuLAdLqUDTLkjLT+tJEiPB0Tu47Kq816JFnvJ8WbV+t9ZlAWwR
         K7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353836; x=1766958636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=fWIKgPHc2MUemCJzNKCuYhVEDzOXSeH6nAVVM9BApTXxVyLIsiR6fKeyhSYjkVLo6T
         atUHkgt6nP/aPm2Ef1XGzKc4kZWhmdq2FiK4eusLbP/3AkBcktsIZvWRSZx3/rNA0c4L
         urUA8WJH0ZhSqNPGo59892HZFbDG/2Hb4Vw2yimrDcS+EsFOInxde8fwINvExGtMMnQs
         VIhXczYAgGxfHbmV48YZ7668Pi9I0QCD/VOj+mNNQGJx0RFOqV70OiQmNqKJ2ZvT1H0Q
         0y3Luw/sqtqk+Rn3MGjKw2FJgsbZlfJzkWTjok/aaWxS3HX0p3OVp0nfL2Xt9+llYF9v
         DWRw==
X-Forwarded-Encrypted: i=1; AJvYcCUBI3gWMtx+2VqKzYPeuWsC20q+IApdaABKHdVVenp04XVQjC8Fnkuvmfr7ZgN8Oa4v/wmN1glQiT15+GV5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2xN3IxWO3gr6k0nH8I6n/awGusOOcJTomZ1kAKyeKhgM0P2wr
	/D3fZSInKl8DahSYpGM/qXY96kFFPkujLfhvzeGOTTxsX06P5Lx8YvXmmCd0ivWt8JOjhwTJdCz
	F4Nrv93ZJF0Vd6Pqfec/ASfKV+ArZm7o=
X-Gm-Gg: AY/fxX6hVPkcCHNK1A7L5SGJN60W2LgAwrKho2mijdVtn3qCsBVl/8+Xa+w3O9H8jBi
	0JXwPLA/2O7K8rKmMR4G8o5UFiv4llHznNfSoOoSlSpF1KplGeRGzYyAXlXZnwFbHHDFCugdMNb
	ipjpUnJO14QgLAMCmMs7uMw1yk/xlow5Rw6ZG950Kds162z2QbNTNBvt3y12VG7lqEHj+VNba8g
	BoqUg+gaQtmqRZjC30XnxwksF2FP2KnBDwdDIbi1fjoODVqTHI/KKKNSb0Rp40yfxcUH3rebial
	kqz41AFr0beKUIFivsFfYTGdJKB/
X-Google-Smtp-Source: AGHT+IGw0n+Vw3mSNWIuK6jiR5TwNM1Orq2NMptHhH0WFtIprggK0653bvytXvjKFmmgd9+xofkm/n3sIE9SOEugciA=
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2a2f222bc6amr92154845ad.18.1766353835637; Sun, 21 Dec 2025
 13:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:23 +0100
X-Gm-Features: AQt7F2repQdtBoV8d-ez3LVKkRTtOC5SATWZ81V_d9C-sFP5czyoEjd7MirbIfc
Message-ID: <CAFBinCDt=9H1ccXatr8JYA=atG+vDCBX9x0xor9kibUfo1NKpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
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
X-CRM114-CacheID: sfid-20251221_135037_041512_FDE1170C 
X-CRM114-Status: UNSURE (   7.43  )
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
