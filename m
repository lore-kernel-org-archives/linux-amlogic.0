Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CDBC04A68
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQd31ougQjS2gaydepTLYnrvl6nvrcLVOY3hhlgXnIE=; b=15eILFCfjD5vqo
	i5qnusAFNyXzttNC3UzX7ORdO6HWtP7h9SBaQJfVNTxhdf+RDz/C2vqno3HVDwkdu18dXB80ilniZ
	cZCJP2Gs1lV67DIO7PwsPf+UZKdlZPifyrNNuV4I1KgDKrTAt5nt03SG9p3C5YHbPiMdzr7qqj50s
	0afj57SgzQl7MTQxNnZ8WEWjfWalsejOdpfnUJtRSzAu3co3qOcNcsuTGvzNLW2vLAKjBd+82rWmw
	ckKF8XrJKJynfsh+LSjpb05kZP7xVMvvVo7n6Qg8/GewbPGXx+QaYmDHDv6rqs0VSumX2OJrwsUl7
	Rla/4/fJqpMGfAY+e2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTYA-007JKv-Nm; Fri, 29 Jul 2022 17:13:22 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSyw-006Smv-MS; Fri, 29 Jul 2022 16:37:00 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 120AB580987;
	Fri, 29 Jul 2022 12:36:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112618; x=
	1659119818; bh=KPOI4/TXZTWMxLhqbVA9Fbfap16PAXSDXDUftOCVS/Q=; b=Z
	SvEofhte+UnkbZTWldfewQfZE53m3+a+dxFnpzIXi5Qsri/rdiSmWjlXNfX1B6wf
	lQLFNC6aqqLrhAyMbkhjOAXgQbP/zx0DaCcWjkXRj+2324xBf0Zwsn8K81M+VqP7
	KIfLtPfZ+s1pEV9tioIsnSrP73TXhurck5XNJ4OXwC+iQMisiG/dnVCWWtdK+NWS
	SIFr8DoR20UVvyxTedG7cKaDFzvQnlCGd8UW9PAQsGXf+4kurJi7kXs8WK7rdi7j
	lE6vcMsokUH8TWMhIBxBo43CEj/mLnIUr5/WBNnHb5rc7t6uriXQRF+mXNu3GYZc
	NP87o0fX7LAim2cCy88YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112618; x=
	1659119818; bh=KPOI4/TXZTWMxLhqbVA9Fbfap16PAXSDXDUftOCVS/Q=; b=h
	32uz+j2a2L/Huo9mna3KEPDvPLAa3pVj78Ipdn6Gb/NVxBCV+3sv/hcE+8YNcdd5
	U+d5HHhL8Qc6BKKSmpCZZRU+WiC23SFDE8aqti+nNGkkzPY5L/oXeF4olgL1BOFD
	AFZOnZdo+UK1BGms7Har+xAV/roS5bZFl9Jfole3ZlsraAdIfERIlxHiPavOWdI8
	wy9P5j412Ct+bKyDWzIvo/q/BCWGxAj/Gt8vII5f9xvv2dBgu1f8CFtxmIFpJ2+c
	FeBWHFoISHNm2sAC1JkqKTkjonAne6A2l0SOoGj0FRewfBOTg/o0e29M0Di4Vwrb
	VFAmhpLUwwoLDKZ6o9e4g==
X-ME-Sender: <xms:qQzkYpzloqQfoT_acDyNQtwnAChbN30XjkWGJKF0rwlRCFp0HdK3Ew>
    <xme:qQzkYpQHbK8oAtnqCw-8NzhqJfrj5D1cwHuQ3YdKdX22Z17aH68p3hIkUzbQE5jHZ
    rLOyL8HDp1vfKkc5To>
X-ME-Received: <xmr:qQzkYjWKngt5fDyW7s9sj6tqE6yR8JMmobF7JB4ygevesrsIl5QrP40yCf7cPe0EVVLRM0qioQ1GhYv0Uqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qQzkYrjiawb3_zSB04cqWyXGMTtPgHxCxfS74cg1CMsHespIBFuWWA>
    <xmx:qQzkYrCchHeEeb-4Olku7epOZ27yxBCD1LzLXXZFhsz_X4D9Oj6LSw>
    <xmx:qQzkYkJzY5vPvIpMHGtch6z4FRbNG59Gwz0rZBJzjTQIwDvfzd9EcQ>
    <xmx:qgzkYtyqp0pqKektVuKakc57RnaxNqFRSl46UC4jHpEFywzrnkWIaw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:56 -0400 (EDT)
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
Subject: [PATCH v1 25/35] drm/sun4i: tv: Remove unused mode_valid
Date: Fri, 29 Jul 2022 18:35:08 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-25-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=maxime@cerno.tech; h=from:subject:message-id; bh=Z/IvtOhxkP1S2d5G4fie4sSqHzE+LzlsmSMCeFD/rMo=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFavOB2svwPZSF582fnpi7503Rwfds+16buhsA+uX/x 1x96dJSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCRA2GMDLffJF6ofa74ccbHIPejZq 4lLZs7Cnavy288/6lQk/nmoxMM/ytPa7zaWqP1ITPg1oMlk69OuH5ksmyLpmqEf6nGHRG7vscA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093658_841764_135A3AED 
X-CRM114-Status: UNSURE (   6.23  )
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

The mode_valid implementation is pretty much a nop, let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 94883abe0dfd..53152d77c392 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -497,16 +497,8 @@ static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
 	return i;
 }
 
-static int sun4i_tv_comp_mode_valid(struct drm_connector *connector,
-				    struct drm_display_mode *mode)
-{
-	/* TODO */
-	return MODE_OK;
-}
-
 static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_funcs = {
 	.get_modes	= sun4i_tv_comp_get_modes,
-	.mode_valid	= sun4i_tv_comp_mode_valid,
 };
 
 static void

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
