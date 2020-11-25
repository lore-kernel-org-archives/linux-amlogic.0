Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DB1C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8FE21534
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHbEKLUA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/aIpR0L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8FE21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJtKOL1pQnT7qD0/WLnY5AdJYVXsqAVIQHbE/wVLrmE=; b=GHbEKLUAsoXVypSnC4dLFbnQB+
	Km8hUNWW1IpIsDSnePSpMtZpCApmdj255xQF1IQjweyv7FNF1K1Vq9yiERZat235h06Wzc0r1U9XZ
	4Li8KWVYHj43dhSI2w4hXkxB/apsUcN0gMPXfcZziF6CfU4bTXPIzkg+lTISs8I7mrxCy2bpo0H9Q
	uPoAniLcPt6laaQ8xL87Wm1cYGsvAxnfmFb5b5S9yHOiVM6yynE29L6StZD96H23MU92+ux60ma3q
	C0e552XFgp3OEsDV4EXh1bx+xqwJgzbejpebKDggnqiMeqsrom6OlOWrOzE6NaIWacrNQUdhqZlZp
	SGKO/KeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxwA-0006QX-C7; Wed, 25 Nov 2020 16:46:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxv6-00060m-O0; Wed, 25 Nov 2020 16:45:30 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB93421741;
 Wed, 25 Nov 2020 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322727;
 bh=EtfxLZGVf6Pv7VuMJv00I0+5UWJZ2ud+PvUseeP91Ek=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k/aIpR0Li8U/yGphrYd82yT8eLMReruMeCppq/2B+WClclpSX29g5xuIuLoauWaNG
 rC9U2M5iCAF6hjqXofhsTJxXLSOsUvxyUzVyCOvzOmbJfq9wpu0ebAUYnfwfzcJPrx
 E4WKd4MgKOb5WEQ+hrAnGRHZUXXNQnauJ43K0y0U=
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
Subject: [PATCH v2 04/39] ASoC: inno_rk3036: mark OF related data as maybe
 unused
Date: Wed, 25 Nov 2020 17:44:17 +0100
Message-Id: <20201125164452.89239-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114528_946225_D3976CED 
X-CRM114-Status: GOOD (  17.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvY29kZWNzL2lubm9fcmszMDM2LmM6NDcw
OjM0OiB3YXJuaW5nOiDigJhyazMwMzZfY29kZWNfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL2lubm9f
cmszMDM2LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2lubm9fcmszMDM2LmMgYi9zb3Vu
ZC9zb2MvY29kZWNzL2lubm9fcmszMDM2LmMKaW5kZXggZDBlOGYwZDJmYmMxLi40ZGJjZTI0YzVm
NzYgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaW5ub19yazMwMzYuYworKysgYi9zb3Vu
ZC9zb2MvY29kZWNzL2lubm9fcmszMDM2LmMKQEAgLTQ2Nyw3ICs0NjcsNyBAQCBzdGF0aWMgaW50
IHJrMzAzNl9jb2RlY19wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmsz
MDM2X2NvZGVjX29mX21hdGNoW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCByazMwMzZfY29kZWNfb2ZfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsKIAl7IC5jb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzAzNi1jb2RlYyIsIH0sCiAJe30KIH07Ci0tIAoyLjI1LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
