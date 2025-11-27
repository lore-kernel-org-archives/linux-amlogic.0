Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8FBCFD2F6
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Nov 2025 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FxbabjWSESijxgfCOd3vE8NpcwLjf5Do2j+LuanFYEc=; b=wvH4vXIEEzrTgj
	zQk5QKpaWdUVu5TfyyatJtJKiJLBoqVr7DPpAbUpikicTnCWqxWXikUXxeuv2LPLEuC46f7HSGQbF
	ak9ZGiRr1LEGs2Lm5RgKtyE+Cb3wr/CYjiOsxqfkTxYL36euqz6gK3BSK298ZfkKtBFoBq4TLO028
	UbHR4AIXLuHdD1guzagdpBh9C5ohgGUQ8tjrRt6oDGhyjRUXIS4CTA1/hHw8HVeWZXyNbPBzrl/bs
	vMn0FmjOG9KDhdrGA9B7yjgI1xSLRDL4uXUd1r2bnqHfPQ8BhVKWbtjVtnFJkaaZEoK1XAyYoLzSM
	HiLa7K6aYiLQfFsFVDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSj-0000000G7ae-3XdU;
	Thu, 27 Nov 2025 07:30:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSi-0000000G7ZZ-3xQw;
	Thu, 27 Nov 2025 07:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2757860172;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE6F7C4CEF8;
	Thu, 27 Nov 2025 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228643;
	bh=6jPCsfq4CeOnErf3qNwJU7sJXITpGdob9lEfen7L2oQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OhEyhWE/v3IymteflPwIgo2JT9OM2ts7CmFLMG58IjdqSDWM7Q7dgFMzwfXziXviv
	 RI9UvAtf8YnKnLoci5DgqgncwsbFAG9XfuiarjQLTeDmQLkGLHeqcE3ioPUYNZ9+ro
	 kjNqsG76vpgIKKwJ5q0YNsQLe1kw0lInrnyGjl9YbPGAlpYSpNhPc0edfRbYXjgp7w
	 ZRJxVGpUTg4GQb/nWvJwZ0kQ3+Dt1NY44VpdOUFs0jxn/LRNqt59MOGm7iT7Um5aGs
	 jN1FQlb4lFPxHiDyekqN67/Ruq45vplg8tyYLwfuIJ1da8oJo6bFB8Po1k2cnfGTPH
	 yunALonCbhu7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C6FD11183;
	Thu, 27 Nov 2025 07:30:43 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/4] Add support for Amlogic S6/S7/S7D Reset
Date: Thu, 27 Nov 2025 15:30:30 +0800
Message-Id: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABb+J2kC/x2MuwqAMAwAf0UyGzABn78iDtWmmqVKIyKI/24Rb
 rnh7gGTpGIwFA8kudR0j1moLGDZXFwF1WcHrrgm4hqTmJxoDVqb8chEoW879sHNkKsjSdD7P47
 T+34GgAzDYQAAAA==
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764228641; l=1065;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=6jPCsfq4CeOnErf3qNwJU7sJXITpGdob9lEfen7L2oQ=;
 b=+6Fgb0YDwTd5M6y0wp/2GvdWtmo59GcMmDK77MFLDAdShb4SHZoI+iPLjuyNILLj5UZfC14up
 6Mbdyhe6Y3sAbJrrOlAOD0UWC/2QTC94jipkNNnhf168f7iHFilSohw
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add dt-binding compatibles and device nodes for Amlogic S6/S7/S7D reset.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (4):
      dt-bindings: reset: Add compatible for Amlogic S6/S7/S7D
      arm64: dts: amlogic: Add S6 Reset Controller
      arm64: dts: amlogic: Add S7 Reset Controller
      arm64: dts: amlogic: Add S7D Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        |   3 +
 arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h     | 171 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   8 +
 arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h     | 124 +++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   8 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h    | 134 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   8 +
 7 files changed, 456 insertions(+)
---
base-commit: 79482f3791c4760b9b0d8d9bfde9f1053ea3dd5e
change-id: 20251125-reset-s6-s7-s7d-211f9782dfab

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
