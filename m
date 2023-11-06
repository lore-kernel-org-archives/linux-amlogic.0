Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157EC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmuJ1UtlFtceE9G9s7Z/63zLolbqqWiI/rH62f4X70I=; b=C3qKAuPnef/hrs
	f1DMaGSfd5hw3OEm9GO9QxGdksYoN7YOGZRXSbxgWA2QtXn7sD2WoZrxRiGC0Yth6IrQIMx3cvPyD
	AO6msMRRuUHpxYw6nocJkpdhoP63H27Z1LbmrOvvHWe4UABcdb7P6PlwYnYdag7E12r1gIumZ6FB9
	58/ttGNeB/q+iBxUUzyLDZTrslIgGW21p4bJQCc+BtUQ3aovk90/h8nhHYeN1LAubK3srtJstQmI0
	O3sL24L0JHPvfFzzVb47QL6nbLwczyUiY2q57873KmDESHyaBoHxmg2cxG5g0OMYRLlrDitj2bljq
	cTJca79F6T3mYupCFDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzx4s-00GGiN-2J;
	Mon, 06 Nov 2023 10:43:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzx4o-00GGfw-2o
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 10:43:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507c78d258fso5576503e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699267400; x=1699872200; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=EK4l5HF7xxlWSQTYmo3dGoTvrbNSR6x1ONnxE49iyKE=;
        b=sgAVy/3IAZvAoIBE7pavYtWAgHmebdIG+4+zDBjyRQQM7oNuaGLp821M28T7E1ZDZ5
         IDow/nTGwVs5TydB4djX4DOchpQ16TIIY6yPukKIoYboN3nHObxafilQPDxr6vs5/r7G
         4O629XUkxKfjqyo9h9E5MDIsuMTiw2w3ZLiQmpgUbmX728inz/lwI1+EaaE3NVpUId14
         kgRHTcUs9x6ncY8GAgFZeUOdLysQKI04lJ1Qezzo6RtbJ2hqMp7iSkvaMELmYnOQDlmz
         fm/rSftdv8XULt1SXa4w/NKKpdY7VmotOXGl5/ie6ofTI1Ag5R3wwO3KcfcTLSq2xC5o
         FSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267400; x=1699872200;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK4l5HF7xxlWSQTYmo3dGoTvrbNSR6x1ONnxE49iyKE=;
        b=bXi0HbG2oQfJNmxanfleCLwnrwe7TEISyUMNek2favVfYiK7mfXZUhvkYI4Wtk96ib
         Kaz+eOpNdq4Aq51AOjc34pjkvArc71TPRztO9al3PZwagrh9mxn+FYH6aSiGpHqUZfxj
         PZ3vLajgHizOuAXXqVrmHNszodKnpgb3ye3ufLLgn5G+/y5lZbKVVY5wajxOHI86v4OV
         c6+7rtOvipRZVi3cNNrSVI1Hj0cRc2/4zrgIYHCBS/ud/jBLVr7RMb/53LwwSOhi5oc6
         p77l6vmkwSbtOE3aZ1GoAVdRCCOHbsIbVvwan9oM4bG/mnET9Ac/YfjrlVcxZ7Mo8HQy
         /vyA==
X-Gm-Message-State: AOJu0YzJ1pKw6B7F42pXUXzs3Fu876N+F21RQ4fOSKUX998oPlz0UXi4
	EJWY5JerD64vS5L32xnyJaWvbQ==
X-Google-Smtp-Source: AGHT+IEuY4dAFuRUFbRqk9ROoWkyBZI0vf/LOEPY67+q6fLgjVF2+PrZtaJdiEfkQaX2csVRK5qlZg==
X-Received: by 2002:ac2:414b:0:b0:4fe:1681:9377 with SMTP id c11-20020ac2414b000000b004fe16819377mr20084251lfi.44.1699267399986;
        Mon, 06 Nov 2023 02:43:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d58ea000000b00327bf4f2f14sm9113326wrd.88.2023.11.06.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:43:19 -0800 (PST)
References: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
 <569e39a0-b91c-46f1-b55d-c9324d66339b@linaro.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson SoC
 support" <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH RESEND] arm64: dts: VIM3: Set the rates of the clocks
 for the NPU
Date: Mon, 06 Nov 2023 11:41:48 +0100
In-reply-to: <569e39a0-b91c-46f1-b55d-c9324d66339b@linaro.org>
Message-ID: <1jy1fb9n7d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_024326_912664_F82F0B07 
X-CRM114-Status: GOOD (  10.52  )
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


On Mon 06 Nov 2023 at 10:26, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 06/11/2023 10:22, Tomeu Vizoso wrote:

patch title is misleading. It does not target the vim3 only but all g12
and sm1 HWs.

It should start with "arm64: dts: amlogic: g12: " instead

>> Otherwise they are left at 24MHz and the NPU runs very slowly.
>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index ff68b911b729..9d5eab6595d0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -2502,6 +2502,9 @@ npu: npu@ff100000 {
>>   		clocks = <&clkc CLKID_NNA_CORE_CLK>,
>>   			 <&clkc CLKID_NNA_AXI_CLK>;
>>   		clock-names = "core", "bus";
>> +		assigned-clocks = <&clkc CLKID_NNA_CORE_CLK>,
>> +				  <&clkc CLKID_NNA_AXI_CLK>;
>> +		assigned-clock-rates = <800000000>, <800000000>;
>>   		resets = <&reset RESET_NNA>;
>>   		status = "disabled";
>>   	};
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
