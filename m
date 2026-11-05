Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAD606A329
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NON62bQ8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A8NQJhwC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tz0TufJ3/A6on+lAVsf715wg+BWwik9NUYpsQMQVSFg=; b=NON62bQ8jhRmAuPybpzCknDDyo
	nBA5MIaYUg6+oPBUhEUWarvqGGSXcDc5Cyag50isflfEf+ql7VwYvPyLxm+r9S0yVwVWp6y2E34aW
	JBIbDrQcVXC7TxBdwefXJ5I7pdxcZB7LdCw/aBZbf4/0l/YVzl7c+ChyDGDo087eXLNzy6wI5f5+x
	m0NHTXW+rfSq75jx8itMVOhmiJP7nu4traJ040R1u28m+2bH+3g/hMl222MKtQ1Nve1KWeQQxI4xK
	iTssSEeeAiNOiqV/Afo/ucb8voHvqy42hT57y29s4IInO9fQEsjXADN8ECODrC46DcuhHHtrd1fW7
	b0lZWIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy9s-00000009DRN-1jwE;
	Thu, 05 Nov 2026 14:09:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy9r-00000009DRA-1vKt
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 14:09:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E18BF40DA8;
	Thu,  5 Nov 2026 14:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DB91F00919;
	Thu,  5 Nov 2026 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887778;
	bh=Vhrzh9uVSsxK/QEM0A/OExVSfLi+mHZOJUJOKuzlAJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A8NQJhwCx3kCKUvN5VWmwIHx/2Axr1hmSWje+o1GO4Q7yxdRU410YoezdRHkLCNiK
	 ojsaqxfvDsLMjkqiAN53r6p07D2Nf0/MAgzKkLsbBht1gdVzm9YrSxS11oNxumMT7e
	 GGtd4EUx9c3k/ELnPDXpwkqFjb5gMIgMwPi5NrGumfbEv83xp0ik/x0uCMQb0y8+pj
	 4AmjZKbTkSgCTCa6R5evSLAKdCS6FRcptTNS7+5fMe+nXm07+IiyYV6m9T1ZI+d9Kc
	 2/ORP/rNlkvnFhmvxJQOOnYHx5V/sieAVZd2S3+T2q4bUegPATlgEzvALCYvQxZKzj
	 NhOFHxK3z17Bw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:43 +0100
Subject: [PATCH 26/83] drm/meson: Switch to
 drm_mode_config_create_initial_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-drm-no-more-config-reset-v1-26-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Kd0V2S7TqFaJ/xhzHTLla+COz/NLMYco+UxWD75X7Kg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvepfPLLP6np1zizl3+c+eTZyztLb9vCe5PTM2OcY7S
 SRLbEFQx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgI+07GOgPDA9I9u3LzVFR3
 XvNru1VsWPnpEqfB84amzdWBBeynHPf+v71I7JfmpjmcGj17rfhfMDY8/tQRmXfrnPSibXNqyvV
 0ONhaPj06IcG/NlEjKd19cllvgu/uKTzHH2Vwhf4yYOyLWgMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..dda2dc2d5b00 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -345,5 +345,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto uninstall_irq;
 
 	drm_kms_helper_poll_init(drm);

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
