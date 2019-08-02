Return-Path: <SRS0=wo6N=V6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E56FC32750
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Aug 2019 14:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C7C2087E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Aug 2019 14:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eM4M8KUV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i2CAJIy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C7C2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKUAtytZIZzxe/Oaahua+UKjNyirdqK81dG8uW6FeVA=; b=eM4M8KUVce2Mxz
	+1oxDj/dN8VLVjgDw6SfETkbnbtpGiQQDpp1NJ0eilDaKo9l2PJojmgQyzXLk5GkyTxro+CE2ovKr
	GlVGx0gTpk4F6k4T/AgGbTgjihI4APr4t+0IJ9oTWPw2SnC05LF7wzMbSjDftiBYTJ0lnmSluVbtu
	rWJCtfUUkLbjduR+goWfW7k5NDis7QU8hCoeKVNJ2Ji3aYP1WUg//1wobYvbh9PMTkjU2TaOF86XY
	cHbfJRQ0Nf/slcy7mVXdx45oB+KgTMF8tEPhiXahyShaD4p6BaSDnvYqHgEp2A6stkMQqJTdL+y5c
	Ow6bxnV6DRMC/lwAu42g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htYgU-0005M8-Sm; Fri, 02 Aug 2019 14:37:30 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htYgR-0005Jh-Pt
 for linux-amlogic@lists.infradead.org; Fri, 02 Aug 2019 14:37:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so62459788wme.1
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Aug 2019 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i8v5OrfAlc7cnw69sdNjHw8GhJEaipmkwKKV+4k7HjI=;
 b=i2CAJIy0B6yfAz6Fgym8ZJ60h02nfACYNLy3zDSdgbqPBv5J1eTixGsOFIlXIqwDkx
 qzPQTmHN4hggVTDZChrVyPsqFvlpy2Va2cGSt03oLokrE0cnmUjfvS//ZXXeJNW9oUU/
 8YYRUYs5dXNAqgF7Uh3Ak/amlbbXBSPNf58Q5oxqmNfcPZf6X7Y77v2broRvo6BplBJv
 pcXMcSGU9+l2rQHy+hA/GS6TddqVKgQlCLkuWMVAQ1c/cUFvT/ggXMNLhsIPBImWn93o
 EaV4i6QsogcVusxv1t7dv9tNU4xUze7xS4GaIzQQPw0zElfCWRWqyPb1XJH9Hcaei7Rq
 7L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i8v5OrfAlc7cnw69sdNjHw8GhJEaipmkwKKV+4k7HjI=;
 b=Hl0jwnB399V+FPO0XAEewvyNZplcMd/YePXZZKLILIBk4yoNhN+JLg1kxLAqQitDF3
 9f3QuMbee655QjZMnkkX52krxDulSB0xwjR5KqRCj1w9U2MhNeMb/ljgdpY/MeH5Sldn
 eQXF3xndzElyxzYwadh9O9FCgU5M2+bSuHRyr8GeGiAjKvmbrp6koDBMSuk/yxOMwtp+
 fborFvIcZ1RfkVQ4c8LZdXa9qOhZ5VdGBZNbZ5gxIB2SYFqa0z9Iilb/nEWEEIUZW6rC
 B+YtGvKBbBLAVqgLBPKUWl54/PKIYqgEdxiQWNvn1z21Wqo7SKD8iulHI404aW+Gwa3S
 N4JA==
X-Gm-Message-State: APjAAAWxXve0RE2Tqc91mv4jFto66wPKFQDva/R2t4bO0KX2VXM/LT1z
 hN1GzmRn2pdQLLOk6FhYVS37rw==
X-Google-Smtp-Source: APXvYqyj1gMr8VQNG4JS/ZxqMmErnoCifUA8FRkcZuOaHE2MT1gD5nosu4B8nilm3nVDgFAPzDGr2Q==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr4800922wma.120.1564756646351; 
 Fri, 02 Aug 2019 07:37:26 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w7sm88448961wrn.11.2019.08.02.07.37.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 07:37:25 -0700 (PDT)
Subject: Re: [RFC 5/9] dt-bindings: arm: amlogic: amlogic, meson-gx-ao-secure:
 convert to yaml
To: robh+dt@kernel.org
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-6-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <90dbcb33-74a2-68de-eb1a-ce84040298b8@baylibre.com>
Date: Fri, 2 Aug 2019 16:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801135644.12843-6-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_073727_866423_BDFF8F48 
X-CRM114-Status: GOOD (  18.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thanks for reviews.

On 01/08/2019 15:56, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------------
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> deleted file mode 100644
> index c67d9f48fb91..000000000000
> --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Amlogic Meson Firmware registers Interface
> -------------------------------------------
> -
> -The Meson SoCs have a register bank with status and data shared with the
> -secure firmware.
> -
> -Required properties:
> - - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"

I have a hard time find how to define "syscon" here, if I put syscon in the compatible
it gets matched on other bindings and I get lot of warnings.

How should I model it ?

Thanks,
Neil

> -
> -Properties should indentify components of this register interface :
> -
> -Meson GX SoC Information
> -------------------------
> -A firmware register encodes the SoC type, package and revision information on
> -the Meson GX SoCs.
> -If present, the following property should be added :
> -
> -Optional properties:
> -  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
> -
> -Example
> --------
> -
> -ao-secure@140 {
> -	compatible = "amlogic,meson-gx-ao-secure", "syscon";
> -	reg = <0x0 0x140 0x0 0x140>;
> -	amlogic,has-chip-id;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> new file mode 100644
> index 000000000000..cf79287498f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Firmware registers Interface
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Meson SoCs have a register bank with status and data shared with the
> +  secure firmware.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gx-ao-secure
> +
> +  reg:
> +    maxItems: 1
> +
> +  amlogic,has-chip-id:
> +    description: |
> +      A firmware register encodes the SoC type, package and revision
> +      information on the Meson GX SoCs. If present, the interface gives
> +      the current SoC version.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    ao-secure@140 {
> +          compatible = "amlogic,meson-gx-ao-secure", "syscon";
> +          reg = <0x140 0x140>;
> +          amlogic,has-chip-id;
> +    };
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
