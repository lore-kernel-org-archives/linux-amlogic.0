Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCB1C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvJ8k1Wya1YFMihAS/8xPYYO1GGU9/u+clp2XNZgCv8=; b=uWY2Ai7SFa2Bis
	aXhzD+ormjsv5FsKvIbA5Stw89j3AtyQvoFkrMAXZmPzn4NcbINnzI5Mn43+lq1tbLxPy9wAoIJ1c
	85rPd/81gjGOexrXmT3F1YBOXLBqlJSPW+RHhH60Y82vcZisT8h9UPemXJLkAJRL6eYhwF9Zu4Xwc
	qwYd4C1Z13c/OawJkNjFL/sQ69EVQ4WT/tHVVqEmsvTgV4guEnZTQVw3lYtWEBEkEB/CjEIhToopJ
	E7xEhOX4Bd9KQ/mgpZyq6nqPbLY+saPU67FHRpW2hdHFUB66PY/mC2mJ9JTYjg28CjXFJlM1Hv1p0
	P8+al47hNjm3pzq/r44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWT0-00EEYp-9M; Mon, 13 Feb 2023 10:53:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWOb-00ECW9-SE
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 10:49:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8653392wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aT7VvlUOMpPipvm3wlZIQFUoYoelXFY2v3Bc54ifSV8=;
        b=uVsqKR2n23byaQccB17GNoz6E2ceIFKQHOLqJuhlaihMGwJ30tjevxEAGEZKkkDQUp
         JcrWtq+bMvTC4AJDW2dS6feliE6lF7p7/n0NEEFF4wnHiMiP0bQEcKQoP7TEFEi1vzLV
         pZdhbf77a+/tF1lupLVNJNkXRyCmrUz0Fi95sMaHTdQHqIIRDxfX3tLLf07CU9vRT3LI
         us1Mz95V82+S+l6TPFKMtzJl2hgINB+dO2z6hAmjE3vRMt45oiXNwuC6MV8/yemKckPY
         andzKtbiYifzlucHDXFrOKfZfTNRlAcUtCbjRW7ibg1TQ6G1tBd6g1EzU1Bmh1m5N2fh
         f66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aT7VvlUOMpPipvm3wlZIQFUoYoelXFY2v3Bc54ifSV8=;
        b=0FzaIToKTq+YKPxM4gB0H5BVmzdgOfIriube1HFT6CT8wkBvgrwDi37PsVoNw2VmmW
         TWFbd8o+3eprjNJLv1z4su/5+dlQLlTRPWyGnhJBsCNnrMhD/e+oqxregDa7WZlBWQoD
         l2y5nY0QPI9RIv2NlDvTuWhIlsP8+bTPneuvI7qJDdd3MeED7CwUhkwQ56VONvuUCF0s
         uXnxRyBsEwAhyxcx4AvROymhObyfwD8F+ACrmtzDWxxzuoP5paKgjIFwRpSTEJmIBgCH
         xEqxWl7xN080H16xpHghgSIArd5mXwAHf33WJ5e8X8j8KalCN2rRW0j0NHv/x9Kp0RZN
         5eIA==
X-Gm-Message-State: AO0yUKUS/etznocZXxDtvYVqecaO3P9qFqzRzP+LkgruVSIElYrg63yd
	BoQSPGyIj0rx8oLXGiVL9BjwBQ==
X-Google-Smtp-Source: AK7set/iyRzJtsUzppLZveqjUXX5TxSHJLjHGTOcruKk8MIGtnSbZ2Wc34V220Eswb4eIaFuasj61Q==
X-Received: by 2002:a05:600c:a287:b0:3df:fff4:5f6f with SMTP id hu7-20020a05600ca28700b003dffff45f6fmr18380252wmb.36.1676285355734;
        Mon, 13 Feb 2023 02:49:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm14568936wms.34.2023.02.13.02.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:49:15 -0800 (PST)
Message-ID: <9443acf1-0380-fda4-7a05-d603ee010ffb@linaro.org>
Date: Mon, 13 Feb 2023 11:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/6] dt-bindings: rtc: convert rtc-meson-vrtc.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_024918_283981_B483EDA2 
X-CRM114-Status: UNSURE (   7.08  )
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

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Virtual RTC bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
