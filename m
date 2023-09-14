Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B773CA553E
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x1OhJAL60CBsheC45OVgDTgI9aa3EhpJ9qxUtd1vXE4=; b=Rs2FO0IH707CMP
	rIn3TDnjF39BLUxDFuJLSfh0c/drRMOjJ4c2qB28k0Q0fsiAbpsj+3s8M8uQXQjKkZG0BRvTCWMTm
	xxqFukTMITAjF6ljUdCC9gA0F9yEs9D6M+oZ+rwdBqvquXBkywBj4prWx5sVwR3TycJBbYEd7unIT
	aWEc8+OYLntUtojTpdTuDiiFuK65A5ovqQLe08gilzAcKLKqizKd16VO29/DYFrJscDMD/S9Mrs28
	k1luSt20GxVM+eyEqUxeSXhThZy8greCS5JEjrsTq36FukqE3o1qUYaGj64bxzle1eQasgDL4d11B
	bwJaEhLQ+9wRimvYJwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgm8O-008Pvd-2L;
	Thu, 14 Sep 2023 13:11:52 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgm8M-008Pur-1y;
	Thu, 14 Sep 2023 13:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694697110; x=1726233110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9eVtr7Sm2yrP7NrW5lUGQE9mQKVpwxVDMhXgaOG0os0=;
  b=JwLa11H8FkL0Fo83vMdLYJHXWNp6JLZbEz7bsmTBhMWbfeqnbOzHzKd9
   +rh61q+kjlnSYSe1HEsWJyBahZoSBNerlVN99CnzEb/2fwIH1DAC+qY+o
   /2QApKqlK3GeErroW5E5HRpCu58AO6qTolxppEzaMA95qEkp11A2Q8oS+
   IfdoV9RNZVp4Zde4o+kV4Y38pHJThIc+HVB6XTYLk1BFIVbGA/qD5dAcJ
   fSDbnAFtWQD/bIZBfgZ6D/Cxxp0KHmC7j/Ru/CewcPNZtNzKOLWYGk0Nb
   zSuKncC6U9hZFunDRhnIC/wk344Oxy3EESrgYIa9rBR9IGNZgd1F+KtYZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358366687"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="358366687"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859696945"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="859696945"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:10:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Neil Armstrong <narmstrong@baylibre.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Date: Thu, 14 Sep 2023 16:10:15 +0300
Message-Id: <20230914131015.2472029-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_061150_695718_C4E67289 
X-CRM114-Status: UNSURE (   9.71  )
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

The EDID returned by drm_bridge_get_edid() needs to be freed.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v5.17+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

UNTESTED
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 9913971fa5d2..25ea76558690 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 			return;
 
 		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
+
+		kfree(edid);
 	} else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
