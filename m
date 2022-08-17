Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835B5C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CF7O6hb87DPCO8iBRHvJkES4gqJ2A/+uoezdUMR1Is8=; b=bDvTcEHQl12W1B
	26Pq4KDirX8aD++Ifc+HzPFEaks4dcurTtHDWVGqVRPgmWumxOehL2AdmtaaRA/9aphIelz0atUCt
	JfYw1CFYYkgPkNgTHQl4BZXfn2fH0X8OI+L5YPJ8xUXE3fxlzCakr4vMi9yIdPFhuyAgrj0PMkmvC
	WeHAh7meAyHlJbH1URn1rgBdJcB/5UpUkrJcUoEeSOp4i0kfQ96ar9cynKspxif5YT+2BuONbO2l9
	YtfWFs+AZ98MYI189WWfn5t4xvJ7k39YqK0ofIXhAfjT8urQPA0kdvfLK76Yet2Yh+9j9HoYF6o0+
	2NuBIgP5SY6yTtMsDC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLao-003d77-Ap; Wed, 17 Aug 2022 16:08:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLak-003d1U-9W
	for linux-amlogic@lists.infradead.org; Wed, 17 Aug 2022 16:08:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso1271320wmc.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Aug 2022 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=WiGuvulnIu6q735m2OE5CFO6qdW7g2pKktoUfCm8PWA=;
        b=TOQ5vqO0wDqWf37UGVPLHGHkfXrrwW+HdW3eqcSwlmZPV4p5M8zUyKbzxp7vDRAoor
         SMDAB0c8shPJofnZ5o/0dSywV6K6xkV2uPj/607HJk9T8SASGYCoEfROK31+D5fTFcXO
         TSHJdxymtdaTlOO+ba69uBDzZ8cAXkNX6jegsDJ/eGE5ao/jYVaogkl0hUDaKlzQVvM8
         WWVlvvLag2VqF20LgdBsuC3MSE2Daijxak/CxkemRR6/wCb8wSB+V3j0kAVrUARPfXHC
         3YybOqOopcFdkevbNg0RNDUVHEnE0Id54MkojgaEFMpivu7D+WIXrg0VJam2z716Z0V1
         0b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=WiGuvulnIu6q735m2OE5CFO6qdW7g2pKktoUfCm8PWA=;
        b=zWAAE5ksV7ieLWTjx90y1PANp2/kpXJ9AZvCidhYwmkY0ruvX7mP88qylhyO9jm2tA
         Cf7B422uY0Sqm2hyg3l1TxZ0qADe5XCM6+naIIi6MJsPHhWJOvRbNX7XFzDd+n56VKqY
         CV84EsWwOXrrBfhpgJ2BNFoHETeTr9Df0Lyef5y6JvbRluLdV8sNe35CeyEcGDaZsKpP
         dJFAAD2Q/Cc5cms4fvJXrqqeziQMolAFemX8TrDeQtat6SpDXLe4gb9wkUK/duW5Es7H
         X3+mU0zNvOtnabTCl7ClS7+8YDVLKOgJh7EC+se9qZukNNOzTsP82bI82aFQN9b6J/lU
         KwrA==
X-Gm-Message-State: ACgBeo3yqGTdcwj48QoRpk11bKX1NoKgi0yuZ36vhScRcq4id9la24Q3
	8Quznaz5efWDG5Z9fxdhD0UAZg==
X-Google-Smtp-Source: AA6agR4cCi7/KGiDIDnEU/GOl9MT2kv2He1kXfd8OFijx9fVzGe19YSnXSsG7YViIvmZJ10Q3a0DHw==
X-Received: by 2002:a05:600c:1989:b0:3a3:461a:ad4f with SMTP id t9-20020a05600c198900b003a3461aad4fmr2681285wmq.110.1660752501711;
        Wed, 17 Aug 2022 09:08:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5c:3576:8e69:3edc? ([2a01:e0a:982:cbb0:a5c:3576:8e69:3edc])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003a5c2abc412sm3263381wmp.44.2022.08.17.09.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 09:08:21 -0700 (PDT)
Message-ID: <04115bee-5ddb-701f-ad18-d2c846155816@baylibre.com>
Date: Wed, 17 Aug 2022 18:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] media: meson: vdec: Add MODULE_FIRMWARE macro
Content-Language: en-US
To: Juerg Haefliger <juerg.haefliger@canonical.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20220817140539.150013-1-juerg.haefliger@canonical.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220817140539.150013-1-juerg.haefliger@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_090826_606332_2AE2A24D 
X-CRM114-Status: GOOD (  11.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 17/08/2022 16:05, Juerg Haefliger wrote:
> The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
> provide that information via modinfo.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>   .../staging/media/meson/vdec/vdec_platform.c  | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 88c9d72e1c83..c7750d4be848 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -280,3 +280,23 @@ const struct vdec_platform vdec_platform_sm1 = {
>   	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
>   	.revision = VDEC_REVISION_SM1,
>   };
> +
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");

Duplicate

> +MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");

DDDDDDDuplicate

> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");

Duplicate

> +MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");

With the duplicate entries removed, please add my:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
