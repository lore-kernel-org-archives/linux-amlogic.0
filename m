Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B1C04A68
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=317Fw1YkTicOZG3qIzJJXYMvlb1QjcQ04yWNNAAvwjM=; b=TnzFv/ITA7M2Ir
	o/a29GpcabJ026FRt7oYACCVMi4PFw0TsS7BqxXgoCWOV0/cYMBCx+LJtIj8CnGccE8rRjc2dfHAS
	Tjd2czI1EzI5WTSaEhgQTLcju/mRSpmWN0bklakIzbmAc1CSRQ5bEK4TXlskopOpMcvZZI31SuV7d
	Cx1Iwf1MhOR6DaY9Vze3zTR4d8H7nTSbEvIwmTui7xJ0e8cS1bJi5LsLhDy2ouOUqha4H6eTpJJVO
	zK6pcUW36WTdoVWkCN0QWCA6mdsgTpo6kDcVvaItCYJEORGNj5b9oKsmReHE9jNk8iw/qQ5rB9DTg
	SOU3e7K+Adlhj6RKlRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHT4G-006WKt-0H; Fri, 29 Jul 2022 16:42:28 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSy4-006S8h-AB; Fri, 29 Jul 2022 16:36:05 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 92AB1580940;
	Fri, 29 Jul 2022 12:36:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112563; x=
	1659119763; bh=e8w96O80jWmpbrCBw3kEkho0/4LLDZdkQsICNURykFA=; b=Q
	nXF2tg/gQ3dK6BjE4qA2oH11e4jGyvmEpFUrjG5UdYRskaBHQFrJKfIvuePSNcTe
	a5Pshnm2g9vxd1lUmWYK9xh58xFgOzqiQvoVB4lcbJy++00kxdbuNVCM+BAdlDUt
	0t6mZLuYplbVVk3Koif/MQAwjhFH6J0OzCepa9iz59aU4t/FeNppHIwrbxhdrh38
	Yxn5wJh+a0vlMsXK18U0zpo0aogCW2C/H7VnrD2OOgfhNtuB5mF9zkne5Tj2pJ6G
	Sm4ohwmmyHVPAg5NXRe/XuVgrexFasfjDdkP5wV52mkAOF3xClomdDo3zyqWUXW6
	yz/RRQ/tKzbCMxk5dHvWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112563; x=
	1659119763; bh=e8w96O80jWmpbrCBw3kEkho0/4LLDZdkQsICNURykFA=; b=F
	tWdbMbwd8gGLz7Pgfb8eYqdd73EAP0ttC5XD+SSbs2AVxnza5/jbd4e0JD+OrZpM
	6d3wubHYvGeqJjfI3rvCDI4rpO/e5zvX3888iAaY+UgsWStaTdjX3v0u7aLWPCIw
	0mfBcd9fHF08UeFnzWntUeRTng0wwfDjnqDpL2uc67GUe6IW5Qm90Mgu/CzfPhSa
	JFmlKqZjAPFXxssHue06CCjoLqyskdcpGGqDsAf7DDrmUYWRCgsAKj5YlKxrOnBf
	gg2KN7Hg30Ivf4Fm/LqzlQSDg1AXg6qDfVdyS0mFcIBS9/qiS9oYzq6s5OUxrU2x
	GGoZHOQaHUL0etfAa5eHw==
X-ME-Sender: <xms:cwzkYtUh_sucbcxeqmDTCbveRxbhJiOfj0aR61JInJ25lBDMyVAqXA>
    <xme:cwzkYtnh61u867QSxzM8DXGZBSRET4ersZWUKzxG_uXzOiJ8iBbF46ch7Tbe19__1
    uVQoro0PFWpADqFbjE>
X-ME-Received: <xmr:cwzkYpZ3xGnobEdUAQOyEb6ht31Pnb6XCpUZ85Z_CzE12w49Om5EMqRlVbSAULZHAjbIqbaTVdvEyXQUPdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cwzkYgUbQyNxw6siDLaaM45nVkv8G5hbhjHp1iJlkl5__ZcNNt99Aw>
    <xmx:cwzkYnnDuMjedRRcg0CJz-gu6pUvWu1130Omvd-sR97XsccAFGyhIw>
    <xmx:cwzkYteMvBhHPqKqRpZ0BtIXuowijmNEjUVZ-HeDnD_epkXOjU6DDw>
    <xmx:cwzkYr3cHP82AOz0OVoZp4DeNyzw-4dzH37RimerQgGDkVHpSFpTDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:02 -0400 (EDT)
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
Subject: [PATCH v1 10/35] drm/modes: Switch to named mode descriptors
Date: Fri, 29 Jul 2022 18:34:53 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-10-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=maxime@cerno.tech; h=from:subject:message-id; bh=7XZdQfRWjHdAHz8+TLk9cQGA52WaqvFzAKH3QklOSko=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFScrT42N+ncm6dRG94xZ5Me7OwhzZJ3uduiUSph7zS FNrfUcrCIMzBICumyHJd8K0dX1iUWwTPh80wc1iZQIYwcHEKwET8PzIy/GypzfGVftPbOW3Z8+bNm4 s1J13O9fNZefvp8qvRub139RgZ9tawG7J2PrtYzTrV0V5P5+EP3t/LPx4oZ6g48b7oybecVQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093604_475047_A55F9157 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index e85099df0326..1421e5da49e0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1768,9 +1768,13 @@ static int drm_mode_parse_cmdline_options(const char *str,
 	return 0;
 }
 
-static const char * const drm_named_modes_whitelist[] = {
-	"NTSC",
-	"PAL",
+struct drm_named_mode {
+	const char *name;
+};
+
+static const struct drm_named_mode drm_named_modes[] = {
+	{ "NTSC", },
+	{ "PAL", },
 };
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
@@ -1779,14 +1783,15 @@ static bool drm_mode_parse_cmdline_named_mode(const char *name,
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
+		const struct drm_named_mode *mode = &drm_named_modes[i];
 		int ret;
 
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		ret = str_has_prefix(name, mode->name);
 		if (ret != name_end)
 			continue;
 
-		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
+		strcpy(cmdline_mode->name, mode->name);
 		cmdline_mode->specified = true;
 
 		return true;

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
