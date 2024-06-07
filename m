Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ED6C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wzKHPuJu22H2qr/Yw3q0c/bwL0iFBzoUCW+cf3Ja9o=; b=FKrSFmNIkgK4SWUAsPM8Aia5d1
	JyeghMLsRfE14QyZtT3W5YlQFqtK20vjx3GckLHmTTReEZ9JkLiWdwX7lA7BDbi5H4vwyCjghB0N5
	v6uUUH+oC2KwmwVlBkwCeWRvd9PHx+Dya+c7GhWJirSm/OY4OlH9vTBFdsCPehiVSfCczu6ge67tR
	zDsIowR0/WfGY9lOA9NmeajleMDUUeYsqzIRdhWGGmxpylr0w619BbGQym36EPGW7PhoO7rT1KTn5
	xXu8FozBEKw9P12CLWBgTnMiGziG9lMWjxLcaKFxTd+K9RRmaZ1whZMwIG3tGPILCvVzjZ1cqikOz
	wBxjWa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc5V-0000000EqPS-2MJ0;
	Fri, 07 Jun 2024 16:05:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc5R-0000000EqMi-2Srx
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 16:05:07 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52b936c958dso2724354e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717776303; x=1718381103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+ERCTW4alu+cgTaHP2X1z+HqtWWj2kK39TpxNNGgZs=;
        b=FOfie+2t6nFuT0WQ7nfqDqsN3LouRdPueFFC9+j9VtAHWYF01KwhkUcMPr/ZqbXSBj
         ib+cb8Eh+mCzY6mhZb9WFjVYv9Hz9g4oKtWFysAdxMzVwt98JA9UgUp41hjpT3m2Ofgm
         mEBfAKRBPLvz/bFY89tjSYyifyJN6QvhK3kaWYeqZxE+kIDJFJ9G4qa2V0HT52d0x92d
         UT6zhPnzpRpv8vgWBoRCkYzDmNa+RXKXQqxEkE+AbnOm1b5wtHD0I49v6QX9d1LjIEeG
         nAr4dlYE9MK8nS/5uMVgVaTifZMs4jXYniymgB4NnKck3V5OrL/mclQ95EbOPxzIH4la
         uKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717776303; x=1718381103;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t+ERCTW4alu+cgTaHP2X1z+HqtWWj2kK39TpxNNGgZs=;
        b=wJscV4geZHyELKPdnxh5q5ARVn5KYQoCGn7abqBUMFU5ybglCjoLyLHNBcubnJh1wo
         XHLZ5qBDh3CDN6lI+J5a4VuisZImw6LFATn7VFcy30NdXnDxT3cg5jJFVNWS9EY9glTJ
         /UovcvUT/ZnkQMMNQS89cAzOZQJY/P1/XlRBQdG/P50rCwkm/ekCmOFY6aVB0BJAiZm1
         JbLlqOpMI/gAoGSnW/o7wBBhVvcCJjNdrjNEL1NSLwy3+FlAi1i/rz5xPrLEZUgNpLGt
         nr38mvR7A0pnOaQ9d1FG99i7uCQGcFB3epOpZVORZ+oBNAEaRypY12DXpBamMGA4FWFI
         LkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVDNwzUBIzOudrmUkCAvRKBoQhpvvSezbOnLPZLjqNtA9s5qB2fX/QNpQSel19lrfYxaPKD5yYuBFrx0XIm8G3/uBRo4LTxQo4aR2Ro8F5fyw=
X-Gm-Message-State: AOJu0Yy2W5ZABzQdWVvbCRB7g5WwGKyWDs9FoWITOmyqxtWEUsxNRaH4
	TQ/u6lSGdDIb1wygJeryBK8mjFcSHLZG2xAZ8JTcPIUqF1CEkgQqZBiltB+VIJfrhaHPdkYWSo9
	9
X-Google-Smtp-Source: AGHT+IEWSEfsueYptPbIG13f/kiC/uiuC1S6W/HOOZZfTghFpVzLYJTB6ysLPC5s/JDRGDPAkjFu6g==
X-Received: by 2002:a05:6512:2023:b0:52b:c192:c19c with SMTP id 2adb3069b0e04-52bc192c224mr940395e87.21.1717776303255;
        Fri, 07 Jun 2024 09:05:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm57967575e9.34.2024.06.07.09.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 09:05:02 -0700 (PDT)
Message-ID: <ac14cfd4-64fb-4b98-b3cc-b29921606bb9@linaro.org>
Date: Fri, 7 Jun 2024 18:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC
 family and update GXL
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240604051533.3312944-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090505_822980_54FCA5C0 
X-CRM114-Status: GOOD (  11.78  )
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

On 04/06/2024 07:15, Christian Hewitt wrote:
> The GXLX SoC is a GXL variant that omits VP9 codec support. Also add S905W
> and S905Y as GXL chips and sort the GXL comment.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> index 55930f6107c9..47dce75aeae6 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> @@ -31,7 +31,8 @@ properties:
>         - items:
>             - enum:
>                 - amlogic,gxbb-vdec # GXBB (S905)
> -              - amlogic,gxl-vdec # GXL (S905X, S905D)
> +              - amlogic,gxl-vdec # GXL (S905D, S905W, S905X, S905Y)
> +              - amlogic,gxlx-vdec # GXLX (S905L)
>                 - amlogic,gxm-vdec # GXM (S912)
>             - const: amlogic,gx-vdec
>         - enum:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
