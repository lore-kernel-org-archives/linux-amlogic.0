Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A49C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q473GQaA6MhomghGaHjFVcGdAgMmTGtERAdPXJnQ01E=; b=jUlyqAacIFuGIC
	rdMqfPaMp/VDtuAUqJmzXffDiJyqrMfv0RhRxhId5/+WXi9l3kBPYO86bDAHappEXWrJhtMYQYf6B
	oTeiYvo//lGmrQRBe9e0sPK48ObUZwXsqFymxtHpNnEt53G6OyiTj3MDyDolaq8fWM8K99uwlUz7r
	NbfUYbAHfvuSLs8ZctHYIJN9+kKpa6JzmLG1MSq1EnNdShSsKFtJgZRvA8YKPjYYuXj6zGkGEPzvu
	pdRcSopUCnmDdGhI8gTE0cXj52DqkyB07rtAY5inpvVUnh4nKQUPkcPvh/IoeTjovT+qfz4OdAsMV
	00VALrPFuydTSTrFDzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqMY-00000008tgh-2onl;
	Tue, 13 Feb 2024 10:50:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqMV-00000008tfy-0qoq
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 10:50:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d0a4e8444dso47291721fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707821400; x=1708426200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWAT4dAXOAmPSzJEZJu2mOVBm/kxWM32GYkAUjFq9bk=;
        b=3fdbGRZ5Nhw1FGETHpCBs1MOIrNoG5CVhWFw49GDzqkXU/1bblx1H8BgD4VMEM+RPd
         aW9yPvM2eYepI52QiH3YM3HdUtiIHE4lAa8UQbOs6p0/vin6s5Gil843tyWtBiVJ+lK8
         gTXwpid7eEbMskjizej54eMmjXg11HL09G/VlF5NzQsOpw2GtZkKbWuNxfJgnfebs89A
         0oZC3zD7ejy2TaJXi2BGHZoWfzgBW0HHl95rmjEOzzulHnxTRna02oh+MJAL46zeau8S
         re+Y2fGWzDfmS8KohPQUQ8xcsSSx7iDPg5Go48SweMnOSY20frCb5UYigTFzlFqpPlgx
         OhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707821400; x=1708426200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWAT4dAXOAmPSzJEZJu2mOVBm/kxWM32GYkAUjFq9bk=;
        b=Yldi9R9KGCKblxlTH2r3eHwA1InmJg0Xnnvi9nLUZIiiKYdM1qamXcHBTb7wiVFcbS
         9rANpbId+GWBIUY9p3gIz6mJXFu7YM3Ff2ocFYO87IiJwLisg54AL0gLJVe61qLO+gYD
         JQZP7PXhJxt8ScjGI9YjzrLUYFE4P7H6QGqb1eL7D75khs8HzR4ZLoXbqZHVWND3nyTb
         gf84geYOt2pqJU/702KqsIUJhH+8RqF/YmkkQPmtdVJePvNO5qK2s8NDZ62Z4e9Rlo4g
         VxjG9NueIbIJ/qC/zFfC3PT/1d06DICiLmHAPUHLsNInTwABJJ/ItO+AwRuH2R+qSsjD
         G9DA==
X-Forwarded-Encrypted: i=1; AJvYcCXQNY8au/7oFiooERMLeVyZuMtfyn+ovMYvXLUDKToHI/E2BFzZDjHW7+fN/Z4ROpt/1POg4yYUiXrrLpFhAYf3Ss7KqGUAYsxmrx1Ozt5C78E=
X-Gm-Message-State: AOJu0YzZblSP4yN71NuChOyo/mJWlkJIx6IbO5uFvZqdy7bS58pP5+ik
	f4sa9WwbCV24wy1LupDjneL03Q1G9xiJmC6b2/tP/78XE1o/yZW7oAEAGu2U3NsrO3SMvQjuHte
	Lt3U=
X-Google-Smtp-Source: AGHT+IElSc/Wv1gvuH8FjWaxFfv7ZcxxuvK65w2MgZFXxN7uqtz1CXEeAoPbZXxVvsodkBoVzKo6+Q==
X-Received: by 2002:a2e:b0e4:0:b0:2cc:a72c:9d with SMTP id h4-20020a2eb0e4000000b002cca72c009dmr6132404ljl.37.1707821400368;
        Tue, 13 Feb 2024 02:50:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUk7qV/a0HjvQceZkCAKoI0J1nvg2fBu8yg+9/Yq1rRb35oRw5hhiuIA9V9Niz+hGh9EnnSV5bXnmNPxm1ULXhN2oK/rpw4YBTLw+XPfiPvojreUXgGloKDsf3Ih5vxUCRigQpDswYX17SJEUbm2+6AF78O9hjQqvCbQFWQ+SxQrCNDBE2+yHiEsjb+BgEfianEY7rMp7Qki/XpelAreluz4J2irD3v8vgJMdHc53iRnhhvDnM7zEhb+LOr5NpwG7rPCUceCZdMyH+tUKoE/AtioXLz/AkDapuEHLQZnfDATa7RXI7WoFRsV3u6kIpCUPUGyqWtQYO/P2PM90Hvngev41IUY57lSiMPRExUDL0XT8=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z3-20020ae9c103000000b00785ae649de0sm2844148qki.97.2024.02.13.02.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:49:59 -0800 (PST)
Message-ID: <b6a02f8b-8782-48bd-8916-36bbd996d4c3@freebox.fr>
Date: Tue, 13 Feb 2024 11:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: add fbx8am board
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <7ff2d053-7645-4016-99b1-646242463547@freebox.fr>
 <76638bd7-f290-4729-8d15-98e1bccfbb40@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <76638bd7-f290-4729-8d15-98e1bccfbb40@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_025003_466676_1A511F2A 
X-CRM114-Status: UNSURE (   8.89  )
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

On 13/02/2024 09:42, Krzysztof Kozlowski wrote:

> On 12/02/2024 18:51, Marc Gonzalez wrote:
>
>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>> and the SEI510 board design.
> 
> ...
> 
>> +	ao_5v: regulator-ao_5v {
> 
> No underscores in node names.
> 
> Didn't you get such comment before?

For the record, this submission is, mostly, a copy of meson-g12a-sei510.dts

Thus, I did not consider diverging from meson-g12a-sei510.dts

$ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | wc -l
6

$ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      ao_5v: regulator-ao_5v {
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      dc_in: regulator-dc_in {
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      emmc_1v8: regulator-emmc_1v8 {
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddao_3v3: regulator-vddao_3v3 {
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddao_3v3_t: regultor-vddao_3v3_t {
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddio_ao1v8: regulator-vddio_ao1v8 {


IIUC, you're saying it is preferable to fix the node names in new trees,
even if it means diverging? (Using dashes instead of underscores?)


For the record:

$ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts/amlogic | wc -l
397



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
