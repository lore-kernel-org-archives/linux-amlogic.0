Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E23C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIzfo5N9Zw//bxAzjjfUUUY95ogl3AJlAKjoG1sxUTw=; b=OLVeF4qnTTCfCU
	55EhF4y3ZWI/IeGiBG1igERJpfw6/z1S4ZcGQklT4zrRwxFWRRVcWl0+lah9ygUuqn/IwCbt971tm
	CduNwHtYUXVpJc2RquEI4rnodcEwEvtvzGyVlnpKlMaC+sg9uGzYsAY11Dlvbz1AGBmDGCblf+MEi
	ogPc+Yt21I99KTQW8YSr6QmVCgRAfX2D5sDud/lQ8sZCSQqA6oAfC9BUnPAl/MKcPXimFvObM7lFh
	ygVgXicFrcchBxlHiYVV8CXCqtFF1y0XU8PWtX4fSFb/dnyyk0NpW8K6g9PMcammRRKywKP8dlkpV
	jX5oP7nQZsp4xZZteLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzJ0-00000009eMS-3KNK;
	Mon, 19 Feb 2024 08:47:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzIx-00000009eKy-3f3u
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:47:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41268aee707so2277475e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332434; x=1708937234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkKhuvKsEed9Py7C2fiWGDe+5remAmNan/P66AVdUhg=;
        b=m6Ce3mTlYrepOR1qoYdEpvJfq+a1Bqn5OkkiT8MfEVBRbvWaMcWcq8i805orih1hd2
         vLHs6XCBndpkwkze2zBBmnrNh28Hc+RVPF8wEjRttelZ45eo/uPeOUxXTFZH6yFeL7Av
         yZpRGWWl/JxfD78s+0C9j2yS9pFbq2GC3O3cHnqKIKGL+vVLztW0TmOeefkdY7ONXoQF
         0xiHTiI4EkbSECzn2pHL0p18oVTKg5VbChfFwdpQsKHQRjtVBPWDsLJVmTWo8c/XvH/i
         rZwXTP1uitrXuUrJ/6q2eLeGGWUQParfxEDvE1zME+t82147gF7DUYVhqwWFCpSq05sH
         6o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332434; x=1708937234;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkKhuvKsEed9Py7C2fiWGDe+5remAmNan/P66AVdUhg=;
        b=et0mfnFAbM2H/Jn32EzF+DoUoG0+SCpfGltBW9QPjUms0lDthX6jZTC2pl/ux7Xd0P
         4avYetxcwF9V4ZkZ6oPKEZXMKJfmEZ3JwEHV6AiHz76DGlht+iwzIfZzWzvjJxTKzNl7
         zY9Dr8QUKoAlcQod9VSVzuikqKxF9YM1PZPhR1Fw4jR6r/J3eUOGf5mHtkeF0mabMk5U
         J0MS0eXvMSFf+4rKuLG1Wu/OBr+qbV98vTN+VfGlLoRRfA5VzKjTLOlzKjpG+EEydyjm
         cKwZrsGPdgKR51Axh95RmcxcZlJ8a/81HQQQ23Pm3ZM0vAa3Vn28laeSTIziSohrPNSA
         t47g==
X-Gm-Message-State: AOJu0Ywa/YBWPjry++a+P7Jg/vpgoUE1asZH0Vqtnkh+TB4z816qVvZa
	7P3ICfIN/iv8tvoJX6jVfEyYfMW/skamMAIhnM/+IuOwv3Hg22ZRQg4iIQRFxMdgr12H1Nyu9pf
	kwXVI+w==
X-Google-Smtp-Source: AGHT+IEOJaRgLUfw1Fy36Qpxf45JsPYnzvIpHgy+e0TCI3oFwEedoWRDKzdVN3pgzb2tsjofWGis/g==
X-Received: by 2002:a05:600c:198f:b0:411:e5c1:e573 with SMTP id t15-20020a05600c198f00b00411e5c1e573mr9008685wmq.7.1708332434066;
        Mon, 19 Feb 2024 00:47:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f5-20020a7bc8c5000000b00410bca333b7sm10499211wml.27.2024.02.19.00.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:47:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, adrian.larumbe@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Steve Morvai <stevemorvai@hotmail.com>
In-Reply-To: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
References: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Message-Id: <170833243318.1719293.16562400747417002919.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:47:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_004715_950517_B5A17B5E 
X-CRM114-Status: UNSURE (   8.32  )
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

On Thu, 15 Feb 2024 23:04:42 +0100, Martin Blumenstingl wrote:
> Stop calling drm_bridge_remove() for bridges allocated/managed by other
> drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
> drm_bridge_remove() unregisters the bridge so it cannot be used
> anymore. Doing so for bridges we don't own can lead to the video
> pipeline not being able to come up after -EPROBE_DEFER of the VPU
> because we're unregistering a bridge that's managed by another driver.
> The other driver doesn't know that we have unregistered it's bridge
> and on subsequent .probe() we're not able to find those bridges anymore
> (since nobody re-creates them).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Don't remove bridges which are created by other drivers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bd915ae73a2d78559b376ad2caf5e4ef51de2455

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
