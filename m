Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A86DC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1E920759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JzM8aoag"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1E920759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ua69dmV9qkWdUESlqPNZsqRxQhDUwFUNWa3h3FOf3K0=; b=JzM8aoagGq/QxEed4RkHo1C2g
	AY3GPNQuQs12u3ldw/daXDkl+LbbvEDBKAwpX+YyauqbOYFTmKsAYcCBE7UeS02zT6MErrMtJWTYS
	rrWRXV6sYwhMjpBP0Y25E3/aVCBtNF1GxzTDaAdxJiCDJr01zBpCf6oSf+q2/BduPAc+7pzyFK90r
	BSZvNjrLFhNIkxsrHi2gA77lLLrM1FNWX4cLR1Du6DdKRmKr1tzOWHxJKmFq4fxDKOvyIFclu8hYR
	QlrZnRbuGaoFLwKZOlFVOnCSaj75oqk6MhiIJSmbILAuPqW1azxJpuwidij1E5JeEzWWAIx7ypRnO
	YKJSyc5bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2EwX-0007AA-El; Sun, 02 Aug 2020 14:26:29 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwF-00070p-3N; Sun, 02 Aug 2020 14:26:12 +0000
Received: by mail-lj1-f195.google.com with SMTP id w14so7157011ljj.4;
 Sun, 02 Aug 2020 07:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vqz66jFdWkrqKdTPiLpnKqTLTv8a5tORVk+kvNATVNQ=;
 b=iSRz5veQ0xfSS79fi2c88mcCi6Tbz5+rOtKpBgb6O54WBpTfzBK0eyMQ4xJ4zD1qmx
 l+X341ypTSwFBhw/yyAkdcJGjqfsEFOItlBI9Vsn+DZUCeutAS3fG9DjkHcd323P6oeF
 C6mPmkYWIAQBr32eIwVYnqVWGhEDPs+Ghi8emEj/HP/+Lcbc1v/CBrutnRgxM0UGOGMY
 M1D8BlQvYM4FihE925OWhPiMltJBk0LloZnLW2jp8xDJjprqv5r0Eb2GvNl33JHlTCF1
 imQzVCN0xeKtJLMQBPrd7EJIM+g4VF2e/71SVFIhvBFrodJ72hA3J+o7GKOZtABG4hXF
 csPA==
X-Gm-Message-State: AOAM531X0uww7R31AQVVJfy4BFjzh85h/4ve12x0SVvVJypLhr/Cq0Bb
 +qrGdMGhdOEbkJ87IyCvVl8=
X-Google-Smtp-Source: ABdhPJy4jSVIiW6PUqWFPiMQhKNWAsiM5j0yMAxbx3OUXIJ59hEmi0ME2i3lZ+iAJfoiqC9jsw91kA==
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr4003308ljj.341.1596378369981; 
 Sun, 02 Aug 2020 07:26:09 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:09 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 04/10] PCI: altera: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:56 +0000
Message-Id: <20200802142601.1635926-5-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102611_248843_0A39C446 
X-CRM114-Status: GOOD (  14.95  )
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
YWx0ZXJhLmM6NzE3OjItOTogbGluZSA3MTcgaXMgcmVkdW5kYW50CiAgYmVjYXVzZSBwbGF0Zm9y
bV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKClN1Z2dlc3RlZC1ieTogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdp
bGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Ci0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LWFsdGVyYS5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVy
YS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS5jCmluZGV4IDI0Y2IxYzMz
MTA1OC4uZjZkNzNkMjgyMjMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUtYWx0ZXJhLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFsdGVyYS5jCkBA
IC03MTMsMTAgKzcxMyw4IEBAIHN0YXRpYyBpbnQgYWx0ZXJhX3BjaWVfcGFyc2VfZHQoc3RydWN0
IGFsdGVyYV9wY2llICpwY2llKQogCiAJLyogc2V0dXAgSVJRICovCiAJcGNpZS0+aXJxID0gcGxh
dGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAocGNpZS0+aXJxIDwgMCkgewotCQlkZXZfZXJy
KGRldiwgImZhaWxlZCB0byBnZXQgSVJROiAlZFxuIiwgcGNpZS0+aXJxKTsKKwlpZiAocGNpZS0+
aXJxIDwgMCkKIAkJcmV0dXJuIHBjaWUtPmlycTsKLQl9CiAKIAlpcnFfc2V0X2NoYWluZWRfaGFu
ZGxlcl9hbmRfZGF0YShwY2llLT5pcnEsIGFsdGVyYV9wY2llX2lzciwgcGNpZSk7CiAJcmV0dXJu
IDA7Ci0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
