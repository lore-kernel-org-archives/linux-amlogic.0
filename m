Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1849C369CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYYGBj1CvGAD9UYHSkmNoYzm7qwPq9ldnzKCRTAtURU=; b=vXMT+WMwvnHiIH
	f5idAH6P0TdzjCneyGc6RMVeN7RwMLPCqdgagFpU9c5Dr21Ln8UmmCr5PInrdTnGnmpFM2wcsCq/D
	3pZMQV+mbKJ7DjVdB72iffrKZWDZdxBUvHke+JcHBNwmL6itkSqoBF/GG1VYwpoSR4hmKYZDYAs72
	4OsYi1xewfOfmePAT40W/l7175nip1GXRy/cbqe08NrSE8lVhTXrA2XiloYx0u/s2T1zLGvFU6RpT
	ruK+8Jxwl5Jkniv0vEvS1anO3jiY3vLC6zpfqNG9kkytfenRpbu4XTgpYUqb73qfB9vskoAEukdeZ
	t71L9tjBsfhCL7sXfGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u796w-00000006L8j-26AH;
	Tue, 22 Apr 2025 08:36:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u787O-000000068J2-0XUE
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:32:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so2826423f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307152; x=1745911952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=JVehmCPZ7LVoom1yz2xFDTBhRkNz9B22N1j2MScEWsjHgT/VrAwFkcwMY2B8YHvEE1
         l3AyPUaWvvkSWVdZWq9MY67JIdCswX7/YA5F2phy/efxjzb1RglWtwyWQO2+kk+Sbwsq
         E99CD0V9wnj2IxLm7hbKvAWhwyHjS4OkKNGrRh4z9mtSXRRT2Z7SsnWhxUXd0CVOYR4L
         ZSprlUUGO12olbR9SaHOeAVnR8HIQ7RG4sb2/Hey5mOX9/xFJENiy5JNtaw6+o9w/3yM
         DIl0wqzwixqa0TdIB/JgmCHMKtkKqKpO5AmTF2gdKQYwFzLaXZorpfVfvge5s6kWiIah
         YnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307152; x=1745911952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=fvdrQf7SXukfgqOL9PO759TexVDZo5/JE7tf9cTA9Fn/GmCKTeAMiQyKoSf/DEtbs1
         32Sm6wiExTJRZLFmuUZ9r7x8Fu5jdJWJE4tUJiBhAEiXqTKpvNULXTTSmAjcxs+WWpkF
         D6Qg+arDqE/WJ/Oembb8nh+UcD8G4eP/zXx7Bzr0YM01d5QQrhPXcGAguUr5rtN8bTP6
         uuz5/CnkCnOV+IaOcWdBJTdIkmIsNNsrH8xvMoaaJo+nU9hHmc0OnPcQFayzA/Of/rKG
         FPjnYYXfl6d2rDH3qvvVWadWuBCWpgDjtHQ+Gq7RHczoP10R6At+ebqPT3gdheR3U1qk
         VWJg==
X-Forwarded-Encrypted: i=1; AJvYcCWVYtugk5S7Puc2/5RfgfxoSCuvDolw0imjtgrSr68FjmM3+/avIV1/rAufPl47xkXJXBPIjjwWNbfNZfzg@lists.infradead.org
X-Gm-Message-State: AOJu0YyjOtQuQWVWR2IvISHjwyTdk23YvxyWxF/vHCfgxczMxF6nKYVp
	zL7K0TRqa0SVtHQAluFEuTPD0u4tUGOHNPUZhg5n2/F2xFH4dOcyp9EfdgP0U9w=
X-Gm-Gg: ASbGncv5adf9/noiO3dErxoddzNG+Z+T+hYsCkWoZkNuIo2hQEQImke7wyWollGN/j8
	XroJCx9vADP7KzTfLrN6X425p6vRhpFYpDSq3E/eDETrqJy7lQe9jW2vlgeMYppRCRQlhTvPSJc
	36yfr2jkgb9e2TPqm6aO4cpBAxe1SNRaS9JeWY+Bq9/rSJ/AA6SVarBggPqqYox/uxDMyyN6mpT
	1MnuTLs5M7TzbH35wZ2suFQy9gnxXsYQIEK3efZ3pSSKqjeSr/him350xdwbnAEZyueSM/kU3Zf
	D27p9PYffpcfwDWDzevMHzPsjo0CS3NBfFiSxoAUNccwCToerCC4hIVaHOx9hQ==
X-Google-Smtp-Source: AGHT+IFclT1+OQXEDIxxx/AMqrjY/N1Yvy1xLXDrMHQkl58h0kU69MTBU2hwvhAytgvH99PcAzfK0g==
X-Received: by 2002:a5d:648c:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39efba26220mr11676730f8f.2.1745307152441;
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43c079sm14450855f8f.50.2025.04.22.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
Message-Id: <174530715197.2805907.16376775353354108716.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:31 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_003234_200044_A5EE2E7B 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 21 Apr 2025 22:12:58 +0200, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f37bb5486ea536c1d61df89feeaeff3f84f0b560
[2/2] drm/meson: use unsigned long long / Hz for frequency types
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1017560164b6bbcbc93579266926e6e96675262a

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
