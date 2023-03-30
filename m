Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8961BC761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMWn3sGe1QXolkEbSHWsrGwlxVoWw//Dht9exkiRQC4=; b=izKA9tqofrTEn/
	nXN4YAe/KluJyMibdS87SZXHLm9CvNrUibEkcqix0/Vu3dWN0vpUa28qGmvC2FdEJA9o8gJeHycKI
	wXQkuF/g1Yu+lSxEU/b4n3wNkfvVeyzONwB+xS7O+S3af9rrmHBp0j32r1QqzWV1iqQ6VFW3fNv3J
	wQcxN0hOvgghW8ehi4qqukT+ltCae+NArIKM7YhGvMBnxzdVgmHMHkuzRPCB1aIZP/1Mn7qQ5kdzD
	OcIdmKFFPK7iXvdH6EzSnpQhzSHUKqIcsiLCLhywdqt16pX0OfeJjdm2JXV1ZUuiJkyy7kzjOKVbX
	lAOJSnGmVEZn3WwhE2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmkW-002tqi-0o;
	Thu, 30 Mar 2023 07:31:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmkS-002to7-0H
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Mar 2023 07:31:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id l37so10279580wms.2
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Mar 2023 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161460;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUX3Tzegj17UnE0hZyGQmi2GdvNc02HxGqTB2+a5Gz8=;
        b=Qlwd5HPPBFd213yHc2eI14pWMFFCVwFZBZZRHl/qI+nuV2wE56C883LJ+eQdquNWn/
         uQSG/tPF9cfZUiAUc6usBGPbC9+DaCq/6Zt3Eqtm5ODakJ/yRlmBFcducl1veB/tUlvv
         1NM5zbmHWnC/arMlvuwksYmdOrq3AVDXtcsBYk5bhoiFj+o/45i+994Z/gQJdsX2FdmM
         OhIWTZi4yy/krinSWcB68OA25K1lVzYdsAkjKjZSLcku4BxdwfO1ZhWoyy/iy4ESzgd+
         20jsMAJlSHWp7e0nGNvjAnUZp7dxGk3oGmKbRyDTgYFOqYJavbT/RE3w5UXt5LChDZdf
         7CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161460;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUX3Tzegj17UnE0hZyGQmi2GdvNc02HxGqTB2+a5Gz8=;
        b=h06H5+dY0VYi6GglJHBhXSfjBewSv+R2EWOKHBj/mRmHe5CDNiLBTUDHyZvAcwTRwf
         IjU2DdxeilxbPrRPCWeSBdQPvIiw6PZ6IjGL1qQKT4sR9JkIxhqFH2hcfrKUBJvhAikr
         NTBueadJtZL03RSLLh6uZQtyqsC9IiRc1V7SggFzXfegeWLIArSfSSibM3nZC2zwARFh
         ZmHFpwqFb2BJxh8WhI86hoQboQ4qkpp3XrGtOClk2OoiFprvMVVfDmMFtjqckbGVKM4O
         ZfJGDpf5B+J34Rp0ubHVPCVt8z7z1h3W+nOhMVAGkXxLny5OYTSf03wXlvasv6CNs4kL
         O6nQ==
X-Gm-Message-State: AAQBX9f9YNuz+CkhDnRRG4juLLPR417eQ5CO907u2ZhvkkHqM9DGDAsN
	PUtis/j1ZZDCyL/Nm/796NcEYQ==
X-Google-Smtp-Source: AKy350bjotFP/XBk1/qhgZLh89YarXni2rWhsdlu+qdqyUFwYUWVCR65iK9O9umE+5xSwPXg3FjJyw==
X-Received: by 2002:a05:600c:b49:b0:3ef:5fe3:c57c with SMTP id k9-20020a05600c0b4900b003ef5fe3c57cmr15371251wmr.23.1680161460354;
        Thu, 30 Mar 2023 00:31:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f? ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600c46c300b003ebf73acf9asm10933201wmo.3.2023.03.30.00.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:31:00 -0700 (PDT)
Message-ID: <ffd680c3-f0b9-7e8a-1328-b858ecedf04a@linaro.org>
Date: Thu, 30 Mar 2023 09:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: thermal: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Guillaume La Roque
 <glaroque@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327170233.4109156-1-robh@kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230327170233.4109156-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003104_119745_B3F7A0C4 
X-CRM114-Status: UNSURE (   9.47  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/03/2023 19:02, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/thermal/amlogic,thermal.yaml          | 2 +-

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/thermal/imx-thermal.yaml    | 4 ++--
>   Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml  | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
