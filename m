Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998A606D81C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iVVrvFRq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lrkur7NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EHTXn8MY7EGcCsSxA+90NTepFt66w62lDV4uvBlCTU4=; b=iVVrvFRqtTpO/8tm/t7R6js1Tv
	NWbCW9db1Ko+oWjDe/eyZe59BMNpmFxY3EyDh9F/qz8Ng+FLdNCFXUpxCpZ6vIpBCEP5uXBLORSkc
	3d5utSkIaWFoPGM/QTqeuCN91Q3A8oM3FyGzYs15fDUy3l9iTStMK2a2Fa1NQJ9Dslp7po08FRPrY
	StiwgN/Fu9U6gZ8672W3BfiDAl/45d/14JiCBo1CjCLfpDq8pnVQ3+2Z6Y7ehDaTh0LHXWFSV/ja5
	mkyyE5O0qd1QcRzOVw3M4gvCd3aAIqnD9pX9KeYRHZ5izFulF6sjm67ummfQyLmxaaOr57S9SmNeL
	6hQK3TQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwQ-00000000aAp-2JMs;
	Mon, 09 Nov 2026 11:53:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwM-00000000a9F-3eMU
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 11:53:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6304295e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225212; x=1794830012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=Lrkur7NNlPEWR+4rleQFXwQZ4YDEBqBvrKeDvBybADhTKnXMQmYejJ/peIxhljSrwu
         3SsdGkG7hFFzj0Iw8oKt8qWEgSMDTQLbtRllYXdZcos6wHY8KOerWlEoije1bqWEkwr3
         90wNiJPuQDWtBE1MO+Y0BKdcthsumlvbVacLGZMi6EB9E/Uo5SVfvtMOGrC4AiFa6DP1
         4eooUyD/05MNoi/AvKgXr9rNcBTeCfQ6jHwE3V8p0WfT0KS+1AdFBSlh3Sh5ZxHQXrSL
         TqV+WbleoNmN/IJApQfEEpmRqaOA6iXmt8LmuneWO25KbkV4xf2HOEWoH1p/k5M+DQ21
         geKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225212; x=1794830012;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=lmufXcnpXgDHMNUEmdG6La5eRWpU8d4MuzyvSz3JEqb7L6J9aiDg/zmwuNMNOtuZr5
         Eu4srpQJK/ydFnwwzL9u+FVriLcj5uBZ9fn722CANiaEuj7ZNfyR2qVDAG26Vgn1J6D3
         UpN2XCADzBziG2UteINQh8ZXQBm7zInsMJXMMCUv6FTEBtV5ifHRz88lk0sfH5LDDcDo
         IboT5v3bMx7SQq4QWhwJAxASfRaJOfBgTCHj68aCdV3zjLIgT9qWCdEg/K+sSmk9sLP8
         dYVL0YojTgCmfoi8gwjCWFrdMCgPVr7ev9TUPe7rl2om/+8ZL5U07/JC91dJbbE9vVhJ
         4wHQ==
X-Forwarded-Encrypted: i=1; AL+hErFPIEGKwAHG+2rhx6M8SQp8lkKeTenrPB/uGsZNNaHJA40fE6+atMJ0e2Tczo3W3rqoPWDCBOed7Q+fkpb6@lists.infradead.org
X-Gm-Message-State: APuU4Z8Bb0ZGtq9zgiWmmsQUOiaYiAtWrdrxCCWB21w8IJ24y62f0zQG
	cpYg19HSkPORlM2rPHYJr9IDceB0GZPWr/X4dxsWlR0rkUpHipYGGmePmvqIpyVk6L0=
X-Gm-Gg: AYBFou22SCJdoGXu07hCXD6QjkLfWSEf2HWJjbpRrwxovR4AJZ8F/oabhwnQamxngo8
	RyjHFKU6rqaI10iV2B6C/RI+OyUofyGEAuPWKJQ01cXICuRwy3iTIKuX5uUJy0bZ3qE18qwIR/B
	020+RvtdoqQpHowcAf1SWokEDWiRtaEH6MM7SO1168OPwZoKwjYgEt6/s6FaJtO9MwgIccDwrC/
	DH/El65pEkGBW6y/qe9yR9/aUzi7+bGwdedDtPyw7PW8BpibzNSyXJG7VV58OH7iPBW2Lcurqxy
	6V6U/KnLMhj0ytfxvmhsav5fxL7xtZ+Ja3VpYYcClQ3ZAgak5jkh4bbeq224Unc1iqSE9IUrdym
	XA/e/kz2t0rYSl/icElGX43ruwVpAW+wbRWiBQyT+CdI0h25Cv4pngMVBn105GNddL6bivHbEcn
	RVZkornGgHwgvfzXXzAojbtId3St6jMH+YOtNdj9funJeCNBpRxFRHtZ3otXmmoDdLv3yWCQr7U
	mJVs/UhbsxfKOKEm5y5nvfrxIMP94P0jls9be+L7U11Wjlci/hp9qCDRK2YmKEJq+KCVaYl6Frf
	OSWm7gqMBwV1hPro2bw9HwmWrU+unnQ+Ss7oqYNol1M=
X-Received: by 2002:a05:600c:4f42:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4b963c7ceccmr86905045e9.25.1794225211847;
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jose Nieto <jnieto.alaber@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
Message-Id: <179422521075.1645559.4574757378913663782.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_035334_954180_6DC660C3 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed, 04 Nov 2026 16:51:19 +0100, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>   [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>   blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: plane: add pixel blend mode property
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f001f3ff2e0a81b934e7b14cf7a695ea668494a6

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
