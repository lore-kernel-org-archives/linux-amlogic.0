Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB9C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BDF9216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZaZowQJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U4DhVvCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BDF9216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeztjaayCVP/b3wX+AftuGWAMsKVAUO+FEz7NBUkUbA=; b=AZaZowQJ3L/Rj/
	cvT/ruC7l3zSzc1it2SvcHtzCbMZejmT6ELbVkgNjZNyl5O14TmXDwE9NQ2Fdwlf6vwEHYZ9Aqdtq
	FggzbvEUMFqL/bQ7ZgeHm70SjuS+Lmz05GiO2JEIUu6aoyHMl8wtRPs/37oqKq8QxleoK+ZylASdz
	xHkLSqOI0Y0Btaj5vD4jJ1N7sksxmwJfCaXU0JoGjRorO+LQ2wrly7yQTNA1dJ65LG5mNS0RSrDP3
	auFcDYZG33XJM9oqX1uTSKpRzOc9xYc+nXrCUtNub3HhHBf3fBJBn3GALjeTH/4AZTIdhOKMQrRk+
	upVVjj7Y49l+WeJghvMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoal-0004oY-7T; Mon, 20 May 2019 20:09:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoaY-0004Xf-F5; Mon, 20 May 2019 20:08:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id g12so15706877wro.8;
 Mon, 20 May 2019 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VzyK0hwlGllQwpUASaSXDvSJ4lCGjRcRs3B49LwTWQM=;
 b=U4DhVvCK8cGR4sjHiPqsoKZBv923R6m3+PqlKY6yM9WbcNPsiSGWSp0EiyVkyZQqNU
 QuyIQdQHOfB59b1bQmeTkp7KSzfQ5vZVmVyuHzJADG6uOlivsXM/JZ1gG42q+MhfLtbg
 KV5WlcCJjQaLzR1CX2K1bud2XDiA4mZtCsfZ7fzqx9GsiyTDNZWzC56Jv5AG4JysZrRE
 kFFqhJyIQ6qzMHcn38KuOn6OAr28Y33HQg3zN/qiRNrht0nCJPF4M/t1T0B0QJihgvMX
 11eZ+8WDcFIw3y8ELd8nApvIHH9kYRdPeQI25FszQntrjrxjlO+UZ6XUMIdpQQVb+bj3
 if/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VzyK0hwlGllQwpUASaSXDvSJ4lCGjRcRs3B49LwTWQM=;
 b=nG7AmSLFA2FAiUHjqt76QBGXmMpuN0X2RrR97eFIyKMt0huC3iQ7VeBn0qYNrOoNpX
 5Tue65TwvCyuXgtJBFCIGmHKD9+KTr9yXwk3tBCHVrvcaQw6lWsKYgadKozMnNhxYu+D
 QqiIj+7d92Ztx8B3bAxQND/qAjd3R+9SQqW7IujllDPdgG53MfkeCqdhZFCeWXAOihs9
 F1ladj46KC/eIN+9VsokCatPNcF4o2R6MsyC14Fwl3tiC4ND5OMDw2deuAMHheqnk6UM
 XK6HwHYUxtz1lKhiYiWPuc1nFFNRKpz3oJK1zAO4GI0KHluJYNck4thjPvSWUzq8myAS
 VCxQ==
X-Gm-Message-State: APjAAAVHo5+DsXbuBOGOMw9E6AlXQtOLDjmvY3vdlvjNIEaAGiSOdzXH
 qs1pgZ1a6R4uEZMA0knKXOA=
X-Google-Smtp-Source: APXvYqyKxze095fP1qavF8T4ed1d3zUmuovjiLWGUkszU48aPxDoxCWtwfyiPggxWuH+G4Upbd/zJQ==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr28290659wrv.254.1558382928917; 
 Mon, 20 May 2019 13:08:48 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id i185sm918627wmg.32.2019.05.20.13.08.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:08:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbes-150@yandex.ru, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
Subject: [PATCH 2/2] ARM: dts: meson8m2: mxiii-plus: add the supply for the
 Mali GPU
Date: Mon, 20 May 2019 22:08:39 +0200
Message-Id: <20190520200839.22715-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520200839.22715-1-martin.blumenstingl@googlemail.com>
References: <20190520200839.22715-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130850_500408_534C1978 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Mali GPU is supplied by VDD_EE which is provided by the DCDC2
regulator.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index c7d9cf035e22..59b07a55e461 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -190,6 +190,10 @@
 	};
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao1v8>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
