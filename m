Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E719CD167ED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlKiCX6UO8OrRcxgVqqdlSTUAImWqgo15RnHurND0Yg=; b=iASzDuZkAGtYtZ
	8XFAhEy2hPG7bRvx6Mtcmwdr+xv+c4JEII2p+Stzx40fr8Lgyy+nRrQjAyW/HsQBpSED5jtRtAfUW
	LVJJHWTlY+zFl1DeGzYcHBJ/h1rXkfM3VXwCmH3il8YPrEF6EFgQA0lN8Q6z4UnJoFoaNlh1kcgvw
	+3+4ovgy4CQ0Wm2KVnHpdFZ++VL/HjMbjiEYICI0oYWMqyrCyDjhPArt3EMbaDeIxtOWV76QH1AhW
	SiZG+If+swlS7r2nfgSm2m0LbFGOk3nynbCMzWOWln7UvLRIoGKPvePktUufhh7ARFALRLpO3O+/9
	glh0ixrVTeKJVTIYLUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8u0-0000000222N-2hsb;
	Fri, 09 Jan 2026 09:35:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8ty-0000000221C-36O9
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 09:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6817242B6F
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47162C19421
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951326;
	bh=7L+vSRDTKzVhMW5uhxK2UgtWU6MpTyHtxzs1hw/M3/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AH/W5KKFf44NZgtKCeRwscvcd5f5OtMnEYBV1os7Xp3PrbVfqE5O8lmxtHr+rO2yr
	 NcAgyZgBU4IMHzy3s0wz0/R7f1WwGy0v3zQSRSxCGkoAjzg2Ifl1gozBMs2DGIwtUA
	 vNh35bPc7x64nokZhbHkMqQt3xbw+/nYKREnhzMJzWrVQVnpumY+9ME+PWH445hpXY
	 0DsB9Y0bLVcpLaeDXTBX446uTpplwpcMUcrdkUGCj9AVvMxfOblx2kcHG+0wR+mnDF
	 UEL1hUhhcM3FrpoFeHzKePOUEDOz0DFw6FckEIm4I6Go6IPaAjnl5eHXTq/KdIgGi/
	 8Hrn1qmumtNhw==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-646fe7f70e2so2925522d50.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 01:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoAU9cZBtaUiT9T1NyJv4GbQRC7RFjQNAHSEh+wVnmX0Ry5dHibBbRhTYLm5tZwn9oslbTn2mgysvK+v5K@lists.infradead.org
X-Gm-Message-State: AOJu0YzeCiuEphrJG+2W4Lgvce/IAPREH4oLiGwpyIZismRwChwgH5Ch
	HY79mdvwZyZtFMcdHj/BeAaH4B3Ce7n2X7UOqGaE1V2/ifHIIXplcVxRH5vlKmwI8MKjE1hPvvU
	74ZZ/EQHKPaMAkk+uMsYPDhD82fh25GA=
X-Google-Smtp-Source: AGHT+IG1nuJdduHBaBbJWNLEpBHS/0bPJdMz2cSjVZpwv/kW086sM7bXE/jQGK5lNaXH05HMk/BcWVmQ+kqn/43rNZQ=
X-Received: by 2002:a05:690e:1516:b0:63f:b18a:7819 with SMTP id
 956f58d0204a3-64716b70afcmr7942611d50.23.1767951325652; Fri, 09 Jan 2026
 01:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:35:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
X-Gm-Features: AZwV_Qixm-JNI9h7N_giBE-Mr4reCD8lf22oFl6XaRV7hyd7tvwUPsENCkrLvCY
Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013526_799518_B94BD3F0 
X-CRM114-Status: UNSURE (   7.84  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjUz4oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKCj4gVGhlIEdQSU8gY29u
dHJvbGxlciBpcyBjb25maWd1cmVkIGFzIG5vbi1zbGVlcGluZyBidXQgaXQgdXNlcyBnZW5lcmlj
Cj4gcGluY3RybCBoZWxwZXJzIHdoaWNoIHVzZSBhIG11dGV4IGZvciBzeW5jaHJvbml6YXRpb24u
IFRoaXMgd2lsbCBjYXVzZQo+IGxvY2tkZXAgc3BsYXRzIHdoZW4gdXNlZCB0b2dldGhlciB3aXRo
IHNoYXJlZCBHUElPcyBnb2luZyB0aHJvdWdoIHRoZQo+IEdQSU8gc2hhcmVkIHByb3h5IGRyaXZl
ci4KCkJUVyBpdCBpcyBhIHZlcnkgKndlbGNvbWUqIHNpZGUtZWZmZWN0IG9mIHRoZSBuZXcgc2hh
cmVkIEdQSU8gcmV3b3JrCnRoYXQgaXQganVzdCBoYXBwZW5zIHRvIGZpbmQgdGhlc2Ugb2xkIGJ1
Z3MsIEknbSB2ZXJ5IHBsZWFzZWQgd2l0aCB0aGlzIDopCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
