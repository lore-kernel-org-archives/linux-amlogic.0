Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08618CA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b/Ciu4/RwiNJUcd3yjBjpwj54NgAEP5hfdqyIcnE94=; b=LRURiGRlW41Gxp
	gPG0OXsoZ46j/dQQvqnQ1YCNhEYE/2eRKYgby19c6An0aBjc4DZmFxWkGf4L0jNqnJlg5m8VOFKDn
	8PDCVNCKCa2X5odth1aOL2Lr6S6iNOwLu9A44xsyfekVEiODK/KyH26tZBNHXVghXM907usKuwNTb
	Uj8PSfOrsiHzjVOSuO/FCFR5VC3x5X6QeWg+atdK8Ty+DaISa2laJJm8sf3mfGm+Ucwg6QcyGkHjn
	w5fCboarIpcpuzHJn/U1A24oWTwKT3cHCSDzFhTFGA1nt/nb2FXPV06wo7X5KPSazrs0/sqrwOHLx
	nM+JVECMow7RGbHF6CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENMO-00000001zAY-0JAM;
	Wed, 07 Oct 2026 08:50:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENMM-00000001z9q-2oWf
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:50:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2184710f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363045; x=1791967845; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=f9XVtE1z50U6KiVS26uziOfzfDMsQ3tpRxS4QstUJVhwdCmWzZRrwsaqGLkbLZ4piA
         K8jwq9sWhDHs9AbQZFO2mgDf5H6rwAHGP8VW0bO8BCd1DI+98sHvo5ZMZJSytjTEzvih
         tzWUeRto/3da0kdKy7sLiB7VNfSga0hRWjBOaNw8cfdIAWdJLuh0NlxyJm/So3daYsVN
         JjGK+/6JTQvA/dpNbDgkhQHe5ygJ9/bq9IyLrzUGa3KbqDbakJrcQMguog3BFeZYfmJD
         U+SPKsBhJjpeOsi7MvaUYJGfLITWIM9/VFMIP8vjdG+9DYE/k140UwG4hVv5ZB735m+J
         FUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363045; x=1791967845;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=mLIBVvgKXzFSvaA/qn2tQKKrPC9/Uf6C2deddBAc3V/tn8PAEcU8EuJJO/dYZ0V68y
         chdlYuJyt1zKQmYs2F9Vfdljl1TTb94Jh9FLqskTgvA3ew8/8Dio2JmO9CMdnXhTepRE
         7tQtcbgE0NImHmFcRPkABiKCWauae41ZF3zfMzsWHFQBLn11bMHkt5zRB7AmCw60XosL
         RRZWgka0yh/J8+iLdBBLfthGp+InvDdZun1GJZ1ylsa1fg1mTxmjbMcm81WFbumvBrG7
         d5mZ6T/ucwfb4xRvfwVxck5Io/rkoaY3hSS7olHbiZnE9NdfJKBxKw+FkPtg1+J4IaaU
         qx3w==
X-Forwarded-Encrypted: i=1; AKwUvBzC/LbM2U7ZC1DAssksmtQhpH/lFLJNXRLF8MbDdLrCgcp0aAxGK/4cyh310w3FNEGP61SZtxWO4JsR38DG@lists.infradead.org
X-Gm-Message-State: AFq9FYKGfTJbArSwoRoKklfwteY2GFK9iFTTKdiUpsqLA9bkLmKO1s8K
	U8EkjDtEzbDy9aqhRpy40pxbUiRdhm2itbL0gK92hE0z953a+XycQSYRcuXxhKoHSnM=
X-Gm-Gg: AYBFou31MUDTeJKB0FZJjA/2+YMrMD6U8F17BPRXX0Jh01gmCRWIpySDPMLeDfLe/TZ
	N9RhY/PBbnPwOWex6MmF5xS39BKLKXBp7i7P3FG/0f3Q/qzQ1EoOHDNuypbhDMAuLZMIxbmjWUz
	3YEcqWHwTEFduFl6v6zxLHQ4w6dShTTZd8SulFlt/ilLZFCFYf4NmoYq4bS7w34hekE/leCxzCH
	HXvpvJ4FWFpgoXQDMkFUiW/miO94F80A65O1KR0qTvuVWlMSgtq63wrGCtNak2XxKXr5agolm6p
	d2OFE4k8lNc+PyHjmzMbnHTMvt5oIGnzWFscdwFtGhC7XLRJBlICDEtdMqcQd4DVqhGC+9x3AWC
	Bo6+J49r/pBiUHyCSdrQAidauS5GRZHZlPcOnzgfIeThDD9zyrX8XouZh+mI+JIH/Z4QhYZDuqX
	bx3tvd/y1xhnBo8ZiWmOryUijhsUCU74fQSawe241T/j8bcPaWkYY0MQzZ9IjoGO3bHXUYcR4+V
	QelPmZ42GGsRYs=
X-Received: by 2002:a05:6000:46cb:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48c72787725mr1780822f8f.12.1791363044915;
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3050asm3959269f8f.50.2026.10.07.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
In-Reply-To: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-6-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:50:43 +0200
Message-ID: <1jzewpyjvg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015046_717335_C663B4EB 
X-CRM114-Status: UNSURE (   6.60  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Slightly modify "gx_card_cpu_identify()" by making the compatible matching
> string an input parameter. This allows to easily support also AUDIN's FIFO
> with minimal changes.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
