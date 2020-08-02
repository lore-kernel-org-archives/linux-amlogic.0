Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C5AC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E8D20759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="edtJkDx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E8D20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JQOzlPrcZ9i+Ova1Svuq7mqKCyIqOMMDvLcjHVx4g+8=; b=edtJkDx3RDgdwCUTR72ifeLRs
	p7rY8ST9Dz9nSV9pq5xs39l/RKOZGfEIxYBduZfIswuTap4SBUPYdCN6cdNFA2i8+/We4uwO9tfrd
	SeTarbuc+6fEnIVzDnKX7u6bcCyToAK8ohNn0Q6jUpBHATQmSpPZjv0INc0yA3SdN/W8hGghZ13m8
	M6T1rPOzseCyWsFOrfGFDyZsk19sIyNYFHz1dxSOTE//a1pdYM4N9i+X7uln+NauVXegB5N/gQMdb
	n7FoY02qHvXs1WrcmbnOGdLVyaMaKBVENhtwsC1eWnX3kYKgB/4SIhCxR6NXskLCjOTn4V64IsALm
	eex6M0Jqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Ewc-0007Co-4w; Sun, 02 Aug 2020 14:26:34 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwG-00071j-HM; Sun, 02 Aug 2020 14:26:13 +0000
Received: by mail-lj1-f195.google.com with SMTP id g6so24376964ljn.11;
 Sun, 02 Aug 2020 07:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eygfm9r/GaNHVAKMUv8+SfoTHGAl/cjm4d2m8xjT5bc=;
 b=YhZTNdRfqOrP4Cpw2Y+OX5TMwxqpQLbKCh9MtohEuVDJaqxGSqYTFoMBD1N+4Yhfcx
 PZOAqGlIj+OhaittUtTyBkdXR4rhU50Mb4pgkpV5N64C2P+IP6zGnQ0ACCmkWoJbtJjx
 0q0FQ8dk7ffFpIVGRLHfPbz9Z6q49Z5a1dZ64qPhdvA/HfcP+ZAYZN0UqH02ndFODAFo
 K5wKzH4jf962yWhaZ5jr8EL0Dri5VGYGoyOV5Vapivf0mrLDXW9BrCHHjhvGW5BbyAH2
 ENoZtjmJhNIDotecP9jVVpjw8rt/lBmOX1EdgZmOboDspIpKkLSgzCn3jOWYkAIJQSpf
 lnSA==
X-Gm-Message-State: AOAM530v5+jlhrQPGHovw8nMSZPnGI0prQNd96+KMqaAhzBuNxPu2YUK
 1zebrfjpktcG7So7GdpBt3w=
X-Google-Smtp-Source: ABdhPJzSmhttbDUgORpKlM914FzAS2b2KYbghno6w3+rxNJphXxD2jUo/xd+iwrLQer40nK+OI29Pw==
X-Received: by 2002:a05:651c:31b:: with SMTP id
 a27mr5541281ljp.455.1596378371517; 
 Sun, 02 Aug 2020 07:26:11 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:11 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 05/10] PCI: host-generic: Remove dev_err() when handing an
 error from platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:57 +0000
Message-Id: <20200802142601.1635926-6-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102612_707789_777356A6 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 linux-arm-kernel@axis.com, Ley Foon Tan <ley.foon.tan@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIHRoZSBkZXZfZXJyKCkgZnVuY3Rpb24gZGlyZWN0bHkg
dG8gcHJpbnQgYQpjdXN0b20gbWVzc2FnZSB3aGVuIGhhbmRsaW5nIGFuIGVycm9yIGZyb20gZWl0
aGVyIHRoZSBwbGF0Zm9ybV9nZXRfaXJxKCkKb3IgcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUoKSBm
dW5jdGlvbnMgYXMgYm90aCBhcmUgZ29pbmcgdG8gZGlzcGxheSBhbgphcHByb3ByaWF0ZSBlcnJv
ciBtZXNzYWdlIGluIGNhc2Ugb2YgYSBmYWlsdXJlLgoKVGhpcyBjaGFuZ2UgaXMgYXMgcGVyIHN1
Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUt
dGFuZ28uYzoyNzc6Mi05OiBsaW5lIDI3NyBpcyByZWR1bmRhbnQKICBiZWNhdXNlIHBsYXRmb3Jt
X2dldF9pcnEoKSBhbHJlYWR5IHByaW50cyBhbiBlcnJvcgoKU3VnZ2VzdGVkLWJ5OiBCam9ybiBI
ZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2ls
Y3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUt
dGFuZ28uYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS10YW5nby5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXRhbmdvLmMKaW5kZXggOGY2NDBjNzBmOTM2
Li5kMDkzYThjZTRiYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS10
YW5nby5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS10YW5nby5jCkBAIC0yNzMs
MTAgKzI3Myw4IEBAIHN0YXRpYyBpbnQgdGFuZ29fcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCQl3cml0ZWxfcmVsYXhlZCgwLCBwY2llLT5iYXNlICsgU01QODc1OV9F
TkFCTEUgKyBvZmZzZXQpOwogCiAJdmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMSk7Ci0J
aWYgKHZpcnEgPCAwKSB7Ci0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIG1hcCBJUlFcbiIpOwor
CWlmICh2aXJxIDwgMCkKIAkJcmV0dXJuIHZpcnE7Ci0JfQogCiAJaXJxX2RvbSA9IGlycV9kb21h
aW5fY3JlYXRlX2xpbmVhcihmd25vZGUsIE1TSV9NQVgsICZkb21fb3BzLCBwY2llKTsKIAlpZiAo
IWlycV9kb20pIHsKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
