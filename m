Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B5C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgPb59jcMM6f6chkTCcpYjHAGF6mmqvqJJcpP855rBw=; b=arSJzK9tlYfjWw
	I10H9y6FE0RC5wsWKwYX3dcUfo0M9P/eNJXAJ2HXOcl62Wej5b6qRYbObW5jSi7VwvvpT4WWPT3xR
	XF32lQX+xhBnPMJ5T11ZEl35AbUzK3yoZuSeZQ90dBYc9V5r9CaMk5lbOFRN2IIJhJfMWpOjjzvvc
	gGQ4JaJU+W92s6xyN1XVetsOZI12tONzDeyrrXk75xlJUc4Egpy8NVFlXzofRrgj5pmjh4v0GGGK5
	m9xYJdH6WqUpKU6tUGyWb3gwZ+pRPQhps7VyxsjVidO26OCg9IkQeSZLiq0SX/YFUhSBAVfAydlrL
	eU5tNFkWxkgy1IoRt7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0O2n-0000000DAoE-2L4U;
	Fri, 26 Apr 2024 16:03:25 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0O2i-0000000DAlW-3lTU
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 16:03:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2df9af57b5eso2670911fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714147398; x=1714752198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vAUdsTCR2PnKMamTrwyk474FOGzS7dCZMJ7/drYNGg=;
        b=oNsGKBj8Hq8pBqbXKdrFu6+lri7GsWGNSy+0NvPMyXapwVoknRF3c/OvAVk+V7Im64
         W1ZAY1uSilXRvHdLqRc516VW4jeXGcH5VFlh9gRkR6apCZlMIizpfZaeEdvyVUT/IMCG
         ghVFTDr12OSV9WA9486YNNRYD6JWuUzpF2jbPLVP2izq65S7O2awrdOxBR1n5ZbjVQXr
         5/kknbUR7vmRjPKRLq47Kwx7corg5KlZP/Zx5HZ2wUrmigSq4wHCU2f+k/7ZUIa/i4Mr
         7KTPdMd077ZtASdjo5ErMN4rIZHO00NZxAo23vQ7De5xkJMC+LMapMB4nncS8U8MsUbk
         ecmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147398; x=1714752198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vAUdsTCR2PnKMamTrwyk474FOGzS7dCZMJ7/drYNGg=;
        b=RcyRUf2/0MwFsRXvvuz99pxjpgW8MBTgBkYOZCYq8Cbe3VS3kaZcOLjGRIusb12sn4
         tFveU4W0P3Fwdcgq4fh1Jcz0+R2+x+5T6H1HhBLJRkkLuj82UVgr75r02Nzb2x0oS55b
         vi66zxNRN3cTlXsHHXv+wiSPADzAzcbbApnO3ZJ5mB7JVDBY/vG92BqVjKNO6cU1oroY
         F5g+qAc79A7xf/5uisFjYftPZRhS6p87bReVf7LrJOAKoRXForJ30pfpWP0DvLwFRTXT
         CSx5q12LIC7/8n8bvmcgpkvFgcZL1qKPUdhVNWsdBjNyqXq1LcvRTv9adt8kLVcrmT92
         RAng==
X-Forwarded-Encrypted: i=1; AJvYcCX2liM7g1GjbgwN+7sZYRokqw7kFuHGkzx9JJ+xM9VCN+PbU1ID+X+e3zUMcY1KG40mkcyk5O+GAuIA8UZEeibTKy7D8vpwZDI6JwN+jbUuc/0=
X-Gm-Message-State: AOJu0YwGC1ZDP51yQ/4wqCUMTtu2mCFZSNkvBmYZ/HU5n8HfcnokJWCr
	5r2CPUhqOEga9GC+m/nfytPr6gEKHHuRukjwRFFICdBTtb9Hqc2F6duPgWmzUdk=
X-Google-Smtp-Source: AGHT+IFZVBNi2xUBOvk7vvZqb2k5iPH7tOf6qAZxXIoF5HheGesLAylF10j55jmXO8j3H5I/limBAw==
X-Received: by 2002:a2e:92c2:0:b0:2d7:1323:6792 with SMTP id k2-20020a2e92c2000000b002d713236792mr2751149ljh.43.1714147397625;
        Fri, 26 Apr 2024 09:03:17 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id p14-20020a05600c1d8e00b0041bab13cd74sm1271408wms.17.2024.04.26.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:03:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/meson: fix hdmi auxiliary system operation without display
Date: Fri, 26 Apr 2024 18:02:52 +0200
Message-ID: <20240426160256.3089978-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_090321_126508_E6B37020 
X-CRM114-Status: UNSURE (   8.30  )
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

CEC and ARC should work even when HDMI is not actively used for the
display but it is not the case with Amlogic HDMI.

This is important for devices such as sound bars which may use DSI
to display a UI and HDMI for CEC/ARC. A display is not required for these
functions

This patchset fixes the problem.

Jerome Brunet (2):
  drm/meson: dw-hdmi: power up phy on device init
  drm/meson: dw-hdmi: add bandgap setting for g12

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 70 ++++++++++++---------------
 1 file changed, 31 insertions(+), 39 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
