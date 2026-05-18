Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B29CD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEktU3E/VB6WpNFXlCxrIbW7PDkpprzaorimbReNohQ=; b=Htw4muAN7DNJ00
	fmdc4LzIBj3gKcEK00yPgH9Ao8JmEFRRE5qmHbEJpMMrHSkPjkzEuLlxbVAKiD9+RhFStvZUxBuhA
	qTY8fg+S0UNCITd4NwEtExamSNKyaFWp3eQ3n7Tuq7NCDKXfOi/6BemAoSzvHKvkpGxT8Zzy/CR8y
	12AClvGT1LFwhfdzvgR5PEbybJPdOywGcixBivatfKvi7A5TULOHBq00V7MWcvuaPamrboCH1gIaa
	9jwMS3QHaMiEjs78gVRFJk5PQmfLu8tFGtomvKyGSkSneNawEU1VJN2I869ZgX0dgd5yUd1pSGPmw
	fIdRtjf8rtuWLnLckmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IV-0000000GScp-3L23;
	Mon, 18 May 2026 18:02:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IT-0000000GSbH-2Fej
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127353; bh=RDtWO1bQ5DXpi9puwzpO7ZNdN3UnLZgsoflq5+aG8Jc=;
 b=dCTYDDf2ofYO5fWowNGUXXUoJJBmT/6fRVZfzT5nAjO0Gr54QWowExxWo/skknj0qxpvNHiIi
 9Rv1pse4Nl4bDoYjCJ237SOn4YFqAMLAlkPgCjaqaNtqkMFDGt1yp2bo9R7FvscOQU4SqWxZDWL
 C7PdU4AYbKCJyb9tf07D8jeI1w0mHTEL/lAqkrR21h+2RQscTgCoQs0V8/YVX8wwWgbsqocikMP
 H3RgNKg393XqeMEUhO6FFoLDv4gnFTRnwUb4yd/NNGO2tNuZMVY9vVsKCC/CyrdPzI4IdnOLDRa
 C2Sy4ux8nzPwlxbcRRFhRktBiULNH+axGlumC5EpcMuQ==
X-Forward-Email-ID: 6a0b5432b84dbc72d2274de5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hans Verkuil <hverkuil@kernel.org>,
	Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC adapter is unregistered
Date: Mon, 18 May 2026 18:01:39 +0000
Message-ID: <20260518180206.2480119-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110233_661736_7BB42F51 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The interrupt allocated with devm_request_threaded_irq() can be
use-after-free when the devres release action try to free_irq().

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq during unbind:

Call trace:
  [...]
  dw_hdmi_cec_hardirq+0x4cc/0x560
  free_irq+0x48c/0x7e4
  devm_irq_release+0x54/0x90
  dr_node_release+0x38/0x5c
  release_nodes+0xac/0x130
  devres_release_all+0xf4/0x1b0
  device_unbind_cleanup+0x28/0x1f8
  device_release_driver_internal+0x358/0x470
  device_release_driver+0x18/0x24
  bus_remove_device+0x33c/0x4f0
  device_del+0x2d8/0x790
  platform_device_del+0x34/0x1e0
  platform_device_unregister+0x14/0x3c
  dw_hdmi_remove+0x74/0x180
  [...]

Freed by:
  [...]
  kfree+0x1dc/0x5dc
  cec_delete_adapter+0xd4/0x118
  cec_devnode_release+0xa4/0xe0
  device_release+0xa0/0x200
  kobject_put+0x14c/0x26c
  put_device+0x14/0x30
  cec_unregister_adapter+0x20c/0x280
  dw_hdmi_cec_remove+0x8c/0xd0
  [...]

Explicitly devm_free_irq() before the CEC adapter is unregistered to
fix this possible use-after-free issue.

Fixes: a616e63c56ef ("drm/bridge: dw-hdmi: add cec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: New patch

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq when,
  echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
on a Rockchip RK3566 device prior to this fix.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 9549dabde941..67a2a242d3ca 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -309,6 +309,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
+	devm_free_irq(&pdev->dev, cec->irq, cec->adap);
 	cec_unregister_adapter(cec->adap);
 }
 
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
