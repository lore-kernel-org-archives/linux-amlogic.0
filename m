Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3970C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ETLy4kwg18HPqG3RzYnBAlkXSjTx6AgxRA+dC5fHJM=; b=w2zILQa1/J5xwu
	hBto3dMy6EJFZDKsAY6iu877T2cD2yiR/rlXCXu7zkoeyZd/hhE5H7VCqN4PPtOxYErEGnYUzpXPg
	KiSrD1NYuuAecGakpZbuLRyjGlMXh15I9hHSuYmRfb+ZWqmkULsg3ehFDunRH87bxC/AqjP1Hac7+
	bClX3RZFXmCVnKdQ9pTEOr88tRUhQrTfWZUvr0k+xCyDRiJ/eMktLWiFYrMryb0ZpYi5kBXTuq63M
	KEzObNAIZFO22GvW4rYkTbd5FmUf1tffwIntgXuAGSZsq4A+l92AhrhD/ogKfbF1i7wUT8cFnJxUk
	JY3F4caIzLKz+fxzR+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q559h-0072wr-1K;
	Fri, 02 Jun 2023 13:49:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q559c-0072tv-1n
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 13:49:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso1897652f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Jun 2023 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685713759; x=1688305759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pq/KH2F2S+w1oE3jYRiu2cFEHPIXuQlNq6CCdo5FOk=;
        b=kU6acM8X6Tz+kZf8Z5QBtw7Nd3ZJo2ToZk9x/PnhRsgMiQUMpiVNX2NHtG1Eb2zPm5
         dznqBfagyg34NArpNoM0cIp6xZwWNM9+SDCRozE4oPxjmIWIULzQJfN+uvE+0j9H3Oa5
         dAefSnUlQP/fCUF6/8V4tom9UqjxVNZ3OE1QWvlcJBuACl/acQ9NvTXocu198gyrGGOc
         /hL0Cy9zfxzv+iRMv5TR0qKk82JKxhXmxgM5KC/fpU6kN3+CKo8xKe5RsX3YVwjDbaJw
         2MDbktIQLicvD44aWX2+42ssyP6RwGJfZrKaWL8ZwCJ0LoDFx9nG51dmkUEN8ELNDBYH
         HAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685713759; x=1688305759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pq/KH2F2S+w1oE3jYRiu2cFEHPIXuQlNq6CCdo5FOk=;
        b=i4T+8TJKmKN5xBIsezXobf4SB3lr+X3mHOY8SYYu743GrWWW2UCoKVhtRgqLphc9f3
         0t17uujE5G/maHxqQbpUl0TtcSUD4ssopIhvCfIZM3oSuLr4wmUkU+uySqwkzYj1XOT8
         avf3CSvlsGDtgUoFBTrzH5Ylu9s3sHTFGMD0WN6eHcYwEwZtD9S28Ip/7JNOcCszlZ/Z
         1DyYIYFt/4DULBly1fy9YokKvH1ZYQ/90ntfQTf0AO9VU8MxVyCSHWPnqNz0iAzXzHce
         +kpmziIOab3r6DB5/Y6DwXyLNJT2EPDy+VuXIEiFuG99V+HfmZtPWBHlfZpUW1w4qYkx
         ZNDA==
X-Gm-Message-State: AC+VfDzuei30SLeT6P1LuRgKreK8cSo7GSYfHGr1wR6/1h8jetYtBLPT
	izTi3QEsnsY0swkH2FHRUEuLMw==
X-Google-Smtp-Source: ACHHUZ6Zq2TOiy6uzLCbEig47MxxY+DF5YJCX+nMxWxA5e73/7Nav1yyhAsRqrimhfGNdxIeIBB1tA==
X-Received: by 2002:adf:f14c:0:b0:30a:eee6:60a5 with SMTP id y12-20020adff14c000000b0030aeee660a5mr29306wro.43.1685713758781;
        Fri, 02 Jun 2023 06:49:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6786000000b003078cd719ffsm1752941wru.95.2023.06.02.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:49:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Tom Rix <trix@redhat.com>, Carlo Caione <ccaione@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230602124539.894888-1-arnd@kernel.org>
References: <20230602124539.894888-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/meson: venc: include linux/bitfield.h
Message-Id: <168571375798.833434.11400829507182378408.b4-ty@linaro.org>
Date: Fri, 02 Jun 2023 15:49:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_064920_591453_9C34F13C 
X-CRM114-Status: UNSURE (   5.15  )
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

On Fri, 02 Jun 2023 14:45:24 +0200, Arnd Bergmann wrote:
> Without this header, the use of FIELD_PREP() can cause a build failure:
> 
> drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
> drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: venc: include linux/bitfield.h
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=664dba662cb313da9cbb1c944c472638a65c552e

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
