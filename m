Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E97F459FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2026 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9tPmoorDEsBDwGZH0uWDdQ5WNImifYPHfuxqZWRMVE=; b=2mciiPgPrPu9wt
	lAoNlmuI7naJyiBit5PLF2oxjnWeIwmGfTDKBHcNc0Ku8mAAWyR5Voh5hKd02B5h2TTpGaL2ylgvh
	PVQIoopQ71s9O0t9yEWbBR5RK6yDy2v/SJNCWNQeQoptPq5xRGxNU8ss7tzNcczehrtir+S7BU0Zo
	0bP86exH+57N9mQnF6e8RavggpjKD02pOuef5BnIQvLvr7G9uF+46yPUq88c62GxJTHWkVKQXc5p6
	UQqPI9LUG+1Z4bnvcpNStZGWMwGw2McPfSOH3J7Ayi7agBAjxPhy9AulfEFQgnFMiOlXtK1M3kcmA
	ldgBiuUsj+rZ+FwC4otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2X-0000000CYmc-1usP;
	Fri, 10 Apr 2026 16:49:05 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2U-0000000CYl0-0mUO;
	Fri, 10 Apr 2026 16:49:04 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775839734;
	bh=z46M+rsMVvol/Iu/vuO1m+rAUYrJ82iMmifq0EnDoU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ULPv06292dF3Z01JzJjHzkQEHS0RTwP3l8ol08UdRpR2SxSWUGIk92OPYRnj/Xe67
	 0BHutzoKS9m69sJVeT973tHHPPBo4KgQDeRk5yUfsr1lTI4wHKJCuemWrDqUEZHqe1
	 GgxZXYEmB2DLcsLIF3A5+NE5Efbo/6YB4LQJMh4k=
Date: Fri, 10 Apr 2026 18:48:03 +0200
Subject: [PATCH 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
MIME-Version: 1.0
Message-Id: <20260410-add-thermal-t7-vim4-v1-2-19f2b8da74d7@aliel.fr>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
In-Reply-To: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775839730; l=1177;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=z46M+rsMVvol/Iu/vuO1m+rAUYrJ82iMmifq0EnDoU0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIdG5PGwnUp/EKo0dNAba95QRzc9WMbqB6dkwPz552jhu4dUiv865FKKJN2fYRYIq3JDT0Uh0og
 hhFa1LX/r0Q8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_094902_377788_293106C1 
X-CRM114-Status: UNSURE (   7.39  )
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

Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
thermal sensor calibration data through the firmware interface.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/firmware/meson/meson_sm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 8eaf8922ab020..3ebc2bd9a9760 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -12,6 +12,7 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
 };
@@ -27,5 +28,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
 		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
 		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
+int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
+			       u32 tsensor_id);
 
 #endif /* _MESON_SM_FW_H_ */

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
