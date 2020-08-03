Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A3FC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 07:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFDF206D7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 07:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cm88wQux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FFDF206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=celRms4Z6j72xdTbDbvoWK3eybDZb7m1CQGLdQtqorw=; b=cm88wQuxWkRFAPNld7yNqMbyW
	TOnRamXu1R5l8QBDYnoFrPH9W5nkkvH45+49w5EdjPNgw7DYpYcrD20VZDHIxeA8FCUrahT47JibJ
	Cp16+TnST/893DDqimoVJYfgH3FjUPp0Xy+n+KQ5l45DTSjQCLWYFTeKLQE61m39p9dqNgdqb4Ark
	pXB7iA2MHGUKCcPjF7rGi79fjg6ZK7ieN9WVRWiL0zOtE6VWty24HQxqUnGHKRRIfB47F6fjeURHH
	M0Z/42DuDsMueVYnFvoNStbRxVgCkxxa9Of/2DEJTXivoZpw688boqN/fxtWs7w8Ko2Chw/0+xx8g
	w5kBB9nXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2UcQ-0006zy-3K; Mon, 03 Aug 2020 07:10:46 +0000
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2UcO-0006zQ-8W; Mon, 03 Aug 2020 07:10:45 +0000
Received: by mail-lf1-f65.google.com with SMTP id c15so2609424lfi.3;
 Mon, 03 Aug 2020 00:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ay3Bi+IiWilbDlJUPitXEI+RuPwMq9ZiJzLYPsaopL8=;
 b=MsGSyCz4oCLHkEuVOrHbYgNFRsC8uvhOs9h87NNShyJr3L5M7eI9iJEpeh5fwK6ReY
 JEdgfa4AyOfYBqBqhNnjf8VPPUNJEVIf0sWeXVJbeqtDCuhRwHmloFA4sFX93nj1CCpj
 aGgiSGc6731emAk+GW990tOBZhAxxTuHhO/ZlbvzbcuazhppFTRtUcmDmlsx/+FFWt0J
 v+4BJraUfX3Cd7yFFMnP5JCWKiK0lizKLSujZ3OoRmurzuh5FMqqlpMNDC9qpwlHmYRO
 H1I+yAo2FYdZmscEUXj368qMH4VEviLLjnAW2qBgJgFF96J45Q7JqMeIPHULfUWLtU6A
 KL9g==
X-Gm-Message-State: AOAM533i9LJn1+EGlvNg6j7RrGlolyZrpZb29pODy0NLcnWHN9tzhtta
 zbDi4MD8fGLlHuOOyN+3gZY=
X-Google-Smtp-Source: ABdhPJzYw7yZDvJbTJfDGxm7OY2EE10qIOitHhsEhQ9czxB+hKmQdhCqIuug22Bs0Z17tX3e9sBetw==
X-Received: by 2002:a19:a07:: with SMTP id 7mr7780618lfk.65.1596438642541;
 Mon, 03 Aug 2020 00:10:42 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id r11sm3877560lji.104.2020.08.03.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 00:10:41 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 10/10] PCI: xilinx-nwl: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Mon,  3 Aug 2020 07:10:40 +0000
Message-Id: <20200803071040.1663662-1-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_031044_329238_FD3D65C2 
X-CRM114-Status: GOOD (  15.22  )
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
eGlsaW54LW53bC5jOjczMjoyLTk6IGxpbmUgNzMyIGlzCiAgcmVkdW5kYW50IGJlY2F1c2UgcGxh
dGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCgogIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS14aWxpbngtbndsLmM6NTg5OjItOTogbGluZSA1ODkgaXMKICByZWR1bmRh
bnQgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKCiAg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXhpbGlueC1ud2wuYzo2MDA6Mi05OiBsaW5lIDYw
MCBpcwogIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBhbHJlYWR5IHByaW50
cyBhbiBlcnJvcgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUteGlsaW54LW53bC5jOjgw
MToyLTk6IGxpbmUgODAxIGlzCiAgcmVkdW5kYW50IGJlY2F1c2UgcGxhdGZvcm1fZ2V0X2lycSgp
IGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCgpTdWdnZXN0ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJo
ZWxnYWFzQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBXaWxjennFhHNraSA8
a3dAbGludXguY29tPgotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngtbnds
LmMgfCAxMSArKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUteGls
aW54LW53bC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXhpbGlueC1ud2wuYwppbmRl
eCA5YmQxNDI3ZjJmZDYuLjU1NDg5YjcyODQ4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLXhpbGlueC1ud2wuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUteGlsaW54LW53bC5jCkBAIC01ODYsNyArNTg2LDYgQEAgc3RhdGljIGludCBud2xfcGNpZV9l
bmFibGVfbXNpKHN0cnVjdCBud2xfcGNpZSAqcGNpZSkKIAkvKiBHZXQgbXNpXzEgSVJRIG51bWJl
ciAqLwogCW1zaS0+aXJxX21zaTEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZShwZGV2LCAibXNp
MSIpOwogCWlmIChtc2ktPmlycV9tc2kxIDwgMCkgewotCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0
byBnZXQgSVJRIyVkXG4iLCBtc2ktPmlycV9tc2kxKTsKIAkJcmV0ID0gLUVJTlZBTDsKIAkJZ290
byBlcnI7CiAJfQpAQCAtNTk3LDcgKzU5Niw2IEBAIHN0YXRpYyBpbnQgbndsX3BjaWVfZW5hYmxl
X21zaShzdHJ1Y3QgbndsX3BjaWUgKnBjaWUpCiAJLyogR2V0IG1zaV8wIElSUSBudW1iZXIgKi8K
IAltc2ktPmlycV9tc2kwID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgIm1zaTAiKTsK
IAlpZiAobXNpLT5pcnFfbXNpMCA8IDApIHsKLQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0
IElSUSMlZFxuIiwgbXNpLT5pcnFfbXNpMCk7CiAJCXJldCA9IC1FSU5WQUw7CiAJCWdvdG8gZXJy
OwogCX0KQEAgLTcyOCwxMSArNzI2LDggQEAgc3RhdGljIGludCBud2xfcGNpZV9icmlkZ2VfaW5p
dChzdHJ1Y3QgbndsX3BjaWUgKnBjaWUpCiAKIAkvKiBHZXQgbWlzYyBJUlEgbnVtYmVyICovCiAJ
cGNpZS0+aXJxX21pc2MgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZShwZGV2LCAibWlzYyIpOwot
CWlmIChwY2llLT5pcnFfbWlzYyA8IDApIHsKLQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0
IG1pc2MgSVJRICVkXG4iLAotCQkJcGNpZS0+aXJxX21pc2MpOworCWlmIChwY2llLT5pcnFfbWlz
YyA8IDApCiAJCXJldHVybiAtRUlOVkFMOwotCX0KIAogCWVyciA9IGRldm1fcmVxdWVzdF9pcnEo
ZGV2LCBwY2llLT5pcnFfbWlzYywKIAkJCSAgICAgICBud2xfcGNpZV9taXNjX2hhbmRsZXIsIElS
UUZfU0hBUkVELApAQCAtNzk3LDEwICs3OTIsOCBAQCBzdGF0aWMgaW50IG53bF9wY2llX3BhcnNl
X2R0KHN0cnVjdCBud2xfcGNpZSAqcGNpZSwKIAogCS8qIEdldCBpbnR4IElSUSBudW1iZXIgKi8K
IAlwY2llLT5pcnFfaW50eCA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJpbnR4Iik7
Ci0JaWYgKHBjaWUtPmlycV9pbnR4IDwgMCkgewotCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBn
ZXQgaW50eCBJUlEgJWRcbiIsIHBjaWUtPmlycV9pbnR4KTsKKwlpZiAocGNpZS0+aXJxX2ludHgg
PCAwKQogCQlyZXR1cm4gcGNpZS0+aXJxX2ludHg7Ci0JfQogCiAJaXJxX3NldF9jaGFpbmVkX2hh
bmRsZXJfYW5kX2RhdGEocGNpZS0+aXJxX2ludHgsCiAJCQkJCSBud2xfcGNpZV9sZWdfaGFuZGxl
ciwgcGNpZSk7Ci0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
