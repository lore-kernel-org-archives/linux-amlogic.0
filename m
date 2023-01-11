Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CABC46467
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30a5v+3oPFW+TXCOXGIcUvtYh8PpxUEf7uq2LCtywVM=; b=IXJVy7WmxoEjvF
	mALUoa5LyEv7ErKR4xJ8q4rgLueSgpLs3N6fwvDLSnGd6qPoIANbfqKvU53eV7SLVzzq2+AG5nVzr
	0LJqXA/a0Y3PZmtBgOjhtPVaNvDhPsLifdZFh6Og1rFYDC+BSSa4poqfDLQddJcDqDrvkM1mAOd9Z
	nUqSAzjpU4ddhiLH1K01HY5leKCxGJWi4DGVdTyOWk1kjZSUDkAyFFd5iD4212CsBzRXzJqHqxu0u
	P0Vf6YA9bUOgZ0CbYmWevF2KCrBg+RF2dRMStXw4KFN5w4k9um183qYdqbMgPcqWmXCFrLgEdg+LB
	QO/WgDHWbJAAYHUycxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbXS-00Bgrm-7W; Wed, 11 Jan 2023 13:53:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbXH-00BgpB-PI
	for linux-amlogic@lists.infradead.org; Wed, 11 Jan 2023 13:53:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id bs20so15091634wrb.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jan 2023 05:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbnCP+ufAhmrYYqJ2oavTnwAk2TMmTuAwDsYylfghJc=;
        b=GgxMAHoFjbR5is4gm57AvvDPVTMJMxfaquYLJCG5Od5GPpv/iCB0ZIkAFo/Izkzhfz
         byxVVvkbw/9YZ422FFI7pbCH/W9Z78PDlvGcb342TUjXrcUy5A+YY4UAxhoD3b/bRrjs
         kbN0xPIzDetf7fNXIZGOgbKWjV+1tVfFEQc8aILH8NgxF9fCXwvlcNRzMbRYATKgnxYX
         fLU6UFs2CWYnS5LtX0KyhmSKSxXZ+53Urqj8WFcRScO1BbrPggc798Zm1dCjHKrFnFhI
         zTm2r31TEs3ga9tDK3B1C0P6NK3XlJ73/nkyMx00zUAX8o+5LadnlthWH85miAcOWO61
         ooRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbnCP+ufAhmrYYqJ2oavTnwAk2TMmTuAwDsYylfghJc=;
        b=MD43nm24SllH9nQLvHZXtwQj3tmopZEMpBHAEU0dHy8ZZFkco9fKJPr5k6h8kSPGJ3
         Z++GtA9sn1ct6KEFFp+pUYuWNlcpBPMAz6J4NTJ6n10+JgiF1PPx5G3+zbQF0S8xMOUo
         UU9wQRXnbfns5YcQdc081eAYMcQKNiO6ZnMxcgGMtiu1xPHanRR56LaPLH/u/QvpAwJH
         gVZnT68n0NWaEFb/H+fw8/ZiHJuaXbfDvsypacwunqtGT6Hn3/IiLygnW+sLgHX4fk10
         fLXxNJ6pF+Eroi5218a2vnfU/cMGvw6G4X3nXEocAJe+ahdkHkUD89HO8eDIHHE3m0VF
         Gwlg==
X-Gm-Message-State: AFqh2kqkprmfuytvhLwawAbImlIA9m7kU1oxbxEOAx3X6VJO8HqJfgjB
	Og9ko3sN1cWGs1izQHmkquCKyA==
X-Google-Smtp-Source: AMrXdXte2o2k6td9/a4v4BCFUbyJiICVxWmJWqLkERIA5CBCMCysgQeeJ2giSqAqXFAw0U1OcDZeWA==
X-Received: by 2002:a5d:61cd:0:b0:276:d6ba:4b91 with SMTP id q13-20020a5d61cd000000b00276d6ba4b91mr39805222wrv.47.1673445175184;
        Wed, 11 Jan 2023 05:52:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d4882000000b00286ad197346sm13946571wrq.70.2023.01.11.05.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 05:52:54 -0800 (PST)
Message-ID: <936ef253-c98b-8cc7-32b2-69a44f964569@linaro.org>
Date: Wed, 11 Jan 2023 14:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC unit
 address
Content-Language: en-US
To: Vyacheslav <adeep@lexina.in>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, neil.armstrong@linaro.org, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
 <39ed8a13-8b27-80d4-99b8-5693ce6d3f58@linaro.org>
 <479859f7-580c-28c7-d085-b65d2443e4cf@lexina.in>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <479859f7-580c-28c7-d085-b65d2443e4cf@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_055259_824246_EFCAB33D 
X-CRM114-Status: UNSURE (   7.64  )
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

On 11/01/2023 14:20, Vyacheslav wrote:
> Hi.
> 
> arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> 
> line 236 has eth_mac: eth_mac@34
> 
>   * Should that be fixed too?

In general all incorrect namings should be fixed, but I proposed to
combined it here since this was touching this line anyway. Change of
case in address is same as other style cleanups (like underscores), so
just do it once.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
