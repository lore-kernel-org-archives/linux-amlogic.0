Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C80BC432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEB1206CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u9S0lR0I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lFzeH9x5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEB1206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBp1/1YVfcYmaYLbKl8pJIGFrWAVQDYBHpSqkdmaj2g=; b=u9S0lR0IC2Viko
	k/BmD/70/TV5Ou9Nr2io8IPNlcA8F4R+GRPc9xD1+MuewtTYt5lKf6/UaAT/ibRKDwPEmPl2fCKh3
	SLUZVWDoPMn8fhIUyyDZwbeRIX6b0DG+0+NA54rn3tTJ+riD+M6ac7GLwRroZ2BQTZDEXolZ1ulA3
	nWv8lAT/wSLeYhIRT5meivunue5VYU8TmiN+/ax4HmdBuj1pmOiDF4ly/MA5O0drD4AadAKb2p80l
	v4R7+X9Iu0E8PHFZrlEYUarhoKgiWtCkCL6nQo73QkQ5+UDceLKHR9VCUnJAP+WSeBi4IQkQtbahz
	z1c45fTzjusEspcoKgSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXjUD-0004Ij-6j; Thu, 21 Nov 2019 10:14:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXjTw-000417-Sx
 for linux-amlogic@lists.infradead.org; Thu, 21 Nov 2019 10:14:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id s5so3677044wrw.2
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Nov 2019 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wg42Ie2oicewNtAQ2/KQD6s/n4R5PzVImaC+y7L2/I=;
 b=lFzeH9x56IU0xzBmSWRZ6DcwLxw1LdGEIJ5MlxSDkIZqsb0vFRQ5uS/KuSKEhv4Rpe
 zXtQOFjQ5v/kTiNdmSeeMdIpd/tLUgDYdIlHZJY++DJQqDyXRl+O2emaVMMdfEMYpbXS
 lPPASwiAaZXdpBiEx8xmrla3280an3xZAkQlbeDlAHyRTMheWJ1BWs1RBZaPlkYk5ZyR
 zGBc4uGluDTwDdqqFLevoP1HfKsU1jK4h2lDg+opAN/Rlpuf7/yfRyLVCalk44pvBFjL
 Q3Uo0kH1qvOW1GrBmhdrITJLvv8OKVb0Z4+4oPyHHtRSxHaUFITEv1aOgLAmvTvJhIBF
 5OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wg42Ie2oicewNtAQ2/KQD6s/n4R5PzVImaC+y7L2/I=;
 b=cCxckrn5fWD5IwYsgjZ8MBN2GCva5uzSRDKNnVttq1bpjoBIuU1+I4rx6vICK5ay/M
 qIxk5stepiatRo+XDFxt1ylHgjG41fxNZUvUW7uXWjJL0RLnqu5rHcbJ/GyLElZOaGcF
 n9omBeO9d28bW7nMt5+frXX1d5+HOb6piBoAv2RGgD2w7sLxhggDy9jnrXPFaXKwbpBZ
 fyyGIVUPfNHZSPEirbI4s3almkY/NPGqeMIc+1X0Q5UPlLTIDeCnPBrr4jKEK+vPEI8q
 //3mcNwmK+oNd9KTfWrkdhsrDL+mCYkc6FzK1TRpbG4TTrLV4RTOMndjCMgg3X3obvu5
 BrCQ==
X-Gm-Message-State: APjAAAWxjCgEzb7l4OWBnEI+TOmXMVFkhVTU9JaXJguArQG8/GHbJDwl
 WB1JsVIuBsqYcjkhGVkDFcIWpw==
X-Google-Smtp-Source: APXvYqxaDVnzGeg++beFGsQYq3Z9at9EOfwRlpJHiF3RSAfp90GcgPYTGGemHS3Jb/bwbNGcDgkpQA==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr9739630wrq.91.1574331273780;
 Thu, 21 Nov 2019 02:14:33 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:14:33 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH 3/3] arm64: dts: meson-sm1: add video decoder compatible
Date: Thu, 21 Nov 2019 11:14:29 +0100
Message-Id: <20191121101429.23831-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191121101429.23831-1-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_021436_971445_E9D3CBC5 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the video decoder specific compatible for Amlogic SM1 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 521573f3a5ba..b94a4eae973f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -138,6 +138,10 @@
 	compatible = "amlogic,meson-sm1-pwrc";
 };
 
+&vdec {
+	compatible = "amlogic,sm1-vdec";
+};
+
 &vpu {
 	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
