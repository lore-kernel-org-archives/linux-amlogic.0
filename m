Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20564C04A68
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXKQZWG320cF2p30M09JI4gq3Wj5tIo4Ioa0nodYUOQ=; b=b+C/KqdQyit/MN
	HDuhqJK0k/HAqqZ7Ck52OTt8eQVY58dHiKKFnuhFh70ee1JRMxywxVIuqb+wMqFGyZDFWJtOqh3+c
	QvR1kLpjYW/G0dOTMyUsuhKHo8Wcx5OvrOmINvJsP91DKyPa7GEVhQ1i6D4AFyepd5bDJ9yhP/iXw
	oREmGtWJOIKfLduBbPcDBGTNXPhhR6BBClq8tvRjFyim7WXpfiY6v+ITx+WjRbPqqht/CpsWLT3AB
	vGCtRla3zUvMRFx5kASzF4h8wYFeguml/M7mFHdDB6pJrl29muJ+2q6Pfpnb1/undSRgUBgIdxjae
	elS7ALpGIyLdnjs6crXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSzt-006TQb-GU; Fri, 29 Jul 2022 16:37:57 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSxh-006Rrm-Dc; Fri, 29 Jul 2022 16:35:42 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id A5FB658091F;
	Fri, 29 Jul 2022 12:35:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112540; x=
	1659119740; bh=j2oN+GXdkaZKd3o9mBAYJ/85uienfqE6K5CTaBOuI8I=; b=Y
	uDdcpoN+NNm9rJzGhUlQ9htEo/iUG/MUqPD+9iq3d8rV6jbvyokS/bUVuZzy+JUu
	aKpJzgSVu6NkxHWg02eiP6cl+zOi4FCzY4XdRlUeeK2qKadxH8qJvfY6YhSxhzhB
	VkwbCSHWHDwMIuNKXjwcEsKS6uapvqFbyfpXqgWNT8tSvoFmKxDFJqf+annp9H/E
	tTbdVQTJAKobakJw2XfhcEiCuTc0OYUeOHU8aZQeWyzJ6nPRYzObYrkwpNhUMcs1
	Ne+cj3JAo72TkN+fTBIaC+64XRzdxJfiUiILg/+S9mFzAb5zRDziHHpv60Lypvi/
	Hvcfz7a8Q9J73bOVvdyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112540; x=
	1659119740; bh=j2oN+GXdkaZKd3o9mBAYJ/85uienfqE6K5CTaBOuI8I=; b=f
	98hODY+HQOdrhBVwOYfVPf24oCS0yGNRjoXi7m0lW/nYX3tR7aPTcZ4KrTaQRgg+
	7eX36GCEJTedVkzXNfu93SrCeOqmezMQkxQYGbBw6HMCceg46MPb2KrHDuSV3ef6
	fnPayt3TQha4+x2LCgMqI9fVnfz7yz8a3tWCGA2486pmEiJkrZ03t6on7UFPLvwE
	EAjz6OKu4VX7Plpi81ShrDGwgpcDFUi5lyxgTPS0qRqFx2QTHO6NtGVH3oSCXOmN
	eQZ4ETCmq7wJrsfssSPfHb3zPmQAnDtJUveF5bzdndsGS6xZ2vZ3LpIEuLOF5pwb
	WWcE1CFZLHJ/3MMn2iDTA==
X-ME-Sender: <xms:XAzkYpxSx2gV9p6OGGIerrm6z0x6joeTrAhelYRYW9u4JG-bG_fpxQ>
    <xme:XAzkYpRw3Gh7r70iJDKgtizmuubcJY5e7c7YTXcjNvfYZrKQuqNHMg4wuvXBsN6ge
    0Lot8o2rVCZEUQ0aLU>
X-ME-Received: <xmr:XAzkYjU_0cpjqhzXmX3i9vxcTxd2qIyq3khlL-dIp5ZYwqHRDhXg9GstzYd12pCkDFpmrNOatwkD360riQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XAzkYrjzoNkI__YNddJVxqWo3k-IMyh9133Dhc6b2oMalThJNvcwPg>
    <xmx:XAzkYrDZYr77YgOG66NepjYQuhC02vDHCvK0KHzM7wkZgbzgu_nG4w>
    <xmx:XAzkYkJs0a5gsNCSC2qZo6CcVnjeImpMsfuEWxpf7YekPmvoCGC4CA>
    <xmx:XAzkYtzfWCoG1npa1YeNyeRirqhaphEL2V68214G2dmQNXoyQrTQdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:39 -0400 (EDT)
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
Subject: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to get/set_property
Date: Fri, 29 Jul 2022 18:34:46 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=maxime@cerno.tech; h=from:subject:message-id; bh=506g4JCkQGu737Vb71VZVRDOM3FvouVx6ntNTaK1n9A=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VEqVtjOy2b+/MCVffevbd5Z+PDswS/Seqe6+77YzX8s 5mv5paOUhUGYg0FWTJHluuBbO76wKLcIng+bYeawMoEMYeDiFICJvNzH8E9/hWF7eAGLsNc3+Q0tmt 2/7KWdzD2WVKU8NSxtC3185hcjw/Qpx5/6tf04Ky/2mP8Kn+/71w9P6Lnujnj+ZEfO9OtJd7wA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093541_562648_7E1D454E 
X-CRM114-Status: UNSURE (   7.34  )
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

The subconnector property was created by drm_mode_create_tv_properties(),
but wasn't exposed to the userspace through the generic
atomic_get/set_property implementation, and wasn't stored in any generic
state structure.

Let's solve this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c74c78a28171..c06d0639d552 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -688,6 +688,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		return -EINVAL;
 	} else if (property == config->tv_select_subconnector_property) {
 		state->tv.select_subconnector = val;
+	} else if (property == config->tv_subconnector_property) {
+		state->tv.subconnector = val;
 	} else if (property == config->tv_left_margin_property) {
 		state->tv.margins.left = val;
 	} else if (property == config->tv_right_margin_property) {
@@ -796,6 +798,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 			*val = connector->dpms;
 	} else if (property == config->tv_select_subconnector_property) {
 		*val = state->tv.select_subconnector;
+	} else if (property == config->tv_subconnector_property) {
+		*val = state->tv.subconnector;
 	} else if (property == config->tv_left_margin_property) {
 		*val = state->tv.margins.left;
 	} else if (property == config->tv_right_margin_property) {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f8091edf9a33..1e9996b33cc8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -672,6 +672,7 @@ struct drm_connector_tv_margins {
 /**
  * struct drm_tv_connector_state - TV connector related states
  * @select_subconnector: selected subconnector
+ * @subconnector: detected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent
@@ -683,6 +684,7 @@ struct drm_connector_tv_margins {
  */
 struct drm_tv_connector_state {
 	enum drm_mode_subconnector select_subconnector;
+	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
