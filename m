Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C971CC46467
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l21lwFts/7OqZGTl0U+5H09+eP62szWMdSrlXFxDess=; b=UrC3nplFuGT5S5kO2aygOanPkW
	VchCRv/wtzp4OzU60D1iTg+YZKA2Xi7Y5I6JCDJ7v11b3UaJHMRLa6SIc5dQW4Ql11xHrVPacnlED
	mgTrFz5+CW+1+HsaVD5KR9uKbLnt3K4h9nuQgex9R4xdYqG9cmQWDraA6MfCQqM+AA67BpaqD8V1/
	szbiy46UQwlOFgHjgbZXpLIlBAvb1A27DEcN/C44BDfAWjlwx5vA43GXSEPe2+dpBOtA8647dsND7
	n0lOFRldOq+GvSRJj6spv+2wTn3NVd6pzzkE77p0vtCE5dANAvqWiSZebrqLtPqazWH7SL8DW/ZU9
	ApB1KJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHL4Q-009CXo-U3; Mon, 16 Jan 2023 08:42:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHL4G-009CTQ-55
	for linux-amlogic@lists.infradead.org; Mon, 16 Jan 2023 08:42:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so1939360wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jan 2023 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gy8r/XGV5pMj1f/4dlMw9jlqDPonmABteOtgzy9gqww=;
        b=NHF3i33RtqpINbCSpEn0Gs8D19DH9R3yMZHJPF0AvAuU/6Cb7q40TdudgGCnnGCG61
         Q55C2/BeVj/MpDywV+yT3/cPF/6+Eagzt4dn5bDU1Lgzj3l64uySK5DcYjEa3WhZ2hly
         J2QOWqFapRJfLeXCHOv0IuHVZCpRCWlm9iyxDky/zTXgDCla4aFGTuMfrisc9GqHWEhl
         QhJQF4fx4pZS3tBNRf60/ZFalTu6KdcQop+AIasb5b6zfvmiZnM1YB+8/zpbCvBv45rm
         FpM8Po/Hld3jRclo6tMzzOiNLPPHrObjoe/ASNZdUycKgt7h4+qOpjQOg5imgsBGl6XN
         dYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy8r/XGV5pMj1f/4dlMw9jlqDPonmABteOtgzy9gqww=;
        b=rfr43+a6j+Revc+sJQiTUn4pLXFewbbuSbH+57kDCJM4VlP3O8tyYVX1nsJ2rzLYeg
         2b5N/CF3n4/NKDqS3bqhv+E0Hdr337pIGV00kqK8K0FrRTunonVNRYfF4JZo2hOYFI6n
         caZUu5LKGVBAVNW+Ve+aM21x3QlcdYCuaa4fCwx9BW1JHKqvgn3k/9YzJptGeiCQtstu
         lxHyz81x55ejyPqUT+i61HpyCmH3eV0tk/hmjpSJ4x6REA+t5ePvPKPAn99Fz6ybkxc8
         yxzjmI0IEAj7Bb6q/T64fI1VRYIC+BQCrPoG4MEAX+vDWUtO16o/8+6grl8vl0EYspQ5
         7htg==
X-Gm-Message-State: AFqh2kpk28KwuEh8pEDDqsppAf5Eyj/a0185+Mq7DKGthQaMY26kTC2m
	efSMvyPVEBIo1GhD3r5EBjHmIg==
X-Google-Smtp-Source: AMrXdXvAZ+hk5ddhA7tn66k45ix5+nWhGUYqykFtKnYu5cdQ6ATBLtnGx2FCWbj4navEhF7QBDMW4Q==
X-Received: by 2002:a05:600c:1c21:b0:3d2:2043:9cb7 with SMTP id j33-20020a05600c1c2100b003d220439cb7mr64768652wms.5.1673858528481;
        Mon, 16 Jan 2023 00:42:08 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id i18-20020a1c5412000000b003db01178b62sm645802wmb.40.2023.01.16.00.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:42:08 -0800 (PST)
Message-ID: <1a0431ab-0e98-605b-25d9-60b052c399fa@linaro.org>
Date: Mon, 16 Jan 2023 09:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH resend] MAINTAINERS: add PHY-related files to Amlogic SoC
 file list
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <38f87b22-d9a8-b8d8-ba7b-a2c2d7311b04@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <38f87b22-d9a8-b8d8-ba7b-a2c2d7311b04@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_004212_201171_A57AA345 
X-CRM114-Status: GOOD (  11.34  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/01/2023 15:26, Heiner Kallweit wrote:
> Add PHY-related files to the Amlogic SoC file list.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c83c26e9..428d88195 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1909,10 +1909,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-amlogic@lists.infradead.org
>   S:	Maintained
>   W:	http://linux-meson.com/
> +F:	Documentation/devicetree/bindings/phy/amlogic*
>   F:	arch/arm/boot/dts/meson*
>   F:	arch/arm/mach-meson/
>   F:	arch/arm64/boot/dts/amlogic/
>   F:	drivers/mmc/host/meson*
> +F:	drivers/phy/amlogic/
>   F:	drivers/pinctrl/meson/
>   F:	drivers/rtc/rtc-meson*
>   F:	drivers/soc/amlogic/


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
