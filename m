Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCCAC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jun 2022 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyxlKSf2wKBkypX3cna+U0duR0+MYPyequHxx+HFlZg=; b=K/RdU4XI/ia9tS
	yPSfoUzYmNUPcCP/U27gzwFT7o+zO/pdDJ4I3jpG0D81M4Xh5JP8TpZYA+BeAv7KTeQ2tQvdzV+gx
	HUwEA9E1916j1KHTta8uvldjXHDL0BL/kogUppWuxEbTk4+PD/B0qbYW3oOKQfCzSPV1ERIrzpmEP
	0RsP58HOl7Uhm9IoLEHKFwHYiiGZ8b3C5xEw8fLc3hpDzAemztM9LFN3duUUKLrE4nBLx4nQlBIYG
	rBKhLOixidnR7iZru4xsz1QMQJZ8o1wByYDwHRzqWGrihz6HGCvf1IFlALtvRJVEx6eIVyAijyHxN
	IkHzWjzCGltuPBOK9UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYJF-007LPZ-3V; Tue, 07 Jun 2022 12:27:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYIn-007LDD-V9
	for linux-amlogic@lists.infradead.org; Tue, 07 Jun 2022 12:27:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u3so23958010wrg.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jun 2022 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MnS9eZBppnZjRJEyPEWcwbc8qEUGNcbl9p3ctix2mdQ=;
        b=Jszx/Wi26USE9TtJWbMiiHrtAozvWbXe9c3sHzU7LSgZNED7VOPVQmXwkicOV9u6RT
         /wX0EMV6B19rD42E+0GzJ6YUnQgc9DtniJ9Ixff4M5oRQaw6rRM51B98kwscnMTjT45H
         T1ip3clG3PHk1wh/HVieVEzlNf6lvK/ZJLhgGgXinrM8DG/lLmsccix1OgrMV7rpbjwj
         9VHRhqjYrBRaihvRnR4fRqqZJ5YakE5G5kG9N6vKLWiVfRzcqowm9zISNFFko0nLesv5
         IHNF5f+8hQyLleVlNdc/9rHU0RCoZco/GincvPZJbvVltgITdRm2u2ts7cIL1ePL5QJT
         CopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnS9eZBppnZjRJEyPEWcwbc8qEUGNcbl9p3ctix2mdQ=;
        b=J6c9/EXxDw7gT7jnTy/kFKTPO4Ej7W32+cyGFabHc2kynv7onkw9G7qAoxjrvY935+
         VvdBOmfLA6eghWg6/Vu2SivuuFbB0JzpqVi7ySTYDh30tp/nPYvAItk8LGrazngkXkS4
         cRq7kAf7i3ZCr+dQZQQFYyAM0S/I7wgY3suwCDtx/Qb1DuDC+BUvN+GaN9xLlkjtRoTR
         o8x+FWzh/GWYl7tXSRajorytpFr/5+3Q9qqTCG2a0tpgtJVmpd5g2Tn76vvLWkq/9O4B
         yMust2lWr2PqZ6wjCQ8KBw8aDjuWAxFaI4j+pD0mqpvWH04jV7j2xhPhL6c3wJ5yDlww
         jjwQ==
X-Gm-Message-State: AOAM530Bp1OqkhDs+ohvyz/Up7QD7yteIZf9BGEZnOrsz47GC9KUYmi3
	3r7cGPpL04bGBZ8RO8zVaD/B1w==
X-Google-Smtp-Source: ABdhPJz39mrIrz65dmQlmcX3m/aOeY5/aTHzZPbMkd34nx5R2i8IAXjv1ymugad1I8spt3xpgUJJcQ==
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id o3-20020a5d6483000000b0020fd0466382mr27123834wri.342.1654604834197;
        Tue, 07 Jun 2022 05:27:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:87c5:1f51:1550:2ebc])
        by smtp.gmail.com with ESMTPSA id 186-20020a1c19c3000000b0039c4ec6fdacsm6553533wmz.40.2022.06.07.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:27:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	Miaoqian Lin <linmq006@gmail.com>,
	David Airlie <airlied@linux.ie>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] drm/meson: Fix refcount leak
Date: Tue,  7 Jun 2022 14:27:11 +0200
Message-Id: <165460481589.1168988.17623464252935400226.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_052718_051985_8CEB645A 
X-CRM114-Status: GOOD (  10.34  )
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

Hi,

On Wed, 1 Jun 2022 07:39:25 +0400, Miaoqian Lin wrote:
> The following patchset fix two refcount leak bugs.
> The cause of the bugs are missing of_node_put()
> after of_graph_get_remote_node().
> 
> changes in v2:
> - patch#2:Fixed patch in meson_encoder_hdmi_init, call of_node_put()
>   after of_find_device_by_node() and error paths before that.
>   noted by Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7d255ddbbf679aa47e041cbf68520fd985ed2279
[2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d82a5a4aae9d0203234737caed1bf470aa317568

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
