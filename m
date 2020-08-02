Return-Path: <SRS0=7H/i=BM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4879C433E1
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8421120759
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Aug 2020 14:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swSpXiix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8421120759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZwO07RLyAVdGxqLPDjd67uM5PQ3u/xq36C2AZ0KABrc=; b=swSpXiixhNh6mEbhHomschZas3
	xGQFcXbhbKXgKRlNUwfbH97TiZyz4/tqF5yTsC2FOraUjUZjZsKWbvuFsmDtpv+5fAw3AcrbPh1e/
	XrLA5HTf4cSDW5u4fYzrg3hVM+LExm8rp1/zivWE2sAcqcI5qein/cqIbtWcQQIyG/+qaJG3xjFNv
	VvgsoG4eWLwBlkMtHtpUmgurIEYTeJsius91BlLgpTnAd68zf7kcC7kllWi9RGuX4qWfSKIBPSeyS
	UPbXUepSqYu+fXlFb9pvfq5aMVkxPVFOmCIn62S6Ck3vIEN5T/mNlqlb5qCtzK4zntqhAJLsohloc
	7PL5eaTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2EwF-00070y-3C; Sun, 02 Aug 2020 14:26:11 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2EwB-0006zB-QC; Sun, 02 Aug 2020 14:26:08 +0000
Received: by mail-lj1-f171.google.com with SMTP id x9so37042889ljc.5;
 Sun, 02 Aug 2020 07:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zeiAgJxHrPijvNQknHHdvjYtJyFN1FT1e2QzBTPsm24=;
 b=B8sVxf6RowCYAGQOlvb2k5Kal91vhbXwufnmyPE6PUcLDrrGd7CM2OToLShVJ0H4rH
 4XMaj1IiPQfV7TN3EbI2mf6kGBfZAiHuMqda9qxKf20sWvkB1kaWNUlEuEuDsqN9xo9u
 fTRW8ZVX8UAdlc1xs0AvpQKaBjcco0nr8hzYQ5swk/jdD98i7cy5jjar4iTOPjHBasNl
 1Wev0XR/LbVGjVe4z5GLm3IqcPYBkI2ExzBeoP2w7V4znUf2ah/QTLZYGO/LxHl8oJ7+
 W6okwYT7PdOw60EKtOxs2GDF0DxrHDdXK0vzvzPVZYjzFRGRY2KUzr5twCL0sZo256HS
 h0YA==
X-Gm-Message-State: AOAM530H86xogbxwY2Ra1fCF2L5RBsp8JhLnNwEtHKlEEPKYxl/6lDb1
 DEEXWkaPcUKPsFuii2/Lh8E=
X-Google-Smtp-Source: ABdhPJz3cgcIo8JIidtc9NrocQlQwtKoNwLE3saIsQCJHhsMNawOby6x6eEuxlT5d67lW0jGLW6Kmg==
X-Received: by 2002:a2e:94d5:: with SMTP id r21mr6223757ljh.424.1596378363688; 
 Sun, 02 Aug 2020 07:26:03 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 193sm4214136lfa.90.2020.08.02.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 07:26:02 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 00/10] Remove surplus dev_err() when handing an error from
 platform_get_irq()
Date: Sun,  2 Aug 2020 14:25:52 +0000
Message-Id: <20200802142601.1635926-1-kw@linux.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_102607_891399_E43CFC3E 
X-CRM114-Status: GOOD (  12.82  )
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

QXQgdGhlIG1vbWVudCBhIGxvdCBvZiBlcnJvciBoYW5kbGluZyBjb2RlIHdvdWxkIHByaW50IGEg
ZHVwbGljYXRlZAplcnJvciBtZXNzYWdlIHNob3VsZCBlaXRoZXIgdGhlIHBsYXRmb3JtX2dldF9p
cnEoKSBvcgpwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZSgpIGZ1bmN0aW9uIGZhaWxzIHRvIG9idGFp
biBhbiBJUlEgZm9yIGEgZGV2aWNlLgoKVGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIHRoZSBkZXZf
ZXJyKCkgZnVuY3Rpb24gZGlyZWN0bHkgdG8gcHJpbnQKYSBjdXN0b20gbWVzc2FnZSB3aGVuIGhh
bmRsaW5nIGFuIGVycm9yIGZyb20gZWl0aGVyIG9mIHRoZXNlIGZ1bmN0aW9ucwphcyBib3RoIGFy
ZSBnb2luZyB0byBkaXNwbGF5IGFuIGFwcHJvcHJpYXRlIGVycm9yIG1lc3NhZ2UgaW4gY2FzZSBv
ZgphIGZhaWx1cmUuCgpUaGlzIHNlcmllcyBhaW1zIHRvIHJlbW92ZSBzdXJwbHVzIGNhbGwgdG8g
ZGV2X2VycigpIHdoZW4gaGFuZGluZyBhbgplcnJvciBvcmlnaW5hdGluZyBmcm9tIGVpdGhlciBw
bGF0Zm9ybV9nZXRfaXJxKCkgb3IKcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUoKSBmdW5jdGlvbiBh
cyBwZXIgc3VnZ2VzdGlvbiBmcm9tIENvY2NpbmVsbGUuCgpSZWxhdGVkIGNvbW1pdHMgYXJlIGNv
bW1pdCA3NzIzZjRjNWVjZGIgKCJkcml2ZXIgY29yZTogcGxhdGZvcm06IEFkZCBhbgplcnJvciBt
ZXNzYWdlIHRvIHBsYXRmb3JtX2dldF9pcnEqKCkiKSBhbmQgY29tbWl0IDk4MDUxYmEyYjI4Ygoo
ImNvY2NpbmVsbGU6IEFkZCBzY3JpcHQgdG8gY2hlY2sgZm9yIHBsYXRmb3JtX2dldF9pcnEoKSBl
eGNlc3NpdmUKcHJpbnRzIikuCgpLcnp5c3p0b2YgV2lsY3p5xYRza2kgKDEwKToKICBQQ0k6IGR3
YzogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQogICAgcGxhdGZv
cm1fZ2V0X2lycSgpCiAgUENJOiBtb2JpdmVpbDogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRp
bmcgYW4gZXJyb3IgZnJvbQogICAgcGxhdGZvcm1fZ2V0X2lycSgpCiAgUENJOiB0ZWdyYTogUmVt
b3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQogICAgcGxhdGZvcm1fZ2V0
X2lycSgpCiAgUENJOiBhbHRlcmE6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVy
cm9yIGZyb20KICAgIHBsYXRmb3JtX2dldF9pcnEoKQogIFBDSTogaG9zdC1nZW5lcmljOiBSZW1v
dmUgZGV2X2VycigpIHdoZW4gaGFuZGluZyBhbiBlcnJvciBmcm9tCiAgICBwbGF0Zm9ybV9nZXRf
aXJxKCkKICBQQ0k6IHYzLXNlbWk6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVy
cm9yIGZyb20KICAgIHBsYXRmb3JtX2dldF9pcnEoKQogIFBDSTogYWx0ZXJhLW1zaTogUmVtb3Zl
IGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJyb3IgZnJvbQogICAgcGxhdGZvcm1fZ2V0X2ly
cSgpCiAgUENJOiB4Z2VuZS1tc2k6IFJlbW92ZSBkZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVy
cm9yIGZyb20KICAgIHBsYXRmb3JtX2dldF9pcnEoKQogIFBDSTogcm9ja2NoaXA6IFJlbW92ZSBk
ZXZfZXJyKCkgd2hlbiBoYW5kaW5nIGFuIGVycm9yIGZyb20KICAgIHBsYXRmb3JtX2dldF9pcnEo
KQogIFBDSTogeGlsaW54LW53bDogUmVtb3ZlIGRldl9lcnIoKSB3aGVuIGhhbmRpbmcgYW4gZXJy
b3IgZnJvbQogICAgcGxhdGZvcm1fZ2V0X2lycSgpCgogZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWRyYTd4eC5jICAgICAgICAgICAgICB8ICA4ICsrLS0tLS0tCiBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktZXh5bm9zLmMgICAgICAgICAgICAgIHwgIDkgKysrLS0tLS0tCiBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jICAgICAgICAgICAgICAgIHwgIDQg
Ky0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMgICAgICAgICAg
ICB8ICA0ICstLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jICAgICAg
ICAgICAgICAgfCAgNCArLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWFybWFk
YThrLmMgICAgICAgICAgIHwgIDQgKy0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1hcnRwZWM2LmMgICAgICAgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtaGlzdGIuYyAgICAgICAgICAgICAgfCAgNCArLS0tCiBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWtpcmluLmMgICAgICAgICAgICAgIHwgIDUgKy0tLS0KIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BlYXIxM3h4LmMgICAgICAgICAgfCAgNSArKy0tLQog
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jICAgICAgICAgICB8ICA0
ICstLS0KIC4uLi9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2llLWxheWVyc2NhcGUtZ2VuNC5j
ICAgfCAgNSArKy0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2llLW1vYml2
ZWlsLWhvc3QuYyB8ICA0ICstLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMg
ICAgICAgICAgICAgICAgICAgfCAgOCArKy0tLS0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktdjMtc2VtaS5jICAgICAgICAgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS14Z2VuZS1tc2kuYyAgICAgICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1hbHRlcmEtbXNpLmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtYWx0ZXJhLmMgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQog
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYyAgICAgICAgICB8IDEy
ICsrKy0tLS0tLS0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXRhbmdvLmMgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS14aWxpbngt
bndsLmMgICAgICAgICAgICAgfCAxMSArKy0tLS0tLS0tLQogMjEgZmlsZXMgY2hhbmdlZCwgMjkg
aW5zZXJ0aW9ucygrKSwgODIgZGVsZXRpb25zKC0pCgotLSAKMi4yNy4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
