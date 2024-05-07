Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7DEC25B4F
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2024 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0He86sAiWzlslCpBcqLfZl0perqWzDMWmK9zC/06II=; b=L5ikDA3XOfcsYF
	MQyQy0ZsH3kLrZopFbLlLiktRoFAZUk/CudnLyUOGPIYztpQDrzjWetrIPL8GGbJ6t5MHEkzAWzac
	G1oSjXEXCLEI3cC8Ss7vX1DtEMuItcEEURnl/QrzH1FT+e7aGL4UWz/4inicSHufEk3nHXOLaivSE
	CAgleeOahlZxEC9l7o17a4q1E03rvsfAiXCYx5ZU2UPVzvFJxpL1t8qe76ionpKNL/OsxoKaCUqKE
	96SaXtPuTUvhyOrnF7iZOsixp4JKQCK3RiPI1C+G+FWsWa7lnsZMTTU0VhwbUxPNXVG9rv9Zqz2Ia
	HcLTq8ZS+SRukYzxq04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Fyb-0000000A6SL-2kiJ;
	Tue, 07 May 2024 08:15:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FyY-0000000A6P5-0PJ0
	for linux-amlogic@lists.infradead.org;
	Tue, 07 May 2024 08:15:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f4302187c0so3750237b3a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2024 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715069697; x=1715674497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqO/eiCLhjMrDJZ/oHlF6w3tQ/HJRwHOeX5fd3lD2/4=;
        b=S6BmZalnk6gN3Kq96P5EM41G+pPFnF5mRUUgjkh96OnF1li+HUhutVga5Jd9KvAoem
         NUULO6KFrajs4Z3rdDdWn8V8L1YdzHabawK1g7TsBLgZq+Bd8QsTxCtY9P+itJJv8nD7
         tGEiRUT3VUTIzeJGdg+edvJWMTVAbyPBr0JtrZLQTLiiOCdc5Nvje/kuz0FW0wnmLMX4
         nLrB3BCsH/Qwm3wvE1kTk1V0ace1t0z8UChaVavfMCQID4wWupvJO6U6BrDBpsvMZ6VL
         hbEY3g3UCdWSeJzXGrip7qvooB/4xSxlLoBk4vKhQGEy1hLG+EDnml1XV8esSQvqi/qJ
         Gf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715069697; x=1715674497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqO/eiCLhjMrDJZ/oHlF6w3tQ/HJRwHOeX5fd3lD2/4=;
        b=vaKAYIe/ieOAjVL03fWTfinjuhy/jTD0uOuWaYALsj1WWqvxiUhvRiTK0eNXCOwo4u
         QOUxavtL2cNsNm7+Q0XvBANTdWPPPpiYwGrm0P6kdB4cd9reKqpUFkRwVaKY5PXVCBrX
         AA87ndbX0TErqz5KoQcVBfIwJWMpHjW27CPY6/6yYq08TVyV0rMyKt7KZdbt5/UoVTED
         JvlPx/Ey413RWqSEsLgOSYh6QOI+TW7qJOmuh17ifJzx7U6AmYmplLkbuF6AhOq+/P9/
         rgVqgP/iovWPmeb1M09zTuQryO2Z3Tm5BDBKtfOgWl6IV7sfkc/unRkjV03VdYCuJik9
         qjkw==
X-Forwarded-Encrypted: i=1; AJvYcCU4dbDGPw8VlYM5TXztwAaImrMAhRhdG9A498Hml7V65sJhzA8FZiTng9GbYVGxF9/qSUvGN0Bsb5iNmenuK2Jz9YXUoDwr2ZD72ioKeYDtFrY=
X-Gm-Message-State: AOJu0YxEzg1AbSOqtRAoq2pTtmYQmrlU8uddC+LW9WxirCKdYqst2vg5
	4iIO1LUktsaG+mNf8mOkW0PBkDJIu6YJ6dPfX01LgpxB7HYtHmfqD+ycEaAq6w==
X-Google-Smtp-Source: AGHT+IHnAZTFdWiXFQwCMQRZCYd4TYAmRcm6JIyFZLn9J3uME67W+T2rImADb2DRfd7XSqJSBOyHVA==
X-Received: by 2002:a05:6a20:3251:b0:1ac:3d3c:c1e7 with SMTP id adf61e73a8af0-1afbdca8a39mr2746431637.12.1715069696505;
        Tue, 07 May 2024 01:14:56 -0700 (PDT)
Received: from thinkpad ([117.213.100.197])
        by smtp.gmail.com with ESMTPSA id u34-20020a631422000000b00600d20da76esm9156572pgl.60.2024.05.07.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:14:56 -0700 (PDT)
Date: Tue, 7 May 2024 13:44:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240507081441.GA6025@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_011502_163570_FD48B264 
X-CRM114-Status: GOOD (  17.09  )
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

T24gTW9uLCBNYXkgMDYsIDIwMjQgYXQgMDI6MTA6MjRQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBNb24sIEFwciAyOSwgMjAyNCBhdCAxMjoyNeKAr1BNIEFuZHkgU2hldmNoZW5r
bwo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gVGhl
IG9mX2dwaW8uaCBpcyBnb2luZyB0byBiZSByZW1vdmVkLiBJbiBwcmVwYXJhdGlvbiBvZiB0aGF0
IGNvbnZlcnQKPiA+IHRoZSBkcml2ZXIgdG8gdGhlIGFnbm9zdGljIEFQSS4KPiA+Cj4gPiBSZXZp
ZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGlu
YXJvLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tPgo+IAo+IEkgdGhpbmsgdGhlcmUgaXMgYSBidWcgaGVyZSwgdGhlIGNvZGUgaXMg
cmVzcGVjdGluZyB0aGUgT0YgcHJvcGVydHkKPiAicmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIKPiBi
dXQgdGhlIGNvZGUgaW4gZHJpdmVycy9ncGlvL2dwaW9saWItb2YuaCBhY3R1YWxseSBoYXMgYSBx
dWlyayBmb3IKPiB0aGlzIHNvIHlvdSBjYW4ganVzdAo+IGRlbGV0ZSBhbGwgdGhlIGFjdGl2ZSBo
aWdoIGhhbmRsaW5nIGFuZCByZWx5IG9uIDEgPSBhc3NlcnRlZCBhbmQgMCA9Cj4gZGVhc3NlcnRl
ZCB3aGVuCj4gdXNpbmcgR1BJTyBkZXNjcmlwdG9ycy4KPiAKCldvdy4uLgoKU28gdGhpcyBidWcg
aXMgcHJlc2VudCBldmVuIGJlZm9yZSB0aGlzIHNlcmllcywgcmlnaHQ/Cgo+IEp1c3QgZGVsZXRl
IHRoaXMgdGhpbmc6Cj4gaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoID0gb2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJyZXNldC1ncGlvLWFjdGl2ZS1oaWdoIik7CgpCdXQgdGhpcyBpcyBqdXN0IGEgYmFuZGFp
ZCBJTU8uIFRoZSBmbGFnIGZvciB0aGUgUEVSU1QjIEdQSU8gc2hvdWxkIGJlIHByb3Blcmx5CnNl
dCBpbiB0aGUgYm9hcmQgZHRzIGFzIHBlciB0aGUgYm9hcmQgZGVzaWduLgoKLSBNYW5pCgotLSAK
4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
