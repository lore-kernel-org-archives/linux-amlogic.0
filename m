Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC4FC56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 17:02:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD553206D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 17:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMdf43ZB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYlX/Paf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD553206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gHKUsb+z1NFyrT/51JXq8GLIO8eHwjVgmiJaT0gnRZs=; b=oMdf43ZB24BdxFPnk8xpkGPP7
	1jli9zAhMmT5lk24SKIjXtOOapZtLIxLB7JJz936J5Bm3heIc4gsSE376mGqAzEZABXP1rYxBPxSL
	UUhlbE4jUZJAfRJXMd9486sNojDdcNL7Q7HeK+Q2IMye6cmNkn58vXM+TTG88TabdvcgG48b0CIc/
	zAHDYbhugf+NWbUZipWHdq6G0iFPqc/hep91xZQVYuqoDV8ZgDIyc9gD1owoh4/gSqcnWh+z7Sjqy
	YTaFEgMSjtf0QxhWxcAPrRVNK063SW1iqiSPladB8RfshoIQwZSvnF4FBtxGiQABu0+HCpApWnLsS
	LvGNykUhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khyBl-00068o-Iv; Wed, 25 Nov 2020 17:02:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxxK-0006yD-Go; Wed, 25 Nov 2020 16:47:48 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 526542158C;
 Wed, 25 Nov 2020 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322864;
 bh=aJ5DCE3a/F2CE/pLLWpj1Y5grILcoc2Inrrstm95hBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYlX/PafMEt3VgLEVAFz0P25RrNHjUgEdABl3WtA2Ds496EJJKB3dD7DyxCDHHivm
 cQJR7pkxx3aOLjdfFrEsJPzjTPBybQTT1iNp9yMcypN6apYRhdYsBtq+P+cKavLXCz
 MZQ5doBRyK7VOanmEOzyikpc8z81Osji/4Uk87Vc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 35/39] ASoC: samsung: i2s: mark OF related data as maybe
 unused
Date: Wed, 25 Nov 2020 17:44:48 +0100
Message-Id: <20201125164452.89239-36-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114746_857536_E4D78800 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2Mvc2Ftc3VuZy9pMnMuYzoxNjQ2OjQyOiB3
YXJuaW5nOiDigJhpMnN2NV9kYWlfdHlwZV9pMnMx4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAgc291bmQvc29jL3NhbXN1bmcvaTJzLmM6MTYzOTo0
Mjogd2FybmluZzog4oCYaTJzdjdfZGFpX3R5cGXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IFN5bHdlc3RlciBOYXdyb2NraSA8c25h
d3JvY2tpQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvc29jL3NhbXN1bmcvaTJzLmMgfCA4ICsrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3NvdW5kL3NvYy9zYW1zdW5nL2kycy5jIGIvc291bmQvc29jL3NhbXN1bmcvaTJz
LmMKaW5kZXggZGY1M2Q0ZWE4MDhmLi4xZTg5ZjJhMjg1YTkgMTAwNjQ0Ci0tLSBhL3NvdW5kL3Nv
Yy9zYW1zdW5nL2kycy5jCisrKyBiL3NvdW5kL3NvYy9zYW1zdW5nL2kycy5jCkBAIC0xNjIyLDI4
ICsxNjIyLDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Ftc3VuZ19pMnNfZGFpX2RhdGEgaTJz
djNfZGFpX3R5cGUgPSB7CiAJLmkyc192YXJpYW50X3JlZ3MgPSAmaTJzdjNfcmVncywKIH07CiAK
LXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Ftc3VuZ19pMnNfZGFpX2RhdGEgaTJzdjVfZGFpX3R5cGUg
PSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IHNhbXN1bmdfaTJzX2RhaV9kYXRhIGkyc3Y1X2RhaV90
eXBlIF9fbWF5YmVfdW51c2VkID0gewogCS5xdWlya3MgPSBRVUlSS19QUklfNkNIQU4gfCBRVUlS
S19TRUNfREFJIHwgUVVJUktfTkVFRF9SU1RDTFIgfAogCQkJUVVJUktfU1VQUE9SVFNfSURNQSwK
IAkucGNtX3JhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKIAkuaTJzX3ZhcmlhbnRf
cmVncyA9ICZpMnN2M19yZWdzLAogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBzYW1zdW5nX2ky
c19kYWlfZGF0YSBpMnN2Nl9kYWlfdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Ftc3Vu
Z19pMnNfZGFpX2RhdGEgaTJzdjZfZGFpX3R5cGUgX19tYXliZV91bnVzZWQgPSB7CiAJLnF1aXJr
cyA9IFFVSVJLX1BSSV82Q0hBTiB8IFFVSVJLX1NFQ19EQUkgfCBRVUlSS19ORUVEX1JTVENMUiB8
CiAJCQlRVUlSS19TVVBQT1JUU19URE0gfCBRVUlSS19TVVBQT1JUU19JRE1BLAogCS5wY21fcmF0
ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAogCS5pMnNfdmFyaWFudF9yZWdzID0gJmky
c3Y2X3JlZ3MsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IHNhbXN1bmdfaTJzX2RhaV9kYXRh
IGkyc3Y3X2RhaV90eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBzYW1zdW5nX2kyc19kYWlf
ZGF0YSBpMnN2N19kYWlfdHlwZSBfX21heWJlX3VudXNlZCA9IHsKIAkucXVpcmtzID0gUVVJUktf
UFJJXzZDSEFOIHwgUVVJUktfU0VDX0RBSSB8IFFVSVJLX05FRURfUlNUQ0xSIHwKIAkJCVFVSVJL
X1NVUFBPUlRTX1RETSwKIAkucGNtX3JhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF8xOTIwMDAs
CiAJLmkyc192YXJpYW50X3JlZ3MgPSAmaTJzdjdfcmVncywKIH07CiAKLXN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc2Ftc3VuZ19pMnNfZGFpX2RhdGEgaTJzdjVfZGFpX3R5cGVfaTJzMSA9IHsKK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc2Ftc3VuZ19pMnNfZGFpX2RhdGEgaTJzdjVfZGFpX3R5cGVfaTJzMSBf
X21heWJlX3VudXNlZCA9IHsKIAkucXVpcmtzID0gUVVJUktfUFJJXzZDSEFOIHwgUVVJUktfTkVF
RF9SU1RDTFIsCiAJLnBjbV9yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCiAJLmky
c192YXJpYW50X3JlZ3MgPSAmaTJzdjVfaTJzMV9yZWdzLAotLSAKMi4yNS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
