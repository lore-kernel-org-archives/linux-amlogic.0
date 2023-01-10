Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B7CC46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ql/bWOQfORkmCJ5UPtHSdDx1G56FIzmIPxMhwsNNEAQ=; b=27NFd99QgiwwwM
	dsEMCS0WdpLhF02ke3stQBsDMu/xSuUB0CKTJdRvpb6JS0GMoqKkc7tHege68zyshrgz+9FVD59Zg
	6hEcrhlHV9YyCc+vxMLsUsFKXSo+2JAQGyhF3ii7YgljzT6Pn/VzKZDq0MuTNKp2T8MITQH7tEA3f
	vALBqpZtl9sEh7sbz4Iox5PIC4PkDXixCk+binD2LQlfMy2LblyFGI4dKvTxoQX3BE9OseXDqMoNT
	/lyGr+q9/tvMvbcufIY4mkLdUbYeF+jLZy+gqSZuSp4KnPM2fFKtMMfzqv0pM1e42GxJ/psDoadyP
	BpnRQ/6e9hPdJGTZz9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFA3u-005p4y-KX; Tue, 10 Jan 2023 08:32:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFA3s-005p44-Ey
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 08:32:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso4689995wms.4
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 00:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1TFzsY4F93uzkv4BoveW/h5a+CswnlNdRYqVKav/z4=;
        b=wF14M3NRFIJcAUCJ9WSchD86R1xCWLy5PM/NQha35AibDoCaZaKSzgUyYIFC+iV3IJ
         pWYadodEjs69CjVtSmVWZpFvyvqw3REG1PjtyVYSr2eLyClgwVYTfQhwYhZ8MEgBQJhV
         u07wZgKALblLiykMpV6PxcrIuY1nOSqK4ryjno01xPrx+qV83zh4L6keZJLNlWmCRiJo
         rSsU4G5dLk0+TejjxxrzaMv4QWxzDlnckGFyyl49YsdFnLNlyucKqVulDwA9nmePWRhq
         IWGdEYG4TPH66eIs9/o6p+Y5tq4VvErlL4VQJ6FfKqRCIy87amszNdvVpE3DOKTWr3Hk
         tNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1TFzsY4F93uzkv4BoveW/h5a+CswnlNdRYqVKav/z4=;
        b=FG3cGSagZNxoyjYfEvqRN9cUIRlfrhkwlmAhWO0AbfTMvQ5OgNCJx4IpfWwTQt4Mn5
         HuWHK7nDrKIPY0uSgC4leSwZOFqNtCfr+lRz8MwfVrz3wUfpLvDU4HOoJE5lAcS2547c
         cR6gmoA2MESpxTVKXFyOS2XbLtECDkYsLxddAoPFBVmaLndOvVaTI1fDD30nFbKtJJjl
         AV9Kw/sC6f2EN32UvjSHSYfIOQtIXdLRJHpSJ93zwvaIMA3GE9iuhGBcuxCL34LR7uXl
         CF3GMT/X6Xo5nizRgPSi0gCDdpI6CUvQmfz+XBJNQpwxqo/U22axVS/b8QVISQ9PBhWr
         d83g==
X-Gm-Message-State: AFqh2kratqXQK9sII+91mJpNpcALI4JEwuz/eoHeOBotAVP4xvpb0NDT
	MMQsS3Hny18qTonLRMadTOQPqA==
X-Google-Smtp-Source: AMrXdXtjr5ownIMXxWxHFKAnFJWMeJytFZmJg9YqzEHYXQ8XXn2K+W/Xt8g5sNChDMdyDG1/pl+XPA==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id m15-20020a7bca4f000000b003c6edc05170mr47689049wml.25.1673339566974;
        Tue, 10 Jan 2023 00:32:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b003cf894dbc4fsm15032112wmq.25.2023.01.10.00.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:32:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20230109220033.31202-1-m.szyprowski@samsung.com>
References: =?utf-8?q?=3CCGME20230109220056eucas1p26418012878272961a3a21a365?=
 =?utf-8?q?192ef60=40eucas1p2=2Esamsung=2Ecom=3E?=
 <20230109220033.31202-1-m.szyprowski@samsung.com>
Subject:  Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
Message-Id: <167333956612.1584080.3967652630228708272.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 09:32:46 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_003248_537002_2C7A057A 
X-CRM114-Status: UNSURE (   6.31  )
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

On Mon, 09 Jan 2023 23:00:33 +0100, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() function returns 0 on success, so
> use it for the check if function succeded instead of the -ENODEV value.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=67d0a30128c9f644595dfe67ac0fb941a716a6c9

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
