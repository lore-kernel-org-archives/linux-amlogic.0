Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC23CA0EE4
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtPdnRdcGzRidM6TkrPcA+qaAGNE+EnmR9keUb8GbJs=; b=x0u11IGgVszOzE
	3arZ2d4pYi0GycTN13W2ByWIBFiE2tzr99sjI/0MGm48OrN3jUW2WnO6IL2SMij8qBGvykrE1iMd6
	JUKqwJHt1zi6OH8ceY965u6Gfau+k8HKR6TCb2nFTkkmgSIbZEDFdbQb6WaGL70iy4y/UnAphqL55
	TgDgF4kCAEd/THGOeMwFKzFrnGNN1NPF60OKeflrI/dw1BRG/faAC70IXaoIVwEuZt1/EREZq/ffe
	tVG1TCPmXXSmJO9UL8Y+mZ54UXq7Aa1POSziVumGxIBdpBoLQhWeKREyZQA/T/PnuXaFENqXGKqNj
	2ah5cnfext7C7hH8Nv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AQ-00000007orZ-0NWO;
	Mon, 18 Aug 2025 14:48:58 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unxX1-00000007C4M-166I
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Aug 2025 10:56:04 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e933af9f8b5so1705229276.0
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Aug 2025 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514562; x=1756119362; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf/h379UViupe5+NY6kzAfazLWPK0066Pyufbr9DpO4=;
        b=LR7cx31yUmH2GxYCo50FBZZyMy8ObyZbvTH7Oyllm4aCMYM6h6MZ3kvnpoHPEKnO1R
         ldsgZcPdnsEcN8CS1a9JmWmiW8RQaNRK+Dk5V4Ubz6OuyaGROf1QHoQqaUtBi+hOIAF2
         t8qD6K02NKfS8Ma6Qh3fNVcwe/pwDpUkbZhFsyPCLQLqreh9x7i+IsTiLukbD2AfUDkh
         YuF5T+LVeGzIC4NVsSFwvDVBHQ7GXKXIqnE82GsbT1e3EwAPDOl2HR4kgP+/YQ9fbbP6
         Vs+gqI/zQuhr52p+4S323UHs0tM0SWSa72r+E4FuQ9czwZbAV1p4LHO5FRTR/vXizbOf
         6wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514562; x=1756119362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf/h379UViupe5+NY6kzAfazLWPK0066Pyufbr9DpO4=;
        b=OFN7TZpxr3uVn5ZvYd01AZ4an2lu41gW9GwmXkYG5Jk6+oyEwzQDfJRyWuC+aTc3FI
         J6nDcjcrLkpJ/Z6izvtlVqwzk1iUkCHWa3iuBt2F7g6CDlNbIP2O4UhqrdqL+mDN7iYH
         +0l/75nArIXanIKcmYdQSOPHPCxOGohjKIKpoZ81S3qmuN2nUDbAGkceOhrErodmZemE
         icBCVjsQ7C0hKkRCE8NvJiK8B/rZ6NDR6Mgs88pEdAI8NfPUIf9dRXfFoUbRrEg3ZYYl
         15HFDAqqNRNP5lKa5U4NLUxQaHYf+F67OtX/iw/730b4X7LHStuuy52bBU1LFbNwgRGB
         +dIg==
X-Forwarded-Encrypted: i=1; AJvYcCVR3yvljxf6N6ZV4W8shQj6K2UD67U9gY43Mk8oiuhxBmQ5G6dm59whWwomON+PozWnvOwKAcmGfUn1h5Dl@lists.infradead.org
X-Gm-Message-State: AOJu0YzFH02LJsJg9ndG3CGfuKKdNORuIuINXVZpoBjLcPr3eBPsUi4r
	OUqDiNi2Gw50dRqhpldNduJyZ2ph3tCW/BcR6LBU0vpAkuUyZb60ra3drC7xmIrxjm3gfQfSO4o
	4CYNlYM634xNTqeeIaXG75SPf+whixCZ0LLNzhw/45g==
X-Gm-Gg: ASbGncs84L6qc5bqP7wuhUX9wr6tH/Gm7mZPXQZ+4KMsT2dpYbTI1S8rFi1ZuD0SwFg
	jJVUkbpKJrB/7vKT9YlmPiEFkak8cMcN7RXErhHP/fLwmkLbS9GUMHwK5EhrQfQz+vr0dKJ36g7
	K3DGL7QYt6LmSkb7MoiN1ybK2JbyQXv1Lv/orw60lZJbswAmlRWkHmVMm3hA2kLx/lqjmLMMjiT
	NCetLp/
X-Google-Smtp-Source: AGHT+IGpvbrDi4hUl48Zba/3/rBPfc8NraKhAc4AfrhtmjNoilheS+QB0WSMwYa9e4qE4gIontoviX/Mi8xWRVPKC+8=
X-Received: by 2002:a05:690c:6605:b0:71a:3849:f88e with SMTP id
 00721157ae682-71e6ddb2fb5mr146226437b3.17.1755514562208; Mon, 18 Aug 2025
 03:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250812092908.101867-1-zhao.xichao@vivo.com>
In-Reply-To: <20250812092908.101867-1-zhao.xichao@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:55:26 +0200
X-Gm-Features: Ac12FXwa1IzQiF3BDBFOd_R2WYobNi0PZbh6LfTaEAaRBfzgD2wCR6ijr3XXs00
Message-ID: <CAPDyKFqeA895DBDKJUcerXAYLGG_Em-vBu9eRMoVEwc0LyX=ug@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: use PTR_ERR_OR_ZERO() to simplify code
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_035603_298154_AFB38CD2 
X-CRM114-Status: GOOD (  14.99  )
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

On Tue, 12 Aug 2025 at 11:29, Xichao Zhao <zhao.xichao@vivo.com> wrote:
>
> Use the standard error pointer macro to shorten the code and simplify.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc-clkc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-clkc.c b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> index cbd17a596cd2..6d619bd0a8dc 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-clkc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> @@ -84,10 +84,8 @@ static int meson_mx_sdhc_gate_clk_hw_register(struct device *dev,
>                 return ret;
>
>         clk_bulk_data[bulk_index].clk = devm_clk_hw_get_clk(dev, hw, name_suffix);
> -       if (IS_ERR(clk_bulk_data[bulk_index].clk))
> -               return PTR_ERR(clk_bulk_data[bulk_index].clk);
>
> -       return 0;
> +       return PTR_ERR_OR_ZERO(clk_bulk_data[bulk_index].clk);
>  }
>
>  int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
