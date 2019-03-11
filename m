Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC489C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C88620857
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+jKSCHe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xam3wbBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C88620857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKBnKrXpr3NyJgxrhrKka4d2dZ3gA/7jGBKrYu0ylM4=; b=o+jKSCHefFckMy
	nofe1GC5fZp8yCUDcGNVwFiPA370lN0bsaY7Zh6bASRQ1ualE2Ij0srRpqaGfnk4jQb+c1ZWoiN6N
	bKeo5U+rdlQXYe8E7Xnx5vxxYQmYQ2+4bsAeB3IBH0edMzifiZ8TFDvEHC+crazbAR9E0Bnb7buix
	fjTmmCbCvPnEgxk4YNKxIleSBhEK9+9Yv2rRakp8zXd5kHE33Ou4DGdhAeDU/zBUcml5826KNjaTY
	uehUH+eUZ1GEuNepF7Hn55jokZdfMsY+/OJI62jRnmL8fYM9I/2iWSqm9slseLcQqZsL49tYIQL8J
	kkBziVZILVQhNrQCICgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3IXC-0002Pr-6B; Mon, 11 Mar 2019 10:51:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3IX8-0002Oh-5p
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 10:51:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id t6so4511604wrw.7
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acF3DitoyymhurVq8KUqY0AN8ctPL+NGsZ1lE4tVO3I=;
 b=Xam3wbBfd+QhtmWpMxny/jrawAMCumM4nWMa7Xu337tUqy+CimqV1cXpy16vr2loIv
 H+zh7kWK0sEQgpQkR2C3jsbZJUBEHWdNI0oBweRGtbGu4gv1YXstggVDlvHO2uTwBP/v
 Kz9tvYfHV6jCjcDMnVU1coDvtlBWi4AXHY3Xu1nGNWB0Pe/A/NzSM/tsWkl9HgcHAa9M
 csXTu5eUKcvjv4Yj9VLCc9riOgMX4RKPHihgAZ/wcvNYMGj45EMBuzl0n3vJZd3lRxk+
 UgqXRH1z8Svc4MoBi0krEkk8KpGroThieJLsvSRY8zFEGp/RcC5M40LEQgIy7bMKviVd
 5szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acF3DitoyymhurVq8KUqY0AN8ctPL+NGsZ1lE4tVO3I=;
 b=Cm3kBEjpP5wK66zubZuA/dMD0yFN9dulR4/0WeiuhHT12bbehuHo2MK7CNLaIa30Ok
 5MfCL5JjlC8O1c6jbwZT4TR078kTx36jh//R4YWqZKVQmF9HOT9GCRWTrbT9Huhx9vEe
 K5mvlxq625a0+c34ZipJqI5rfX+2gYdh2DMaxlLFvcYZbvVM+HULHygXUFg8iV80pSx9
 VOqmU+mEpvX1yjsBCGeRL6hB0M9/HpJfI6noETXSBC5Dr1GJ8wFQkGOpnzdwudOH/mEj
 KlIV+m1Z3p3llCPOqo6nquj6zIeo35GbwiyOo1sLHhFoX5T+LvRVcxHhtUGjSHMLNYOF
 Mxbw==
X-Gm-Message-State: APjAAAVxk2A7NeAl60/Fas5e5MLEI0Rt+va1p55tzMIZlVIAQhBGRYVi
 Al6r6LPoYWwkTOjv34bo0nfxVg==
X-Google-Smtp-Source: APXvYqwshDw1X8JBQbcUMRf0bddU46IVIkrhV3UbcV4g/noVcWEUba+Kf7z9rnKOxGqJ9FDS8wnrLQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr2667939wrs.182.1552301508744; 
 Mon, 11 Mar 2019 03:51:48 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id c21sm6902640wre.35.2019.03.11.03.51.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Mar 2019 03:51:48 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] drm/meson: only allow using meson-canvas
Date: Mon, 11 Mar 2019 11:51:42 +0100
Message-Id: <20190311105144.7276-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_035150_226848_3FAE7BB3 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series aims at removing access to the DMC register range from
the meson DRM driver, and is the final step at fully migrating it to using
the meson canvas provider module.

Please see the commit notes of patch 1/2
"dt-bindings: display: amlogic, meson-vpu: exclusively use amlogic,canvas"
for more information.

This series also incorporates a probing fix proposed by Neil Armstrong [1]
although rewritten because of heavy code changes in the corresponding
location.

[1] https://lkml.org/lkml/2019/2/4/152

Maxime Jourdan (2):
  dt-bindings: display: amlogic, meson-vpu: exclusively use
    amlogic,canvas
  drm/meson: exclusively use the canvas provider module

 .../bindings/display/amlogic,meson-vpu.txt    |  5 +-
 drivers/gpu/drm/meson/Makefile                |  2 +-
 drivers/gpu/drm/meson/meson_canvas.c          | 73 ----------------
 drivers/gpu/drm/meson/meson_canvas.h          | 51 -----------
 drivers/gpu/drm/meson/meson_crtc.c            | 84 ++++++-------------
 drivers/gpu/drm/meson/meson_drv.c             | 68 ++++++---------
 drivers/gpu/drm/meson/meson_drv.h             |  1 -
 drivers/gpu/drm/meson/meson_overlay.c         |  8 --
 drivers/gpu/drm/meson/meson_plane.c           |  6 +-
 drivers/gpu/drm/meson/meson_viu.c             |  1 -
 10 files changed, 53 insertions(+), 246 deletions(-)
 delete mode 100644 drivers/gpu/drm/meson/meson_canvas.c
 delete mode 100644 drivers/gpu/drm/meson/meson_canvas.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
