Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AADC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8FA20759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSAtRaMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8FA20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FYKaGBsrHeugpMiXzeBL0aJr/pnQdvpyqZlI14vzYuI=; b=nSAtRaMsmDUCwKmJU06kp5si+
	F4cXDkQeWMvwVPtZEuW7sbzXaULGga0OhEGrNuGL3RBNQaHUxseID+AcLMT7iU7c4E2lWCEi2HADo
	Tws+2opjjPSU5FyfUkwSzv3J0wu+QPzhahIzhTZ2I9kq8Q7H9OmGxliLRzgkmxt/W3uSVvOMEO00U
	hpeXA4reAV+mSwJ+i64kz0mtGW+XlcMJG3q2NqyMB1m2fSoKtizvvJbMOnx1icon+O5N8CyogskfB
	wdj51XYyWbzAkFgCVUxpWgCVxRafzRS9LV0YeQYHV8kfCvZ54eoTqY7SIHH6E/ICo9hJUgIk9ycqJ
	1PJgfXm7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Ewo-0007K5-36; Sun, 02 Aug 2020 14:26:46 +0000
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwI-00072G-Ly; Sun, 02 Aug 2020 14:26:15 +0000
Received: by mail-lj1-f194.google.com with SMTP id w14so7157100ljj.4;
 Sun, 02 Aug 2020 07:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3KSoQD71byHkg+Qsnb1jzju+E/FIRrV3OAj8SbgT+c=;
 b=s34FRS5CC7hNxD9+EskX12iL4xgzKNlJzpy+nbtTUOQxO8EWLJsXRL0RLiwE/tlzam
 2KBUflJAqTWaG4MuDX6R49jlpK5gLeHl46I37Zh5Ly4WLVrrAO6JW6uPzTRG8XZf8mfI
 tEu5RKffr+ea23LdFdgW+ObbUmJ4AmDR2MYGysIn7mAlFMr9l7hJ8vBSd9Iun4VCuIgx
 VjXF0+LrFShVKp2VOUeo86otQijmEmtc4ZB1uudBU6MWkw5iL7P3TLiLOPlLkrU4VGgZ
 CtzOkPHQvutwqomO/We88U4HuprOQFbkObZNnKAst9gh/y37X/ldqYPs1Oud3lat1nOi
 KJxQ==
X-Gm-Message-State: AOAM532Sl5UdeGRMVVqlaMUgQBWsoaWbex6f1IeceKQa5Tn/sKpf8HGL
 kThXVaAVCYK/UOGPNunEoew=
X-Google-Smtp-Source: ABdhPJy+xlZ4x5ScpsArHy4QaEW+arFDZ4OILOPVHDYUlBaUmY+RMdxu/xscCf5AhzmdVlScycAYuQ==
X-Received: by 2002:a2e:9bc1:: with SMTP id w1mr6140877ljj.288.1596378373175; 
 Sun, 02 Aug 2020 07:26:13 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:12 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 06/10] PCI: v3-semi: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:58 +0000
Message-Id: <20200802142601.1635926-7-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102614_811427_8C872222 
X-CRM114-Status: GOOD (  14.60  )
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
Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS12
My1zZW1pLmM6NzgxOjItOTogbGluZSA3ODEgaXMgcmVkdW5kYW50CiAgYmVjYXVzZSBwbGF0Zm9y
bV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKClN1Z2dlc3RlZC1ieTogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdp
bGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Ci0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kt
djMtc2VtaS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS12My1z
ZW1pLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS12My1zZW1pLmMKaW5kZXggMzY4MWU1
YWYzODc4Li4yYTE5ZjJhOTg5NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpLXYzLXNlbWkuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS12My1zZW1pLmMK
QEAgLTc3NywxMCArNzc3LDkgQEAgc3RhdGljIGludCB2M19wY2lfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAogCS8qIEdldCBhbmQgcmVxdWVzdCBlcnJvciBJUlEgcmVzb3Vy
Y2UgKi8KIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwotCWlmIChpcnEgPCAwKSB7
Ci0JCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIG9idGFpbiBQQ0l2MyBlcnJvciBJUlFcbiIpOwor
CWlmIChpcnEgPCAwKQogCQlyZXR1cm4gaXJxOwotCX0KKwogCXJldCA9IGRldm1fcmVxdWVzdF9p
cnEoZGV2LCBpcnEsIHYzX2lycSwgMCwKIAkJCSJQQ0l2MyBlcnJvciIsIHYzKTsKIAlpZiAocmV0
IDwgMCkgewotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
