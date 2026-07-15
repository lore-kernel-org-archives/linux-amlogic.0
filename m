Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2885CC44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vtvZuNjX4vq0577+lSNa6pK08tJTTi5KVGks3LVaZo=; b=4buNdMVMLPqrG9
	HpZoVA/5eCNw6KSnoCCawL8NpE53w+Q2CZq10AxCYlN4ttBbiggk/fVu2Idow9DS+QbiizZ7ypInN
	A/KRgv43Hs9kw7d1hv8tVAwMJqJyVISMjg6NxvJQIBUc6XobXtUpCgoMYNu2+l7lIZKKBDXe0bATu
	ZMZHD0na4kPZAH5L2QBLkmy8aCcIp8e6cxvXm24vVJYasbFs/CG+wwY2qDIEtx2+v4IIqK1ve+GaS
	fmOrPZQ7Bb9BNn2vyXVfnnGSPNb0YZym0mc0pQPQWEHkzrDyDsxpfS9JvmJDGfhNTuU4eGskMxuAM
	mZowraxeEkYjfSX/h8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1c2-0000000FKbT-1eWG;
	Wed, 15 Jul 2026 15:33:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1bz-0000000FKaU-20Bi
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 15:33:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so2346855b3a.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Jul 2026 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129607; x=1784734407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=Py+a4S2TCAzGakNISCKb/tU0Hz+YyREGn3LlXQJEJ2h4hO1U7X1wErIZGs0ovNbxoK
         TNh9zfEegfLy2tYyEcQNBfsZd/BZDMTrtrxfLAZpBicRLIiWPEnvt2pwNJMUZqU+kvB7
         jndY2B0FU0Ou0u2m5bc4hmWJ7bTjVnfSg2O7xZXzqDX3Z1YLnM7Yxa2LhP+FWFeP16dy
         F50Di+mjkRkqpyOuI/qnBSx4HytIi6Yqs0NGBypoPK/1cJQQy3RsBA9Qn5UvsfNeKDtv
         5jknHslblX7c7xDQyFJ5S/Sd52Rf8SxmPoxJLnsDrwhsSDiC4RQ2eC1YpDnWIJHcFWcc
         VngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129607; x=1784734407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=Eoi7tJrxYCWRxhTSohhuVR/SlGPP0kbPsOQ9vAta86rin5aLhx36XGkGRmftd625Y1
         vHJHckQWGoZj5y6XRxLs4q9e+cbfCzz+7YQi4MZiwDRB/av+yLupUPBep+G5xInwL6Rq
         wo8sWpMdfJGDNqzeDiV5G/rm2zO5iR1SPDBR0I4XXBbxgrC4xRcv6n/JDNzC97xn73wH
         zKskPjuuYInDGj5k4373dhqZR5aSUpRP7L4WVgcrjl2TVXzUtMDzpb4Hs0r3rYug1dCm
         cVGOA7p/ufiJfyNi/44FernpiiPUccpYRc4LTy0eKxwK0H8PMIK+JLcmULmQuxo7lB6C
         QsZA==
X-Forwarded-Encrypted: i=1; AHgh+RrXfEeNQ4qhcjRxbu3dYI1ytzAeisJkgv2nQp+sRmuPRJkYbis/bgNRnwXFOEXg9uO0D7Y1LJPOVYa8nPgP@lists.infradead.org
X-Gm-Message-State: AOJu0YwkMzpUTcEO98fg1sdlONOAbiN7eOwGC5er4UJ7D3So5bGOScxG
	hYWdrK+zV6PuTjEXBGTeGxqycvpkcMzVt1rSQg4FMfxvgIM6RKo/qBcLZWb2HRo+Fm8=
X-Gm-Gg: AfdE7clO7tw30yT93f+4Wg6Qg+fEmwJ3OKUqSVQboGxxhGxzkVgDRuDRKl2UWR5+WGk
	aAV35hS30ikEP6Xa9P0t1ng5VwaiPJqprHjBXSSE3BCviNYXzri4W3oMVbkp3h3kmuuhcDHOztL
	0glWU/5WaVXphRMzrE2FYeaiC1q7z6cZFbe6jFIqfhbFvzzPsWG3pZQQP4UAT+g5WWz2Sz0f7g3
	xFq6Q0cDyFmxZGDgVkzPUQ67vBDehzbfo7vJOyIbJtSg7NJZu0mhGorRtDzyNsZHGNr/swqOnvH
	flwXPhOYVP7JUJ8oGmmCOtOzfKRjPzuQRie9rbtc/KEeYx7QZe2lFFx+uQUgeL0waPWhGLRbjAV
	8YvbKl9To1Pl3YZ7OHpA/QTcpBYBKJ8Uc/O8eFsvBK2FMZG3hMXWcgJ4ks9+lgVr+UeHgofQsr1
	2VKRC1pG3Ue94G6px/
X-Received: by 2002:a05:6a00:4f95:b0:847:9803:ec6f with SMTP id d2e1a72fcca58-84870373138mr20935586b3a.10.1784129606555;
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7de23asm3373865b3a.49.2026.07.15.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
Message-ID: <aleoQy-YePWJC0sW@p14s>
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_083327_536866_517BF659 
X-CRM114-Status: GOOD (  15.79  )
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

On Sun, Jul 12, 2026 at 04:57:19PM +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 3f710433e937..4cd5121b9a4e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -25,7 +25,7 @@ properties:
>        - const: amlogic,meson-mx-ao-arc
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        The name of the firmware which should be loaded for this remote
>        processor.
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> index 2811334515d1..591471e5f93a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -30,7 +30,6 @@ properties:
>        maxItems: 1
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      minItems: 1
>      maxItems: 6
>      description: |
> -- 
> 2.53.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
