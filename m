Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A4C25B79
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2024 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4Co3TTrBhDM+t6OTBmnEN9BfbkdA4rAE2TeZqPON2g=; b=WtFX4QEnAGe+X4
	AUwpuL+sEBds3Z7CO/sLqNdHE+vpybLlAx8pP78nPya/7GZt96bz8g2pDQ7JALzPy3lhKCvuzs3ic
	g6H3LaIpc4UqZiGSK9hmiS/ExW9bdXzptyzls7kWDA521HYhDupcwYKBpCpGES9+Uo6QiGj9NqhSA
	SD0dC3cZcwBwtxo0NUlOPSCEgCHEduP7ly3bNmvNh/Omjz0dOUnxhHEoA/NdAfzUGxil/lULp0Tiu
	hIVCqzu8CabpeRlpIDnYJk2vimjB12pWMZLrUr5PM9wSIe3RYjXOEUxdEK0s6JyY8CD8myxCuczyQ
	1FO4mcZY01KG2XuEIHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaY4-0000000F8Ky-0vLg;
	Mon, 27 May 2024 13:38:00 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaY1-0000000F8Jj-188e
	for linux-amlogic@lists.infradead.org;
	Mon, 27 May 2024 13:37:59 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-df7812c4526so2412387276.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817076; x=1717421876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=vWkCCuVnqRpRZpOuWUXZhq0lmHc6xWZbB16H73Afn4S9lSGN4VbWWNn1o3i8gktuQ0
         +43Cc8Tue0xcMlYje2r3pJIiYvtMFgClXZCbfjQoa72+3Cl1VCo7h+ylusWSlWmhqG5y
         WpMODemqX9AAjUVFnI8e0FOWmQs3ff8+QqRAh/FDNBcUw4LbDrK0ds1azx2heKyOkbDV
         swEf5wD02F15LIYoF3Hsnl7zRVSkc8hAFR2EUGgjezK9WJck7zlGlPO1Fc53C9BOJcvz
         9Yg/fMjpVImbES+4YAebL1aQAMOh217TTXrTHq1Zu02MVdChPDBoxMqrc7LL9v4lpoh3
         balw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817076; x=1717421876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=Wj7od1/cQjOj6oeARVLl0cUjjOBxheoNOkf7ainoAZcDHBVDj3GZQ3XapiPYuCNeZB
         5AIPTlmr9oLnBrhUwjW/LOkUQYxClgukg56vyRdthS+z7OqWLPUr/iaFjnBovRhJxtx9
         LNmHHDTNeazbVciKv5AL1AvJVcadfL9GvSJoLfFmUnoNvUYBsYpqg9Xtz8cbtc1G8ANn
         cDXCYgIi99OmKBvu0pscehLjoqGsj7+v0+v4LXRoCIvB54u0u4RoMnqqaULR+uwBL1fl
         DuI5uUomWhur0H4fGCH0HGhC3ZD0XlbsVLKZmzBjUU0bGixs2PtBc4rAB6ZOzT1L0y0j
         XueA==
X-Forwarded-Encrypted: i=1; AJvYcCXcKbHTklnvOAPySTJNimsgDOyl4ITpL5crTfoW2tq+dZy/JdDvpfFBmJyyQdIgCUGJRQzKOy5oWKaw7Y9bkQVgguRLwOnhECIA/CbDUoNbZpo=
X-Gm-Message-State: AOJu0YytWalL44HkCzgLpUc+2YUqGWbXWyD85OCvQtse3hEuKk1QADuf
	dPQrxgCncXA6Z75otl4WUjXmb2edINvhVJsPjGJmSO5Jox/kN84ydYyqIJZhl6wdIWD4eb4DUUl
	lAWIwU+2J5LWAQKrNmKW7cAiibKzcfOc++EFfOQ==
X-Google-Smtp-Source: AGHT+IG3ODce9dNV390Ozs9wlqpcGCT+NP7kvAR3YSrx49G8pypddGGuh8zJs0qLVCnoqGn9N6DYCNxnN4AlbhGb3Ao=
X-Received: by 2002:a25:d610:0:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-df7721c660emr8663079276.32.1716817076072; Mon, 27 May 2024
 06:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com> <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:37:45 +0200
Message-ID: <CACRpkdZFfjCitNiGVe=F4Jd_M36fqdG0ixD7396xEVbvqZUdyA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240527_063757_512478_B549CD99 
X-CRM114-Status: UNSURE (   9.35  )
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

T24gTW9uLCBNYXkgNiwgMjAyNCBhdCA0OjIx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBUaGUgb2ZfZ3Bpby5oIGlzIGdv
aW5nIHRvIGJlIHJlbW92ZWQuIEluIHByZXBhcmF0aW9uIG9mIHRoYXQgY29udmVydAo+IHRoZSBk
cml2ZXIgdG8gdGhlIGFnbm9zdGljIEFQSS4KPgo+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KCldvdWxkIG1heWJlIG1l
bnRpb24gaW4gdGhlIGNvbW1pdCB0aGF0IHRoZSBxdWlyayB0byBncGlvbGliCmlzIGFscmVhZHkg
aW4gcGxhY2UgKHBlb3BsZSBhcmUgYWxyZWFkeSBjb25mdXNlZCBieSBpdCkgYnV0IG5vIGJpZwpk
ZWFsLgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
