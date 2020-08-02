Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C692C433E3
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE592075A
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEXAwe9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE592075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=puoYhrmfpJvxG/ABd0GlThJEAuYXDw0DJr0XzgeXiYE=; b=FEXAwe9b/+qjH3MoGSxFbzjV9
	Nl4716gAakz2zn81MHUAB7DGSzqbQef1td7MBpHgew2Fqr67ScbwjaQFRXk96HC/ZCFytG1/P1Q4q
	v/FA53Cvns+rA5weyqSpHpfJC3xvZxuXdxFGQF/2i32YQnm2C1tDAYc9M4M7YS2d9P0Qde/7+sSub
	BMksntDnMEHeDATUhHUPXyFi5ZzCdoSHwqc41wUOURfVE8mpVTjpYZd4HUlahtnxs6XeEpG6M50/0
	UZNx6Zi0zYSDnb7xHAISoQ6gf3QdoXyoJsvTIyN/C+y1gkJaHzNEZTWTtV0sF5cqSdEBCb+yNTvXC
	GgUZ5Cw8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2EwM-00074H-3T; Sun, 02 Aug 2020 14:26:18 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwC-0006zI-Gz; Sun, 02 Aug 2020 14:26:09 +0000
Received: by mail-lj1-f196.google.com with SMTP id v4so27328565ljd.0;
 Sun, 02 Aug 2020 07:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfkhr1q1ggPu0YMrYNRyEFtEoT09pWjfvzSHRK7KszI=;
 b=ZU7mUvS721uGpb2SPPOsPDB5XhUPBBKGqFcnBmjZZ1GKKNB8BXTfRsey2BjovktFOh
 wPbBEzDUzEuFOh16QpfW8/EJuoj/c3+XhIRwy+TqyV2SdyJhWk/rrra33gMLOsqZf5GR
 g1FpObtWgKIfHB/f4Lvd4olXtE+gLKjmTShwPJb1hauLttyyCkIyPwLQ1yMs8ZuAeyj9
 py5VtbfuhMIIzwN/4VamxZZr0OW/RI+1XSzENjYWTk+N5hzqVVm42j2A3pv8N/H7oY8p
 rYETCIdo/+HZ6lYLQfDgikc/XzSnmcluTRDaBFom7eBHJrnevvxtbdRLC3IY39lh/c33
 gycw==
X-Gm-Message-State: AOAM533Pgnj527K+V9J4WqGFJKkFFbPqI4wJewmsWzMwDwg1AYu/PvPs
 69aC+sUZfej7PeVDpA7VY+w=
X-Google-Smtp-Source: ABdhPJwj8NNsaKX276AKW3jAXsmsgaGQgCsO/u2y94Zh7oXKJWpdLXn5GIGobnMNMMKuZhl66j8/uw==
X-Received: by 2002:a2e:9d04:: with SMTP id t4mr5607399lji.184.1596378366828; 
 Sun, 02 Aug 2020 07:26:06 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:06 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 02/10] PCI: mobiveil: Remove dev_err() when handing an error
 from platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:54 +0000
Message-Id: <20200802142601.1635926-3-kw@linux.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200802142601.1635926-1-kw@linux.com>
References: <20200802142601.1635926-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102608_640421_0A8BAD30 
X-CRM114-Status: GOOD (  16.08  )
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
Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOgoKICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2
ZWlsL3BjaWUtbGF5ZXJzY2FwZS1nZW40LmM6MTc0OjItOTogbGluZQogIDE3NCBpcyByZWR1bmRh
bnQgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKCiAg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2llLW1vYml2ZWlsLWhvc3QuYzo1MjY6
Mi05OiBsaW5lIDUyNgogIGlzIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBh
bHJlYWR5IHByaW50cyBhbiBlcnJvcgoKU3VnZ2VzdGVkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3
QGxpbnV4LmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2ZWlsL3BjaWUtbGF5
ZXJzY2FwZS1nZW40LmMgfCA1ICsrLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2ZWls
L3BjaWUtbW9iaXZlaWwtaG9zdC5jICAgfCA0ICstLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvbW9iaXZlaWwvcGNpZS1sYXllcnNjYXBlLWdlbjQuYyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvbW9iaXZlaWwvcGNpZS1sYXllcnNjYXBlLWdlbjQuYwppbmRleCBhNmQyMTkwYTY3NTMu
LmVlMDE1NjkyMWViYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVp
bC9wY2llLWxheWVyc2NhcGUtZ2VuNC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvbW9i
aXZlaWwvcGNpZS1sYXllcnNjYXBlLWdlbjQuYwpAQCAtMTcwLDEwICsxNzAsOSBAQCBzdGF0aWMg
aW50IGxzX3BjaWVfZzRfaW50ZXJydXB0X2luaXQoc3RydWN0IG1vYml2ZWlsX3BjaWUgKm12X3Bj
aSkKIAlpbnQgcmV0OwogCiAJcGNpZS0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRl
diwgImludHIiKTsKLQlpZiAocGNpZS0+aXJxIDwgMCkgewotCQlkZXZfZXJyKGRldiwgIkNhbid0
IGdldCAnaW50cicgSVJRLCBlcnJubyA9ICVkXG4iLCBwY2llLT5pcnEpOworCWlmIChwY2llLT5p
cnEgPCAwKQogCQlyZXR1cm4gcGNpZS0+aXJxOwotCX0KKwogCXJldCA9IGRldm1fcmVxdWVzdF9p
cnEoZGV2LCBwY2llLT5pcnEsIGxzX3BjaWVfZzRfaXNyLAogCQkJICAgICAgIElSUUZfU0hBUkVE
LCBwZGV2LT5uYW1lLCBwY2llKTsKIAlpZiAocmV0KSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL21vYml2ZWlsL3BjaWUtbW9iaXZlaWwtaG9zdC5jIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9tb2JpdmVpbC9wY2llLW1vYml2ZWlsLWhvc3QuYwppbmRleCA1OTA3YmFhOWIx
ZjIuLmZhMzIxZmNkZDRiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2Jp
dmVpbC9wY2llLW1vYml2ZWlsLWhvc3QuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL21v
Yml2ZWlsL3BjaWUtbW9iaXZlaWwtaG9zdC5jCkBAIC01MjIsMTAgKzUyMiw4IEBAIHN0YXRpYyBp
bnQgbW9iaXZlaWxfcGNpZV9pbnRlZ3JhdGVkX2ludGVycnVwdF9pbml0KHN0cnVjdCBtb2JpdmVp
bF9wY2llICpwY2llKQogCW1vYml2ZWlsX3BjaWVfZW5hYmxlX21zaShwY2llKTsKIAogCXJwLT5p
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwotCWlmIChycC0+aXJxIDwgMCkgewotCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBtYXAgSVJROiAlZFxuIiwgcnAtPmlycSk7CisJaWYgKHJw
LT5pcnEgPCAwKQogCQlyZXR1cm4gcnAtPmlycTsKLQl9CiAKIAkvKiBpbml0aWFsaXplIHRoZSBJ
UlEgZG9tYWlucyAqLwogCXJldCA9IG1vYml2ZWlsX3BjaWVfaW5pdF9pcnFfZG9tYWluKHBjaWUp
OwotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
