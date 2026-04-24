Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687FFFED3EC
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ3Zx7HYgs83pIZ/xQywZGmAjDd81J9zNvvQ+BwJ+ck=; b=hvLj674awsNBVj
	/smIAp+13JOWeBlhxLiYzXwgMGkiMOmhPnkR0nN7EPMTWq+oU0V0yckVMtQk9DonMxU/V7TzhrROp
	HqNzkIgV2daHCqm2Nr3Yw3QVm/gM+aaQAmMOUkR6IVKS0mtDdp9zR3J8oRApScUkDIjn06HgFybz1
	87EF2zVky7kng6KPykqR4yNOwKaz0xAUpggQgwuimMOV6gcfM7Orf33Mx8P0dAr5tM6BaMc1waSql
	4TPyVG/8sbtc9AfTb8R1695uVUOCqjH8IsuL0EAxN/8FANT8pejv0Kif/VnRYqA3EHcFpx5i/lSYA
	4WT7sZcLa5eRT5JbWWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIko-0000000DOxu-1WtC;
	Fri, 24 Apr 2026 15:47:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkj-0000000DOu1-06Qv;
	Fri, 24 Apr 2026 15:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 213FB445A3;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0129C2BCB8;
	Fri, 24 Apr 2026 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045656;
	bh=cMGDrFg61aGwyz734Xgs5gOHCfTOozPvglCuCWWc0fI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ByCrqxx6kY/Vv/bdtP4v3zMgk4MUmk0DbJYXTkzwTdnnl/jDhWWlWIr4tC0NE3kSY
	 ilqtNJoml0hrWQdTs8TJAhnF0AbjZeWwhhIjq21Owm8/lWb18jKlJdQcS0WL/+wApw
	 38k7rSo+AE7h7bo7BZBN1wMGImsAIOOL0urfqI93McwQMtpKHH3+3jv9Y7/o+GbIzk
	 Fkvp3TpAmOG3xyFpAw4rB8sOmNby8HF8hAsm5hS1Gy1uuGi+VSygcVy1nDfhpB+EAR
	 lbcyobxCAqPvGFanmiugQXU767V1oqHHeHOTzlweMBZPGbwOY8bABtXkvT6D67DzuG
	 rCSzBlr+PqPfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC20FED3EC;
	Fri, 24 Apr 2026 15:47:35 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 17:45:10 +0200
Subject: [PATCH v5 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
MIME-Version: 1.0
Message-Id: <20260424-add-thermal-t7-vim4-v5-2-9040ca36afe2@aliel.fr>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=X3csRgyz9ieRxPvJL2SoBHgakr7+scAeWEibnYe+kXA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brCd0fZNZwi+q8dzZhOtRy/DJ7qPfOIAen++aXVtccL
 FX+lHy3o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiI12mG/zXpt8/u22VZKr5b
 8rexQyjDv+62Z1U57G06y8QvcBlLsDAyzFIqWfPjzYvw53d/7uSqeHuXb5f1pLotq9muvjFmdJm
 TzAYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_084737_150501_5740DA6B 
X-CRM114-Status: UNSURE (   8.06  )
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
thermal sensor calibration data through the firmware interface.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
