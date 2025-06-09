Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A0C678DA
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jun 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xo+CGGxcKDnBN7LaS2TUziOuzOjbsTUITmQYm/+J5p0=; b=4/4adjUcWFNJZV
	54M7nQVNPobgTwMHa6YavxplWZp7BfZLSeacElRuohGFUvpNItVISr+dc9uB/oeVp5O2JlIv5ZcR9
	7SJ1L1m9E6esHEjp90TJrOtGyxZs74UY4SreRnVaYGR4mJoBi8vxGAxZO3hy1xUZuiSFazA5PT0iZ
	xWOx27Uwr++rqAfigGUa5zPQEIn4Ar7xJrylMj4ZjLg9nNK/iDdHCA/IKEqA4rSHEcPY/6zI/pGAY
	VZZ+Kcji0c1CLlTjejcNLlJDhDJzmi2DYs8OBYBSg+WZxN1skbjehq4cqvGKNNsFomRJaI4QAJAHM
	rqPV4Mug3H78Mzq/qytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfE5-00000004dzG-0iaK;
	Mon, 09 Jun 2025 16:19:57 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOees-00000004YY2-1RIi
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jun 2025 15:43:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23602481460so26062275ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jun 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749483808; x=1750088608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=Mqb5fp6OH2eTURogfEvIoNrQfQQ19dMLrT9JQ1jRf7hLcI6g3+h5qlVuxf49229xxU
         O1HaynXxLIJmBlaFnjFENc1rBlkGL516e3HlxPqF/lvaAJFZwedGTjgZ7j9QUu+T5BlE
         N33Yekk8twlry2nAj2bBHzskQHCSgB6Te05Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483808; x=1750088608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=edumm6T/i4/9x1hQrQKaZcM+Z8cEbjpdCxdMFlTHdjGpgskAKcjNU17VbBketmpEpB
         MBnX+sHS5D5tledMd0oadFg2ygLajk1Fn0p2cSDkNc8QecsO3tm7HB7rvMzsSH8+2kSP
         /P2hEtt/HaaxYH2aPGQu4/bX8RwCjtH9XMqpVxApXgGQSE0nsUZGYwmesm6stTti1lib
         l+81exTpJp0T80KJfvLckrJCwidsxZLY/3w9V9WAt31WQTG8OSaOwlsMWHzDBsjoWaGt
         TrvLqe6rJ25HFglTpDsvG8ZSjVwO8e3xlP4gGP7K8ExWs761BiFONoy6eM5wXJiZXd+r
         pixw==
X-Forwarded-Encrypted: i=1; AJvYcCWyDDQOoFwW1JouYhCdkyNWrfNgV7z/8Hccp7X3zx4eNhNRge4zpSYytZ5ADpi04vR2hnQxxaJSwLY4eFlU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1NI8RGUSrnnIrVvEsLr3WpFjF8ns5tBbSqY8JrlIpa0I3I0Pc
	vQUkvAeDwxRllfV4vU539zSvQwiW3Rxdi2f3QAdeAlkdbIkr4IprDAZ6wUyzM3cBilYIEWFXU6z
	C5XU=
X-Gm-Gg: ASbGncvV5yECxiFNqNDbjPLOCn6UuR1Bb6WHKcGUrhew7qMX9EXtVQx9DOzoyfu29Eu
	FvLHgxTJ9nWH3ilJBfMmIHXJsj70Q1SKPXmCBRsg3lJ8wxajp9uesk0mqBskgDHm3JbGiXaTcYl
	zZUkhZEmoUhTkmfSSNc63r8W3fYG3hfRg5nHGo4T821kHtpnypD77B6c7Lmdb1B2ajBV5FtEvCl
	XCdbImxKrOuNXjWOSHwncjbKMBgg2CG9/0FI4eqtTwhnsDO4PXT0zLY/hIVLbsVc9vN1y0uB99y
	g3Hm1o7AbWUhrX7VSvIRBRuL5WpmaaLo1EIrRJQmvGlwtV/vj39QCfr4miT3ATLnO1eSmSz9V5m
	WhKnPuTAP5kwVcYA=
X-Google-Smtp-Source: AGHT+IEAknAoGTWnK+L0nTmIwBJdcEelDXduH/m9m6+p2wuPuLHbRsDpAAWaXtvSYoFQOhxYK7L/Hg==
X-Received: by 2002:a17:903:3ac8:b0:234:a033:b711 with SMTP id d9443c01a7336-23601dc017emr166504925ad.50.1749483807963;
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078121sm56339015ad.27.2025.06.09.08.43.27
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-312116d75a6so3453718a91.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWodg1pJqK+Bu19DVOxdwKnTFU2C6ZuK/UvBKmOMazOn8IypbDM9u2fBxjVy41KTQ3NhUBGJlqJOzT6u3qN@lists.infradead.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084334_392115_806C5A26 
X-CRM114-Status: GOOD (  23.69  )
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

SGksCgpPbiBNb24sIEp1biA5LCAyMDI1IGF0IDY6MDLigK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1
bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUgMjUgRmViIDIwMjUgYXQgMDg6MDQs
IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiA+IEhpLAo+
ID4KPiA+IE9uIFR1ZSwgRmViIDE4LCAyMDI1IGF0IDExOjMw4oCvQU0gSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIGF1eGlsaWFyeSBkZXZp
Y2UgY3JlYXRpb24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCB0bwo+ID4+IHVzZSB0
aGUgYXZhaWxhYmxlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+ID4+Cj4gPj4g
VXNlIGl0IGFuZCByZW1vdmUgc29tZSBib2lsZXJwbGF0ZSBjb2RlLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gPj4gLS0tCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0OSArKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4KPiA+IEknbGwgc25vb3plIHRoaXMgZm9y
IGEgYnVuY2ggb2Ygd2Vla3MgYW5kIGNoZWNrIGJhY2sgdG8gc2VlIGlmIHRoaXMKPiA+IGNhbiBi
ZSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCBldmVyeSBvbmNlIGluIGEgd2hpbGUuIElmIHlvdSBu
b3RpY2UKPiA+IHRoYXQgZHJtLW1pc2MtbmV4dCBoYXMgdGhlIG5lY2Vzc2FyeSBwYXRjaGVzIGJl
Zm9yZSBJIGRvIHRoZW4gZmVlbAo+ID4gZnJlZSB0byBwb2tlIG1lIGFuZCBJJ2xsIGNvbW1pdCBp
dC4KPgo+IEhpIERvdWcsCj4KPiBGWUksIHRoaXMgaXMgc2FmZSB0byB0YWtlIHdpdGggdjYuMTYt
cmMxLgo+IFBsZWFzZSBsZXQga25vdyBpbiBjYXNlIHlvdSBwcmVmZXIgYSByZXNlbmQuCgpUaGFu
a3MgZm9yIHRoZSByZW1pbmRlci4gVW5mb3J0dW5hdGVseSwgSSBzdGlsbCBuZWVkIHRvIHdhaXQu
IFRoaXMKcGF0Y2ggd2lsbCBuZWVkIHRvIGxhbmQgdGhyb3VnaCBkcm0tbWlzYy1uZXh0IGFuZCB0
aGF0IGRvZXNuJ3QgaGF2ZQp2Ni4xNi1yYzEgeWV0LgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9w
Lm9yZy9kcm0vZHJtLW1pc2MvCgouLi5wcmVzdW1hYmx5IHY2LjE2LXJjMSB3aWxsIGdldCBtZXJn
ZWQgaW4gYmVmb3JlIHRvbyBtdWNoIGxvbmdlci4KSSdsbCB0cnkgdG8ga2VlcCBhbiBleWUgb24g
aXQuCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
