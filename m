Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E87C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:51:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F55206D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bE543/hK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWlOm7Uc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F55206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1roD7EdYCdC85KbOaXoe5aRuZlArXChfFeUrOsAaDOc=; b=bE543/hKjhKXTq0ENq0IEdjn3I
	H7EaBQ53SDjLgWoekSu71iPiLPXaAwSDZcSX8/P7adqUnGhig7WCp5dt0auIdHgfhcxLnQly9hKQO
	FJ2hJry8C8O0DJ22vzqaGOJONn86xQSzfrC+hjrQ0hBNBUTK5Cwc9Eli/Vk7m1S8zD0kALVMwNFzX
	fI9pTdlwD36n4xC8SguALqlvGWciPfWVQRKWH7LMMAXvDxgm++7pkSm+GynO1MqUqc6kUrd2cgJyw
	AzAcBJhwBfARdeB185FN8Pj6inNVLbe89W08pkwXcTXckIEzU0KlRkz3fo9EQHCm0CVvSIZwL5wGI
	GFzRt0Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy0h-0008QB-6x; Wed, 25 Nov 2020 16:51:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxvh-0006Em-3e; Wed, 25 Nov 2020 16:46:06 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A44221534;
 Wed, 25 Nov 2020 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322763;
 bh=QvhyoHx2lMqfOUPbVPjehAqBnDhjTWYLsFZ7GvNgP5Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AWlOm7UcDqYdf86FQLskfVwmcT2l25RqI5/cRKK2YBYGqzhCNIf3U2QR33wM8+OzA
 9TAKma8Euyg4VpjU5ekGfMLbljjP2KzZKHbQnfB7MsLixLsNjaYM5gqYvYeZrGYd31
 FCdsqOSD4g3tOL/isUKhjrGLmOrxH8pfY2Ikp7Vk=
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
Subject: [PATCH v2 12/39] ASoC: ti: davinci: mark OF related data as maybe
 unused
Date: Wed, 25 Nov 2020 17:44:25 +0100
Message-Id: <20201125164452.89239-13-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114605_356150_699AD294 
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
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvdGkvZGF2aW5jaS1pMnMuYzo3NTA6MzQ6
IHdhcm5pbmc6IOKAmGRhdmluY2lfaTJzX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvdGkvZGF2aW5jaS1pMnMuYyBiL3NvdW5kL3NvYy90aS9kYXZpbmNp
LWkycy5jCmluZGV4IGRkMzQ1MDRjMDliYS4uNmRjYTUxODYyZGQ3IDEwMDY0NAotLS0gYS9zb3Vu
ZC9zb2MvdGkvZGF2aW5jaS1pMnMuYworKysgYi9zb3VuZC9zb2MvdGkvZGF2aW5jaS1pMnMuYwpA
QCAtNzQ3LDcgKzc0Nyw3IEBAIHN0YXRpYyBpbnQgZGF2aW5jaV9pMnNfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGRhdmluY2lfaTJzX21hdGNoW10gPSB7CitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBkYXZpbmNpX2kyc19tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gewog
CXsgLmNvbXBhdGlibGUgPSAidGksZGE4NTAtbWNic3AiIH0sCiAJe30sCiB9OwotLSAKMi4yNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
