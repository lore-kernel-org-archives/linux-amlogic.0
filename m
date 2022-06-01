Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jun 2022 03:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DrFUaRPZlut6cCorg8j538Mx9NV+baYmcSqcO7HOwvE=; b=fwwOTlq5jzyMRy
	81A3qF5ITRTl/8X7xdGyE9nsWiWWuO0TaKaaCMPUQ/FQOt2kiBX87w9v3HfwbLIJA1cvfsSKYeU5s
	aXyop87nbssyMgTfPW7vNHeGlkOgg309zwJcOFymJZwH7JIIW/fdW6/xDsRGy1oKbeAXLdohhbCPW
	WX3rn3sSAO9v3zuCu3v7ah0RzMdbWFm/JJYtS6nq+PNT4JaSvG9AuWMHvW1aqMmOAgIKgW6rIVdag
	c+zFtc0SVnkp3qTklhb4HHmLPjOOrpSdO31SBzBr335o6iXfC8qMAt2Sn4E+HnM7bxA0H1wCxTgMr
	aBn/uN3w91wM5XkYzqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFD3-00DgcE-N7; Wed, 01 Jun 2022 03:39:49 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFD0-00DgZT-Po; Wed, 01 Jun 2022 03:39:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d12-20020a17090abf8c00b001e2eb431ce4so828002pjs.1;
        Tue, 31 May 2022 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BPt4dtaBXbbIz680GXjnifuabCoTnOqD29Zad6avBJU=;
        b=nw+3kMrrmiyzaKACHZawVtj2we71BB5rDBesnCh9NO42UAU718xHv+4OYahFJFuudK
         XcOIvtvKkfOQRmKQbxLr3rpnJupgBTVZVE0UORaYwSPeVqlZq9GYTT6Q/lX/oz9rHd2o
         /DESQ/UO2QFTUZm6469k5wjrjP+S2uB6joXn+Zls/op8LrYiLuOjwbsT2uOyRunC+A+2
         52j7OHCnkYe+FzrnjQvhkTSrJv7cPASgbNAdiLyczJegw1in7RVxFRV+7BwE9A4KT6gp
         FDR0Ucl3BNIj+Flg8wlS4WzhO678o9gmW8MJqi41oB3mIz5HW8/B0peaR4pBwmmuHE4R
         yyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BPt4dtaBXbbIz680GXjnifuabCoTnOqD29Zad6avBJU=;
        b=hMGnij8ilJJORHKPHHqaLvwL6jI9tEF71X8vV6xSZVZJwPgMT9m3maUdwBLvBmV/FC
         e3xU0pxta916qTJtg7BWa1UOiA/oLRIzazhQcnyhyHxjrk9NwY1gV188GI7zkCNi3pTk
         0/DvEDM/yoEohgKSVxuvGsjurmH/vg0xX1N4aY+eL3cnh95xEWgeJftwNYzdoqCuiKc9
         Z9m2vt7zKqscjY0o3GNh0CHIO5JAdrfOm4a09bJXmpj5Da785hwFffBAqsP1BvGu0c4M
         RHF5bEKEC00IdxGMfGtgCsBRCEaAsDhR5b76VTYgG29oeSS/jYO14LmZ/JVRHidf3C/4
         tuZQ==
X-Gm-Message-State: AOAM532bm/d8aAwmN+qgcLn5LvNEDa2CkEigwsSgp9EeWOGd0lwjRbkP
	etqDgK+KkSk+ZtXwE5u9Ngb2wsr2TYsGTwGj
X-Google-Smtp-Source: ABdhPJxer3AeLgoZLp4VQP+/nNyqbXOlRUDTKhy9HqMSwV7nbJJY3xIQCZ34bWrRjeUsoLJRduE3bg==
X-Received: by 2002:a17:90a:ab90:b0:1da:375f:2f44 with SMTP id n16-20020a17090aab9000b001da375f2f44mr31928040pjq.33.1654054783864;
        Tue, 31 May 2022 20:39:43 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 20:39:43 -0700 (PDT)
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
Subject: [PATCH v2 0/2] drm/meson: Fix refcount leak
Date: Wed,  1 Jun 2022 07:39:25 +0400
Message-Id: <20220601033927.47814-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203946_865451_E2BBA917 
X-CRM114-Status: UNSURE (   8.86  )
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

The following patchset fix two refcount leak bugs.
The cause of the bugs are missing of_node_put() 
after of_graph_get_remote_node().

changes in v2:
- patch#2:Fixed patch in meson_encoder_hdmi_init, call of_node_put() 
  after of_find_device_by_node() and error paths before that. 
  noted by Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(patch#1: no changes since v1)

v1 link:
patch#1: https://lore.kernel.org/r/20220531144818.26943-1-linmq006@gmail.com/ 
patch#2: https://lore.kernel.org/r/20220531144818.26943-2-linmq006@gmail.com/


Miaoqian Lin (2):
  drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
  drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init

 drivers/gpu/drm/meson/meson_encoder_cvbs.c |  1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
