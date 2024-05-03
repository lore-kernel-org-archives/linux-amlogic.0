Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91DCC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+m8HQ10+T3dFhDjrZoCVofsny8dL/zjAgDF+B4VLrWI=; b=tirZiGpyj+mEDj
	DEbN2QZ3ik+GLj1yXngs4ypAFJ7IM/541VSOZhVYUkdBi4mmNfMhIrBnTLJR+WhQMuOxDFgKZRWNQ
	9+Crmza7rf2wcmGC5XUUkq9gKNjE5FT7DNRH9vf7cG1TPYMpOTf7hHGjizX4JSndEc7C9uJ1fo7Wb
	msSkeJ1UW2rMX9l2hQIrrmNYtfbGB+bI0s6Bg5pdFCuXu9R3AAK0QG3nYRtAYBGcrIP1Euj7mf5f1
	d7i0n/b5Q6eMyNEB9ixQK6PMTko0Zjqe61c3SHrOvn3adcERTIv+Ln6cr78nbamYR08m/sxL21Vyb
	SthCinnjhbj8k8Nqk7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2odX-0000000FjfJ-18Qd;
	Fri, 03 May 2024 08:51:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2odV-0000000FjeN-0TUk
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:51:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e242b1dfd6so5667471fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714726278; x=1715331078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWk/psw7Jn7h8F9Bpz9pTT51OJv92Z7OG1gjIzaGghI=;
        b=NmSkat80QEbi3WykcMVB+fZJbxAFIgcH8r7qiTfQ6Wfi3AA38ScXYBWj7HK0fnGxc/
         qrpvogwSlUV1rZW6HbHcsiFCJ51ZaXIzUCGt1FpuXmnFaz0W8cnYVBXcBQdEmiTmh9ww
         gwccxiaLbpdwVlECroesw7L0gfGnB6cf87bM7y1P4VM+mRoPKVfNpbH3hkza57uWctQT
         +dQLi4HVH1y3Q+61K5tJnfZnF7fUwgJC+uJF/NjvI+eje5xzt+8ffqiqciZUUrdClgh8
         9WutPxtnGgjO4JzZOcPINKMV+nnrf/C3nyNuWppLTsc1sliaDwGvajuup6cTgHfvPDUz
         C2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714726278; x=1715331078;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWk/psw7Jn7h8F9Bpz9pTT51OJv92Z7OG1gjIzaGghI=;
        b=vqf7lNZRWGiRj/tvoNq/rey25PHrqqe0+pkTHZdzqkFA2VzpcV25guS69HzYDIYYWE
         uc5biGDhSy5k3U3DUSVXOxrpASXtRenzc43lovKoyRJWAJ1rXltZqfHuSwwLGpMSjipC
         X9WpjQahH2kQGkvktLZr7eKUpNtozDZcrzdsw1ULaeYTvTvKvB2T7IXYpBU5Jx+scaa2
         mq+I2TdWMgHf7L+QRI7joUiYoojLFyKe3cT7DzcRYsy1dlmjBdQyays/Xp6txf2sTXyr
         UjK6wGYwvqCl1etS9RG40qP8RCUx5KjklJoWV4fPTd7A4Z7S/G171W+vjmEN6zDMLBhj
         lXnA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Oxj2xNcNrkuq6LxFipn4AHTVmkN4mlmMWnvX25mzHLUNThyoOsaDB7BpBAAFks/M4Vkc6hevrzeuocTDOAOJ/SEzovtf2CBJdFddtwEVmvQ=
X-Gm-Message-State: AOJu0YwaOoDUGLlbHWmIfMY9xzpBhrQHuNlJ6X1OrBrVFGT7ZNNnfPM7
	0Mopbo+JHfO6CDmsvwn0ETd02dqQpAwXg/EzLZpFLJTg14A8LXExeSevFbWHaWw=
X-Google-Smtp-Source: AGHT+IHcI2LurCc2hKenAfI5jjKmPmOLR9ME3lIwcmztZCp99vEXqtLskwgBUgkpuv4Q6SUOsRVoww==
X-Received: by 2002:a05:6512:2eb:b0:51d:70d9:ece0 with SMTP id m11-20020a05651202eb00b0051d70d9ece0mr1451847lfq.6.1714726277628;
        Fri, 03 May 2024 01:51:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i15-20020adfb64f000000b0034af40b2efdsm3204178wre.108.2024.05.03.01.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 01:51:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240426160256.3089978-1-jbrunet@baylibre.com>
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] drm/meson: fix hdmi auxiliary system operation
 without display
Message-Id: <171472627680.386161.1617857178874394298.b4-ty@linaro.org>
Date: Fri, 03 May 2024 10:51:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_015121_208986_61DBED33 
X-CRM114-Status: UNSURE (   8.47  )
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

Hi,

On Fri, 26 Apr 2024 18:02:52 +0200, Jerome Brunet wrote:
> CEC and ARC should work even when HDMI is not actively used for the
> display but it is not the case with Amlogic HDMI.
> 
> This is important for devices such as sound bars which may use DSI
> to display a UI and HDMI for CEC/ARC. A display is not required for these
> functions
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] drm/meson: dw-hdmi: power up phy on device init
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/04703bfd7f99c016a823c74712b97f8b5590ce87
[2/2] drm/meson: dw-hdmi: add bandgap setting for g12
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/08001033121dd92b8297a5b7333636b466c30f13

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
