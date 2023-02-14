Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE8CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 06:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyOFDLxnkSTJ7qBcZp6D8YyBeRqNERChaiKGFd1KEe8=; b=xsEkGGp/bwDVlp
	sCPUltT8hU1Qr1oRmxIDtXaOR54IeiDG2WTFE3p4RUNAJjpHo5cN8MQ0xJ9LtynxE85XdMNxh1UZ6
	YJSdYnN/Opkne00giIqzi9v+R7Zt9T7OlSoZR85e6WYfwZKRj3yTlV4Svsr4hUy4e+HB/OFp3IbKu
	WisY5VJrrTaPgWiibe5200AyAJRXP8Wn8hfZKW1g1IT0NYbjMN+jh6NEa3O8pExt/E3vxywDWPs8t
	7qpt/lgys2sCdhrI+keOYI8ySgQlmoQx9FjGDKZ9hNskvPSyxtxPqBcDpfQrg1FutpKXSe5vbUxX1
	j5HdYOnO9ugvPjQvUKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoyb-00048Y-4i; Tue, 14 Feb 2023 06:39:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoyX-00047e-Lk; Tue, 14 Feb 2023 06:39:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c1so12126060edt.4;
        Mon, 13 Feb 2023 22:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nhKjEH7r7Yngny/ZqXBLs863BYkcnxD7fB2ffD3a7g=;
        b=KhWzA/nWCJvJ2hbMirUFPhS8xCzZHclfVulD8YuxpThoyqWehSBjvsNhvnOe3VdaDf
         YPtyvyV0wG+xt3KQtwMxlPBvoSbYADr8Dt4s3x8dVMOVMvKauMYdZm34koT24XSqym4c
         O9+dUP5UPdv8Xaz5j43Ht8O/P1mC6X8gGKNsz97bra1IxWjYqN2UHEzwmTsswMF3/v1A
         W68kxqUVGEBTtXr9EMmd7PhIuyK++Rt4/TmI9jOjZ6RGw+2iJdLPjDYnmADMYxdFuQLZ
         Q7JECb7Kc2EaCbk1JuTCAj4aNKd7GcXW/KO+ODfdlPE22j/a654+OUDJVee/JRnFNXzB
         1SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nhKjEH7r7Yngny/ZqXBLs863BYkcnxD7fB2ffD3a7g=;
        b=Vw4P7Nr7Y73j7/Y74d4yq/Eb53DY2Ce2HifKPyMledwfjlNrhhJtODbN/PJPk8NcPA
         GIuviUq7MJBh5F3twKR5mki0jrCrfvvAKIMn3EIGaty7ksFqvOkuuWnfgYJyVvSefG/o
         yhjMwRWh37SV+IK/QJCSz4RKU5j0Bzl4s6DtYlO/8rwsuMd988sHdIJ0WEgEvi+E9ICh
         Gn0m3ANPaHJ+ZrtKPo0M0l42yT0otY/KiPt71C0foNNnjKBpE0FHWNmg71fuh2LzE3Pc
         a+PZ892YUgxkfBHzLSISXJVaVHc7QbW4uzx/m/MrLtpOjo/2GgXyBbW4kkFKDkPsmao0
         P4Vw==
X-Gm-Message-State: AO0yUKVpiYVg1uplD2ybzCT39k4iRhgPQHQ9JI4RoHVI03Pv/ooM36Uu
	0tN6oxImXuopcs+9S+1i/Qg=
X-Google-Smtp-Source: AK7set9PbG2cD/G9Z3G++ccd4S18aj36cUCelMQMgZtNzRwkqZcEIIf5LzkYL24nqTWJ9Q7yLQjwGQ==
X-Received: by 2002:a50:ce1c:0:b0:4ab:4c36:463c with SMTP id y28-20020a50ce1c000000b004ab4c36463cmr1180023edi.16.1676356774649;
        Mon, 13 Feb 2023 22:39:34 -0800 (PST)
Received: from ?IPV6:2a01:c22:7234:f800:3c3d:a22e:c2c4:b19f? (dynamic-2a01-0c22-7234-f800-3c3d-a22e-c2c4-b19f.c22.pool.telefonica.de. [2a01:c22:7234:f800:3c3d:a22e:c2c4:b19f])
        by smtp.googlemail.com with ESMTPSA id d1-20020aa7d681000000b00499703df898sm7360254edr.69.2023.02.13.22.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 22:39:34 -0800 (PST)
Message-ID: <ade6669b-9a4b-094c-a485-fdc8c7f5a8c3@gmail.com>
Date: Tue, 14 Feb 2023 07:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] mmc: meson-gx: support platform interrupt as card
 detect interrupt
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
 <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
 <CAPDyKFrsTMpguDp+0ZrKYkH5CYSk_OgKLxuZu4tFoGYaLpbJUQ@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAPDyKFrsTMpguDp+0ZrKYkH5CYSk_OgKLxuZu4tFoGYaLpbJUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_223937_764484_D9A503C3 
X-CRM114-Status: GOOD (  14.15  )
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

On 13.02.2023 23:47, Ulf Hansson wrote:
> On Mon, 30 Jan 2023 at 00:10, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> Use a new mmc core feature and support specifying the card detect
>> gpio interrupt in device tree.
> 
> Don't we need an update to the DT doc too?
> 
Right, the binding still has to be changed to allow more than one interrupt.

> Kind regards
> Uffe
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index be1a972c2..c87bc31d0 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -1236,6 +1236,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>>                 goto free_host;
>>         }
>>
>> +       /* gpio card detect interrupt */
>> +       mmc->cd_irq = platform_get_irq_optional(pdev, 1);
>> +
>>         host->pinctrl = devm_pinctrl_get(&pdev->dev);
>>         if (IS_ERR(host->pinctrl)) {
>>                 ret = PTR_ERR(host->pinctrl);
>> --
>> 2.39.1
>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
