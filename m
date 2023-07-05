Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86B7EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiE61KaKPaxVPtqFsng8ut7pvQ26OJVfky86i430AjU=; b=ePYHpQUMfHY/1M
	RnGEpoPBnwZj0Xb1WhEpHRIG+4caJz5JBfAS3SyVDOLsfQLAVK1ZYh+P+epk/xLOlunCufNC/PZHh
	BXFu/YjZcUubpZQpuD16QSOKgxEdAkfEhlDKD4mP6ba51Ya1aOgMhniz+KLbcW6R5RzgHlsDPHoNJ
	tKFzrUDN1zBoBOXZ18d/YEKdrNvamqysCgWGk77rimZfUUVuQxdcYwUO8uEzCKaU8WlA6p83+e9qj
	QTXtcJUQVYatYZSOupVhVj4Dw/GdhgeqaJGw8kCgFYbqOQb/qCEkVquoEuQS2uT/DZpkNCnvt2/sw
	9fYd7W20MVdzgH2FAnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Yn-00GxQf-15;
	Wed, 05 Jul 2023 19:53:09 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Yl-00GxPD-1J;
	Wed, 05 Jul 2023 19:53:08 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3458a08310aso30965255ab.3;
        Wed, 05 Jul 2023 12:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688586785; x=1691178785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y45aTDzSTQD6CGxFP2My2e1zQpvSPUcKTCZkKn80Qfs=;
        b=YlG4beItjv03XxYoFoRiqrKNij9aZVWw8OyGBKP5tC5O827ZvNWp8+W3mv6TF7DDbp
         F2Xoe8oihofrAJoFGR6DAIJkdhxM0vF2VLONVSEe31/FIcacn9NbiLzdP7seOZ+ZzZNI
         9bEj6w7ruK/J89Z9pS3u0BlZY9JE1lGjTVNOZPmnB4XR9Jj88BDcuOyvVjCgeG5r8J3j
         PoxoVS1BVKPFCcD3UDmWtVXo0nR42c2lR2oTqdTciOb7S0wx2g+FU9/6+rGmNspH79uN
         XjZgQ2nyiW3Coz29PcccsvTyBleq8vFwgbXjfwtGhKZ5Zso/8gl6mqlQ847J0tEFgUcK
         3thw==
X-Gm-Message-State: ABy/qLZY6jW7+NwNOUzRBrb63+YQSHQRtcQak7SaQ4HPu7ME19sYbfMI
	BvWV2b16opPNerzhuOyGGA==
X-Google-Smtp-Source: APBJJlG849qoygO19N3NJ7tJkbVASz+SkcxxwDLkmdq5oiTtzbDaYXe0Djxd06jEC+Rq5kaeoS1mfg==
X-Received: by 2002:a92:c647:0:b0:346:46e:209c with SMTP id 7-20020a92c647000000b00346046e209cmr115663ill.22.1688586785208;
        Wed, 05 Jul 2023 12:53:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y24-20020a02c018000000b0042b4b1246cbsm1994291jai.148.2023.07.05.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:53:04 -0700 (PDT)
Received: (nullmailer pid 1732499 invoked by uid 1000);
	Wed, 05 Jul 2023 19:53:01 -0000
Date: Wed, 5 Jul 2023 13:53:01 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
Message-ID: <168858678149.1732437.11783574032549132078.robh@kernel.org>
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-1-22be915ddc3b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705-b4-amlogic-bindings-convert-take2-v2-1-22be915ddc3b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_125307_439632_2BED6FF1 
X-CRM114-Status: UNSURE (   8.98  )
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


On Wed, 05 Jul 2023 13:41:51 +0200, Neil Armstrong wrote:
> Convert the Amlogic Clock Controller bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
>  .../bindings/clock/amlogic,gxbb-clkc.yaml          | 37 +++++++++++++++
>  2 files changed, 37 insertions(+), 53 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
