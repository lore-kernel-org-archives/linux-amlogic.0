Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0404CD1283
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujb+W3TVyXiUytVeHRjtj3FZe8/is1tDOBFB7LXnmxw=; b=4TyqEMHsGWIlAC
	0v9XdbwEYNmN3C+kXOO/h610bfJJp0JH9b/QkK6bqJDl3bDhrStbABYj4dkqXCoQScTktPpjscL/6
	tv4LYX91ORd7zM4zYZHvjvUSSpRwhSf1zOuZISM05hVpE2IAWHy6+hoAWrr6JUngMx+TDlxjF/8R9
	AvMH8Rk4j7MN0SJZteT1VJdfx14sdj4si7fq9X1JgFhe61GwSnYkPI5scOkOeKc9vLm4J6doixzrP
	I1XfPvxbBoMtJw3W5Zn2ITkBmyfEpePS1H1nMI1IE2PzfHiuAK0qP0rS5x9d9dsEoR1nYEKBquUfD
	zbccdnZbZI+PvFZ5qI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFEy-00000001KoT-1CHP;
	Fri, 29 Mar 2024 16:38:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFEu-00000001Klt-0KNl
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 16:38:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41493e0fbf2so14650565e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711730278; x=1712335078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N2sjDVZQ5s5rWMc1AGGuzwDRxJwDXuM3KrfxZH98mw=;
        b=cIof86e9S1g6cqMG2kRIL9TlkaGUEUJKNEd8J6IG19FJsGDTsIGsHEUNvcWUnmOb3z
         q9rSaQh6lWQz+ggu/GMwt3TpAJP33B7MMRMRwU+aJRhdRNLGz7qkzITrxPQ5Cuodh6T3
         3ikdR3f4HLYytr/QVXo44+mGwnjMnhF6/EzyrfmpHCjZwCsOOf9FGK9zixmTyabN0Lbu
         T+dzeidOi5b0Qwm2m9LdyRg+kO1OQxK55LvHo5giGvLFW2fnDokXgKQ0IZ2g5z/xOnF+
         P9j0WZzcChZTfMVANSC01om9soCdaXWWOi/EMW5FBfJlWJeHD3SAix4b9nYoPjx8i2QC
         a2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711730278; x=1712335078;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2N2sjDVZQ5s5rWMc1AGGuzwDRxJwDXuM3KrfxZH98mw=;
        b=syE1Prqxk3sxGo1/HFxGXUuGb6UcMFulUrfGNvr6po/8RNLLdBJU5vOyA6JoJXGMP8
         ypjwEU7u2ZL7OgccABZ0vaPmMmqLOGkAQ6CTwIrnldGS9LHEJDkuzHyMrKn7MPZMLMmF
         rAtaOZuGy4p25NwbKvQreyowf/wmgxox4WzOuPVGi6FAFEG2kSObh24CvUaC/Wig8gdK
         RZpzp92/q2NMswduDJqXsZ4josADD9Jh1owxEmzh+LxUGKojsE5AcvTmXP4/nAVGYzUB
         kkPDmM/CA3rT4rp+qT4bDg4QOe1Tp3zvLjHqfY+mdT+LMfJd1FXzviqnIL4fxypEm0RH
         tHjA==
X-Forwarded-Encrypted: i=1; AJvYcCV+U2pUXmDAeXtyKlyFjo/EGU/LO9zVqLbhtPNw9sKsHNfJalw4KZKURRbC0VXH909HXZqTTRQ18ElLzPZGWa4Gwg5LNoGWO2wTfnxQPvsX/vI=
X-Gm-Message-State: AOJu0YxRcJ4HKryrDKCDFED555ofnrOV+3sM1FLuMWAdXrUdUoadTFah
	XNJnDZm1z5hF84iGbGwHlvYh4pksntkgP8VCj2gXf6Qp4x0QnFuCmiPMuYucAxU=
X-Google-Smtp-Source: AGHT+IE9lrROr7Xt4WRR3WKh9SAKOAjngnqU+7gTIU7bJRWiC8dVxAT6q6g7+dXPYYDLeV3MgA6fBQ==
X-Received: by 2002:a05:600c:4e8b:b0:414:f60:5d6a with SMTP id f11-20020a05600c4e8b00b004140f605d6amr2080570wmq.0.1711730278063;
        Fri, 29 Mar 2024 09:37:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b004146bcdde06sm5958736wmq.6.2024.03.29.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:37:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240109230704.4120561-1-christianshewitt@gmail.com>
References: <20240109230704.4120561-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional
 rates
Message-Id: <171173027724.1500306.13941100169169682823.b4-ty@linaro.org>
Date: Fri, 29 Mar 2024 17:37:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_093800_132774_6E01CD10 
X-CRM114-Status: UNSURE (   6.41  )
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

On Tue, 09 Jan 2024 23:07:04 +0000, Christian Hewitt wrote:
> Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
> sync with the following error reported in the system log:
> 
> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
> 
> Modetest shows the following:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: vclk: fix calculation of 59.94 fractional rates
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bfbc68e4d8695497f858a45a142665e22a512ea3

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
