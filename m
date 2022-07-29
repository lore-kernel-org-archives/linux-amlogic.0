Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C925C00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftiTU+SMfGg2uHi2Wb9Lgcd+tJ0tZm46IjZPB0GwdpI=; b=WXxETgjVTn/T3Y
	4q8BPLDpulwliVGY0lvB1pJwFdAHX6h2HtmY9aPWVsKwlyaTzoc6D3sxIx1N0RE0ygPJc40znwL41
	2B1R0t3T3Jsao+ZwM+r+/KgIbU5tYPhaYvsdXX9s2mrz46tbgZGK8/GkotQWLqkU9fd/MUX4gquDX
	u8ZTBt5bO6/LwC4zNVlSQg5Xy7EzW3nhDGjaz1t0p2vRtzEnQp1c1hEGY7M6RbStnIjYEoqDLD60I
	2cqg/kuN4JWJ6tf13SV/ZDqSAluqazZ18FcULw79yi4ofA/XoB7Yad+AEo48BWZSwdfNha2gLSG9o
	qEKjk/g/6H+TxZoX1wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTV9-0079yp-Ut; Fri, 29 Jul 2022 17:10:16 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSyl-006SfQ-G5; Fri, 29 Jul 2022 16:36:49 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id BFCA6580980;
	Fri, 29 Jul 2022 12:36:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112606; x=
	1659119806; bh=F/VhzqSdix62l27XLYpBCO7aYppl/5mjESdrPRMdeMc=; b=R
	N2JuGdu18CHIuri+ZEN21A+gOWBanrWJAdBZfy8XN8R4Ow329APiorsMscoXqOQg
	eOE2YsLI6f7o8Gd2BCDy5z91TzE9qYxZEC0TWq0jLGQwoH6RO8LEXykeaf5LQ8e6
	dPLTOimT/CkauHyzo+UQEkPHpVNGSM1C7d7UgqYM1tddzyHWKiORXq8TeC1ctdNG
	+GOvyTLQeBaTu6FTJXzL6wRQVPfWWapk3t9HuiPW8HCqgzYKRcidbeEBgMaXhrEi
	m6tQcF1Rt1+ac7omlnFCBrlnEIWrUQi698cVL822Ax7y5l42VUqo0UjHNX6zoxIv
	5FNPH+uJjI/DfrvzYt+kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112606; x=
	1659119806; bh=F/VhzqSdix62l27XLYpBCO7aYppl/5mjESdrPRMdeMc=; b=z
	4ueLWEyrH7WkXZUGIsik5MVqZNX+2HVLgIAEblLyKPrkk/8wzP8Ku5w0LvClM/Kq
	5S+wwmxEdGspf/YGU4TJfKTFveMCX5mB4ufSiD+Wpg7otR+XedA1arkqjYTnlj7W
	JDOUTaMsbQRzU7rW/hqzvGWmM8k21by6o3iL93GU9ZEv6cv+YKKZShd6ln6YS0tS
	P/rSpkPaPLunXPJd4Hmb6up3wRS2R/Q8ost6sbTFzf5OwyByAeb2TroBUNPFwG+6
	AgyQw6JImeocmGf5Ix4PnJo6Ne/evhdizBRXaQ0GmlbBoIGMTFdwOi5rtxoea70i
	UY7t25eF1qmwCoTJjwZQA==
X-ME-Sender: <xms:ngzkYvafpr2EdemV5seaOhBv1voZ-ojuQIgmyD0TgbLNVMDMr8_k3g>
    <xme:ngzkYuY7Z4ZopYVGu0pD7T86m0z62xW5Q8q4G9sALRVnKP4gU_7nPvvMR14Tfq77V
    0d2Qsxfywzk8BCgM60>
X-ME-Received: <xmr:ngzkYh99LZ0CxrogW1QcL-zgdquM9EvEO5V3J0F57ZpPXdMPtQgFGVpTNqerQzDyx7f8Hy5AFt2z-PsfTAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ngzkYlqMP0q3Hl-LwPjelYRYtk8ORdydMEgkmObcWzyDSwb1aN_IOA>
    <xmx:ngzkYqpiY2DYSm3krmA7k7OcIdQfZAlGeuJKBVq-87yxQLL8M3QdDg>
    <xmx:ngzkYrRalDbhUZcnKZu2hPGQQ7Khdkuo3F297-8eYwT7uuMUxZzNtw>
    <xmx:ngzkYsZaTFUwQuJshpOgn4B7ern2UujR8T4vUOvywhse_np8eQYj_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v1 22/35] drm/vc4: vec: Use TV Reset implementation
Date: Fri, 29 Jul 2022 18:35:05 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-22-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=maxime@cerno.tech; h=from:subject:message-id; bh=2RWnJNFvJqSTsOQ2zvbFCwdfzkNymcZjtNpJxCcBkek=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHyarC6xHSooKXyrvLmvZc77wnv4RNY+P+oe0HQp3XT nRzmdZSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCRGXkM/z0r68NfuC20lF0nu6tr62 opU9NUZQn9E6s7VlXdlDmh7sDwV+T79Zl3dwiu/WWotCiqwO6oxUc+myc2xiVPlzn4/fPWkwcA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093647_664585_D4786073 
X-CRM114-Status: UNSURE (   6.98  )
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

The analog TV properties created by the drm_mode_create_tv_properties() are
not properly initialised at reset. Let's switch our implementation to call
drm_atomic_helper_connector_tv_reset().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index fba15a14787e..6f4536bf537f 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -254,6 +254,12 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
+void vc4_vec_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	drm_atomic_helper_connector_tv_reset(connector);
+}
+
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -274,7 +280,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = vc4_vec_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
