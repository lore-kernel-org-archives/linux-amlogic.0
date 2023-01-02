Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79772C46467
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfVPdH1pWK3Tx0zIVhwHpETOU0u+fNxlBZvYp3y9D+U=; b=CYdwe9/mao6Inz
	EssbmPS3sBNYBPWCwRRgqAAm9+78M10bkNHzfHQ/bDx6xbu/aSXU0DS0/s5cb0N7FcXEsCez2XmQz
	ERqwCGKCOAHAzpIuFlccuIiM8UtbowpYA3XLZhdeihRfULAZOETSpso0s70ONyCUh8+Q+SqKTJJN/
	KIBaT3KXGCaIqdzDEaATKAb5NkAeAmch5JyzT+WCxXxRGby+rq7C4Pl+F2unEcrA/QcwI3XEko9Gx
	R5h9uJsytj9RTCLxkmXDgGMRpt98/N9NK28JLJCVOZdkQan8oNKS0LfJ2yvsWj9E+x7dg731mbo92
	y6M7woNhxkr/i/0NjP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHfV-00ACg1-8j; Mon, 02 Jan 2023 10:03:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHcf-00ABAE-8d
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 10:00:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id co23so25889579wrb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 02:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=194dBh8yd73feKUfQT2LX9SH0xX4MSntnyEqmQlb6pA=;
        b=ruc8j5Ryqx9/8iW4g1lGyVxZF6emec3HcXUP796DX5VPP+bRoFbDMWZQEy2+Pqk3c9
         IaV4CCVjtRmACtI/DG5xfLyaqdbMDt+uGGQ+sRtPEkgXjtiqL86SYw5yzJK06AnuUmtU
         fXHt7avuDKzfFDtjOU+s3IWRsfFaBWCU4e859NCfaJ2L4lzTwI78xOSewjKoYpy0lHJv
         6OsBS30koGaH0Wf1gCpLReuhwVdHDghtdjEzA27PFnO8IjnBHiC1ShzkOMnIJWQLucs7
         Tj9MSWi2+rAAyGLUiDYZ6jY53mEn23QdgsIVVTG35DIUXjMbmRnYNhe6Qwd9hHcbUc9b
         UTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=194dBh8yd73feKUfQT2LX9SH0xX4MSntnyEqmQlb6pA=;
        b=4xLzqxYFZkaB8JdITz5ByWfXLhvNcTWhQ0RuNnDouhJROFyxI1NFSa8oGFp55JhWCw
         MRrXHcsk0NDdxloQbWTAd71Glj/LXkrrXOjjVkLWX1eMQUdEvHneg2B+kXmPvMRSKZoH
         eTqaw3a3a/dsB9W4YqWOT4thJmUeIy0zU8h5B/z+4DJUR7y7xHB/29J+LJ7+0OOtjmAm
         Zty30gTmPXIZ8U4zAYg8wqL+nR58+FQqtghx1jX3dpajK31quM8OtKXVb04n+IlGS1P5
         PJqu28z6L6KRDuSIVbTc1Ga80zO/+uHMXdpELKswHoaEf3m3iSNg34ieL2DEQwC2XRPL
         ZXcQ==
X-Gm-Message-State: AFqh2kpeIFkmejAGXYxdse510Amokty8LZU4x2JmV2kHjKSHdu2QI/Wn
	Beo0+kbfcdzIHS61ByM1icRg6w==
X-Google-Smtp-Source: AMrXdXuIEK0IbdioJa+9RZomGbTgk+DyCuImUKGU1H/zzftZI7i9mNdxXkCyEwZXmAVJq7oTBjE1Iw==
X-Received: by 2002:adf:f187:0:b0:296:4854:2c6d with SMTP id h7-20020adff187000000b0029648542c6dmr3145509wro.32.1672653644337;
        Mon, 02 Jan 2023 02:00:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h9-20020adffd49000000b00242209dd1ffsm28056871wrs.41.2023.01.02.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:00:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <ccaione@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
References: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
Subject: Re: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not used
Message-Id: <167265364359.326489.7829360920975044539.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:00:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_020050_680123_4E31D71D 
X-CRM114-Status: UNSURE (   8.03  )
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

On Mon, 19 Dec 2022 09:43:05 +0100, Carlo Caione wrote:
> Having a bigger number of FIFO lines held after vsync is only useful to
> SoCs using AFBC to give time to the AFBC decoder to be reset, configured
> and enabled again.
> 
> For SoCs not using AFBC this, on the contrary, is causing on some
> displays issues and a few pixels vertical offset in the displayed image.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Reduce the FIFO lines held when AFBC is not used
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3b754ed6d1cd90017e66e5cc16f3923e4a952ffc

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
