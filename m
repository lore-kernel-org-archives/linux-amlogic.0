Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E011EB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkJ8kKUUC3agGmAB4tcTOEokTWspXKWbWrPbbYQF/3Y=; b=u4qppTGsnwNPv/n2zlpTmIsuVd
	NgXZ/8koF3Y8fnGe2Y2yVSq0YbuTa+kLu1mhSW8tAFo/4fJyQf1m2d7dDT1nwP5fOPA0t8gVQFWBx
	SJrr4+OYPUaN/pRfMV5Tt4glFzSjhptPORSXuS5NNa4C8l584Fw1io0d0c6x+NOrP8a6H644hv/ZL
	t+gwa/zUq8PLoPpFSDz4R94zvocbZldlgCPn5KcUiGSPUCGKk/NoZCjiAS9chU4WeNTpBUwA67AqG
	oYMjzSZHo5EgI2AZhKzWWLi/uNL4GGi2tBFLFK4M/pvs4syHIIIJ4YOEzVoOoPOwhkEpnLFJGQB9p
	c22xhhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3RO-00CR56-18;
	Tue, 27 Jun 2023 07:48:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3RL-00CR31-21
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 07:48:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313f58d6652so1625154f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687852119; x=1690444119;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V4EUTaqa/YZ4jDA+Wf1yQ+b2ojB9ttSnQ3Vj0U/AFAc=;
        b=KIVE3qLp9MOBy+CqVm0+geaIX+RLBtz+wOiea8N3KzO8WPFtcCx9qYQrAC++H9SINZ
         i0g2DPH673kChSqCMCfyjRum6Z5Ym8PLUkZYiwQjEKs5+x1YX3NUouD+rzjslxfSMZcW
         br8N5AOu7n5zdYQ9GSpsdcKL36yyjmvxuQp2vrIWRwnCMgzZXwGvAS8yUqpROsfmuQkz
         Sj3JP1XrhsB3V3l8eklSDCMMQd1EftEhjI1UBTALpgsN9P7CBIqakTCIOBfiHfBybyh7
         GKnNeCcmKMPqege+xdXOeS460z2xQndPypotQquk9V/r5HAlj4HrMS4XwhLRjL9qtFmn
         vjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852119; x=1690444119;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4EUTaqa/YZ4jDA+Wf1yQ+b2ojB9ttSnQ3Vj0U/AFAc=;
        b=PPOtRrLv3OxK13Zu2tLhIx05x3e+zx+VzDBkDdcTmzhFGhjxQWDMTl7WI51wLKhHQv
         h9HA0KLS6wyPOKrgnCxn6tO8nBsV+munKW6D9dThANHzpT1v8P4tHRTSSsLgZX1Te87s
         MXKPtSkrSfDe/9JRPoEVOHFiP1FXN4WK+ypcoG828mDthXIui+eAQfJilFeorRDamsSJ
         HmtEbajMw0Il2WyrnFsI/5OEO9uo8PG51vRFbqMc4qcTRSnV6W29dLglX2BuMiqPIhP8
         dp5CGmIUNKuYPVJDYro1oh6tkcv073NchMXjhGwex6MAasKYwYp6KhYhLgB+7GA0M4d8
         jvEw==
X-Gm-Message-State: AC+VfDxyLzkXHKL506QZeQIgcEXflpl9BXo/+1O02MehaJGzWnb0JEz9
	6PvxFcRJyE3DUo15sdGwrsde6Q==
X-Google-Smtp-Source: ACHHUZ4NGBLdm1hGEsZxgHN5juAUz7/putOdrOALifK/OsCWo56HfuMIKI+Mle/Ykas2mq4X/0EqCA==
X-Received: by 2002:a5d:58d8:0:b0:313:e2a2:fc80 with SMTP id o24-20020a5d58d8000000b00313e2a2fc80mr7320553wrf.33.1687852119497;
        Tue, 27 Jun 2023 00:48:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cec9:2929:7a19:7afa? ([2a01:e0a:982:cbb0:cec9:2929:7a19:7afa])
        by smtp.gmail.com with ESMTPSA id q15-20020a056000136f00b0031122bd3c82sm9583932wrz.17.2023.06.27.00.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:48:39 -0700 (PDT)
Message-ID: <c74f99c9-c565-8837-79d1-e08f9bfd4a7e@linaro.org>
Date: Tue, 27 Jun 2023 09:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230623081242.109131-1-tanure@linux.com>
 <20230623081242.109131-4-tanure@linux.com>
Organization: Linaro Developer Services
In-Reply-To: <20230623081242.109131-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_004843_667531_054E5C21 
X-CRM114-Status: GOOD (  12.88  )
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

On 23/06/2023 10:12, Lucas Tanure wrote:
> The new Amlogic Meson T7 SoC does not have a always-on
> uart, so add OF_EARLYCON_DECLARE for it.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/tty/serial/meson_uart.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2501db5a7aaf..84d33903038a 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -649,6 +649,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
>   
>   OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
>   		    meson_serial_early_console_setup);
> +OF_EARLYCON_DECLARE(meson, "amlogic,meson-t7-uart",
> +		    meson_serial_early_console_setup);
>   
>   #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
>   #else

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
