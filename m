Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5920DC282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251312075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRDqp/gW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JUhTPCBi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251312075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgWyIqaKIfeyfX5Zcdrrz7mzvI8sw1VzJ1DgvBIEZtI=; b=nRDqp/gW4IGA4U
	+LfX9d2oEXtp4JxoMxjpmiEdu7tJ/5sEx8JBAqWNuqfWQhiYLqVdH9PUtebNJ66MLa8897DZnlrSv
	qhwsn7ZeBopwmlKa/JpXaNICd2thGkCToryBkIL90C9g0Vkrk8UOXxd1vTjO6SnPctdYxrpgCs9a2
	xAnIW3qeqVti4/AZeifta4Jb604KJAaEt9XTpZYIE+PdAoylVecu2eFraIYTeM9GCa6OR8mg1gqPT
	bDIwrF97fHZPCqusI2zXFJ0YMEovL+TMymkSThcGV+/l8eAqsHqoAOJwqP7A0vQ5Wlt5uwYBprFaw
	7/RosIJilneEg41B59ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYzk-0004MM-0I; Tue, 12 Feb 2019 14:25:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYzB-0003nS-Ix
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:24:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id x10so3199470wmg.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KAMq1x9B0WCQpzH3RwEBRqWOiCfu+v2gKiAUxijQ3dM=;
 b=JUhTPCBi+rn+Qm4N/lS+K7QJnRqYZdeODJmLzFN4+rfG9u0Qinh0z3PB59we7oqcB7
 bWWu5vZYGiSdfGs4CjdxE+kSj8vb8IApnE1QMMw7ox5gI/fTQSgnbo3E4X0NJQyo1rjf
 B/IYJVeAnD9PVTjToqNJtyaZCMQVVs3RQrCrVai+TzU0ncJLMMkgndfL42juOMm0sVd/
 1f4lgIVeBQRgzMtRD22ikCXOIM+bAjT5yxLIVUqge6EsQY3S/576mg4rmlEeuaOF07Kc
 0WLwZkG8BMu3zELoPKKRCXvzrvbLAcJsW1yDtRLVF1tWKWllo+QPdxPKPUtD8Pt1T6f7
 AZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAMq1x9B0WCQpzH3RwEBRqWOiCfu+v2gKiAUxijQ3dM=;
 b=FZr2V4YJGno6VlMUAnqvFKv7XySn9ehjTjDjvsRJ3qomMQCkUw7633YOXXGC92m/F1
 3/oSBGbYZm2gikw1uPgv0XTubMNKJgSmMcxfpbZpfBiiHFzPcXZcmXC8ETKdD7qzOAmd
 R+Ea4PD9Rlq5Cn1E6fh4XvKHX1lUYcrJKhUQdLOtl0qrbN0TO6MB4VmMlHBP6JcU724a
 9fBnE0Fc8MB36CpQwqDEFYW9XdqIgYzZHsjykU+RFhAADsKqXvJpJmpf9PDYpodfnF1s
 oKHbN6gWfZJr9x+/6pfdPV2iTRnNrebVkI4t8Vy+n+iQJcIrlPpCk+YeLBiV6b6Z3KuO
 ZQuA==
X-Gm-Message-State: AHQUAubGZVzakTLXGX0JTBjmwTsVmaIhY1LZuACAx6zHv8uoaD+Tsj5o
 wyqEv0Ne8DXhg+/cKGQAx+LpPQ==
X-Google-Smtp-Source: AHgI3IYpgl47wD6nqFYP7LCl82rQFpzOK10BE4EKQELBLfj0rBM/iBzR4WWSXNhm0jvdtzcJ6sPavg==
X-Received: by 2002:a1c:2804:: with SMTP id o4mr3273810wmo.150.1549981471553; 
 Tue, 12 Feb 2019 06:24:31 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c139sm4926838wmd.13.2019.02.12.06.24.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:24:31 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/3] arm64: dts: meson-g12a: Add AO Secure node
Date: Tue, 12 Feb 2019 15:24:27 +0100
Message-Id: <20190212142427.14478-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212142344.13634-1-narmstrong@baylibre.com>
References: <20190212142344.13634-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_062434_413906_1909E93E 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the Always-On ao-secure system control registers node,
which is used by the meson-gx-socinfo driver to detect the SoC IDs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3b82a975c663..e247194da126 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -101,6 +101,12 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
+			sec_AO: ao-secure@140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
