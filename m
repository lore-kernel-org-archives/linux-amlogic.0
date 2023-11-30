Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07446C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHn2CkVnpNVMac922jZhQh90BxR9EtGdMjf/lDGBQMo=; b=Je06HTxIb9VS9s
	K28x0Rp7lvuv9PFgIXx6FDEETlhJZw2TNtPkRQFHiRSMw068/DIldMWX3BAyBDj7TkGScIl4bRfLN
	o1trv1qQxGEAbtb/2CKzghJa5NFhaQXr1ky86S6NG/XecQfe0NRhknfivfYvEtgu7buEIIuFHNGlr
	Ov8oqKCqTi7ESroh4hw0izWXH26wCb5K2WNWyxoD3LKJ7cGfbYRFux0tOwddgjbmhhHVyMgAZYoDs
	XTv56KqjDvqJgD7eluDrMnqVMu9CHsKfFkaRsAqYArJUC8eoHsfBgak0gDUAonQMID9jK+CzsN5Fk
	59g0uecz8B8gh59Rrwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fG5-00AZxe-1q;
	Thu, 30 Nov 2023 11:31:05 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fG3-00AZwg-01
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 11:31:04 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-daef74513e1so692614276.2
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Nov 2023 03:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701343861; x=1701948661; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7OU53fGBOPG6Pf4dr1TYI+8Sj5e49OX70Q1sOZhEyk=;
        b=MbVHtPbUPf/XYS/FvFptyQnIE+K+OhtI3ZUyQ4NHxFNNuYQD/sSN9VMkkYs4KUXG3q
         kTEHxgVXzmIKLsoQUDFpBH283sVsHgTNkdY/EbJwIavgYbhcOpd1aifoRtwvTq0PsclL
         pWH6FkkNLaqb3ctRBhnRPssNI/VHHolejV258m45IG34ZfR80LqKiQ9hB63wG4uFak4x
         FUaTXA3rrOX6o4On1wp7egLdZLYtOKmzB3if8xctwx2yhRSJ1bLGd3fxNRX+va2KPpmo
         abaKpssSX6G2fQEJiz2k8ZtKfstRA5pgc95jWvcz993LWUvys+1LFHRdoeFEy/sg19lF
         auJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343861; x=1701948661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7OU53fGBOPG6Pf4dr1TYI+8Sj5e49OX70Q1sOZhEyk=;
        b=rOcEf2Pk6hRTG7xfy2yzn2nG5H7jWSA6qMD82L+GzScVlKEFKTBh1eWhNR6Coa3b9J
         elTKDRjp1PMgfxpPtBFzQNxlitb8hLnH5SjpHoE2ZcewScUdLLojhGQpgY6Qbk8GLbBL
         Fftkq7SdPln8SVkoLYwclVoL2Ecx9jP7n6F1lrITmtXWOiwm5wX7PnNan+uRbTmacDme
         SiJea7AtJQ+HLx/eXbjkCZdlmQuwt6l7Ry30oHffsU67viqdkX6DYal+MF3eZKE6LMcX
         J4jhBxNwGnHtgIbp+LaxlFzCfxGw3UvwOIL6feLgAjqjz8byP5angV1A3T49/6I0JPqq
         e43Q==
X-Gm-Message-State: AOJu0YyrD3a1hpvBBJM0yMbEVfpz/AXL6ivh4Cli3oujhgQ1YhG1UYaO
	E2PpotvHbEkDkobTMm96XIFNrsAfp/vssbvOxSqL9w==
X-Google-Smtp-Source: AGHT+IGLBA9cAvCW/BlFwViZaJGDvVrjeHv8nYpm9n0xFyqiDsBqoa/xFpj/b8u0mPKQS3ZU6c/jj0h4qWRRrKDRbwY=
X-Received: by 2002:a25:ab0b:0:b0:da0:76eb:3d31 with SMTP id
 u11-20020a25ab0b000000b00da076eb3d31mr19895548ybi.15.1701343861311; Thu, 30
 Nov 2023 03:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
 <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org>
In-Reply-To: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Nov 2023 12:30:25 +0100
Message-ID: <CAPDyKFr9jtg8rf2bs1N3zR146TvCmHgTwqWRr=LJNjervpfOkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_033103_040007_A2408F71 
X-CRM114-Status: GOOD (  12.40  )
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

On Thu, 23 Nov 2023 at 17:17, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add MIPI ISP power domain ID to the G12A Power domains bindings header
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next and the immutable dt branch, thanks!

Kind regards
Uffe


> ---
>  include/dt-bindings/power/meson-g12a-power.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
> index 44ec0c50e340..01fd0ac4dd08 100644
> --- a/include/dt-bindings/power/meson-g12a-power.h
> +++ b/include/dt-bindings/power/meson-g12a-power.h
> @@ -10,5 +10,6 @@
>  #define PWRC_G12A_VPU_ID               0
>  #define PWRC_G12A_ETH_ID               1
>  #define PWRC_G12A_NNA_ID               2
> +#define PWRC_G12A_ISP_ID               3
>
>  #endif
>
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
