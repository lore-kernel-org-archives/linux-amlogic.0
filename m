Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B9C00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJL0PT7f5Z7Jm+Vw8ojRm8T9Dqxsnm5KeYuNCaQjCKI=; b=TuLeQa4OnhHXvv
	z82JJ74s+y09p5bSYBwhkiWfbFYLB2uqwl6gJ3Gi+Zxc4pEb0Hge11tMJj1AH2V4Rw9J9HmjP3nAW
	cnLHIxYPajcdL8Ck47NdDG2WfFLFdfcvrJU3Zr72EaUReXe3I+/aadvD0n6Nq1r2tTJUWwQ/PwyjU
	BXGBLPI0FQ4YwfsKch7SPM+vlr5KQTACIhl+Ruvalxm2t8QKnwy7KAtD+pEqvh3/oNzadjtROI1WF
	RHJ83sYVpR9afKpoWeSUn42KH3cVQH2NgKuXv5RanFnd0bGkh/KSky5GGtZuo2gHHFh2Y6VRnzc7k
	1cJoTgGZSlwC0Zx+8fOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHT4r-006Wn4-Pf; Fri, 29 Jul 2022 16:43:05 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSy7-006SB7-2m; Fri, 29 Jul 2022 16:36:08 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6BA35580942;
	Fri, 29 Jul 2022 12:36:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112566; x=
	1659119766; bh=xVYLKG9KFFYmuOaTAKRLm+p8P7z09nrupInjkJzNlvg=; b=p
	eGkvPp9VkszCbBMSvqhe2K521WOU5cEUHToD9XxGzIfDWbJJPr+H6dqaUzk9G1cD
	b+08PM7zxoIsqqCRGLR/+8JyZo7zz6gfIC9xafnA8b43D8b0P676C9/mvdSWwUhs
	aLkF29Fx77MbrU9rlTgCTmKH+1P7yKWYEnn9KVOxM+uGkY2IoDonvMIwEBaP5PDS
	81X3ki1IHhB5/j4yJNDCZkFI1SAiPHDGlhgCy04HWUYpPZI0Dtd/ebYaVH68rnI0
	BPRidxXjFSG8Wr3nj1KBE0j8xzoZ1M/y1EXVAyomt6GrZbNd1edgUKsoibSys3Js
	/tFDmLl6UiTlh5ad5u01g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112566; x=
	1659119766; bh=xVYLKG9KFFYmuOaTAKRLm+p8P7z09nrupInjkJzNlvg=; b=1
	D201QYH+jhj5T7xGEgRqCS2cA0hqz3QnILFtJywMR6tcMSnaMUNqJVTnSMxZqoym
	76NEZOpWqd1ED/RqqPj/570LsmIdurCy5MfUNPPVPscoUNQyKJv9hdsekYMOd7Oo
	EWTMyenmGaPtXNCn7zp4WbNAWijODYgqbyiDOtquvbEkMdrH3thr8Zd7ltQFBo/k
	mKMrTy6nP/ZRA38kysqG8lX2ujjF5UDO1idAZOlO5SWTjcY4E4EyMGBvLzvRwVom
	EM8zVhrXQ5N1/nL0gxSmTtOsKcxmZbYxEcXK5Z+grTPSC0MQ6xkJnsj+h/dlYxIs
	0Pe1Q4po+xlRn9Ggwv+JQ==
X-ME-Sender: <xms:dgzkYk2BMFe6IlW7XEWt9Zd1PCm0fv3U6QdsTSEG0ehKJBRnN4S1hg>
    <xme:dgzkYvFXxPQAhxukA0ojKdCe600G3cDPLeF0OH-NbOAtT1Nb4OIK_htrbd0HdXTNv
    BTCOLeZST4sojAwkKY>
X-ME-Received: <xmr:dgzkYs5PKKYXyOW5OczTsWLN7AD8q3DHaYQdWDtUzy36lnEg2QPaHZmbMbSRLhQhipVd_6UHS6hTzRAygm0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dgzkYt16qHHK42HYu-VGLpBImaQ0ithtjM2up0DB0OuxBKo1y9YZHQ>
    <xmx:dgzkYnGiHunAAId1ZKwS4edR-O2_CtVLKT6FHqk3kcCPEzwkr2Qvog>
    <xmx:dgzkYm9MDwent-LImtPSrE4DwzIN32_CGylVWzo-Pn_KOGDHETcYlw>
    <xmx:dgzkYvUwKZYvB5olNpS7zIbdX2MkPT76qllhGq4ywK7PSVNtfTpQjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:05 -0400 (EDT)
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
Subject: [PATCH v1 11/35] drm/modes: Fill drm_cmdline mode from named modes
Date: Fri, 29 Jul 2022 18:34:54 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-11-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=maxime@cerno.tech; h=from:subject:message-id; bh=NWuztsnfEBMwtrwGZAZ89RBSXbuMUAK6h8TPssl7ueY=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFatr10tcm+HI8krRuTQr8mfAkyKmqcsXSbdwP31w2/ Y08UdpSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCR/YcZGR7ppvMEqYY8j2Pa/WDVgf lCS/ZWCwarVn+adbx93vncny8YGWa5Bx3lusat82xuXLT5NsZ/P2LCRU37244JmZ0wnDn9SBUA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093607_255005_301F2674 
X-CRM114-Status: UNSURE (   9.04  )
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

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 1421e5da49e0..78ea520f2822 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1770,11 +1770,12 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	const struct drm_display_mode *mode;
 };
 
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	{ "NTSC", &drm_mode_480i, },
+	{ "PAL", &drm_mode_576i, },
 };
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
@@ -1792,6 +1793,9 @@ static bool drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->mode->hdisplay;
+		cmdline_mode->yres = mode->mode->vdisplay;
+		cmdline_mode->interlace = !!(mode->mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return true;

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
