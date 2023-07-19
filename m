Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA7EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NN/AmFCbChQIocQI3iH66iDATM5hhyU1SIUDzBtothA=; b=mFeDxjs2c7NEiG
	2rCxT8T1bw5vkBfL+wNzc/CXKoB32Mo7UiO1hV85czQpCKR9AElBVBlh7u+jhULlxgmW+jqM9DD4K
	3Zx0EJBKZ883P2QwEij/0LR+opwe/aWrDlG7NXSPgB090ldUe8OuWCCcV7RCAFc+wVEb2f69lnaVS
	ntSNDEBL2kEOHNrXmYRhIuMQ+4z5HqF9Xll2XIJPmpC8XFkUCelOXxetNUDWhIl5U80znG8cUdejm
	5qw8e4ZD/2xCGNlZQ2PeEkzuBMfg9j4EaOuRJL7ysb9Q/LXNWySc01u1aMbOU0EkMYLsZpRbduJFe
	Jx3JcF7E84TBnl0cZ/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1of-0067S0-1o;
	Wed, 19 Jul 2023 07:41:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1oc-0067QW-1n
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jul 2023 07:41:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so8984903a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Jul 2023 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689752500; x=1692344500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLrUGW85rpv90KzHtLXkb3CjWAhIiWzODGEwCQgbYyw=;
        b=VLWkzTZTiw6QWblM20qIpPImHMsRxPnT5eefbx2Z8hO9YWoGsJh2wCoeoqlany0JrL
         7i4PpRYVfg/1CiMwh9OQmj8mj/QevqS4YDOMlzfYlUZOKGO1wysSMoSMxsplsoM/GAGC
         Au6s0krl6/EBG4aH2Uqy8rhVRIZ3odOwj8SKaqP36JBdPr2I+oT6mCbujaAqPntnWTQL
         4r/ggcd/K4C8ONpqXGbfeJ2Pn3B8aqTrOLxANLH5JNWx04Ws9uGGOlPitTXQRVAT/ZQ1
         EsFvAbKLY8IlUukbGidDAFv/d4czgCJZDx8z63WeN71jV0+ujKfTtne3Wu0NxnDI58ys
         2EcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752500; x=1692344500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLrUGW85rpv90KzHtLXkb3CjWAhIiWzODGEwCQgbYyw=;
        b=lhwlc5mSi9stdsNW+xhjzIdTJPyd9OEEpCLN4vfjdeDjO9G1gGsXO7yc40hrUYyvWt
         unRSWBmfzvcMpzXjMRw//tANhtDPqqM0WpQh4mIxP27vVOVOrBfoCXGjW86XMrIIHZLw
         ez2ECz5z7Tcti/RBrF4kwvg5Cd2AiNKlXXdLL8n0PYImLgX6ex7TQYbs9i0gFECe3qkj
         /0l9bRuqqCLYIecJFHfZXsWYZgcEwsZX8Zi4FizUe/9OsqLNvVNA9fdY4ImE7ZPBFCqC
         RZvQuOM4K5OiQeve28srUE4Gq/MwX+fCq61ArSvU4jfDW1zJIzqHFzFmpJ48eEfJ1T2l
         fEZg==
X-Gm-Message-State: ABy/qLZ8hMqeQ8c1adzagMBy6x3ORFmIVjpZkyXrnzqSAhLDh1pHGvYX
	94PSK+YmFsBuZFV6nIXlXYdydg==
X-Google-Smtp-Source: APBJJlFD3Lq9Qk5gW+xseTg2pSlh8AFtuKQYxkcDUNt6C47LWETman+o6eD+TmJz8h6zmpCB3YsxwA==
X-Received: by 2002:a17:906:319b:b0:965:d18b:f03a with SMTP id 27-20020a170906319b00b00965d18bf03amr1775787ejy.58.1689752500075;
        Wed, 19 Jul 2023 00:41:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id gj19-20020a170906e11300b00992ea405a79sm1935164ejb.166.2023.07.19.00.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:41:39 -0700 (PDT)
Message-ID: <8dec9f94-9a84-68f2-4cc7-18fde97119c5@linaro.org>
Date: Wed, 19 Jul 2023 09:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719060954.14864-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004142_598724_B2FC0783 
X-CRM114-Status: UNSURE (   7.47  )
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

On 19/07/2023 08:09, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic C3 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
