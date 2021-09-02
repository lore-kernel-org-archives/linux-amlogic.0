Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DA2C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B162861058
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B162861058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9M2SWGctZpb7VbjUZZIcRIwLPAYTW7b2kVlX+XSPSls=; b=Vn2KZ4xm627QRt6rxYebhzZGrK
	efLT7mZAz+gNIHFDWEe6JOHVcUYNKu/1CJxGYoqI5F7JXYPb0gaT3aoKg41hA2cNOr2dQrY4BOK3G
	RaxRpiGiDX2bWACwb2z0g4BPvdsAL8ho7ESUoJgHJypxvqXx920s+fgWmAxNZoTRwHHzMFiuYj9yu
	XnsQ/rlttlX4BV3iQSG8RdpMCVATNqRfG97X7Da6ojlKYcQvNM6JSRWVbXOX3nWh64BRlKKxYRlcK
	Jz2gkkqwXd5KxWr4drqx5BGVio56wBSaoKUGjhkdeoUAk9low4jxPt5MTCg+TzdHJucWWvk1O8pSE
	YX3DJMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmmj-009hu4-BD; Thu, 02 Sep 2021 13:29:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmmV-009hqS-Hm
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:29:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id g138so1284542wmg.4
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ivnC5t+kwzEH+N/lwdFwyYkZFXtqdXvtkdNGNrl+pyw=;
 b=1HcCAvg2il9akpcXzOUs8HyMDSI1KSiAnVYAsl62L7af0eG96ldqVLQb/3YBdeYLwV
 cIu693qcBr7CqppExod3FEtLhWx1fi4GZ0LWN42pFmyP7EXDKEqhkqu/9TixABY5MsQI
 jaqLkzxF+D8MQ21vtdFh0+D9BpZlyEElXAwAyUyyQ1q0z9MacbgjnACTTqFzhx6X267j
 Vr5tou3hzzDM7Lwz06IcN3f/u1n8BNeR9PR7B8Th+Ex0iUt/veZbRObtupzMz5WeWm0X
 gxSZWVpdiEofWzmWTIqurV7knf+9SFloLiA1bdYu1tPbxr8EOXPCl/QPl4AME2jciCeb
 Opng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ivnC5t+kwzEH+N/lwdFwyYkZFXtqdXvtkdNGNrl+pyw=;
 b=rq6Gp0eQS/BIAmBiOViLyB6iCpakgJ2XaTw5L2bU4Fmxjdo+W/cPpUorozIigTEY1y
 bwq8j5TghKtgYx+SxkgL2MtzXMYuVpCPFiwz2wz+2rwUh62we1cU/B6Rsd8ESQ8S9oQN
 8lZzKFXsW9TnQ3webbPMuJjiUEU+WwCFEDUv50IEGPdMAtcTiNx5yeJlAGOuz9FudgBc
 DcD7AEqROeACkBHYIAR8ClgK/tHtSc1uL/DGHp5l0wR4kh/xTg+mO1yT6dezO38LEOjp
 gIyuHzI3xQGEzi+meitmgmQmpJpZyPhGR/oKukqfOh2afV9lpsph2AOZjDfkVeWBg7hA
 7sIw==
X-Gm-Message-State: AOAM531w1psiqYPQu4F1cZWIx2T16NAvK5r/IDhICRO57uq/Fq6wMErE
 LATbXopIn6KDUO0TZQaO7JkFbQ==
X-Google-Smtp-Source: ABdhPJwidUUfhzH1N+y3nf6q0yaSEafQ9Mt8Zb9Ypp6EK721dFqZJXusGJx16rI1rSukALSGIuTvmA==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr3195951wmc.26.1630589365913;
 Thu, 02 Sep 2021 06:29:25 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id p5sm2007079wrd.25.2021.09.02.06.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:29:25 -0700 (PDT)
Subject: Re: [PATCH 3/3] dt-bindings: arm: amlogic: add bindings for JetHub
 D1/H1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vyacheslav Bocharov <devel@lexina.in>
References: <20210902130516.3892452-1-adeep@lexina.in>
 <20210902130516.3892452-4-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e2216ba3-12cd-4d89-d330-e384f34a2ec0@baylibre.com>
Date: Thu, 2 Sep 2021 15:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902130516.3892452-4-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_062927_621530_57E0D578 
X-CRM114-Status: GOOD (  15.25  )
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

On 02/09/2021 15:05, Vyacheslav Bocharov wrote:
> From: Vyacheslav Bocharov <devel@lexina.in>
> 
> Add bindings for JetHome JetHub D1/H1
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 6423377710ee..b223d7829c3d 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -86,6 +86,7 @@ properties:
>            - enum:
>                - amlogic,p281
>                - oranth,tx3-mini
> +              - jethome,jethub-j80
>            - const: amlogic,s905w
>            - const: amlogic,meson-gxl
>  
> @@ -133,6 +134,7 @@ properties:
>          items:
>            - enum:
>                - amlogic,s400
> +              - jethome,jethub-j100
>            - const: amlogic,a113d
>            - const: amlogic,meson-axg
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Could you put this patch first and also CC devicetree@vger.kernel.org ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
