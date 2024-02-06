Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC1C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZGoCe1hEU/2hHMzttT59de7dAQruYPz5AjlEcrFubo=; b=v87jjVd2negooE
	6cpJc6Kinp9vY5PvrD+Ay6ZLLkZJ7QNpDGmpNk71527wH3QnyeKezy0GUQsXt7wtVghrUbb7E8KVC
	RPhP/dfMTHYm6Z6mZOLVbC4Pl+DBtLvoxn2ysmTkE1PW406kBquCKE3S+ZRS6nl+DnbvOzUGawuU8
	svcsUQJZrFUkRlAA14ziBV+xl8ufHTJ0U8Eic6O5u4c2r30TIzNH29Ok0zifkk/hRuhvAuW4HpUkN
	B1PCmZTuyIeQr0U56FiHvb/pq6b3+NBBYOlIa2t5H6lHUh4kkuq7yMMeVZnht9RyBsmi1QCcOv2It
	OFXsr2Q1QHloTW+2I7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLY4-00000007jAR-0sIL;
	Tue, 06 Feb 2024 13:31:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLY1-00000007j9a-2CY1
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:31:38 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-511538be947so2106439e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707226295; x=1707831095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LoTutqZs1PohwVYExlU6zJcR7LQGe1CiS/9XMI2fnXI=;
        b=ImmQufzE79U6yXW+c4OnveYohslzlShmQYulO9J4hVZr3G1PgcLjfvFAA9EXUEzcL1
         dX6HN/Zvbfk0tDoU/GXEVLWCZEH3BHYvM/X1M+EBNwedD29B0Uz29TdLJradHPVZqCx8
         E3zZNoejoFvrqqmiF0A86y9O0LS6B+Xq7y8VJEY78POaSwoRMIFQtbW/tqZ6wgpadDUH
         3jOwPEf8wQ2rdBXI1eXFo4VDtb68IsfOdXOZBP19BMkCjbTrroRXtw94fr94lyh/HXwA
         tvCVbSVGm4MIVh43kaY78tNGim6hhezewB9aGmXy0jKcjX0SCByQIIzb6AQsrsb0bN+2
         R8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226295; x=1707831095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoTutqZs1PohwVYExlU6zJcR7LQGe1CiS/9XMI2fnXI=;
        b=tyse6aT0NJUyquSlCV+aLnxq1gxKdl9iapiP6QXqC2yIJKFjt0D7KtZXoMx8JhJ2so
         X480ve2DTJtEI355ak7+b/P2JzdwrxI9w/Jcgrx9up+N0uGbR3c9MGgE6VHXHilmcUPe
         T3/MfTxKO/rpRjgHjC3cd0SDNk+/xhwZGi49mUz6c9xc5fZ0Aq+PfJDkfpz6p7sfVcLW
         9X9F2vP+vHzhwgQ18l4m/pXefPP07WocN1mV9tSnCxfbUxjP2LyDno8w73I6OTjbVyLh
         EzTrNZLPX4W+pC50P6w+lVQUcRntewWWPFnBz6FvD8cZ21rW4xiALnH3ZrUQR0zI0won
         r0Ag==
X-Gm-Message-State: AOJu0YyRlEvvF5XesaNKdvlCv3tGK9Y8hy5ZdYI/CbTBphLpZY6Cs5ef
	USojBk+8DhoZqFUj9BWhFVwN0DpfbgRnEPYsAiOKGD6rCpHcWfaAVIzUMt2vzoQ=
X-Google-Smtp-Source: AGHT+IG7GWlHmaPWxXl4h+3CSJ90uj9AlzoYF2mNtZrlVQ/O7GpE3/NO0HVrvA2MhVJYm9Hv9mc+7Q==
X-Received: by 2002:ac2:5a46:0:b0:511:51a2:e9c4 with SMTP id r6-20020ac25a46000000b0051151a2e9c4mr1832571lfn.15.1707226295281;
        Tue, 06 Feb 2024 05:31:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUmky+nbtNhmxcqc5RgtTCWAnSeaNdM4JYkO4L5fC8mnDXZ1LSHUfw5GlkV5PNa658/a1ieV4p581O3TLvDXdv2rYQQExIh5HphecS5avDbJz8k475GYCuQetX2rVPSDsg/Calm1alGUQQ/p6HHtTRkgMNN+xr2KrvHigc3W0HltCCYTUuEtYVkulIzjHKY5cuk+E8Xk4jtEuTwzeZhsUgLjWSjnaCdGevegxVJ7NGNxm1RRU0sylsft9I62aOKlWlLwX/JfeniI3rPRD7Z0WKzP7MBFjC1TrB51FbI/arFmWubYgRZ6x0sK/9aZE6sz2FzM6MpssW522W8/D+JX95eZexFmE0cq1uScgzfov1W/oo=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z2-20020ac24182000000b005115465c401sm242655lfh.72.2024.02.06.05.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:31:35 -0800 (PST)
Message-ID: <64041a5d-a321-4ffe-ba31-bcf0cad63484@freebox.fr>
Date: Tue, 6 Feb 2024 14:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_053137_602332_E7950353 
X-CRM114-Status: GOOD (  11.34  )
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

On 06/02/2024 14:22, Krzysztof Kozlowski wrote:

> On 06/02/2024 14:12, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>> and the SEI510 board design.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>> Request For Comments to spot obvious mistakes before formal submission
>> NB: on IRC, narmstrong mentioned:
>>> adding dtbos for variants seems to be the new preferred way to handle such case
>>> the fdtoverlay utility works well for this case
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.

Hello Krzysztof,

The only checkpatch warnings are:

WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

This patch is modeled after another patch for a similar board.

Which warning did you think required attention?

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
