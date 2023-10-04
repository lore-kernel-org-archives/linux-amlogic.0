Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0319E7C4E5
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uOcWsXuu9AgGn0fpNdw3cCbUtNC8uWoscLygJLebhfo=; b=Vk9QCaa5DMw3Nv
	0xhI5fIdaE7ITqWb6PI5Z3hhs/IVr8cTDPM2e3o1msnNZRVKvhw5vtc2JIYmEkSnheroD5HN+0wz0
	MJq1JUEGCPbxBjZoiUc9XqSG/bRpSUUBta1gqvebmY6v80NduB+/cA2v1nte+KEGoEAR/8jqSr06H
	2hISuLZesli5SEVRkRcnioCUotlhzJEH4h5VS0894cAczBIWmXWvok9bx6WD7kpFEDIpIrnnUpUBy
	mpwDcvTBEn1CREqCUwXuTBzW9NsT8iXRpJTRtd3KRloG+do3Jqz9bzv2z/wsvuUDzHZtUXjdrVlIA
	H+F/+NL3ycvzd9g0CaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Iw-000YIK-2D;
	Wed, 04 Oct 2023 17:04:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Iu-000YHS-0f;
	Wed, 04 Oct 2023 17:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A6855B81C0D;
	Wed,  4 Oct 2023 17:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C99C433C7;
	Wed,  4 Oct 2023 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696439094;
	bh=Yzyl+TEYR2oYskXP24fXoVSAOYCviqn/Mu4EnfT7UOw=;
	h=Subject:To:Cc:From:Date:From;
	b=gRFO5ksSXS0ZyF24WTqtrC9j+4tsu+gOYyhs2szJDt/+ru03zoUjcZNYA8s9rvOKL
	 LQhjihWc73FriinR5IxT58lycaqLFH02tHNJoyZ2cCGzKCyvVRSHQI7yVmBzO4sTP9
	 rNRDXxNM9FYMxUmUcpugqFHq2k/XuaF+Qx1ZkthY=
Subject: Patch "drm/meson: fix memory leak on ->hpd_notify callback" has been added to the 6.1-stable tree
To: dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,jani.nikula@intel.com,jbrunet@baylibre.com,khilman@baylibre.com,linux-amlogic@lists.infradead.org,linux-arm-kernel@lists.infradead.org,martin.blumenstingl@googlemail.com,narmstrong@baylibre.com,neil.armstrong@linaro.org,sam@ravnborg.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 04 Oct 2023 19:04:13 +0200
Message-ID: <2023100412-stooge-serving-4094@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_100456_379664_D4BD0884 
X-CRM114-Status: GOOD (  11.95  )
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


This is a note to let you know that I've just added the patch titled

    drm/meson: fix memory leak on ->hpd_notify callback

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-meson-fix-memory-leak-on-hpd_notify-callback.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 099f0af9d98231bb74956ce92508e87cbcb896be Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Thu, 14 Sep 2023 16:10:15 +0300
Subject: drm/meson: fix memory leak on ->hpd_notify callback

From: Jani Nikula <jani.nikula@intel.com>

commit 099f0af9d98231bb74956ce92508e87cbcb896be upstream.

The EDID returned by drm_bridge_get_edid() needs to be freed.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org # v5.17+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230914131015.2472029-1-jani.nikula@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -332,6 +332,8 @@ static void meson_encoder_hdmi_hpd_notif
 			return;
 
 		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
+
+		kfree(edid);
 	} else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }


Patches currently in stable-queue which might be from jani.nikula@intel.com are

queue-6.1/drm-meson-fix-memory-leak-on-hpd_notify-callback.patch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
