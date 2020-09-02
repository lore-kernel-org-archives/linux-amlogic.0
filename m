Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC265C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:39:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A83C208C7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wy06YmER";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWZFBv9M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A83C208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S0szoRJyVFfnwZJIQIKVDrtt4+AuRwyXLivAHaQGSdk=; b=wy06YmERlhPklXKsWJSGRTEqi
	5WxEUfqfvqeAldLM9JR4rzI7RmFiU8eg7RyTW+lyrxaoKnBLJy3ZjEJrPO41sCwsXi0076ZLSvE8F
	r/f1/0gwJ6U5serRoDhefrAXknUf2+y5AtuFr9lN+vHlZIRPvoPVs0OHMOYQJG7dwl/nqinXzWbQ/
	nI/B9s275mSbBKrLuKJKNHPyfo6ohnpFkioVl3qiY44nvpwKvtRGem8T3aHponC4zsg6tPVUMQccH
	uXq3B2HjRmPIEllkwS9UrU3Q/5hcGw+XWoKVlMGeFmbZztCxwCOWFYe0KoYLuVAP+m3HJLnTNIQ4L
	Ie8v4EODg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYbB-0000bc-8Q; Wed, 02 Sep 2020 19:39:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYaY-000076-TF; Wed, 02 Sep 2020 19:38:36 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F9B42083B;
 Wed,  2 Sep 2020 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599075514;
 bh=uScesMbqyDE62hweEWPuyL7WWTMRh8MYCWsDxlC6EqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RWZFBv9MZSBEJpivw+ogGRJXdri2LjzrzENGHno3Cc4jWgRGxew0muj0MHLVHkhyH
 CSzuUd9/nDWhyW8Ro6kJsYEUcYIuQN1++f00Ha+B7Z4KAHDZmHyOXKOYsVjUuvz/VH
 1cCZ8Y++8Rx0BVeZqBmxRSy9B+KKFUyG/tNtGmgc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] mmc: sdhci-of-sparx5: Use proper printk format for
 dma_addr_t
Date: Wed,  2 Sep 2020 21:36:57 +0200
Message-Id: <20200902193658.20539-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_153835_721180_53E83080 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ZG1hX2FkZHJfdCBzaXplIHZhcmllcyBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMgc28gdXNlIGRlZGlj
YXRlZCBwcmludGsKZm9ybWF0IHRvIGZpeCBjb21waWxlIHRlc3Rpbmcgd2FybmluZyAoZS5nLiBv
biAzMi1iaXQgTUlQUyk6CgogIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Ytc3Bhcng1LmM6NjM6
MTE6IHdhcm5pbmc6CiAgICBmb3JtYXQg4oCYJWxseOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5
cGUg4oCYbG9uZyBsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg
4oCYZG1hX2FkZHJfdCB7YWthIHVuc2lnbmVkIGludH3igJkgWy1XZm9ybWF0PV0KClNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L21tYy9ob3N0L3NkaGNpLW9mLXNwYXJ4NS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hv
c3Qvc2RoY2ktb2Ytc3Bhcng1LmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLXNwYXJ4NS5j
CmluZGV4IDE0YjVkYWQ2NTc1YS4uNzQ3ZjEwOGEwYWNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL21t
Yy9ob3N0L3NkaGNpLW9mLXNwYXJ4NS5jCisrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
c3Bhcng1LmMKQEAgLTYwLDggKzYwLDggQEAgc3RhdGljIHZvaWQgc2RoY2lfc3Bhcng1X2FkbWFf
d3JpdGVfZGVzYyhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCwgdm9pZCAqKmRlc2MsCiAJCXJldHVy
bjsKIAl9CiAKLQlwcl9kZWJ1ZygiJXM6IHdyaXRlX2Rlc2M6IHNwbGl0dGluZyBkbWEgbGVuICVk
LCBvZmZzZXQgMHglMGxseFxuIiwKLQkJIG1tY19ob3N0bmFtZShob3N0LT5tbWMpLCBsZW4sIGFk
ZHIpOworCXByX2RlYnVnKCIlczogd3JpdGVfZGVzYzogc3BsaXR0aW5nIGRtYSBsZW4gJWQsIG9m
ZnNldCAlcGFkXG4iLAorCQkgbW1jX2hvc3RuYW1lKGhvc3QtPm1tYyksIGxlbiwgJmFkZHIpOwog
CiAJb2Zmc2V0ID0gYWRkciAmIChTWl8xMjhNIC0gMSk7CiAJdG1wbGVuID0gU1pfMTI4TSAtIG9m
ZnNldDsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
