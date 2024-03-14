Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F591C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbxfFcwVQGIivNWZSwJ0Yto9RYW54lV/92d5KqxVcwA=; b=L5m4w1RsxdIyVb
	6SIHAHoqJgcIh5q8+zPcIYXI8kHPTjMR4fzMe7P/edDMq7tjxrp/m0Wpfu9+RltNsgwdDdPzV/UUi
	QQFs5g3vfkZ6b+u81/v8b/v7PwbClUosZns3wy2hx5KYpc+1eYKC4VVeKi76fVS5RrZPWJ/I2ba/K
	zq/vvOCODpG22xXIe/z0oO0dn1i1UCGx8vzZHYfCSopEVVFEjbCnmfGg2JeiO8YC+lHdDAa9ub/Oo
	O9biEd+H3jhnuOTKAvu8m89GCoa0oI9K8SyuhD6Uu7mbiOcHhZGhQvU0M0qh9XAQ909vZiLMDtd82
	qaFqYB/WIy18KtTmLdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklBI-0000000ERTl-2KUB;
	Thu, 14 Mar 2024 13:31:36 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklBG-0000000ERSt-0zh2
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Mar 2024 13:31:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d41f33eb05so10742431fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2024 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710423091; x=1711027891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPkhUSdcqdsN9V6zcu4BRhpYFnVUNXONuARlNbPZEbM=;
        b=LhTU6XB+rxshhLgyNjc8d3ncS8ZUaiaPhIW9T2HkjWF1DMyGZ9dWWPr9EtyjkIDWFg
         /Hx8oHw6wnm+UAgW2vadKa5KSC9pKVKTTuq39uYQ2p7YnKk8Q+1Dulq31VmYlXOpYL7h
         i67LsWQurLGS67TqF9KAQ9vWIoXwAhv1hzO80RBBq6LrS/YrVONpaifWMIqDBaGK2JFx
         ahOSJyoVqOfl1QZlFQDeMzabRIxEofzQC5Tvek8WTVaaQ6OPZX2gKulGgwZbRcspsRpQ
         6HSWJ8nfjAMjNkSg875Vba5TFwBTFmqb7EwWPxem1DKdQFDQZTIJPISjaPGyi5hLzSYg
         T3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423091; x=1711027891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPkhUSdcqdsN9V6zcu4BRhpYFnVUNXONuARlNbPZEbM=;
        b=tnounZ1rgv+1ItJHfHE03WoQVMBafsIH4hGbS8MuHNf0asUZF6VPtsjU6Q7bLpGMod
         CHyZbLjovHfloMax0IIWkme0mrfQ/tD2PTMLRO1QQ1Q1AGhjohvuhxT57PMyrBaA7ryC
         FDett0qgaTdV1VKWwPLHCrmt/mARCsnrtwdP7CWhPBFlkH3fBZNXZxupOHrEFTWhlr8i
         V76tUOzYVYOXYsuMO+7yKfg1dANwOFtwAF8wfnBmwz65xxjcLcuh7VZhEme3pyVh3iug
         yUSjIOTvIjsYq4s7mJg+szzB+79pbUVdKzSO0ZRnTGFcSMELy/87Fdgh3QUof0+ACOsa
         1PBg==
X-Forwarded-Encrypted: i=1; AJvYcCXJDuyty07wp6rPffvXDFm7rySEbU5Ttxoq/ztUroc/SLKlXa0XEqxe0lLfijQ5hS59oF71orsf8kXqTf+gUGgFSjG2qoc9oq5/d+RTWRM6VGY=
X-Gm-Message-State: AOJu0YxK5sdeaOX8qS4nFw6NwM3cjzdyzcEY7CwtMdNXCQjfy0Z6ghxM
	+sQK3dpU9R1DrnRl1Osphrn9c1frPrJBwYX4lgAfwxKbWiNl27/cowa2bu7++UA=
X-Google-Smtp-Source: AGHT+IFaLoDN+qWeQtwjKCiJXBGDygA8rVYQTs6JwGP3mrfQKiP4eBl/sU2zeSEoZ48NYtXaxNHMlQ==
X-Received: by 2002:a2e:9019:0:b0:2d4:7829:4d11 with SMTP id h25-20020a2e9019000000b002d478294d11mr8773ljg.39.1710423091372;
        Thu, 14 Mar 2024 06:31:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b0033e052be14fsm767561wrm.98.2024.03.14.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:31:30 -0700 (PDT)
Message-ID: <df615536-8034-464a-8dba-c890b70edc1f@linaro.org>
Date: Thu, 14 Mar 2024 14:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
Content-Language: en-US
To: Viacheslav <adeep@lexina.in>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20240314070433.4151931-1-adeep@lexina.in>
 <20240314070433.4151931-3-adeep@lexina.in>
 <111346d3-8357-4ca3-9249-a43ebc225fcb@linaro.org>
 <9292d2ee-138a-4a59-9c96-31c1b4473a4e@lexina.in>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9292d2ee-138a-4a59-9c96-31c1b4473a4e@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_063134_352882_B91637BF 
X-CRM114-Status: GOOD (  26.43  )
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

On 14/03/2024 13:22, Viacheslav wrote:
>> +
>>> +	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
>>> +				    GFP_KERNEL);
>>> +	if (!soc_dev_attr)
>>> +		return -ENOMEM;
>>> +
>>> +	soc_dev_attr->serial_number = socinfo_get_chipid(&pdev->dev, fw, &socinfo);
>>> +
>>> +	soc_dev_attr->family = "Amlogic Meson";
>>> +	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
>>> +					   socinfo.v1.major_id,
>>> +					   socinfo.v1.chip_rev,
>>> +					   socinfo.v1.pack_id,
>>> +					   (socinfo.v1.reserved<<4) + socinfo.v1.layout_ver);
>>> +	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
>>> +					 socinfo_v1_to_soc_id(socinfo),
>>> +					 socinfo_v1_to_package_id(socinfo));
>>> +
>>> +	soc_dev = soc_device_register(soc_dev_attr);
>>> +
>>> +
>>> +	if (IS_ERR(soc_dev)) {
>>> +		kfree(soc_dev_attr->revision);
>>> +		kfree_const(soc_dev_attr->soc_id);
>>> +		kfree(soc_dev_attr);
>>
>> That's a double free. This was not tested.
> 
> 
> Please, describe the problem.

Test your code. What's the point of arguing over it if regular test
would show this?

> I don't quite understand what the issue is:
> 
> - kfree() releases memory allocated with kmalloc()

So point me where is kmalloc(). I don't see. I see only devm.

> - kasprintf() allocates memory using kmalloc_track_caller()
> 
> Technically, I see no difficulty in freeing the newly allocated memory. 
> In case of memory allocation issues in kasprintf, we would just get 
> NULL, which kfree should also handle properly. Considering that we don't 
> need soc_dev_attr anymore, we don't need to worry about the contents of 
> .revision and .soc_id.

Please pay attention that my comment is under specific line. We do not
discuss unrelated code.

> 
> I see that kfree_const has crept in by accident, which is essentially 
> needed here only if we replace kasprintf with kasprintf_const for 
> .soc_id, but it does not introduce any erroneous behavior.

> 
>>
>>> +		return PTR_ERR(soc_dev);
>>> +	}
>>> +
>>> +	dev = soc_device_to_device(soc_dev);
>>> +	platform_set_drvdata(pdev, soc_dev);
>>> +
>>> +	dev_info(dev, "Amlogic Meson %s Revision %x:%x (%x:%x) Detected (SM)\n",
>>> +			soc_dev_attr->soc_id,
>>> +			socinfo.v1.major_id,
>>> +			socinfo.v1.chip_rev,
>>> +			socinfo.v1.pack_id,
>>> +			(socinfo.v1.reserved<<4) + socinfo.v1.layout_ver);
>>> +
>>> +	return PTR_ERR_OR_ZERO(dev);
>>> +}
>>> +
>>> +
>>> +static int meson_gx_socinfo_sm_remove(struct platform_device *pdev)
>>> +{
>>> +	struct soc_device *soc_dev = platform_get_drvdata(pdev);
>>> +
>>> +	soc_device_unregister(soc_dev);
>>
>> If you free the memory in probe() error path, why you did not decide to
>> free it here as well? It is symmetrical, so this should make you wonder
>> - error path is wrong.
> 
> This is something I can easily explain:
> 
> In the case where we have successfully registered with 
> soc_device_register, we clean up everything that was manually allocated 
> and not used.
> In the case of unloading the driver, the cleanup should be handled by 
> the soc_device_unregister command.
> 
> Technically, it's not possible to insert memory release because until 
> the command is called, the driver is active, and afterwards, there's no 
> guarantee of the pointer's validity.

Then you do not understand lifecycle of device. There is release here
via devm. Exactly at after my comment, when } finishes.

> Perhaps it would have been better if soc_device_register copied the 
> entire soc_device_attribute structure and took care of memory allocation 
> and release itself, then we could comfortably free any excess memory 
> back in _probe.
> 
> Are you currently recommending not to release memory within the if 
> (IS_ERR(soc_dev)) section?

You have double free which will be pointed out by testing. Yes, of
course I recommend not to have double free, so not to release memory
which is being released.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
