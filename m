Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C8C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ1aUHB9RX9HBYmbsy5UoTcF4lnnuCqsb/0Ae62hB8I=; b=RWe0lp14/YcbKd
	wYkVv9dcLrJVbdXVDcyGUxl5MxYFQz/VOmnR4I17/+nvKEuYf4AVpWRFogAl9JfTNU3OLHwNJYtyQ
	AWHUuvfO03+Dq0FVJRShOaFKgOG8aWdNpF0zNhZBfzx9kY08TNi2htqlRL9DY3uP7KqN30CISwTt6
	09/xoVugSzhBC3nqVfGlFTx0TRnfJ1QB79kwdoyQVklD9HdrQcwCq2og3K/B/E3Pn8XFwfZTt2Yid
	Hb3kXowLUFRHY4ahLU/7/NOkHrlqpHTYtBaOEGXWSSmZrajxBeYDCVK4jtjIPVuw4BFcwzkc2wa3B
	Nr2AXVw8cXmcvlF3tVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVnC-006SDC-3h; Fri, 10 Feb 2023 15:58:30 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVn9-006SCD-Si; Fri, 10 Feb 2023 15:58:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id h24so6295153qtr.0;
        Fri, 10 Feb 2023 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8aTFVnOsWYVkAC4sToVkHybmRjgNOkZh2qFCAaG8DlI=;
        b=Mi1RyD77ugTxCb1ulPTtMBZeqpqGF5Q0mYp6MhS712A084x2kpLFCTpdLya3m1NBUB
         mvqzm2bWVkLTwhJjn1bLcYzYN72L+p0o9VwQzSEKpmQZ29vbd1X2RN+wKsRq8g8QrUmC
         /U4nv2mCzDf2SP4GQsoclIJ3AoMg3hpRBUPTDATzHhem9yI+A+SEf7iPp5A6Y7KmgTYt
         6S28lx6psVQCjX+FNSbb3BlyN3FwZeg4lZuIzPwRdsjRu2WqnmeomMMEqtGF37c6PQk5
         BCSN9vOA7ovMSr14qKKU6xB/I3KwmWB4D6y4N21aro/kEktfQZXbu2ZERpT2DAO6ql7V
         B7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aTFVnOsWYVkAC4sToVkHybmRjgNOkZh2qFCAaG8DlI=;
        b=0mSxkQiu8HMtEKrQnmFcklcyXP9K7rOj7FXrTtZuzgyESJUTESE5tK1+L9elDCKT9u
         2T34X3bDjB3aM3KerYW9VTfzkl5qu6QvRndt4xbRX/eoU4+zNCcMvmRZuS2IfLnc2ACY
         VTLsPDwiDNpkmzbRRVQlVrJX9B/xEJ2K0Gm9Ldxh8t4gAJOAvchnh1yrqr0xm+dKq3f5
         YxhVsjnBHhiyLIQ/22Nf7S11l3Uzw6/B+cx2ebXOCaZetRXKplvA1Ec2vaMCupnHlMf9
         E4Z+Dr5j8r0sakeFSpjedVtLg65SDJ4TsCj77L2B8cvjIUoFbQou7mf68NXShZRJ+aU1
         w6SQ==
X-Gm-Message-State: AO0yUKVAX9XPiEvA9UD7yt2VjT/BGnlHiborYFXT3LVhfeuoDKYZ2Z1L
	RIBS/HaCsnllTnknVCT/blrdFhoGhHvYd4GSYEs=
X-Google-Smtp-Source: AK7set8CcS3ZeuXDp8HKmLAtd+GYM9oJG6VhEc2IjxJIdB3epTN0zATVW2t3jUy1ugW8dZS1ccszPhq+V6c+iTLYmWg=
X-Received: by 2002:a05:622a:1001:b0:3b9:a589:e7e7 with SMTP id
 d1-20020a05622a100100b003b9a589e7e7mr3116880qte.228.1676044701339; Fri, 10
 Feb 2023 07:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com> <20230209115403.521868-3-jiucheng.xu@amlogic.com>
In-Reply-To: <20230209115403.521868-3-jiucheng.xu@amlogic.com>
From: Chris Healy <cphealy@gmail.com>
Date: Fri, 10 Feb 2023 07:58:10 -0800
Message-ID: <CAFXsbZos7GCF2fp73MrWxjMthFFKj8XAc2OJkNvOMEGUw51Jjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: defconfig: Add Meson DDR PMU as build-in
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
	Chris Healy <healych@amazon.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_075827_953508_EAF6E938 
X-CRM114-Status: GOOD (  11.36  )
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

Reviewed-by: Chris Healy <healych@amazon.com>

On Thu, Feb 9, 2023 at 3:54 AM Jiucheng Xu <jiucheng.xu@amlogic.com> wrote:
>
> Add Meson DDR PMU to defconfig so that build errors are caught.
>
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 851e8f9be06d..9fefe659ade7 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1296,6 +1296,7 @@ CONFIG_ARM_DMC620_PMU=m
>  CONFIG_QCOM_L2_PMU=y
>  CONFIG_QCOM_L3_PMU=y
>  CONFIG_HISI_PMU=y
> +CONFIG_MESON_DDR_PMU=y
>  CONFIG_NVMEM_IMX_OCOTP=y
>  CONFIG_NVMEM_IMX_OCOTP_SCU=y
>  CONFIG_NVMEM_MTK_EFUSE=y
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
