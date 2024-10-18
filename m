Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC2FD2F7E8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8x+XrxGRSzIX2ht7KFAEpDHr+GU+O4hz5GySwi9E3Og=; b=xqXXz96K6sRqZg
	nwGSXh67URWNHLAiZcRZpe2andh9VIvcSs6G5ofMgEWwcdmm0D/bPNGog0P8mjqYWscgyEZtEGDVb
	sWai3MJ9VvGSygnWrS0wJhN645flSMZYkd1eoTmbDL0Jj0BW9KGnoqhuuP8l3THJbX5qxNvdox4vP
	mVJuq4Hll+vcuI7W4RGMs76NRElPUptrum2S+pnSZq2RgwacvfFlW32Xt9T7s8EzROix5CMOtRtur
	Blc0BPaHseIyVT3fni+ek0FNvsgT1O59tYJrHWKdxQiS79VBlTlDfMLTtVLv66Aq9h3bBYX8CXoTN
	NcvB21AdPeUZrLLlLaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1idz-000000002Mn-1CFp;
	Fri, 18 Oct 2024 08:47:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iWB-0000000HafK-2WbP
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Oct 2024 08:39:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so24010185e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Oct 2024 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729240770; x=1729845570; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrncWdVx0bleY/RhYi61o0nRl8Zpr6NCNC/up3U4baE=;
        b=3MNHUAKaIxSImv7vRwf8eAT5T392gd+BuUE1EuGW5H3wL9j5Ly9YQrAGFSKq6n7xqW
         qPtmvmdrZ8vShJE9w7N1d4UqvOnyRBFKjFZ3IPCD+6jzsdlntgw6n+t/ghpwuAGZc13Q
         +XdGfypjBUD3dY9eoVdHZvkdqg4YQNEcR1olMyWQhC8Ig7GJ1UG1JxBNojtNanxv2RJn
         gYvHc91pjrXNRHy3eearBNfTmtIZCgXnwO3Yi94D47kwMLNFbBuOnA/lVTGqwInUfGRJ
         pEPctn+zybU2l59P9mDMUHEBOyKkCJyxz2zXc+mMSgo2bkCp/tKlS/d7OrNOcVmu9TkA
         oBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240770; x=1729845570;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrncWdVx0bleY/RhYi61o0nRl8Zpr6NCNC/up3U4baE=;
        b=a1qjKX+RR2B4r79AZWCyuJUcHw//3ZYH6zv4jFeJ9+we3Oz6P+LlJPgw1qFx6mgtNS
         +JT7CoNCSm9/E8+Egq2Ztpmy1JY6NxPuyrpDDazXf5AjtVen1tk1kn6F1UidcHWSOXiL
         M1lw6HhL1ctlISAiczZ5JFrN9+sEJQEddEzmsMK0B7pYNFdhCN4RBDcgI7StVtkBUfeN
         AxlJ97DClISQ4i8KMlD+aFBpne4VxDdhymQbkbyG4EVyvL2+yKtPXDeLFVdCwL/aCqfx
         zVNvB2b5RzUHDOt5n6+3JSZSe1wP5VKn29BiogpLk+ReUQQrfs070Rp5D7EiM+uCKjMK
         ILyg==
X-Forwarded-Encrypted: i=1; AJvYcCVx5A7My+5YtD2qYNGl5vOCFVPBnIChVSUXAwWe/bfCvgLbXHd3/nnJ2xcSaIeCaNE/H6yAElnyPVmOmGhy@lists.infradead.org
X-Gm-Message-State: AOJu0YwIPxe/Ya/sxCBApAaD7zuSrGl9us9Icltejg5LIxbaC/Lexdn2
	jD4na4V/YEQmNyYow3iD2QYjrD0Hgi40ZQgtd4o6Wix3XlBzV2PJVFVtwzqREKQ=
X-Google-Smtp-Source: AGHT+IEtT0VrGwMXWD3f3PNN6+mMk8Niqje0hsKtwQA0iMPfyIkaGazeJqRT2ugGAgBVN1yXC2tZog==
X-Received: by 2002:a05:600c:4e8b:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43161642386mr15793305e9.21.1729240769641;
        Fri, 18 Oct 2024 01:39:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fd55sm17360595e9.45.2024.10.18.01.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:39:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com,  Linus Walleij <linus.walleij@linaro.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  linux-gpio@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
In-Reply-To: <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org> (Krzysztof
	Kozlowski's message of "Fri, 18 Oct 2024 10:28:51 +0200")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
Date: Fri, 18 Oct 2024 10:39:28 +0200
Message-ID: <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_013931_926249_BC3049ED 
X-CRM114-Status: GOOD (  11.90  )
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

On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> 
>> Add the new compatible name for Amlogic A4 pin controller, and add
>> a new dt-binding header file which document the detail pin names.

the change does not do what is described here. At least the description
needs updating.

So if the pin definition is now in the driver, does it mean that pins have
to be referenced in DT directly using the made up numbers that are
created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?

If that's case, it does not look very easy a read.

>> 
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
