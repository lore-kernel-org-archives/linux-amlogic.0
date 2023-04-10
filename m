Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956ABC77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zP9wOq81DuOpnIB+lVSYz68m//UzdwIZgbF/ORN+msA=; b=vvZkpns7Lxgau7
	97xuV6OXBHl50zdRgEo9/uFvYMLif8Zeo8iTkKYR8cqs9jjSSgLiCyL+3Jd4uiSlSZ/aKmPrHZJ4/
	QZw5LTKJqJP8wkIf8Is+KJSkikTNSfVm3T7zE4QgPaALuFRCsODKr4U7HswAoOgqU3SqPlnntLHDi
	w6h9ApyyngD8SsiZgIDBwcCdoP+oXQeXyoePrdIa2eh1gX/7iceZtIRUkvQPHGhyKrsbJmxPW+aGt
	X6bdnWUhtDkIstSGh+7qLso0uVwCJyS7S+9/yQ9V4Kzhhasgueb8YHVkwad8xRqKI/i+4Q3XULkyG
	OTeXkSPCT6Gj5JlsjsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plw8e-00FiUE-13;
	Mon, 10 Apr 2023 18:21:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plw8a-00FiTU-2m
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Apr 2023 18:21:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id xi5so14386383ejb.13
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Apr 2023 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681150866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVIcOWWATDcmahsrKugnwUqJFiGpoNmPF9dN2ibO5JU=;
        b=Jkhl6+O3WuZHCbWvctenwizKp4ziE3rOkKGlqetDkOjya5Z39fHjGpZPhVS8jccrAk
         zDnCN4uLq5YgW6q+0CHMSQ6Ifw49T1DYbFz1U+vcoFVhR0CaCFU+P04amT625AyyDpzE
         tqjmZ5COQy/L1viVaYFtBCHkW7+HyZVHp8oyJI5d/zypxlCrJI0mB62dLCaTlUrto/5X
         ysfPod26tNsvdamlchD+M+3NLdfSElFzTVWyuD5slVhJ+qbw0EJth1vTuey8l/82SojU
         kbce24ab03p872pTwVJfRqkEabZYQ9KP8yX1Tk5wkC8xKRBwYB6QHtVbWq03xIhCqnX2
         PL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681150866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVIcOWWATDcmahsrKugnwUqJFiGpoNmPF9dN2ibO5JU=;
        b=1RyZ6M1TGN6n2gkkeQNkY3qtD+fVxbYsI9jQ3g5LMs3tcv+MEi0wltNv99/oF6tLoW
         IMKPya6BMHDoWLhY/z2k8D4v9FQfrc6gTif9nNhQtSEbwW25br9SD44tbTmopj7yxy6C
         /SXl+4IT1Vl5+LIgKsytvR0ZwzrQGLcGsepMb4Q0+kqRXxe7KdFO1KEuKh6t8vPZpPyC
         yjh/XmlA1OVV1f7cVeFFkGcjNcjkpKHgu4GeGVYRBS4NC3BrKwuyk6kqj6ZFtj/IMYl6
         AzP2mahY/OvLU+ZRtOkPQRmQ+tB8rElaJnyiow6j6YrUOKCoRXxeOXca+DwFRcIuIWG6
         50HQ==
X-Gm-Message-State: AAQBX9frKEIfQxylwD3qEqaGgxbJUea3mETED71u1rvRV/i3sacjEcnD
	yaAgg5z3gYPkCIBJdz4BOq3+Iw==
X-Google-Smtp-Source: AKy350a48PYGq+bhWSYqUcpZzVIdt9ujd8R2nSrpLN6+ZnrZ1xw7GXS1YlIIMTm1RaUmySnBmEIf1Q==
X-Received: by 2002:a17:906:1ec8:b0:8b1:3467:d71b with SMTP id m8-20020a1709061ec800b008b13467d71bmr7889493ejj.48.1681150866220;
        Mon, 10 Apr 2023 11:21:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1a6c:6968:e633:48df? ([2a02:810d:15c0:828:1a6c:6968:e633:48df])
        by smtp.gmail.com with ESMTPSA id ty11-20020a170907c70b00b0094abc0f633dsm720252ejc.135.2023.04.10.11.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 11:21:05 -0700 (PDT)
Message-ID: <a3c37c31-6587-e723-05aa-32f2741fff30@linaro.org>
Date: Mon, 10 Apr 2023 20:21:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/2] arm64: dts: meson-gxl: add support for Xiaomi
 Mibox 3
Content-Language: en-US
To: Karl Chan <exkcmailist@inbox.lv>, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230410180728.30332-1-exkcmailist@inbox.lv>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410180728.30332-1-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_112108_940522_C04BACB9 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On 10/04/2023 20:07, Karl Chan wrote:
> From: "Karl Chan"  <exkcmailist@inbox.lv>
> 
> The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
> There are two variants:
> - 2 GiB/8GIB
> - 1 GiB/4GIB
> 
> Both variants come with:
> - 802.11a/b/g/n/ac wifi (BCM4345)
> - HDMI , AV (CVBS) and S/PDIF optical output
> - 1x USB (utilizing both USB ports provided by the SoC)
> 
> Karl Chan (2):
>   dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding
>   arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

Your patches are missing...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
