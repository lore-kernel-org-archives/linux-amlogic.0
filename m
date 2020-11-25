Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2CFC56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:58:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD3E206D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rl2Y3WbW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiSK+XYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD3E206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzsZ68y3zWlV0dsrCkO6RFlR890qmF83dKTZkWbnXd8=; b=rl2Y3WbWWnttVy571NXDPFLO7P
	vVSZq1T1cG5s+zcmommhVAXVXvQxvEMoezz0s4BNl/RLzBtNUQ7AuFCEvh5YzMAsiHMyO2iT7Hnu2
	/UNpN+oz0ujXsfpW5iOvAQXdBr1Q6Z5qDPTIUOSfFHF7czhWWDZttPf3Mo+5li8p7/jid3aLgJhdl
	HGz/FmXrP9mDkt/suwl3rdJMjcm2CgJHKe4gR8C6RRb4ii0UT8wneWeCpxxsRo9CW6ipcE/WJ5MF9
	lbcU9vNie1MUZGEpfFRrpyNJbThvMZLE0uS/KHeD3P0GH+GLWSLV+/DNg0P50EkS7Y7w0X454rydN
	uSyLQoQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy7E-0003vc-CF; Wed, 25 Nov 2020 16:58:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxwg-0006fS-Ei; Wed, 25 Nov 2020 16:47:08 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2139721527;
 Wed, 25 Nov 2020 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322825;
 bh=zDxcfDBYmjuuUTiiRpHLHOCTf/WPUkT0pv5HqP59xZI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LiSK+XYcJNugW0STLE/0t1V2G0ik6mZcH64EBcZOv82CKd7CcmslEyqG4E0RfpKPG
 u46Ewl1lIwHGpMJgBGVhiBXCtjjCv++nVaT2/tyyzlZpa0szNn8Y3DijoxPVvpCbzb
 DZybrRVHSn0ZIwymN+F1DR5jUtXvuJXjZXOm/1TU=
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
Subject: [PATCH v2 26/39] ASoC: max98926: skip of_device_id table when
 !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:39 +0100
Message-Id: <20201125164452.89239-27-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114707_297747_60E8049B 
X-CRM114-Status: GOOD (  15.49  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggYnkgbXVsdGlwbGUgbWV0aG9kcy4gIEl0cyBvZl9kZXZpY2Vf
aWQgdGFibGUgaXMKcmVmZXJlbmNlZCB2aWEgb2ZfbWF0Y2hfcHRyKCkgc28gaXQgd2lsbCBiZSB1
bnVzZWQgZm9yICFDT05GSUdfT0YKYnVpbGRzOgoKICBzb3VuZC9zb2MvY29kZWNzL21heDk4OTI2
LmM6NTc0OjM0OiB3YXJuaW5nOiDigJhtYXg5ODkyNl9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIHNvdW5kL3NvYy9jb2RlY3MvbWF4
OTg5MjYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4OTI2LmMgYi9zb3VuZC9zb2MvY29kZWNzL21heDk4
OTI2LmMKaW5kZXggYzRkZmE4YWIxZDQ5Li4wOTc3ZTU0MTMyNmQgMTAwNjQ0Ci0tLSBhL3NvdW5k
L3NvYy9jb2RlY3MvbWF4OTg5MjYuYworKysgYi9zb3VuZC9zb2MvY29kZWNzL21heDk4OTI2LmMK
QEAgLTU3MSwxMSArNTcxLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBt
YXg5ODkyNl9pMmNfaWRbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgbWF4OTg5
MjZfaTJjX2lkKTsKIAorI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbWF4OTg5MjZfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gIm1heGlt
LG1heDk4OTI2IiwgfSwKIAl7IH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtYXg5ODky
Nl9vZl9tYXRjaCk7CisjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIG1heDk4OTI2
X2kyY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
