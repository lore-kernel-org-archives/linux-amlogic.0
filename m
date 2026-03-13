Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1F5105F783
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2026 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZflBvXwjauAuV97PH8qRDiycj+MhXtgiyRKESdbWzcg=; b=r88cOou46svMWH
	7EqH/5wjlCqjwSFOso2jFMnoeW/fYbh4/4rAU+LkC5gRKraOX4MhlixLZz9+niV1FKyT7UNZFPE5r
	QX5tEmrj6moSwmI9QVAE6BGdZN3eT8ajbZnkGj9avsX92S69i635a/x9VWfl88ynoKiKYT5xBRKf+
	piaX0JrXpJ+EJoPKd3X2Mqr/24dFD8mLkbltwOpoUpauaOTGbM6Hi/R2ehH8t1J2/4ZgDAyGsmb4W
	ctkF2aAYrRdeKKyshbj+siOZqSIosDnmdmM/RO/b9zQa+jBThqJdYupcovDb/4ikTCt5pyVJQLLkA
	yW5d+NlZEAvy7kCLvBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJT-0000000HJrj-342Q;
	Fri, 13 Mar 2026 08:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJT-0000000HJrA-06Ob
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Mar 2026 08:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=; b=jEg0vNo6quGTswJ1qeJmNzID84
	DDSuzH1v3WgCiuL0uhMDp/IcXUEjvNq9Z+TpJj4jfc5u0widuumPsQmhzYBaMDshpqVd9rAS+FtnH
	WO94ylU5PLrYPYxk0Zy8MjKmZiXIkS6KmIXGjipTWpontjh1yKZDIC5hR/uqdiwLTRpwHOtPTj+lL
	MtnNmfMkViFIqfH7z+aliNmRGDXrybEP2yKFeqa7Zv9U1ETAqSkJ2GpOxpKl7cwOnpYUWtd3AwZHW
	ybV4/QtfO9ihAxZkJMsxH83kkUiNkhM1NftARR1qmcZ8Pt+F/D48HJK3KwuqSFhgTa0q+kU6yV5J4
	hBbkHIpQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJO-00000002u7y-175G
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Mar 2026 08:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 902C2444DD
	for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D5CC2BCF4
	for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773392158;
	bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TuNN/sdsSHwP/VHRKKsG1F4YTUS5ZhzO3eF6ZjflRECLSxm52GZn0O+a6DYtw8s9w
	 AztRsZ6hwk6mFH9QjMLP6ul2unGjmpkpIqrGCVRM7XJ91lE5qjYrRo421vuqGU+Ips
	 dUTvUP2lPwGo6cUpGRPiarN2csB7JvMb0jI/Ci+wBxM0t4CvddwnzhqGPCkq7OZ2uz
	 q1FLHibPBhnYDoXHHAzK4gd8xjmC/HbpS/GJkB9AsODxRC/oP9dyHczV035sr3rZQ7
	 zhugJAyuq9iyE0d58vLAu0TaPaxVAVMP78UrAtKR75moc4u0qVEPZakARFdazt8gZI
	 bL3wWDwmcIB/Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a725a14e3so17417651fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6tOir8uFAUvhdV//7VduYMxv0WkCucgV8R+BJ4bafCljs+BpEw2s3THt6PPmuQijEi+liiO90oKUQEsPE@lists.infradead.org
X-Gm-Message-State: AOJu0YzxsDpzYHTnDg0dT+J7inwxlcYa6Q1uKXWBWhMPhN+delVaDGVV
	Rm7i7rX55w6wQIfVYXDv547OaJHddNEpUeXrkIR8BjdjZbJ5AIhZdevZc/aEWykSg5fxiMGtf3/
	P/oDWzn8kyC6/Ss1188/XAZPMKV8nntLrBRJrHG7G+g==
X-Received: by 2002:a2e:350d:0:b0:38a:878b:b567 with SMTP id
 38308e7fff4ca-38a897de73cmr6682211fa.36.1773392156502; Fri, 13 Mar 2026
 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com> <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 09:55:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
X-Gm-Features: AaiRm5311s8a1dkokfIWdxBu9dTaoHy4sXAtnoSYnP4jjneoiOLY-XItyfiRHlE
Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085602_689889_FE4EE6B6 
X-CRM114-Status: GOOD (  20.42  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMjoxNuKAr0FNIEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxMSBNYXIgMjAyNiAxODowMzozNSArMDEwMCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4KPiBOb3QgZW50aXJlbHkgc3Vy
ZSB3aGF0IHRoZSBjb25jbHVzaW9uIHdhcyBpbiB0aGUgc3ViLXRocmVhZCB3aXRoIFJ1c3NlbGwK
PiBidXQgRldJVyB0aGlzIGRvZXNuJ3QgYXBwbHkgdG8gbmV0LW5leHQgYXMgcG9zdGVkIHNvIHJl
c3BpbiB3aWxsIGJlCj4gbmVlZGVkIGVpdGhlciB3YXkuCgpuZXQtbmV4dCBpcyBxdWl0ZSB0aGUg
bW92aW5nIHRhcmdldCwgaXNuJ3QgaXQ/IEkgZGlkIGp1c3QgdGhhdCBiZXR3ZWVuCnY3IGFuZCB2
OC4gOikKCkFzIGZvciBSdXNzZWxsJ3MgcmVzcG9uc2U6IEkgdGhpbmsgdGhpcyBpcyB0aGUgdGhp
cmQgdGltZSB3ZSdyZSBkb2luZwp0aGlzIGZvciB0aGlzIGRyaXZlci4gOiggVGhpcyBzZXJpZXMg
aXMgbm90IHRvdWNoaW5nIHRoZSBleGlzdGluZwpmdW5jdGlvbmFsaXR5IGFuZCByZWJhc2luZyBv
ZiBSdXNzZWxsJ3MgY2hhbmdlcyBvbiB0b3Agb2YgdGhpcyBzaG91bGQKZm9yIG1vc3QgcGFydCBi
ZSB0cml2aWFsLiBUaGUgY29yZSBvZiB0aGUgY2hhbmdlc2V0IGlzIHRvIGFkZCBzdXBwb3J0CmZv
ciBwb3dlciBkb21haW5zIHRvIGVuYWJsZSBldGhlcm5ldCBvbiBTQ01JIGRyaXZlbiBTb0NzLiBJ
IHdvdWxkCnJlYWxseSBhcHByZWNpYXRlIGl0IGlmIHdlIGNvdWxkIGdldCBpdCB1cHN0cmVhbSBh
bmQgdGhlbiBhbnkKc3Vic2VxdWVudCByZXdvcmsgY2FuIHRha2UgaW50byBhY2NvdW50IHRoZSB0
d28gdHlwZXMgb2Ygc3lzdGVtcyB3ZQpzdXBwb3J0LgoKUnVzc2VsbDogSSBzZWUgeW91ciBwb2lu
dCBhbmQgZGlkbid0IG1pbmQgdGhlIGZpcnN0IHR3byB0aW1lcyBidXQgaXQncwpiZWVuIHdheSB0
b28gbG9uZyBzaW5jZSBJIHBvc3RlZCB2MS4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
