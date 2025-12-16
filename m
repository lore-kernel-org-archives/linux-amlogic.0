Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CFCD609DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vi7vQrsFxPrP9AFkWgpTKiUpW9L58i724h6kI5+0Wik=; b=MWVSW2kn8z7CHa
	Opt2O9RuyFKDeTnxyQL2KY8KBT8MRCUIyxQyuwQ5n/GIZg96nNjl8L60aAhzbgvaqbdfS+0XQLx0t
	fpzxehRFqmstf+8wZ7P4+Z49efFohMteQOjESZT0nCBs6Bhz/DshTjC/gA48lMpkwfEE99qJaKvrk
	0Yfr83082J0Kx33ZSHlV1mr3YMmXujZCWm9Om01O1ZuLWXr9AIQYDlY63aImD2CkGjZN7WJHGeP7p
	MOTTxWkoSmzseZbJnI8QHu0HVXROiRwHwaWnMVFHW3umEapl/e+b4wlpObzkXyAzAEXrWoMetOtzQ
	RnDQ4A+911GsROfwjxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKd-00000005dgZ-1G4x;
	Tue, 16 Dec 2025 17:59:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKa-00000005dec-1zsr;
	Tue, 16 Dec 2025 17:59:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0F4A4E41C34;
	Tue, 16 Dec 2025 17:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4DB96071C;
	Tue, 16 Dec 2025 17:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3960119A97DA;
	Tue, 16 Dec 2025 18:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UIaP6MBQMsmgUd6KNZ2JPVRiNKPK9KzdPCLhOdPMcsc=;
	b=mglTxps3VJvXj01Xn7Z00ZX0+ktA34Ri+t6nmNLd/3pITvNRyM2H/5RiysX8I77F3lLpN8
	AstjDTu2JwLLib5j4sD6E7pYv2UGa8HPSDCuoBOrG/i/9fLQRpDhPSif1bymWPuuL6skmV
	ynBNBz/CXdF5xPqsPk0X7uYomHtPfomqWUrDpD5vzAOLEE8KvwBiPE+xCltUVLwddBUy34
	LjxTLWBJME10BIamkSfhhM+3SEhA7GouaJXUzwl18J6HUgok0zSrInl2eMEw4ezyINXaz8
	svIOTGNxO1tCzUHICkfGkwhGHVn5mU4ZpW9+IhexxkeiZGezzMMXyzNrYh3Jig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:34 +0100
Subject: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
MIME-Version: 1.0
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_095928_657399_E5A5E0E3 
X-CRM114-Status: GOOD (  14.71  )
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

of_drm_find_bridge() does not increment the refcount for the returned
bridge, but that is required now. However converting it and all its users
is not realistically doable at once given the large amount of (direct and
indirect) callers and the complexity of some.

Solve this issue by creating a new of_drm_find_and_get_bridge() function
that is identical to of_drm_find_bridge() except also it takes a
reference. Then of_drm_find_bridge() will be deprecated to be eventually
removed.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- rename to of_drm_find_and_get_bridge()

Changes in v2:
- fix "mutex_unlock() before drm_bridge_get()", and use scoped_guard() to
  do it cleaning instead of complicating code
- rename to of_drm_get_bridge()

Note: a simple implementation would just be
  { return drm_bridge_get(of_drm_find_bridge(np)); }
but it would release the mutex before getting the reference, so it is
not safe. Make things simple by duplicating the code. A later patch will
make instead the (to be deprecated) of_drm_find_bridge() become a wrapper
of the new of_drm_get_bridge()
---
 drivers/gpu/drm/drm_bridge.c | 25 +++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index db40c26d1cb3..0dbc8b59c3be 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1479,6 +1479,31 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
 #ifdef CONFIG_OF
+/**
+ * of_drm_find_and_get_bridge - find the bridge corresponding to the device
+ *                              node in the global bridge list
+ * @np: device node
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * RETURNS:
+ * drm_bridge control struct on success, NULL on failure
+ */
+struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+{
+	struct drm_bridge *bridge;
+
+	scoped_guard(mutex, &bridge_lock) {
+		list_for_each_entry(bridge, &bridge_list, list)
+			if (bridge->of_node == np)
+				return drm_bridge_get(bridge);
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(of_drm_find_and_get_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d2683846cc61..8f10d2fd6016 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1325,8 +1325,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      enum drm_bridge_attach_flags flags);
 
 #ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
+static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
