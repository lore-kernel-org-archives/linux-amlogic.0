Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD9DC38159
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/f0P7LrdszPBkVLpvaFMKIiaEoZKu1QfqQkerUGZ5c=; b=GR6qzBg2sVjERf
	FFLCbQWmjoSfwd0B4GxtKsAo3RLsr8sgbr7vhqd1CBYLkxuWIengnd9r1dACvuiXontJOmWfWodBF
	r41bfmoCso0dn6P0ZtGLqUj6pQ7V29yr3whv3T/uWFq05AQa6XEE1EMTJ0Ou3nfXVltw/Cf1WxyP5
	mjStOJYINIgHaXxz18lO0R4JYYOcrmkNJ7ktSvs1Ye7ghj2V43P+zPg3DkxUWRlw8R+1pm6y1ybBL
	/IMWlVOPv2UTBAW6nyN2Zl9RFWQcs/ZdT+zEL/gCitChtE3Tbcq41qHvqY4KX5zGReZcdTM53CGuA
	pDJizQjFCYDLNHbCEZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3dH-00HRJ4-T3; Wed, 18 Jan 2023 08:17:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3dE-00HRH8-RR
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:17:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id q10so13752861wrs.2
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5CDdoCUnCUysD4OwVm5x8AKmJcxld25F1lQaxRj+UE=;
        b=EsaEmOoj/k5hWYVjzW4wymx3f62KDXfpdzhsx0vO65rwsFrA+poJW2jsK6zGT+xXoH
         rbq/Yms8ZK0EGiUaZqM6luB0uS21dzPoPAkOVY9u9y9ezrG+9wCSnuQ5SQHLnhM3GgVN
         B5w7wMLLDYaHUBH8SdHPka1xEFAgmgFAcaAzkVWDMEesOhVTFnosQ8eX6reNJf1igI4A
         tFA4KJpQvkiM5GNLdqooZUWLarVAEqR9yOg0Mp+cMJqcLaxsFs61HCJqGE3fbfIPk1Ha
         McC6WDlEKw1zN6WKcBI58mxObiE7nYHTjs8WGvpYgo0LU9iSXC4xsPAUdicr5BWW7o4n
         MKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5CDdoCUnCUysD4OwVm5x8AKmJcxld25F1lQaxRj+UE=;
        b=tEM9dAaZTOTxruh52DlcvHSU4/U+Qk4xksYsiDS/lSKjOCSaXQYL4FFrrG0YMHp9Xf
         dvcL68GYoWypTVNx8eyHwpxdKTL9CnDtPUFLON61ECs9VUqWh6yogswZa+BJsMAoaGBv
         e9v2hCzkr0mXBgNj3kY8T5DbzjRIunssE9Duf7lRUQxHubHTNoCcY0uEFAz6sbMcvf0C
         itqaf7mMPBZiydBkwMlBeppeZFUI9wsNGhqeXw9tnXgfetLjmXPLWxh+Fo3tPeY8IJHS
         8+/F7x6Q6f1spP8Ob4B0g9yOI8xqYgMkc/cSFXVxhF1G2nm+BfECuOPeVp0UwwCc2Nzg
         q1zw==
X-Gm-Message-State: AFqh2kpK0AplZiSAsk9C+/60bX/QY0PnsjLariPH8K73yqDg7ckCqeGO
	/SsFY50gaT9DB32JPK8vQD1cjg==
X-Google-Smtp-Source: AMrXdXsrGhBFxvpmGjjvtTlnHTlkVNbgpbSMNOaiPhI0paRO2JgxMEJbIW6PDkO2ecInUF59pt+Kww==
X-Received: by 2002:a05:6000:1f0f:b0:2b4:e5e:c0a3 with SMTP id bv15-20020a0560001f0f00b002b40e5ec0a3mr1566357wrb.21.1674029833248;
        Wed, 18 Jan 2023 00:17:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm24778523wrv.11.2023.01.18.00.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:17:12 -0800 (PST)
Message-ID: <5378f107-7676-d8c6-5bd4-d82fe12fdbe5@linaro.org>
Date: Wed, 18 Jan 2023 09:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/9] dt-bindings: usb: Add device id for Genesys Logic
 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Icenowy Zheng <uwu@icenowy.me>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-2-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118044418.875-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_001716_913883_39011B2E 
X-CRM114-Status: UNSURE (   8.01  )
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

On 18/01/2023 05:44, Anand Moon wrote:
> Add usb hub device id for Genesys Logic, Inc. GL852G Hub USB 2.0
> root hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: - drop the vendor name from compatible string.
>     - drop the -OTG and -QFN76 suffix from commit message.
>     - drop the GL3523 USB 3.1 root hub device id.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
