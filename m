Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A770C00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRhXqBPT4pweP8VW1nOCjQL0B+KvE74+VLrTZ0A7DQY=; b=3AG1ATsO+BBgdW
	XHq21t/dvOVuYyQhGBX50ivMq/Xyv/Qivr2LspQFnNoTt/hZg8jj4CMcmhI9SKnVR3aTop9LYHT/J
	enNynld8jGwOt2JxKpaFVMTKGIRsSL5L19FCLliwtHG0y2vhNQ12/4vlAJYOas0nrBluOLQCpzZrk
	XgGxom7cL64aupkpoLIJbPeBwlqLFjK84lbCQ2Whi3WhMQpxDUgFUH2wkN5hrH/VDsOTATemkr3l3
	i2a4r9YdeRYUbOJkl7Ku6Fz7lbODZ30DiDc8E99jrb2aD3U9dd7QzB8jZMQ6nJgRMknTXUPk5PwTE
	zNCWB98xFEbVKWyNfJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHT96-006ZeS-En; Fri, 29 Jul 2022 16:47:28 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSyK-006SKm-J8; Fri, 29 Jul 2022 16:36:22 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id EA71058094B;
	Fri, 29 Jul 2022 12:36:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112579; x=
	1659119779; bh=we2+5Gor+ytUnMBu5xTu1/9nZ//mY4WLMl0azuUC8IU=; b=t
	bPTTMExsQw9FnJ7cdg0tSKxMS82fZGoc+6CUtoONHdMB/1zWy9k2/vhceC9EhIsO
	Yb34RLL8LfEH4od+r2+GGfc0wivpBWANmIwBor36tVvM1phFj0WBI49eONSf/+LB
	Uz9cVJMs0SRAK8qS05hjwZzPwvv/sJGcOpktEeRLjLULh/wP+cy1nv7qu7Pzdfjv
	aUoMSQ446ns1k6myTDUhzo1MotXt5MJWT3/UNrAAsCB6o1ge/W2wsH+xAkPeIi6l
	xaJdJE4ZUTHyE5ry+/9Doz/TdzThmaXI4zpKnqbSdJJGWJmyBJSvkUqp4XgbYp43
	8J5MnD/JaysgXIrarycVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112579; x=
	1659119779; bh=we2+5Gor+ytUnMBu5xTu1/9nZ//mY4WLMl0azuUC8IU=; b=t
	+vXR9bSbVnww4amDF9/gVST21vjey3iqivWmJjgGd2KKu34U0PL3xnA7IdywGF25
	urgvIdC06v0sz6S6neBHOMXmW5TJnQn1Kc64Pt4QMBBQm7nIZVvNRD5Hx0QKxGk2
	IH0NBCCwrLzF5yyqOxnhE4R1JgEM0ak8MRpDub0CTg+zuwG4DmKvqIxBLR0bsxpZ
	TS/3LlYCCNM46R2LTVHqqmRWmUGvrvSwXa85P4BvcPekKxc99sKclY1m+Kfh5//a
	mZNQU2SxLe7JZdrutqrdVq9A4JK2SgLIrNJLnnUqWVck5HmpBc5Lb9hsk8aHX9bt
	0EXbxB4lvB2lTqDUXRDgQ==
X-ME-Sender: <xms:gwzkYtdmUNQ9HlFAOIdFpEniYQma9GRYco-4afzBNjMAGp-2uqxqkA>
    <xme:gwzkYrMPyyolQPDqqSvtcjy3FtD2s75ph6rcXkxUjczFkX2Whvff0tIX0mxKFbfnP
    BcfmIGVKCALP4XYpjI>
X-ME-Received: <xmr:gwzkYmjZ9FJuPh9BLdTf5p4FxdPtwM75qy_119dG4eIvBvPnMGT8og5AncdUQnrnBpi2jpvH7WaQkm5oJ2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gwzkYm9tVy7St1rxnhy40N4nONHxEpSrEAvKXdeb6wCLgkUU_5qMXg>
    <xmx:gwzkYpsWI6iu6N6XyjPLp6d0KO6P2oy7saaTyFykugoB9gSHy0q8wQ>
    <xmx:gwzkYlF-Ct_WCTG04fn6H7pZ8CnK0ZeEG-sn61DBr-nby9zruyva-A>
    <xmx:gwzkYo-PjIshaMMUhFL1yvzeUrjFTryhV-OQdEsE9LjsYioOjDEOKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:18 -0400 (EDT)
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
Subject: [PATCH v1 15/35] drm/vc4: vec: Remove empty mode_fixup
Date: Fri, 29 Jul 2022 18:34:58 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-15-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=maxime@cerno.tech; h=from:subject:message-id; bh=9K0X2b4CC7vPlBBRjtYOkzUbCYIm/F5a/oUghA5nq0o=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFifHJgR6+cxa2y8n+HKhRTA37+3+55zXtVaOUeHnG9 NuuQjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbCzsnw371n5RZx3cTAVd/mXD6aOP OWm9q8PTXHnwoujn934l7kgf2MDO+ixT26zVIqy0XSMueF/NKaKrn4VVjkTKNsoUg/kXPnbgMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093620_742348_A1C2C4D8 
X-CRM114-Status: UNSURE (   6.85  )
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

The mode_fixup hooks are deprecated, and the behaviour we implement is the
default one anyway. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 457529e5d857..17a6afac61cd 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -483,14 +483,6 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	drm_dev_exit(idx);
 }
 
-
-static bool vc4_vec_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
@@ -518,7 +510,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 	.disable = vc4_vec_encoder_disable,
 	.enable = vc4_vec_encoder_enable,
-	.mode_fixup = vc4_vec_encoder_mode_fixup,
 	.atomic_check = vc4_vec_encoder_atomic_check,
 	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
 };

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
