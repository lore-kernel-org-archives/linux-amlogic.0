Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82863C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:58:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD37564E20
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD37564E20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P/lZQx5TgUgVM/Hau4zXguSalZDN9noKFHMnpEt14/w=; b=uWRVuYdmEh4KAeh/b+PwuMjRm
	6Bz0zHockAnnW4Y39SJp0E1/UIWdaHcXajEvtua+ryWHD8v10P6SLD7p7S7kcx/ooYA2KTm9r8Xnx
	TIAjdqusgeaNEIgX5YiEKP1Q7dzkedsgTAhTvjdh6D6w0MIcyxPSaWM/zUU54ykZ+gzZ9TBKRqB9Y
	48wKE2DyJMmrXTTNi2bYD2KN4bKe5N9mcJ+eVUowEfZgB97fjmBItCTEVu1Ug6/Jt9uhxYw6ZJy4Z
	euuDtG75ByrjpS2NDmy8Mm6vfc+PaFZ36Mr7Ej9zgBgZKMBL4sAlhA74cyK82leLyENuOpptL5gFh
	NoIQMmAyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PbP-0001io-CX; Fri, 29 Jan 2021 08:58:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PbL-0001hm-GY
 for linux-amlogic@lists.infradead.org; Fri, 29 Jan 2021 08:58:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c127so6519574wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Jan 2021 00:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSVmLLrZmaKDDD8crFgemj3WKceyBVPdiw8KFG7vkWM=;
 b=mpPdEvP5BJ05MDpQNKAyFK9Aq1YzjvrPrfwIfVjSCzk6UQvdqP3uaPuALa86Bm2uew
 HMCgE/scVM5SzI1yZOityjUdRUtYsmMvTGDlCo6nmh/7BxHzdKPQh8MnjNiQn2EHNQrN
 Wpa1+DhXrto7EntkfoVExBPLn6sw0K5RbV9CXTDgLWVHrkp2Z7JwUivAaqoumb0pHXpO
 eHdwUBaYd8j7ZOHdQLHKrPYHhEp2BmRKwqHBSlpTFVVoZZqJEVBsrpLnQ47y4gsRTbZO
 NWioHYR2PLXkwaOk8RG7uO9vqDHK6BmhPm/Ehrv5DCuVNUfiUv33kEKqC6L8cWqdJ6++
 hveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jSVmLLrZmaKDDD8crFgemj3WKceyBVPdiw8KFG7vkWM=;
 b=QOIBugODCxhz53qZrbgU3DoOO5maSQJaCxbjKGq1H9kP5RzUA+tTJ5SfdBiBrsbPT5
 EoRf8ivmKgNtpP1Xk+jhxc5p3lpOj3Rt7FTMl1S/6AXMOZR/6UWLkSwrVXniWa8tv9bf
 ptcO2TQbRDO/9oK2OwGOljuX3fLC74bRxBlDuA6l+zFWJ3VM7GwRo+zdxn3GGE/udtCE
 0+GTTxBIR5KE/kGLg1GfIQdQz4YImRrlq9ic94io706cxn0mX/+iN5y1YQEX0hzYZfxi
 ZU+UsG8ul1pCk9E1tUj++B67oLp3Yvh9ZCFR0aeMH++r2Ra0GMKNhJ+4uTs0jCAIQtA2
 pEOQ==
X-Gm-Message-State: AOAM530hy58XujHAHVCaJn8exnYgP1Oj6ZK/rIZt/dFQvWPR1c8kZ7tB
 GFhgSZsMsxkEEfk9yFOw+npWCQ==
X-Google-Smtp-Source: ABdhPJwGtWOJxZjVSjjHvODBQIfvQNOHlHNW9NCYrwPybmq/tAhPPOW6ogGpBoLRcmvWfqMbz/rlIw==
X-Received: by 2002:a1c:1f86:: with SMTP id f128mr2803203wmf.174.1611910677895; 
 Fri, 29 Jan 2021 00:57:57 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:849c:ba34:4d4f:a235?
 ([2a01:e0a:90c:e290:849c:ba34:4d4f:a235])
 by smtp.gmail.com with ESMTPSA id h23sm8885295wmi.26.2021.01.29.00.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 00:57:57 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson: fix broken wifi node for Khadas VIM3L
To: Artem Lapkin <email2tema@gmail.com>
References: <20210129085041.1408540-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c24ffddc-5e4b-d262-5ff4-e8771009af1c@baylibre.com>
Date: Fri, 29 Jan 2021 09:57:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129085041.1408540-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_035759_626416_42AF6000 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 nick@khadas.com, linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 29/01/2021 09:50, Artem Lapkin wrote:
> move &sd_emmc_a ... from /* */ commented area, because cant load wifi fw
> without sd-uhs-sdr50 option on VIM3L

Seems it was an apply/merge issue here.

> 
> [   11.686590] brcmfmac: brcmf_chip_cores_check: CPU core not detected
> [   11.696382] brcmfmac: brcmf_sdio_probe_attach: brcmf_chip_attach failed!
> [   11.706240] brcmfmac: brcmf_sdio_probe: brcmf_sdio_probe_attach failed
> [   11.715890] brcmfmac: brcmf_ops_sdio_probe: F2 error, probe failed -19...
> [   13.718424] brcmfmac: brcmf_chip_recognition: chip backplane type 15 is not supported
> 

Fixes: f1bb924e8f5b ("arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3")
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index 4b517ca72..29c785cf5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -89,13 +89,13 @@ &pcie {
>  	status = "okay";
>  };
>  
> -&sd_emmc_a {
> -	sd-uhs-sdr50;
> -};
> -
>  &usb {
>  	phys = <&usb2_phy0>, <&usb2_phy1>;
>  	phy-names = "usb2-phy0", "usb2-phy1";
>  };
>   */
>  
> +&sd_emmc_a {
> +	sd-uhs-sdr50;
> +};
> +
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
