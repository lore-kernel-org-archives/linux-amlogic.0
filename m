Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA05C433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8043D20759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ru+GIEgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8043D20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ir+QHhm5tccffGaXZGg3NO+Er7Mq66cpjhY73P/7eMo=; b=ru+GIEgjS1waoWfU52l1F1SMn
	t7jIX/WlEXYE+kd1XWINcoMjn3FdjsaiAKty0anXSq875O7XlqLfUczxYlrsCWlyK1i+F0PUHspxp
	Oexxu8uRopcxp7wJPv/6JXSRTUDjbmnAhXgHqSsuDsIKRWYBjPX3IhzYE8wCV60Khr7KL7Gtl7FyD
	3IlQT5dwYF4fWJ8/Xyvre/RrjSrgGXeL/8fW+fm78TSSdEGqt+tpWIiU3vbes9w6PXXby4fAcs8On
	08uoogk+7DCHuCzDDG98+02rmWqqlPmERHtvx6P2Al0EgLiX77rWy9cjJSUipyU8Ffnsfm7bcHTEj
	xVu1aEF1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ExC-0007Zd-9A; Sun, 02 Aug 2020 14:27:10 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwL-00073p-Ie; Sun, 02 Aug 2020 14:26:18 +0000
Received: by mail-lj1-f195.google.com with SMTP id w14so7157189ljj.4;
 Sun, 02 Aug 2020 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KctYFubeJoKLzzl613htWFeciTcF38lRZu1u0/Rl6M8=;
 b=RiwP7NOMnE5Q0pf5Y5GnckOZPIWdXVZ1KVaxHLEfFZ8YnZocpU3QsdcBkVLYojorzP
 5+lhO/1mQkv3cwfQhhaR5XRDLCdKjh1ECTPtQ1cNTtWxBXT/wu0GP7pOv1qn2XfZ8BaI
 pJ29RJJms5sWQVEmEG5bqKbrLW6trwjNbTwDmM+g8ekRyuMUoOt5JzpD8SHu+ubXOdSI
 akM+c7Q2fsF4lfPzMD+edIwj+t/GkoTlDpBMzPNU0A4gn5LuiyxC2WwXE1mSODp2RfDX
 2ABcPZX1B48CpIMESeBQPkPs8ZwW0e0eNX9JqktamDFYGBGB5wVEtoKIrbzC4CZZV473
 qfsw==
X-Gm-Message-State: AOAM530V5BAEGRmun1C+p16MiULad8rHuD1to+T/HUDWksv8PrT8UDzt
 OQ3Aw2EpsKx8dDpXapwSVP0=
X-Google-Smtp-Source: ABdhPJzMcdshNqp2FVaeIW1qGszgg8tWQnvrwe+GCIZdRiYp+tWne0ejZ4gesGSqeO7GvTac2I4drw==
X-Received: by 2002:a2e:9e89:: with SMTP id f9mr5229933ljk.212.1596378376233; 
 Sun, 02 Aug 2020 07:26:16 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:15 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 08/10] PCI: xgene-msi: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:26:00 +0000
Message-Id: <20200802142601.1635926-9-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102617_737676_A86A99F7 
X-CRM114-Status: GOOD (  14.10  )
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
Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14
Z2VuZS1tc2kuYzo0ODE6My0xMDogbGluZSA0ODEgaXMgcmVkdW5kYW50CiAgYmVjYXVzZSBwbGF0
Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKClN1Z2dlc3RlZC1ieTogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Ci0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2kteGdlbmUtbXNpLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS1tc2kuYyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLW1zaS5jCmluZGV4IGY0YzAyZGE4NGU1OS4uMDIy
NzFjNmQxN2ExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS1t
c2kuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS14Z2VuZS1tc2kuYwpAQCAtNDc4
LDggKzQ3OCw2IEBAIHN0YXRpYyBpbnQgeGdlbmVfbXNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJZm9yIChpcnFfaW5kZXggPSAwOyBpcnFfaW5kZXggPCBOUl9IV19JUlFT
OyBpcnFfaW5kZXgrKykgewogCQl2aXJ0X21zaXIgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGly
cV9pbmRleCk7CiAJCWlmICh2aXJ0X21zaXIgPCAwKSB7Ci0JCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJDYW5ub3QgdHJhbnNsYXRlIElSUSBpbmRleCAlZFxuIiwKLQkJCQlpcnFfaW5kZXgpOwogCQkJ
cmMgPSB2aXJ0X21zaXI7CiAJCQlnb3RvIGVycm9yOwogCQl9Ci0tIAoyLjI3LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
