Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A1CC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SHuaePJB374eDexl9OZldA/P8cKYUZa4uOjgKjvFOY=; b=NPputWpXTgxssDKaB8ownBkkbd
	/EnZqFf2KvNO4MF6W44ZgIKLrOCPZk4M+ns4iYiJ6OGwfy7P16o6iykP+E+QcpA1cuIeeT3kH8gcb
	nCcanRe5UDn7OwHXLiv0LCCTvqg1A9ucsCWRxzG8+mKi5QnTLW/T3NPZrH7vU5814aD8eG8xLvLWB
	D9KADm5cz1pBu2hlte7jSzWg7OEvMnm3J7VxIYwD5umXwZGnBDbI3PXvZgGYssQAi+GMKPc0B/9Hx
	KjU9D3ygivwYILfCDfxQWfKa3lj5ena4iMZ3hldEmmWzenJbT4zShDZyT0ecOjAZ+LgMTjjmDhTRj
	C8YpaJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1przxP-006Qo8-1O;
	Thu, 27 Apr 2023 11:38:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1przxM-006QnE-1E
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Apr 2023 11:38:37 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso15335430a12.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Apr 2023 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682595512; x=1685187512;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CbqyD3XgFti1HrSxmaokpC2JBUzCdQwARfYod+uaeME=;
        b=b9kWR5rAztphwj8KGiCm39qqQOje6Uh3CA7u8b9nA0436VGc2HjV6rXdBMkQyIJ5LM
         4JZxQQz1n0AqvBhtSNDWbsK5hyi5feortGUPsBW0Jx9q/sXLVU0xLaCLMaEFfnSiLLU5
         Nzr7WZoieFrLLf5Oy/hvPiD00KC9X7gQ4RNWBVwMFwy+TvkV2FjeRgHHjOLF5ohyfT5d
         LuaFEO//In5iVSw8ePo1VjxJU60uMLbXsa/VjNbRCWbmT1277coO9h9bqxOnUnjjJlER
         Fdhxcftr7BAXOiZEDYJJUwP39Z5nB0RwltmxU6N8zewAgzLux9vnIHiLH0b5GWiNRX0A
         2UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682595512; x=1685187512;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbqyD3XgFti1HrSxmaokpC2JBUzCdQwARfYod+uaeME=;
        b=MR5wcBczEI6VntpJEs3tHbgcxcDvGup8wngCoUSuHI50Xm+qPPvbWiFUg1eyASYq10
         DnaAy01LItCvv8nDAq74415ypXo77eE6A+CDx3n89t8aWOrTdC0YD8My7EjuXxKRXb9e
         p62RtLcwD/OBrU+ATmzry3/ax7UxIKBmoFPjcOYgGGmGqNos3nOt38/+J6aRYB/3/hLD
         ls182zg5R6AqIZ6x6hSAdJ3XeEk3je/phdlCuPxSE/FZR2OYcvbviRETR87HKY7AZjaq
         OFSCSj3EChsILwcZKy8Svz9uFusuzZjBrpfgxFPg49DmHPweDl6g3wBPVJ2e1BcRb4mR
         hi8g==
X-Gm-Message-State: AC+VfDyaSMHTme517f/Lc0C8dVE38qxV+Jjr4V92CpOxT1NcOAbP+RSu
	rXSfzTHXMCzG22YtN/cfm0eNnW6ZBXGPBD0QQMQ5+g==
X-Google-Smtp-Source: ACHHUZ65VsCbNM67iavLjJTTc5HfMjN9W324fASHLb5h0CI2tVQwm0XtH7V9HjGzUjCHPOxDfda+Jg==
X-Received: by 2002:a17:907:1b09:b0:94f:6627:22b5 with SMTP id mp9-20020a1709071b0900b0094f662722b5mr1530499ejc.47.1682595512251;
        Thu, 27 Apr 2023 04:38:32 -0700 (PDT)
Received: from [172.23.2.82] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906504e00b0094a90d3e385sm9415422ejk.30.2023.04.27.04.38.31
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 04:38:31 -0700 (PDT)
Message-ID: <0a055e99-7291-620a-482c-70c78e9c87c4@linaro.org>
Date: Thu, 27 Apr 2023 13:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: VIM3: Set the rates of the clocks for the NPU
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <20230426052831.59391-1-tomeu@tomeuvizoso.net>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230426052831.59391-1-tomeu@tomeuvizoso.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_043836_425576_5A82EE11 
X-CRM114-Status: GOOD (  13.50  )
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

On 26/04/2023 07:28, Tomeu Vizoso wrote:
> Otherwise they are left at 24MHz and the NPU runs very slowly.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> index 4e8266056bca..3a14b21998c4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> @@ -52,6 +52,9 @@ galcore {
>   
>   &npu {
>   	status = "okay";
> +	assigned-clocks = <&clkc CLKID_NNA_CORE_CLK>,
> +			  <&clkc CLKID_NNA_AXI_CLK>;
> +	assigned-clock-rates = <800000000>, <800000000>;
>   };
>   
>   /*

Is this specific to VIM3 ?
I think it should be moved to a dtsi file, perhaps meson-g12b.dtsi for now ?

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
