Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D153C56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 16:18:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F282408E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 16:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8Satbyp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oyp1w20K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F282408E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdStauL/TQYDdU6fNbLUwqlpCBTYpNBKxhE0pkSXw+8=; b=D8SatbypDlFOw+HUhbnX2xn08
	dgFS2Q8gndJItsTbduDfMlVeq6mT8l+c5gzvDFNzoFFq0kN0qxFN0EKkbpQRJT+0Pk968Y5Fl0CF6
	uHNfsW/hB8owd+pzA2bUkq5a46vBrFgLObXCzfGFQrKbj8OLoGnoWjVBhBaNr8NAHV1QymRAxVV2f
	bwP354VWOpcrIUwuc/ZBnrdxWmXmgSppX2h864S09tZZqYEI4DEo8UFHpa/Dw2g6Ke/3aHImzMkqW
	WEehpRztvqggN2R/tjdfrtPn1PbZHxSnnmCUDZPShX6JUoEJCpmNAfOJdWIHQtncT/AUaf3OoiQys
	MKD5owkbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg971-0007AE-6s; Fri, 20 Nov 2020 16:18:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg96z-00079K-AW; Fri, 20 Nov 2020 16:18:14 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E05472245F;
 Fri, 20 Nov 2020 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889091;
 bh=J7blZK/cQ3ZmyizEP/d5i6nwcrycLSH9do8+EQTrnvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oyp1w20Kw1+RhiKRTJPAXIyfn0T8xpfiE5F4+TNUDI/oON7uP3oNzlHQaE0wUt8aH
 00Dd7UYt0uF1WEEnTeh3YxFTn5Ck23fO2C4IPlPQOSw9tQsxKnMz+moFwx1oJfqapx
 nV9LNOrMbRA/oVCrOIHlP6+oXLzAicRUdmSARDhk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 07/38] ASoC: meson: t9015: drop of_match_ptr from of_device_id
 table
Date: Fri, 20 Nov 2020 17:16:21 +0100
Message-Id: <20201120161653.445521-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_111813_468716_A8664AC6 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLiAgVGhpcyBmaXhlcwpjb21waWxlIHdh
cm5pbmcgKCFDT05GSUdfT0Ygb24geDg2XzY0KToKCiAgc291bmQvc29jL21lc29uL3Q5MDE1LmM6
MzE1OjM0OiB3YXJuaW5nOiDigJh0OTAxNV9pZHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvbWVzb24vdDkwMTUuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jIGIvc291bmQvc29jL21lc29uL3Q5MDE1LmMKaW5k
ZXggNTZkMjU5MmMxNmQ1Li4wNTMyYTJiOGMyNDAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9tZXNv
bi90OTAxNS5jCisrKyBiL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCkBAIC0zMjEsNyArMzIxLDcg
QEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgdDkwMTVfaWRzKTsKIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIHQ5MDE1X2RyaXZlciA9IHsKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJ0
OTAxNS1jb2RlYyIsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cih0OTAxNV9pZHMp
LAorCQkub2ZfbWF0Y2hfdGFibGUgPSB0OTAxNV9pZHMsCiAJfSwKIAkucHJvYmUgPSB0OTAxNV9w
cm9iZSwKIH07Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
