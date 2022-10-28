Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600FECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Oct 2022 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cIt1aXh8sgdD1PA+vtZXXkKOrTf+FEMWLx9TE42HuM=; b=EGG88agS8jq4j7RzPo5dKQpYsD
	6Sv9BsMGVKfNiSTm05dGU9c4fL4cY3ZpdpmuSF/3Wk1WxDI+Y9PXdu9Mk14mNIaJUKuPSs7HMfJbd
	8530857MFeJNVpPZbkyWEmuX/+Z0uE//xqUndrRb+dLLxZKlonM4UODwQ69ZEaZ1Sq/BjigsnrDsd
	GONIr0EnZzJeMvoA5wyhts6x8yAF1r6z9xhTuU1BmHrnIHM8aGWpMuxyeJeV3v83iWyAKo2iGnrlI
	17Xp2NCBnmZa5o05NbGsJYMW7FEBpB9Dcytc5gjCzT57KNT0jyzyG+RMbvbKZv/S8d792kCxCX8NF
	Z9ozqlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPhO-00HR94-B8; Fri, 28 Oct 2022 13:47:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPhL-00HR7L-TD
	for linux-amlogic@lists.infradead.org; Fri, 28 Oct 2022 13:47:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id n14so3239957wmq.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Oct 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlka1GHz30o8aFh5tsOBDtq0uUt2y6UQRhwfqrBr1vE=;
        b=QYmk5BWs/oI32LYoqi6tLS8sQs5PGD1Qrw15MH8NBomuEMZV10PHqTFlI+RoBIu63A
         O3/7wsg3FeQJ8vpmH241KKQ65NuURSh+kytsn4Er3zqNF+2kZrikQips6ZOXKrKbtlZ2
         t+ChjWuvDTdR8O1yED8kWYgLfTG3bEGRzxsxItS4+3Z+603sVU7GuAYftmbDHAx9PbhO
         x9igrP530WCjTkHlUR07gSVAPV0wbqlU/N7YUS/Zs66d9uG/4YOFXarqhBQqMQZGnXTA
         Y6rKBrErcmc0BcARnZN8SJZ7gHOj9FiEyUNKny59c92ODDwddB7ExNP8QQ3t20w8FXkr
         0AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlka1GHz30o8aFh5tsOBDtq0uUt2y6UQRhwfqrBr1vE=;
        b=fs2a2sTRpc2TKuqys5CBylQYfLn/grwWEzfC67eWBGsdy6S7xk/SbHRZx76XXAmOIk
         WF9MclC3xOg6kvOAG82EMCDaY0hpVoEZIv3eAVv9WpuUsrwqThAQeeA62YJskWMttiWa
         653HvIWbeJ1LuPxi/7zfX0lpr4uSGeF5c83hUCt6+B17rWSCwJ7C9RbprzpC4GdW3ZdQ
         HBAZMubKWAiAi8Yk538yvmNDQ7tu3dEsVS2gkeYVfnERL5RjCq2/6KEjRGQmaeFA9UCf
         /UEvalijdy2alumVrWZuxJyGcpmgrGNO9kR0C+0dcTwa1+WGEXkEFJT7EcIfCqrP7ZdJ
         ucUg==
X-Gm-Message-State: ACrzQf2z3ZtWrM+sfFznMDVchXhm3OfQtdo46suFf3vpUS1x4uASBZ94
	hAUS9MrLJmNBPQVg+EDB49WkUQ==
X-Google-Smtp-Source: AMsMyM6jRcL5aI0pR7qvy593FXtb1XFIcJ1VPvGc+0GGu3R4pUQo7szAhVrmZO9sLmRfQplU7LHFgQ==
X-Received: by 2002:a05:600c:3789:b0:3c6:beed:fecf with SMTP id o9-20020a05600c378900b003c6beedfecfmr9281906wmr.174.1666964817077;
        Fri, 28 Oct 2022 06:46:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:9e9c:c6c2:95a3:c182? ([2a01:e0a:898:f380:9e9c:c6c2:95a3:c182])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003c6c5a5a651sm4267793wmb.28.2022.10.28.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:46:56 -0700 (PDT)
Message-ID: <ec753353-a844-2262-bbbf-7b77fc55af19@linaro.org>
Date: Fri, 28 Oct 2022 15:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: fix repeated words in comments
Content-Language: en-US
To: Jilin Yuan <yuanjilin@cdjrlc.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221028134156.64042-1-yuanjilin@cdjrlc.com>
Organization: Linaro Developer Services
In-Reply-To: <20221028134156.64042-1-yuanjilin@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_064659_974214_D6209FF0 
X-CRM114-Status: GOOD (  15.43  )
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

On 28/10/2022 15:41, Jilin Yuan wrote:
> Delete the redundant word 'of'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/clk/meson/clk-regmap.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54e..e08a9fa0cc36 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
> @@ -18,7 +18,7 @@
>    * @data:	data specific to the clock type
>    *
>    * Clock which is controlled by regmap backed registers. The actual type of
> - * of the clock is controlled by the clock_ops and data.
> + * the clock is controlled by the clock_ops and data.
>    */
>   struct clk_regmap {
>   	struct clk_hw	hw;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
