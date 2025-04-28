Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF45AC369D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgl3dyHmZSAiTr/Zg8VJjV6UMqamoDGBz+zdmHtJu1o=; b=NaXtHuBA3gYC1H
	cKkjSoV2wlVAlMLpaNsGJXXNBNyfQS8YeGfha3b7SijWMYaNvTxIUcQ/zQalannnZ19XPkioid2PP
	1EBJUeGSSTX/LmTkL1gdqqzvym1H+jUfM6HUC+NULrCTK+dBhI6mGXpaLattPKHza+ojw8vODsztk
	+VJ64ONNdh2gTJheYu3zmPqDFGBdFfNabEI0Vm7l1sShic6dVcQgkzOaE6I6OaPz+Ud2o2FYywG8D
	M5Gc4pDllCvrpd7+dvZ+Qs2K9B+8vdI9BfBR/5i4kChBrjc7FaS96tjdg7Vn6e/qdDZhfVVzz9Xii
	8SM75xpdNPtWHnxeFlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M4L-00000005qY2-3A1N;
	Mon, 28 Apr 2025 10:50:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LyS-00000005pUr-2Uqc;
	Mon, 28 Apr 2025 10:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65942A4AC6F;
	Mon, 28 Apr 2025 10:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB81FC4CEE9;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837070;
	bh=bM/5EDf32Br2Fmtz15dIAtUhg9VujV8OEWyNE+VJDtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GMHAfWteEmXZRUOmsspfjqj3XLZPvza+ufNt58PrhZG56F9WIpcG8JjBqa/bYRwdo
	 WdrnK0hZmbqeYBxPtKm5VFG9V57yYGMLahOv93JpF+53uhRQnZ9Ux4HmihVC9uPBpW
	 tlsXQHDuVEGOcUeVRP6Mt+iPeiQumHKumnkr28T3n0BeEoeSXCDipy9fbvC/d/SQoU
	 MpgcYw0wRCMwUNIC+aioO8rY6hwkPeP5fJsz3f+uRvJTAJNBQSB7/odhapSDyWfQEY
	 ZP+gZui6oBAoqBw2+X/exFRmHpY0jIC4yzDMFf2l/6jFTxzU3JWFFAoQSJA/ivZL4I
	 qs04lblftIqaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA738C369D9;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:28 +0200
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TC
 Unterhaltungselektronik AG
MIME-Version: 1.0
Message-Id: <20250428-fernsehfee-v2-1-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1023;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=lhW1S1FqMGlohP33kbMw1Pv6brNFdpf4vK4RYn9L2Ow=;
 b=FTY9CmJ9n2ohyDbO/qJZqosFFn7U14VWhCnco0IzGh6Gm4JAfeBCIiuq5vK/IPab3X0l9f6Sa
 Ihm0gJtX4+jAcTLq+jgTYmqgc0uFaRXuQcRIgnZuzJPM326GFPDN3k9
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034432_725478_6FBFC9DE 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKVEMgVW50ZXJoYWx0dW5n
c2VsZWt0cm9uaWsgaXMgdGhlIGNvbXBhbnkgYmVoaW5kIEZlcm5zZWhmZWUgYnJhbmRlZApzZXQt
dG9wIGJveGVzLgoKQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9z
dGVvLm5ldD4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnlhbWwgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCmluZGV4IDg2ZjZhMTliMjhhZTIxNzY0M2JmN2E2M2E0NzFmNzQ4MTlkMTgyMzguLmM2
MWM1ZTExZmY1NDcyYWNiOGE2ZWJkZDZkMWE2NmNmYTA3YWU3YWYgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAg
LTE0OTQsNiArMTQ5NCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0aW9uOiBU
b2J5IENodXJjaGlsbCBMdGQuCiAgICJedGNzLC4qIjoKICAgICBkZXNjcmlwdGlvbjogU2hlbnpo
ZW4gQ2l0eSBUYW5nIENoZW5nIFRlY2hub2xvZ3kgQ28uLCBMdGQuCisgICJedGN1LC4qIjoKKyAg
ICBkZXNjcmlwdGlvbjogVEMgVW50ZXJoYWx0dW5nc2VsZWt0cm9uaWsgQUcKICAgIl50ZG8sLioi
OgogICAgIGRlc2NyaXB0aW9uOiBTaGFuZ2FpIFRvcCBEaXNwbGF5IE9wdG9lbGVjdHJvbmljcyBD
by4sIEx0ZAogICAiXnRlYW0tc291cmNlLWRpc3BsYXksLioiOgoKLS0gCjIuNDguMC5yYzEuMjE5
LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
