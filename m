Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F80CD5BCF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEywlG5q/uENcMZxrA3cZYr+TrOKGNvVJ+uqMYsdh28=; b=yqofSCRJ2ay9wL
	IWveOsoymmxKGLe1+S9CHKXIas7qqKQRkZTQYDTFBGiZgG+wq4FcpxfElllmnPNfZ9owTyYOaZKIc
	MT5A1uivNLeIbAAoBAyC9uPDXEzPw/TJhsKIur+xq3XJb3Z3g3GSAI3zCCdp/TYS4Y6JweFLON7w4
	UBLhCdZNtGAuPUZMrONLnnhjpyc959xusyt9QRVp3KpCLjeXPhLTW39fypQgy7QLxF194/wCf1mAq
	Y3A4CFNMVGJGcQLYCmRiPvnjoz8Z3JF9OIxL7KSHg/ZgP/WB13BzY7Jrnla0eJ8S2Q2o142xYMjZ4
	gHjbxorcwNmiu4odiUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmIt-00000001H6k-177G;
	Tue, 26 May 2026 07:34:19 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmIl-00000001H1M-2BKX;
	Tue, 26 May 2026 07:34:12 +0000
Received: from [127.0.1.1] (10.28.11.83) by mailsc.amlogic.com (10.8.11.35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 00:34:05 -0700
From: Zhentao Guo <zhentao.guo@amlogic.com>
Date: Tue, 26 May 2026 15:33:36 +0800
Subject: [PATCH RFC v5 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
MIME-Version: 1.0
Message-ID: <20260526-b4-s4-vdec-upstream-v5-1-c6edebf5ea89@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779780841; l=701;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=EIbyEqiJ64VIutoxUMLEEjiZLuEMFFURkZoqXNKTANY=;
 b=7/SFWew3pk2OIXRhw+gXjJ6zO9SpMclslVvqDIMdvdUYP6BkKPPRYCWQTW1BLj6aozUHtdc6i
 xy42EToyXR2ARaoPfx0rblMuNp8i6nC5QlQvbmbXvmqzChAvXkWfCVV
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Originating-IP: [10.28.11.83]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_003411_561885_60AF9175 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5d..5da6c65d684a 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -47,6 +47,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_GET_CHIP_ID,	0x82000044),
 		CMD(SM_A1_PWRC_SET,	0x82000093),
 		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,	0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
