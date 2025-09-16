Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4391DCAC598
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Sep 2025 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XajpQmMMeMEIVaU7pjR00aoBv8e590e+npsnojNR8gY=; b=ewHSjxBMGzGcgk
	9kBwkKc6hZSRAWcodFuSiPvJVP2WPRfYttidRgMkY0j3clEMLq/hudClGoBjBfRx7+IjJORppGm4r
	9b4BQIFH1mdSQrlIpqlbwrtruAj2KhNNZ2qfmvdgotoBo2qwasRya51LP4TSj0WjCJqEhoXoGW8Dv
	C2fjrKHlzgmje5O75WXLEv4g00OZvjZJyxgyvWBuKcTOKlLD6ft71Z4TdHuXOEGI5/H7RolItan2S
	aJ5GMj1FYUHr8TaF96dOewpzZwDbhmlOVcbh6nBxdps1iV8lp6lrPDUKqcCsYpaqnsC997zG3pmLM
	ryz54jWU9GuFTf0l3K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQQ1-000000074P3-2vJs;
	Tue, 16 Sep 2025 07:48:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQPy-000000074Mc-0nB3
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Sep 2025 07:48:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso18478775e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Sep 2025 00:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758008880; x=1758613680; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRMshHgr9BfhwP+oJxFotu57YS2EOBaQb6QEmA5pVV4=;
        b=aJxfgqV4taBItrc1Lv1BygxB36y7MPJsAP2xlSIfs7ftcrXGRD/fChqfYMJdE8c+yZ
         Wf3qv3Vb8HUzhn+2Q6dNudV6jXp4mqWeRuM0uDLFlzm42uoneFaBzb+001HZkVc7fwv/
         PoMquFM1zhO/Pv20LD64lhGkcmmHK2gNx5MSX6lMpQ8/55K+hcxYvI9Obtvn00SC8W2z
         /GEwplwbp6bZ9cXwyIstmiKnZ2/8v81hNeaPgYxz6o6FKfq55TJvThwF73ML+9RUW/Dn
         gcDxC4NT8lYNPvp9MfWxIV4xnOuvZ7YnRbJZncerXskmpYzBrZ9eUBpDZXB4/4G6v0fW
         I19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758008880; x=1758613680;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRMshHgr9BfhwP+oJxFotu57YS2EOBaQb6QEmA5pVV4=;
        b=GOTmdnkuBbwn4ZlLgsynBH209NF0wGlEmbAtUaBDLGOgJowweu/bJICre8XY9+ytSk
         QCcsHJe4BnWc64B7m8kxdKryB3OYKSgEBB7SvPrq2IMLTKtuRg4RxG0QyS3Lsz6vsH54
         6JhyoxmsaoH7Ge2NEvHRE8bov+cOEoZvxGVFag+6NHZMqVWQoGctQCDpwypd6IgKtY1G
         dO1dD9nak1aj4KgVN/76G159CwAHT9PfWeSsRx7iRZUx4lljeE/rLSwJS0bX+SbKrVWn
         K9D6VDBntdil5T6qjrb7OrzhK6r3D675wgE7e8ebQfRIYMHMAkcVpQ3opRq6ZogK9+Oh
         WRtg==
X-Forwarded-Encrypted: i=1; AJvYcCVf9bWiFasMj6xdUmFH7/zy5At3n0K+499xOWc62TtBt2iqbIv2ZsLcs2E1Lyf7ws1FSZa9LRmU5ZcmntvX@lists.infradead.org
X-Gm-Message-State: AOJu0YzqKCw7IODV3E3ftGvgmBL963jIngeRpsDn2sGCuTdW4f/VqQF6
	IMK9fTQ56X69U2/SpHKFTmocnDpE8AQhlIZbV4tdEPH36QbJNANjuvqKF48Fx0Jh6tc=
X-Gm-Gg: ASbGncsX2YLR77cRdoIlm3ubzA+q5BxyiCDqg6OgHooYGFoaHo86UYt1YoxORK6LJ7u
	y2E+kl577TgOkwg9489A2JBdqFajXbbu1GjK9LNBhiKqbzT8Gg6JUOw7Kz+emFWtk+Klmq9G/AM
	I/rGUEFDiuMq1SU+BEf4bLuZHHCFPfax1cv8v+pgpd233bCJiYdmk6AjHefzhqoZmmOtjiPEZ7x
	J+MfLp8l7kTWLbGDuljfrZVEFZPek7abKMO7l2ea+0FlQjEX2ARYKY/xYWg/fgBNm44q71V8Lg8
	gb7mKPjmwXZXQ28MmD9bn16KMiMTfXFSDbsLmN6s8ZNtGItvCkusiwqtWAQqQDrBC/uep5RcCiM
	Zr65WC6W3y4ctl2KxRLNU
X-Google-Smtp-Source: AGHT+IHLQv5am8Q5PjXuyp6eiNrR5bsV8vHLUkJ1Q6ondFRjcGxSGd7COuqKP3wd8LC/p4RSW+zhnA==
X-Received: by 2002:a05:600c:3b87:b0:45f:2d2a:e323 with SMTP id 5b1f17b1804b1-45f2d2ae5d7mr57197665e9.0.1758008880401;
        Tue, 16 Sep 2025 00:48:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a6cd:21af:56e0:521])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037d741asm207326335e9.23.2025.09.16.00.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:47:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com> (Chuan Liu
	via's message of "Tue, 16 Sep 2025 10:06:05 +0800")
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 16 Sep 2025 09:47:59 +0200
Message-ID: <1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_004802_242398_94FDA733 
X-CRM114-Status: GOOD (  14.16  )
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

On Tue 16 Sep 2025 at 10:06, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> This patch introduces new clock support for video processing components
> including the encoder, demodulator and CVBS interface modules.
>
> The related clocks have passed clk-measure verification.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v5:
> - Add Acked-by tags from Conor.
> - Remove unnecessary flags as suggested by Jerome.

The request was "in an another change" ? Why was this ignored ?

> - Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com
>
> Changes in v4:
> - Add Acked-by tags from Rob and Krzysztof.
> - Fix compilation errors.
> - Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com
>
> Changes in v3:
> - Rebase with Jerome's latest code base.
> - Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com
>
> Changes in v2:
> - Removed lcd_an clock tree (previously used in meson series but obsolete in
> newer chips).
> - Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
> - Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com
>
> ---
> Chuan Liu (2):
>       dt-bindings: clock: add video clock indices for Amlogic S4 SoC
>       clk: amlogic: add video-related clocks for S4 SoC
>
>  drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
>  .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
>  2 files changed, 213 insertions(+), 4 deletions(-)
> ---
> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
> change-id: 20250715-add_video_clk-dc38b5459018
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
