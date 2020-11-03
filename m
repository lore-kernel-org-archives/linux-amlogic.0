Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0683FC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 16:31:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81799206DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 16:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hjZHQ6No";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yt4jWbWz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81799206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPpuU3gzxO0OrXla45rHE6WH6JiSdidrlYBYyBA9X3Y=; b=hjZHQ6No1vj8bHJclByMxMWqc6
	0czR99QFMt3I0oloPmryt1V4lIKTcwuJv8lhky2ieAkHpd+kkcnqd6STmDPIi16Iiv/aga0GyLkhl
	aGuQHVl3zTvbCwgZqFWkqdMMlXCw/QXXaC4luBcySCnjiS+yj5GPrx5Av1Xt40AHsSRYpNS8Dh2Hg
	wehaqtsneuVu7XnK8i+i7+6YCJzwuiXyurMcIdCBhOfao14pQeV26sgbiJ2cafE9iZtGDdBG62zCA
	1P4XhPpjyOE0TF32kfrLmvi/c/a4EfK0LGUzBf0nMWrrep2304xgqeEZJ0oNlCrCBGVIdiN/qvf9T
	7uvE36LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZzDA-00037Z-1S; Tue, 03 Nov 2020 16:31:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZzCv-000312-20; Tue, 03 Nov 2020 16:31:05 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6493206DF;
 Tue,  3 Nov 2020 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604421051;
 bh=dhY+aUcvUDnN3GOi7rmB6auRLoyv4aZXRn9dLCqmgEA=;
 h=From:To:Cc:Subject:Date:From;
 b=yt4jWbWzqlEY2R57hS3hfeYtDyOOfnCziXVs6pcJPBQIPh+Pu6t/qF6HiCY5NfNGI
 Ykp8dYVQTd23SRWHrIVyf/Dq/w8SgXs71oqeHLQ6teu9q1fN/dxiPJMf3EDM4RJagi
 uCa9Si6/FWe6WiZdwg6TDuEIew1gzziJbdQ5A2yo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: meson-gx: drop of_match_ptr from of_device_id table
Date: Tue,  3 Nov 2020 17:30:46 +0100
Message-Id: <20201103163046.14336-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_113053_301589_75428101 
X-CRM114-Status: GOOD (  16.95  )
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
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLiAgVGhpcyBmaXhlcwpjb21waWxlIHdh
cm5pbmcgKCFDT05GSUdfT0YgJiYgIUNPTkZJR19NT0RVTEVTKToKCiAgICBkcml2ZXJzL21tYy9o
b3N0L21lc29uLWd4LW1tYy5jOjEyNTI6MzQ6IHdhcm5pbmc6CiAgICAgICAg4oCYbWVzb25fbW1j
X29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT1dCgpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1neC1tbWMuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKaW5kZXggNGVj
NDE1Nzk5NDBhLi4xM2Y2YTJjMGVkMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVz
b24tZ3gtbW1jLmMKKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwpAQCAtMTI2
NSw3ICsxMjY1LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fbW1jX2Ry
aXZlciA9IHsKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUgPSBEUklWRVJfTkFNRSwKIAkJLnByb2Jl
X3R5cGUgPSBQUk9CRV9QUkVGRVJfQVNZTkNIUk9OT1VTLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBv
Zl9tYXRjaF9wdHIobWVzb25fbW1jX29mX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gbWVz
b25fbW1jX29mX21hdGNoLAogCX0sCiB9OwogCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
