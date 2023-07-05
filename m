Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F567EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIGcLKZox9KP3L21eIw1ZBomiFyTz8wnd3mqDlINTys=; b=doyRD/jBobFwzV
	GtuqDfE61jswn9kNQK97BNOrSlj209bQ+MOXZkZj3dDKqv3qwGMO1wpE9CYYgR739vg1g0H9TG5nq
	MhyBfGmxruLdtfkfIzVIQpWkS2gke2dAvvVH67tKtluvCnT5KXuqPSd0LJEwtWY9ayfLL78YORtne
	P+VF9WYl09bovWSMU4AY5DcD4AX4v9ijv2eDIBrUZwMEE7taO5tIvAAj31gMQ7UZ7FACd3cFe0f/I
	HoxdPHktJJYb5vUtu7D7223Vvl400hAMyoq1Aq1IB13S809LyjSwrr0/GVwtJOgHLjOJ1966AUHSe
	c5SW7qnKdq0DqTzpRk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8dr-00GyD0-3C;
	Wed, 05 Jul 2023 19:58:23 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8dp-00GyBw-1f;
	Wed, 05 Jul 2023 19:58:22 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-78372b896d0so270741839f.2;
        Wed, 05 Jul 2023 12:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688587100; x=1691179100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWR4rzgRzJqw8ZsrwBvfIC+5CsnJGVSJ/W7SY72QRJs=;
        b=l3JVnGRQRbTq6bkxXudHQh+hhSUwhG/JG1ZbHiNmbF8DM6K/uke3id6DogQms1PdJA
         lrpt8hw5tdhOUDrns1HzPcLHrtOdjff2JJ8xWpq5RdFqGRxyfuNvSZXUp/4CdXY1uCAJ
         +gWr3V/MEZCpuqPbgjGgsjCOt41NSy/A91jom4w2q7+/LLJs9Qn1xMc9GGEusloFHepK
         lsRP+WCN+Mwa4KrXMFvRszbYPz0LY9OaG1FTZLUj7A0yHQpHsFGp9mxW9JyNtsjVxSKO
         2VA2yUQMR44pWuZ9q5E1N+JnAqZqwtJgZ63fIt2Yv755XQe5J/HJrVuvozwW69iVHKJ2
         ZVjw==
X-Gm-Message-State: ABy/qLaJgzovR3mid6BM70zH8tXq/lul3oIX8o9N5yhjBtW2DE4Lvawv
	qzUost5yw9ruuSjTeJHhwQ==
X-Google-Smtp-Source: APBJJlH+GhulCs77gC1uUiQFuq4jo9mjgirVmZ0inqvPVdAxFQcR+RjE/nzGuZy9qJVIo8aNC6PGXg==
X-Received: by 2002:a92:4a0f:0:b0:345:6ce1:d24e with SMTP id m15-20020a924a0f000000b003456ce1d24emr124971ilf.22.1688587100082;
        Wed, 05 Jul 2023 12:58:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k16-20020a02c650000000b0042b3bb542aesm2613192jan.168.2023.07.05.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:58:19 -0700 (PDT)
Received: (nullmailer pid 1739539 invoked by uid 1000);
	Wed, 05 Jul 2023 19:58:16 -0000
Date: Wed, 5 Jul 2023 13:58:16 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: soc: amlogic: document System
 Control registers
Message-ID: <168858709644.1739479.11332380287477883638.robh@kernel.org>
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-3-22be915ddc3b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705-b4-amlogic-bindings-convert-take2-v2-3-22be915ddc3b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_125821_576563_5F8107A1 
X-CRM114-Status: UNSURE (   9.93  )
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


On Wed, 05 Jul 2023 13:41:53 +0200, Neil Armstrong wrote:
> Document the System Control registers regions found on all Amlogic
> SoC families and it's clock, power, pinctrl and phy subnodes.
> 
> The regions has various independent registers tied to other
> hardware devices, thus the syscon compatible.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
