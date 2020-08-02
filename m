Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C5EC433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12594207DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcz24QWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12594207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S1htz+bszmkNwjHbF+2KAtHSTwWdZ22QeTJCbSHTLJs=; b=fcz24QWkV7As519FrX9kUi0Yw
	MZbe4v3zLcn2i6jENK6v5LIZ/NKph6P47vk4rYTPju2Vvq6y/xvhvxpkws5Wwc19i7N1gwEOvn5vC
	Clt86L+kbkOzfRsHGrjEedf/cVrGNhF7oSy8Y7avocK10I5J3A4d9J9HrabEk8GMqhaDgmwnPYEsJ
	kePyjZrZYApSERJ846oucWyrP8WKGQ9coF2oy/c/vjOuHxJ7es4Ok5p/4v2g+8ofc80yaW6vGba7Y
	L/XDC+F3BcDLDI546X36GckQuMOVMYu3qlgp970kGwP9V9d08caZqPER7X6w/MH/LNnpi87j74XSK
	TsTRo/v/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Ex8-0007XN-T6; Sun, 02 Aug 2020 14:27:06 +0000
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwK-000736-BC; Sun, 02 Aug 2020 14:26:17 +0000
Received: by mail-lf1-f65.google.com with SMTP id 140so19147045lfi.5;
 Sun, 02 Aug 2020 07:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHFVVkyvJ26w5l6BjSHc4G0RPe7rT9aQTvdBpCkShCw=;
 b=PTvu1g3I59nz0fuTktyxAtUZIEyMNIwZSigVayXMWu5ORjUYfyH1EVS2l7c4bZ2UI3
 P7y09hsGWYQ02VCNSb5C1EG3vAI1MDu1UiaIzXLxZ2WiFGo4ejT8q3yWn3DU+B5ItKWl
 AAiSpwCP9IEWRTrWyatUwogbKcckLuK42q0m8/EIqNpUJaNT1qSPo0uBf/3S11WgnuQj
 oMVx68k3Ow21xn3FdGuk/zhaHwnkuyTxiy7XJmLRvBhNkBwFoGlppEzDL+JUt2NOmv7i
 uQ3SMHNIxn13AkNOu8pCXbBgtaYOYKMWmAfuBrBN6X2OJFKAPsumCtC8mvLeTFXcnYSO
 Qj4A==
X-Gm-Message-State: AOAM5322IYbFIKKB/KZghmmxAXZIRVF/KEtrwK2drzuce9HDV14X6MR0
 jspggkKyRHzqFrMsh7lkQJE=
X-Google-Smtp-Source: ABdhPJxe9uClF4yn8tZcunRWtxDlWuh9tR86znz+TOBPok/VIIe5Df/vBtq17m7kMyjbPjEFliar6Q==
X-Received: by 2002:ac2:5933:: with SMTP id v19mr6202139lfi.94.1596378374688; 
 Sun, 02 Aug 2020 07:26:14 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:14 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 07/10] PCI: altera-msi: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:59 +0000
Message-Id: <20200802142601.1635926-8-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102616_454693_9FCE3540 
X-CRM114-Status: GOOD (  14.80  )
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
YWx0ZXJhLW1zaS5jOjI1OToyLTk6IGxpbmUgMjU5IGlzCiAgcmVkdW5kYW50IGJlY2F1c2UgcGxh
dGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCgpTdWdnZXN0ZWQtYnk6IEJq
b3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPgotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1hbHRlcmEtbXNpLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS1tc2kuYyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1hbHRlcmEtbXNpLmMKaW5kZXggMTZkOTM4OTIwY2E1
Li5iZWM2NjZlZGExZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1h
bHRlcmEtbXNpLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS1tc2ku
YwpAQCAtMjU2LDcgKzI1Niw2IEBAIHN0YXRpYyBpbnQgYWx0ZXJhX21zaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJbXNpLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOwogCWlmIChtc2ktPmlycSA8IDApIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFp
bGVkIHRvIG1hcCBJUlE6ICVkXG4iLCBtc2ktPmlycSk7CiAJCXJldCA9IG1zaS0+aXJxOwogCQln
b3RvIGVycjsKIAl9Ci0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
