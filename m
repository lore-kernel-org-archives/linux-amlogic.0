Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C6FC4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d+lBI/BuNZmfZ+TVH5PYweqIqGzrAvg0YChiT+AcCY=; b=NwRvD3z9JWVFUmb7oQeiOtiLzz
	dHO4hrBRnZZbswpqCcpYdvJz4hxIgP2ie/+LPblcfpWSzsxby3waifudp2CUR3upYKu0sXvVVH5uq
	7nxc1aVtnJZieZhSyuAfeh2DkcbV0dvTwos9Wa+yEWYdJBHcjBOsLpFiNNTHLZ+zl+gph+SJD9qCJ
	2EBKYLa30LGlNO30auU0Kl0jcKaYPRc0b0V+3WHnb88K8pDZjBCZsqhWZ0hUrA6ROoxlglxNomA+/
	q+nObWVcgT57Mt13/DGE+WMqn3YCp05JuoAakwhJJ0E8c6Q4WGWv5720/iZ/XqTmvAl/zd03hxB4R
	UCbE5llA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26bb-00G1uh-6Z; Mon, 05 Dec 2022 08:13:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26bN-00G1o1-4y
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 08:13:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id d1so17313361wrs.12
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=hH8EH4emacWt/i3dinMgGS8nSqTXKGuNzRdVns89xp9lootuIhBo2OtYbrD8lkN1nC
         My+UVHjJw/oudKcISaxuAMfMeXv9FW/cX5R/Vkd4B1O5WU08dx8bw7PBC+kidyn/bINY
         qZi5EgJQD3FezXn6kyyA4EJlsO+b7YSOUK7A5lZrlCP9/CHrKE+R1EnIkfjwppZsZBQT
         4KFTZWay7o3jQZ1jVQsjLLUyGtdXHx1XVkRvxjI44hT/vnfsNMlzAMnEWZWTfr8cl61h
         SdxwhsbqUnqud1MpVoNIX6o7ozKyrgJU3rXXWjygMst1MvcCv7RojdyVlzk6dj08P93d
         bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=fGjy0dxnnxU0/R9XN21r2uRc5vYQPloiBlgcm52xQqa+SiLhQLmyQdkLtuT6YOyb1U
         Wl3BKmwJdxawDzu0wGTSdKwHmqcYpIbz2Xsepv6tSRwvMaeqSEu/1/Y6GUzTcTf56bnu
         b9wamWzINRKwvy8X5ChX/9zDKEi/2YeKUFMSXTsObAloU2kW6w3Dc31WNsw2H8WoWxHh
         9+WAMhd8nTELtaftpr6vuzMbpvl75QUHPAZ1trEXgVJkItBd5xIE1mBirHUC+MzU/RRn
         vNKqJLg90iAEBRS5cjx6n8WTcQEH5fmC5DjdbHqxwMSnL4xv8x44RRNN2DkO1M5UNVEV
         aglA==
X-Gm-Message-State: ANoB5pnklgLBiN+r/F4HBLZ77Zs++N8f0MICfjMprtF2FDr0XLvZliAc
	K6ufD+g8B3EIMQEk4km8Hz7+Fw==
X-Google-Smtp-Source: AA0mqf7ai5wgiIRIYciqsXgXnPof4ogfREHeWVAWQiK2meZ1Z7k5m4sdbH7en5NgAmqIhis69vieQA==
X-Received: by 2002:a05:6000:1c15:b0:242:28c9:d112 with SMTP id ba21-20020a0560001c1500b0024228c9d112mr15235142wrb.294.1670228001367;
        Mon, 05 Dec 2022 00:13:21 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm13376083wrq.3.2022.12.05.00.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:13:20 -0800 (PST)
Message-ID: <b258ce94-627f-c029-6aa5-3723a87c0002@linaro.org>
Date: Mon, 5 Dec 2022 09:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to
 cec subfolder
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_001325_211040_425343CA 
X-CRM114-Status: UNSURE (   8.05  )
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

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>   MAINTAINERS                                                   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
