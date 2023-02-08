Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B12C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRCyu/3LwWGhFpdtVozmcA/zxOxcvIb0XAFCEyoG0uM=; b=qSBxVKV9M1cbl+
	Bcpd382i2WGyFHLqDk0QkCCbu6j/vRnfkVlL9bnGFhXTQqS6s0F+rlfU6tJ3018DOersSl8TJ+lRn
	0gUdsqJAi0+4GkJYTqMPtxt+h1QwLNkBuCjuToGLH3fpBK6ZZYmdeZUZeRYs7WQuhSm9I8i9Le+wq
	POT0SLNMGdFXvpRJoc4SlXRxJSCQdCyl6zZl+fWjyH/9iV6WuG71/ee/xLOVzxGqj+vWbz50KXfyr
	fZDbMjIPm6rezBQBDm8VfDmX5hwmOHqmstQQeJ8bTDiCSmj5KefhelsFgXadzpGP6afLNimOkW2JR
	eCYPRDTmY/c3aFK5Vr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhQG-00F9Ns-BT; Wed, 08 Feb 2023 10:11:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhQC-00F9KS-UF
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 10:11:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so1030328wmb.4
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Feb 2023 02:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huzB20qTn2hk5Sq50TcJmPrBiboHg5g3LTY+3FZ3Yb0=;
        b=KWidLLXh9HX/nt4zg03fLQRfj3YHNKgvZjeskIue5Q9wqMMvRrH2zoh4zHSsn3PeHn
         CiGAvL9EqDb+//F5Sebnf+NX3QFSvOVr3EnfR2zW6WAZNlgsVR6PBeRbt01bWu2K7k9z
         4atmTMdZz06o8x3uc+D997ZjlM+GIeKFIuZsUXkbMNfpXhxI9b89rJeF8g5d4zCTBesg
         RwLEXKYzAMe9hd1ZqmI2GWDQ/9Kc4ckwcxmIAo/NgmKfjNtOra4MNZPKlF+fL+vN5vsw
         tAo22g/2J9hX4ObNbEQjNMEVmeEhPfCJVi5BIzhrribBe1ZCrEAecOQSh+0OVF4CI60G
         8zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huzB20qTn2hk5Sq50TcJmPrBiboHg5g3LTY+3FZ3Yb0=;
        b=yKoYwJ4l2WAGf9I3nvbD18ufKjcG7R0BIUjMVTWcAYup8X0NL4c4j0tOV3JV/7F35Q
         KmA4QQFD4q7von9Cz+liqVR9vp18QGd/oLBFyUMXFE16jgZ2qGYX6wf+2AWd9UoLwAAe
         zLdNp8pD56vv/sGO5Y2wicWd7yCdZNxjMpVVqkQu6n7seXdU/4/NJ+zsp2z+sTO7qp9J
         qR/P/5UMsAehK0RdsKeuHs6yCAaJbfH6YVr8j3zaLhD8hsTDyWhsU+3X3QowbrYAy448
         F3r6/iGVmrHbzxZ7RLMw9AQ8ieAxL6pjCEBWC1VZnSEnlYn2KY249yeX2Wm2aFMwEitn
         vMHg==
X-Gm-Message-State: AO0yUKVw+areC1ugUMGid42uzNhsUS96G6B9c07nEbveWkjV89iUpKdO
	0dzJEmu2KELhZeM0eKO6Cox/cA==
X-Google-Smtp-Source: AK7set9SFBkBwYbJsxEoEQo2yTUSMhBjOMBIM2S+qELVNcXscqrtbGDB2RZokPCNgDbPk9mqHHZjhQ==
X-Received: by 2002:a05:600c:1606:b0:3dc:19d1:3c13 with SMTP id m6-20020a05600c160600b003dc19d13c13mr5894099wmn.12.1675851082636;
        Wed, 08 Feb 2023 02:11:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003df245cd853sm1340660wmp.44.2023.02.08.02.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:11:22 -0800 (PST)
Message-ID: <d74c7f61-46d3-4f87-5889-b3431fdfd467@linaro.org>
Date: Wed, 8 Feb 2023 11:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230208093520.52843-1-jbrunet@baylibre.com>
 <20230208093520.52843-2-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208093520.52843-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_021125_006251_26E09F16 
X-CRM114-Status: UNSURE (   7.91  )
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

On 08/02/2023 10:35, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg sound card to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>  .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
