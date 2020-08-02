Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13011C433E1
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F3A20759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v5RnKojM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F3A20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=suSbj9BM6nHPi/DXZ8FiK6LKZhiFWG8vfV8GFlej2ic=; b=v5RnKojM8WY0blNJD+82jqwT4
	odkIbYcpR/KRds3ZTA9fKR7rBg3ft1rMOzFVBF5r3y9jeKZMoPOw79aezZyPk0suw1fiuKXr8klcz
	fKw1GSLWWtpkYJriKaQIwcAaseCP7K6dz4pVO4YKltko/aDIbS9Wqj1zIG+VDccBXdvTBcmKxXTzj
	+RlE+7APiofgcgPvmwXFQvHfTwrobzYcu91kzWS2YTSjzrGNRunpGIdslsC9oOvEuksljulSK2Wt+
	3aU+5slxc8nuAQAcMq6OykFImIc9c9Tt7Nfn0fs6Kkkr/qwpgNoddgWKjiMBQbjrQcBMgB+d9oRX8
	1nVopa98Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2EwS-00077K-NE; Sun, 02 Aug 2020 14:26:24 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwD-000700-El; Sun, 02 Aug 2020 14:26:10 +0000
Received: by mail-lj1-f195.google.com with SMTP id h19so36998891ljg.13;
 Sun, 02 Aug 2020 07:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VMzZQXjK0WMetVDGn0tUCy2JU8NUEkR2xnKheZa8ZWc=;
 b=OSgURStQtUQawkO0yRIaxPFakz61bVO4ToxEiY0hhEGuv5T2qkSdLJ4BN5o6F6KM+o
 wWQFYnElBltBJOGvjLQEG8mb2JDScsTdYL+lO0kOe73f40Lqglqe34eqHh1NuOLAAuDL
 c1vt+Kvb3ASXll2dpwJ4IYcOUN9f1E3+hJrC8cTzdKWOtvXeDaSPNpjSds9bXfjj0+xh
 EN2DS/vouri0gKrs4onrMou62ywKavrTSt78q3x6qRDnurUE9mg2vDKy6UsAFdIj4Ti/
 eCGXlJNyYrWFCjFJssqZUsghFeTgRndLQY4+P/XExpaiHFJr6ZpSKeebYfZXTCiogEA7
 u9GQ==
X-Gm-Message-State: AOAM531ZJCsY9XgC7Zglo170wm5Ozo0vvWY9j21zxGtDT6DHB2BhMVVB
 oYHL8hCg7bEI08ZkoIb5+Rs=
X-Google-Smtp-Source: ABdhPJyjgrQc0FDjQcMFVZPpVkua7bA294ZwM5k/dH6lFvq8PdcJNGDDSetrLxIi93uNdb0Ai2zdVg==
X-Received: by 2002:a2e:752:: with SMTP id i18mr6183911ljd.428.1596378368431; 
 Sun, 02 Aug 2020 07:26:08 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:07 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 03/10] PCI: tegra: Remove dev_err() when handing an error from
 platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:55 +0000
Message-Id: <20200802142601.1635926-4-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102609_531237_B3A9B506 
X-CRM114-Status: GOOD (  15.32  )
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
Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10
ZWdyYS5jOjE1MjQ6Mi05OiBsaW5lIDE1MjQgaXMgcmVkdW5kYW50CiAgYmVjYXVzZSBwbGF0Zm9y
bV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKCiAgZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2ktdGVncmEuYzoxNzQyOjItOTogbGluZSAxNzQyIGlzIHJlZHVuZGFudAogIGJlY2F1
c2UgcGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCgpTdWdnZXN0ZWQt
Ynk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPgotLS0KIGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpLXRlZ3JhLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpLXRlZ3JhLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5jCmluZGV4
IDIzNWI0NTY2OThmYy4uYjExMzk3NDc1YTRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS10ZWdyYS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3Jh
LmMKQEAgLTE1MjAsMTAgKzE1MjAsOCBAQCBzdGF0aWMgaW50IHRlZ3JhX3BjaWVfZ2V0X3Jlc291
cmNlcyhzdHJ1Y3QgdGVncmFfcGNpZSAqcGNpZSkKIAogCS8qIHJlcXVlc3QgaW50ZXJydXB0ICov
CiAJZXJyID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgImludHIiKTsKLQlpZiAoZXJy
IDwgMCkgewotCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgSVJROiAlZFxuIiwgZXJyKTsK
KwlpZiAoZXJyIDwgMCkKIAkJZ290byBwaHlzX3B1dDsKLQl9CiAKIAlwY2llLT5pcnEgPSBlcnI7
CiAKQEAgLTE3MzgsMTAgKzE3MzYsOCBAQCBzdGF0aWMgaW50IHRlZ3JhX3BjaWVfbXNpX3NldHVw
KHN0cnVjdCB0ZWdyYV9wY2llICpwY2llKQogCX0KIAogCWVyciA9IHBsYXRmb3JtX2dldF9pcnFf
YnluYW1lKHBkZXYsICJtc2kiKTsKLQlpZiAoZXJyIDwgMCkgewotCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBnZXQgSVJROiAlZFxuIiwgZXJyKTsKKwlpZiAoZXJyIDwgMCkKIAkJZ290byBmcmVl
X2lycV9kb21haW47Ci0JfQogCiAJbXNpLT5pcnEgPSBlcnI7CiAKLS0gCjIuMjcuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
