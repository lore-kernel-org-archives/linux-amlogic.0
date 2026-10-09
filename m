Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD09ACA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yaVPEPEil/5kGv/oqi8/gE4yPfGff+OJI0K16kz6Uk=; b=iUpKndvFglQqgm
	aAfpjjwKa8+HdD/wsQxd0eDGohoHmnwrs0y+sA9oN8GxypjiO/7uTD1j6Y3O/8H+EbhoXw8Bs6cXW
	0sHNt8DgAt7Oeh0lPer8HwuV5OLX2ag7tL+BAGIBmt+DfNjYmidqoHZmut1zmDc/EujRc5jn6TzeD
	8DP/izpOm0vzpcVRr+s6UwKqgUgvTsCbDqFrtBU+MlHuTsR9fYcJivf5XEcVlBYA+TLHhBCCJAoXi
	BxZZP4ZnoRbd8ibD9+QiLYtQgIa/Fh9D+UL1VxuqeNQXaXm3wKtbFQ71+E4e4w1XH1Vpr8l6EiokP
	sTx1o/B8Ozd038pwPvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17E-00000005K6K-0qs6;
	Fri, 09 Oct 2026 03:17:48 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF17A-00000005K1j-2FYo
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:17:46 +0000
X-QQ-mid: zesmtpip2t1791515830tbb33f0fc
X-QQ-Originating-IP: 1yXzRkYE3qH1UuMYru7LuPsRRvS2YXzC1KUR3SgFG/c=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8012898157940025237
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:54 +0800
Subject: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736; i=sophon@radxa.com;
 h=from:subject:message-id; bh=o0Le8wc2L6kpMkxWzI0bIlS/W7PHaYO3TrOedahZL74=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlYsixe8Y+WokNMp4dagJs8aHzijp/e9a8eDPH/nC
 f/jfs7qKGVhEONikBVTZFGIZ5jLXpl77alYqR7MHFYmkCEMXJwCMBGBNYwME9ZoiBo0c2eWexr8
 m3V7RtAic+bb/Ft+zxTa8Ukk4lnWNob/JdLs53RXbvD1tun/Er28fk0jY7jhpoRN2zfd23XCaeY
 RHgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NFzQ23lyTybaiK9hZ0WYaq+UKfyls87ehAOP2r+4ljpNYyWzvNGHpD3D
	kHtxIY1MdEjK/+YFFt7Px+KRlhupznXb7DbsUYphtpAwwVU0lkCe9uk5lgtudT2W2qbVcqu
	iIFnULX8Zd9sI17oWkGkWUx4fQUX3xgyjWNDUorFe0mRn2NhKisCB1Ql3WfR/LnVB4Z53jC
	BPi23+3mZ9u7pYlr4pOxQTPpDXiGXrLj3sMUxh1lE1Z/NKgtlMsuhMpToFhux6dq7iz+Eut
	fhbFbSmwr8SS/0TcLLQV/k5fRNElBnSij4qO2EjK41Dd/20t4ATdGBw2RG8dRHToJqm7zc7
	WhKQ0/NXVuTXx7m7+5NpdouoTs4Kaa371POZTe/uMHZ76E0xNlW0egfghTkz+N4bSlcg4bM
	NaxtUc3LX+nMTh79XNRCPKGnmDRXZ8HeP0Mp0/JU5T9wMRAzgAawu2aOwlE8GgJTe8Hom1Q
	Y6ChziUHPl4rqlwO7G7w9Y0jSUJgtOz9q/j6kjlQQL4gWc4w8YaNTiiHaODrwAF1bn27k4o
	03jMsCH7y1RQiD3htrRnkv6IMdoyV0KwTMGw6+mbtGkHlbraXwwHChgC6OrIn2YXFiOskZE
	rbML7/MWs3j7guAgyqhq0fbtpRr5zql+pCL3gTclJG+l5lhk5GpVoi+2dqG1PYYbwlLoSXn
	ilhZ8lJXRJkiWeKoTuCU3Y8GIZ38aQZEaCjuaaStvkNIC9RfL1iG73UIYePhCdrxtXcuhjN
	xFuS6Gkl2NkRAqYzTzR0ioOIxLHhgitwX/d1S7c+XqYX9LKxYHp4qY96OSgzgkw7+nCKhck
	boYWZnE+p6745UT66/NnrR0z6MMhaRDFhJYmMn0OKbdIaButWcIYegTg0ISlibtBFVPvIfw
	gp8DvwJ1FBMZNMrVAqFE2E/NBHRsDixVBT4QcJL8WQYw0oLEYZImMiYPY7Tk/6/9iexK95B
	AGcGAW0o2Oz8TGn8YZF5E//7RnTw8QZudhl1KuAaUYRBZo9pAMdsAcTlYLEBYdZO8puubzl
	1dpBB4IzJAvzbpvRwFJxvUN8UWSq0EoBs+zTK6Fg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201744_936603_1EEF4DEA 
X-CRM114-Status: GOOD (  11.17  )
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

The max bpc property can now be attached before connector state exists,
and the atomic state helper restores its default when creating state.
Remove the early state allocation that was only needed to satisfy the
old property attachment requirement in the HDMI connector helper, Meson
and DW HDMI.

Update the HDMI connector tests to check bit-depth defaults after the
normal mode configuration reset, and check that property registration
itself no longer allocates state.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  |  6 ------
 drivers/gpu/drm/drm_connector.c            | 16 ----------------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  6 ------
 drivers/gpu/drm/tests/drm_connector_test.c |  9 +++++++++
 4 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 34c5f583e910..a061a3a23ee5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2601,12 +2601,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	drm_atomic_helper_connector_reset(connector);
-
 	drm_connector_attach_max_bpc_property(connector, 8, 16);
 
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 34c30469f405..2e0dbc58c13b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -614,22 +614,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	if (connector->funcs->atomic_create_state) {
-		struct drm_connector_state *state;
-
-		state = connector->funcs->atomic_create_state(connector);
-		if (IS_ERR(state))
-			return PTR_ERR(state);
-
-		connector->state = state;
-	} else if (connector->funcs->reset) {
-		connector->funcs->reset(connector);
-	}
-
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
 	connector->max_bpc = max_bpc;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0c7a72cb514a..3bfb4f8bec2c 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -439,12 +439,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[display connector bridge]->[display connector]
 	 */
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	drm_atomic_helper_connector_reset(meson_encoder_hdmi->connector);
-
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
 	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
 	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 1174607441b9..af5dda3701cf 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -1036,7 +1036,10 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 8);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 8);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 8);
 
@@ -1077,7 +1080,10 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 10);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 10);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 10);
 
@@ -1118,7 +1124,10 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 12);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 12);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 12);
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
