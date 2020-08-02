Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BBAC433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995BA20759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zPT1JUYL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 995BA20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XQeA4jrmdGMUuWAGh8yFoUY8F2QRdDDPNVZo75TfPjk=; b=zPT1JUYLzJNkdVuLjm7zg4q1w
	EXuIyNK4nJLajosQj16xonhd92b04WiELfVh75o04YWlPl/U3kwW4P0rkcWm3mFf5K9mCRpruq6dK
	BEBLTV6q2nP4JjpWpmWSbOlbD5vHTRlFj8Kdt4XmaUDaEF1QCls3VSbAdV6HwzvpnzL9P+FI5P6Ul
	pXshWcfF9hjhPuVp49KSTIDDMF0+dVr0Jw53+LINTgASnXbZtAmni9iM+R5vppuGGjgypyS7wMn2Q
	Lbrue4D+0xKb+wWR/Yi+t7yPpXk+/SxLPTH75HiDCG79fr9YXdrtUItftAvFYdomNFOtSP5ArrSz/
	GiG2HG1Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ExX-0007ni-HN; Sun, 02 Aug 2020 14:27:31 +0000
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwN-00074T-6y; Sun, 02 Aug 2020 14:26:20 +0000
Received: by mail-lf1-f66.google.com with SMTP id k13so19179833lfo.0;
 Sun, 02 Aug 2020 07:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/S75/rZPVtT/la0J520uvq4mcrCeNFGU2um+3tul+rI=;
 b=fTA/2RKakxRz0DygQCYsBOgwnZ9u/grv89kSsDh6QZnxmzPYLUGxY5e0hvyLVyf4qB
 Rxp1mhGjdabSxkNjNn0qdV3/Xcmsb/ZuhX7TvD/Eo7z33mbsZur+zQe8+qbhbbvzq2fx
 OQgIOJuAcC/krcioqAUVqTXVhMeqJVu6WyFKf3/ara9GuXrFc/hzFnar+xMacm4HkS9l
 44/Kow3epT4Jlg9H0xRs27pStJmwBT3uVKNZGfyRGdeTjbX9UOYv0T3TPEGxyZT9TMbA
 LUx7wc+XuEDr6RAvPLxdo5aQ39SU9L8tQVHA7Z3L8yt+All9y0hpcdJS38S166FHoLW1
 qtmA==
X-Gm-Message-State: AOAM532F1JE3tEYO0xOb9f2nuE3uhyowHB8/t4BD5qlgzbtYPadd06a2
 Z71AqUrszneAsy/sjiAQZfM=
X-Google-Smtp-Source: ABdhPJzNpdAF9CCzGfP8sG9ncd25/FPuC6g6AByGverT5oAgx7TlVWh8xE/g3DI5YXBMEkYyIP2c8Q==
X-Received: by 2002:a19:189:: with SMTP id 131mr6399805lfb.128.1596378377807; 
 Sun, 02 Aug 2020 07:26:17 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:17 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 09/10] PCI: rockchip: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:26:01 +0000
Message-Id: <20200802142601.1635926-10-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102619_344882_F993CF83 
X-CRM114-Status: GOOD (  14.23  )
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
cm9ja2NoaXAtaG9zdC5jOjU1MzoyLTk6IGxpbmUgNTUzIGlzCiAgcmVkdW5kYW50IGJlY2F1c2Ug
cGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCgogIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmM6NTY2OjItOTogbGluZSA1NjYgaXMKICBy
ZWR1bmRhbnQgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJy
b3IKCiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYzo1NzY6Mi05
OiBsaW5lIDU3NiBpcwogIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBhbHJl
YWR5IHByaW50cyBhbiBlcnJvcgoKU3VnZ2VzdGVkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fh
c0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxp
bnV4LmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5j
IHwgMTIgKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2Nr
Y2hpcC1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5j
CmluZGV4IDk0YWY2ZjU4MjhhMy4uZWViZTA1YWIzNTRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKQEAgLTU0OSwxMCArNTQ5LDggQEAgc3RhdGljIGlu
dCByb2NrY2hpcF9wY2llX3NldHVwX2lycShzdHJ1Y3Qgcm9ja2NoaXBfcGNpZSAqcm9ja2NoaXAp
CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYp
OwogCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgInN5cyIpOwotCWlmIChp
cnEgPCAwKSB7Ci0JCWRldl9lcnIoZGV2LCAibWlzc2luZyBzeXMgSVJRIHJlc291cmNlXG4iKTsK
KwlpZiAoaXJxIDwgMCkKIAkJcmV0dXJuIGlycTsKLQl9CiAKIAllcnIgPSBkZXZtX3JlcXVlc3Rf
aXJxKGRldiwgaXJxLCByb2NrY2hpcF9wY2llX3N1YnN5c19pcnFfaGFuZGxlciwKIAkJCSAgICAg
ICBJUlFGX1NIQVJFRCwgInBjaWUtc3lzIiwgcm9ja2NoaXApOwpAQCAtNTYyLDIwICs1NjAsMTYg
QEAgc3RhdGljIGludCByb2NrY2hpcF9wY2llX3NldHVwX2lycShzdHJ1Y3Qgcm9ja2NoaXBfcGNp
ZSAqcm9ja2NoaXApCiAJfQogCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwg
ImxlZ2FjeSIpOwotCWlmIChpcnEgPCAwKSB7Ci0JCWRldl9lcnIoZGV2LCAibWlzc2luZyBsZWdh
Y3kgSVJRIHJlc291cmNlXG4iKTsKKwlpZiAoaXJxIDwgMCkKIAkJcmV0dXJuIGlycTsKLQl9CiAK
IAlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShpcnEsCiAJCQkJCSByb2NrY2hpcF9w
Y2llX2xlZ2FjeV9pbnRfaGFuZGxlciwKIAkJCQkJIHJvY2tjaGlwKTsKIAogCWlycSA9IHBsYXRm
b3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJjbGllbnQiKTsKLQlpZiAoaXJxIDwgMCkgewotCQlk
ZXZfZXJyKGRldiwgIm1pc3NpbmcgY2xpZW50IElSUSByZXNvdXJjZVxuIik7CisJaWYgKGlycSA8
IDApCiAJCXJldHVybiBpcnE7Ci0JfQogCiAJZXJyID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGly
cSwgcm9ja2NoaXBfcGNpZV9jbGllbnRfaXJxX2hhbmRsZXIsCiAJCQkgICAgICAgSVJRRl9TSEFS
RUQsICJwY2llLWNsaWVudCIsIHJvY2tjaGlwKTsKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
