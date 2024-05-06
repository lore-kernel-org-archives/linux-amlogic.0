Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F223C10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZ4h5zv+1Vvl5floJ0rBDyjxE88KGQGvt0DRExo27NM=; b=w1xeEqNuDSuEM3
	uTH4PDlwoj4hqoOI4aNF2xc+g+Y6LSGhNgsXoafF3awqgtFTFfept1/L9uwpHQfDl152/tlSrL7yY
	v6kI85VCvEEa4R9KcbgP+KdpsfMsowbAitMk5QwOMhysb6GLqvmw/pzZQtrcl0mYq5zAVo09wgyoo
	q0oH9hJcH//t4LGuOQrqWoQ2ERWhhzrpcsbH4ZD5efwOK8E6Z3HQjoYsYzx2QZyw2UinzokX4EGAv
	mU471VVW9mdC0mjaHMqfllzJZ+hF/+Sa4HCZUOGZvZEC/f5WOO8ycLhOjpxkItCMmTzaJ8tHY10PI
	G25ww9UxEeGJnt3VL+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xB5-00000007DLu-3Nv1;
	Mon, 06 May 2024 12:10:43 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xB1-00000007DJp-1Fv2
	for linux-amlogic@lists.infradead.org;
	Mon, 06 May 2024 12:10:40 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-de604ca3cfcso1738141276.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 May 2024 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714997436; x=1715602236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83bq6sZnjWOAj2QjLu2jyQop5vm1yVH5pagOdWkdqQE=;
        b=XIBlSLTjUlN8YssxTAUoUhB76CuY38cbJSgt4vgEQWF6y4F4cZFF5JqIw7wBqkr5eT
         xd/jNPQFmu5fzhsxmgpIFg/R5S2wGZ32JvNm42kp+a/QW8QJ9pTLy2ERPLl4/PXdWG/B
         wdQlx2zdi9Jv9wKuPcOGT4NWBaLx7nYf1y0xuPG8l86hwBIPEtD5GZ0E8s5aQMNLIxXV
         Mt6hdMCcPCaI3pE5KfKUa0OEpZqlzq6Ycxapd3wqT5YwBKEwfVgr0Jtb2QGpVlk4GLhu
         GxMZ5t8J5jQfDYSy05bHaB1z4JK5KIFWWdh+snHPXQKgh+L0Q+c0KdSOYG0Ikb/PeYKY
         auxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997436; x=1715602236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83bq6sZnjWOAj2QjLu2jyQop5vm1yVH5pagOdWkdqQE=;
        b=rjfSPYeu3Ab2qHN3AM5FgftJWS6ogUxFb6aKZib6kO9iBhLajVO4t9U6Q5D7ZpR+rU
         JJGMYWbVkjle4h4KUZvPAWFepWGZSkjanAHjjMEA3WCgwOQqE/GDP2q1bzOYIfG43aod
         Nrqonaxrt5o28gsaD5nMuuorMDG6yUXt28VnejbzCc4ks6Hc1+/QEOCEzruQ6CYcNCTw
         4ItVKJQcVPM9CjnEe+gKCku87DHolKk7Snzh786RB+eNbQlKKW3XMyO15SpQvsgfz5Je
         1ZDWq8WxwOX9mLvxaC27rQuyiQleoBVjMuSwiq5nEilpE2Nm6Y7CziGTw4agKnF0NhSV
         tmog==
X-Forwarded-Encrypted: i=1; AJvYcCXnEtIyn8lMVWHs8QKSMG/zm71PR8RCV+I04P3XQZ4dZhNOJK9q3K0RvO8pwfvgnq0338sIrf5FZ70Ud8mDdrUjhTD3bbFYm3k4vNSzcVotYnI=
X-Gm-Message-State: AOJu0YwakEt64DiPsbfR9tQ0FLXZM6dQhIAma74xDL/byxUZz+HLj1fv
	4uz10s5iqGoeE+uIA9YYFVGbHjiiS8IPnYYY8HsN1lUOqfZgxsNa8ZBO2uPgvwZleKW+bbKu7OY
	Xaz5HP0BDXIyErwnnIRzWhsMMJ7CP5t/GAHoVaQ==
X-Google-Smtp-Source: AGHT+IER78l+XvV7AsX+dBbOeQ79q3sQzITzxy15JTynwXfGIedBRzHp3Bby/Y/eLvaqRahVeAP4r46dQsP2qbPRE+I=
X-Received: by 2002:a05:6902:2011:b0:dcf:2cfe:c82e with SMTP id
 dh17-20020a056902201100b00dcf2cfec82emr11080008ybb.55.1714997435752; Mon, 06
 May 2024 05:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com> <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 14:10:24 +0200
Message-ID: <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_051039_421399_F31B5FD6 
X-CRM114-Status: GOOD (  10.47  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMTI6MjXigK9QTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IFRoZSBvZl9ncGlvLmggaXMg
Z29pbmcgdG8gYmUgcmVtb3ZlZC4gSW4gcHJlcGFyYXRpb24gb2YgdGhhdCBjb252ZXJ0Cj4gdGhl
IGRyaXZlciB0byB0aGUgYWdub3N0aWMgQVBJLgo+Cj4gUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKSSB0aGluayB0aGVy
ZSBpcyBhIGJ1ZyBoZXJlLCB0aGUgY29kZSBpcyByZXNwZWN0aW5nIHRoZSBPRiBwcm9wZXJ0eQoi
cmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIKYnV0IHRoZSBjb2RlIGluIGRyaXZlcnMvZ3Bpby9ncGlv
bGliLW9mLmggYWN0dWFsbHkgaGFzIGEgcXVpcmsgZm9yCnRoaXMgc28geW91IGNhbiBqdXN0CmRl
bGV0ZSBhbGwgdGhlIGFjdGl2ZSBoaWdoIGhhbmRsaW5nIGFuZCByZWx5IG9uIDEgPSBhc3NlcnRl
ZCBhbmQgMCA9CmRlYXNzZXJ0ZWQgd2hlbgp1c2luZyBHUElPIGRlc2NyaXB0b3JzLgoKSnVzdCBk
ZWxldGUgdGhpcyB0aGluZzoKaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoID0gb2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5vZGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAicmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIpOwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
