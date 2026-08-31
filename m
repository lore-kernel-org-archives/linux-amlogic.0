Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F241C61DE2
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC70T+7PhdWyIu2IlVayvkF/IDoPt60LT9VZXJc4nUI=; b=okq1T0nKZDlImE
	ozU38Vd7DzJCWjWsfF6fI8q8FaVNGoY9qFggzpgF6d3jKHdqb8YyXofbI5jlPwJNDVeAlXTM2Tu80
	HW1jKW3zUhyvtB7rn2lpK2uGJiBWacL1a6aSYWZQAhipcOxh4tPfnjRKRPjKxaMrKmeTq4sLGmUXV
	tYnHEIZyAn75odUWXE+SGBq+tnBWL7qIgC7AGU7c59C1xESxgBksdDHh7fGMr5XlFUHXxtKr0S/Xo
	td5dDiRSr6l4zN0ihPJR+tnEsXivxFVocv6G/wNu6cCLKu4kjyhBRrH0pyuFbfIxZNiqKHWe0hwsP
	Eq8HHmIrDQCaHbvDRPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xRA-00000008tYA-1Riw;
	Mon, 31 Aug 2026 08:32:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xR9-00000008tWs-2Baa;
	Mon, 31 Aug 2026 08:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B40043F01;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10DAAC2BCB8;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788165135;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WXmCxUw5ykfZUxUD/OWDuO5krPooPricRx8DbRUKrK6DxTKzYxbCFK6PI4p9yLP3n
	 YHNo3Eg2W2HD+dndWyQAgSHrd/z16Opt4PFf+KyGycXcj8BGefn4HhGewiv5jZU3Bd
	 x4tNg9ZFsEdDG/yvosSUGLUBbbCa5IAL91cXxlORNOtWJzEsKP8fyYddF3ouqolo30
	 Pk4tY6aORLj51g6QpUyKMN9qHFqXk77jxXlilepF/2x9s2oPLlXVY/4kAXqYCOZ5uO
	 m5mz8IjyN8GK7af+DAsTrHDwzvPGsHsblr9dzjo8ZGM801aLvwWDxCiUxlssUekCDD
	 sKEEqPkIhBYGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D69C61DD3;
	Mon, 31 Aug 2026 08:32:14 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 31 Aug 2026 16:32:02 +0800
Subject: [PATCH v8 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
MIME-Version: 1.0
Message-Id: <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788165132; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=6Z+ZCQ7Py7qGzILOAelA5yhL91QqXe5khWCbyXBeY5XszS/uRnxMfjMkbdQrYZohp9sdze/yo
 hXXl1ZfQ1V1CuT92qpHnTGAsvK/T+T3Lb+wuH5lgUjdL0ArKf8sN5dp
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
