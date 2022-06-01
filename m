Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3100C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jun 2022 03:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyYsyaNCBQCTtn548JZZcfMkjy3F1HmSpstxBnKLAAo=; b=nSkSJxbqkREQNW
	aEhYcFOIp+/LpD7EBGp3Xw0fQISR2rQNAnL6gNPCUzD+MJCUzx69pGIxbTNCr8FJj8+l6TPg7ur4Q
	uoa5QpGFeEp3X6xo/pVrv4d/t2fzQ4WQvTcjQDfI+V13OURXcVGg2EwSlSenWRD0EOOGREPH1jXbS
	hEunS3AvGcSPyxZaLmBCVshTmSo/a3VPAmUfAVDTFlZvI2sAfwbxznFz4SRC9sYThk4scclNlsoUl
	Kg2OuYPafxhdGnddjApeF4MjOO8z6mdzJrfhp05LypnDMyw3ijKGeaUnTrmIt75v+vJP4QaxRNwzh
	NUI2V43CI6T17qLL1oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFDN-00Dgm5-AC; Wed, 01 Jun 2022 03:40:09 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFDC-00Dgfv-90; Wed, 01 Jun 2022 03:39:59 +0000
Received: by mail-pg1-x533.google.com with SMTP id i185so701758pge.4;
        Tue, 31 May 2022 20:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
        b=I7Rwzn599nYSXO0ehdauIMZ913hZwSg4hgdHDi4NFjycN3mkFHslQfzGP5zMCMJhTw
         ZY2WxucR6T2h6FsWNtPsI+jPqEoMN47gW8e61OElRxQgKXqx3TIKQmYq6PR8lQoSH2Gc
         swltfB8cc+I7C5uI3Vnj5qIR8ImmocRWCNiBmmb2YI+E0F0IBalWIZxWH18tHjneVFuI
         bK0s9Zwy2llZfvWj4W35wOZywZ0mnDqhFYdDQqNPc2PmFWMR9DYnqznYEpYgquej7kBX
         5Nntt+BmHjK2A6gqupFV4Tl/IW4m6W8WNyDc3JGafp9DcNENPxWPSX4WRZO7Ynm1K7km
         J6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
        b=NApz7jThspoM7dvofm0ikhjzqYhVVlTNWCQFIMkFPSjIS8aIXY/RBIKzvGZWoVDuxd
         IEo0COtdeKyU1Mk48hq5abedvPzZSDikX7MgbpZZtz278meSe+mHnvjLXciRHgnC40uC
         kDQVVA3/RH2SL4d3PC5UyP2HNM6MIZqmIdm4h1aM+ztkcnAvxruIOkAT4pC8FcKGA2Xw
         YejzOKcg+N8fKbge3FEwR3Vgj7tPtycQKWJv7D1wehm5y+hP2IfD2kPlehkK3BCluxjo
         tmdE/8DDTOEY47yDFtbNXwYv/nz/FTohWIRw9X+nrXrdzlW1u9+LqtKrA/oyHwrlRpDd
         PpoA==
X-Gm-Message-State: AOAM532SAwgXi20l8vqiY+SJktrtSFXJGmY5B+qdyj5NIg5pRDqUda/5
	Tqocb+NsjL+MEeuTGs3BdI4=
X-Google-Smtp-Source: ABdhPJw7vYFqNAuZ0ZS77DemhLpZ6cPkQti7TbLMdDwMmA1GStvhzPaixJeC7e2jd+/eSbyBBi8jlg==
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id s6-20020a056a00194600b004fe309fd612mr65087189pfk.10.1654054796300;
        Tue, 31 May 2022 20:39:56 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 20:39:56 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH v2 1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
Date: Wed,  1 Jun 2022 07:39:26 +0400
Message-Id: <20220601033927.47814-2-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203958_414056_E5CD270A 
X-CRM114-Status: GOOD (  11.03  )
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index fd8db97ba8ba..8110a6e39320 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -238,6 +238,7 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_cvbs->next_bridge) {
 		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
