Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9ABC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 22:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7SiikGVzuciDg8gqDfUEebIF3Zv7l0dQJfZ1w3ikUk=; b=dp0mWLacr26OQq
	0TSnXHEdLusDjK7VursPh7W5FJ4cRQnTEY6cEl/7bfZzjgsN284a4BMEE8VA5tKFv0cBb80THWQEc
	5bKe1IJtjP4wF6FSDKgxUVwVZHdXeHKL7r5hvs3eFzxaOGsJvKlzr49qp83pE/z7hE09DkZNSn35/
	oKdt241lW1Q7ObB0Tu023Bo+QhDn33tQHIpcuRpNNcJ7GXexCMSyiUNh4DhZ1rAxtHkR0UnSzVs7N
	bxZRMmhSsE4rmH4DXa47cGfZ5S7dw4cEbn4I2Vy+rajz3G5tpCzZ/fbMkcgI9RJveA2ZjAc/8DVlm
	smc5lvyWp5UHjVCGgxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s6M-00BOQx-EC; Thu, 01 Dec 2022 22:32:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rwz-00BNHA-51; Thu, 01 Dec 2022 22:22:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n20so7672094ejh.0;
        Thu, 01 Dec 2022 14:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xpsoa/KZ/MFtUhwUhKUu1uaTU5EwKaD3apFYo6l+v4w=;
        b=CnnpZIk4Y5TQrtxWgX1G+3oXoG69fbybTzsf//lOAmIrFK/jyEXVPu/4+Gw22ZNFXU
         zt4lbyCPhrzTj2Qsf+Rn5UehrL4JjKSP89dH/oOh+LRsY5/CxYAB0xgjRj6eo28e5OWW
         NNHnNGTtV7qDJuis057LrDxobjDSqeY66N4frx7OMLnQYB28ibtsEudU+kTybMIRn0pR
         bkz6o6WQFCuYLJzKGchFxMyOhrPWKAgTjOVIg4iWXRW5j3swi/pbVo1SU/MegnbFC4Jd
         eKGBs3Hdneit2vqlhPHGOyhZkC3tXROhp2bFVLtwcUjNQSnjnKaABP0pt7mk+dR73OF3
         CUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpsoa/KZ/MFtUhwUhKUu1uaTU5EwKaD3apFYo6l+v4w=;
        b=ZkenhJsNxkaFO6/9rDK7GojW6BfZeLTUep2jk+UBhafh7R67XToWnKGcK4GNYUeBV5
         iorJdkaIhU9Pzd1ifV50Hp/d5T64plsExi8RG2IZqDfCKnswsouSDkWmw7DsfxyR4wE1
         f8XvXpBnDYy4F0ScdD2UWvLP2Vz9QWuRh5+d8uipN3NaVJXE4lY++woOnZl/iS14xaRN
         Evuy60w7PsLs5U/mjRuI0lwkUlnkiqhtIFVJlsfgMZydg3VOf4M/A0AA+e/Avftl5ajG
         knHxYameKgexw8s/zbnidIk18f+kcWIs1R8HrqmuOWjrIuegNBPRJwt+3OoRnEL932ph
         QJkQ==
X-Gm-Message-State: ANoB5pnyxeuKzsEd88L2KCToBY4H9OwWEstTksiUOjKzs1cwV2a/1U7B
	fsTlLBHP71qeeymhhpiAs7XZIVB5418HyvRQ/JY=
X-Google-Smtp-Source: AA0mqf6GcQ8iC1fMivhTvpOEGYH+gexlEFingeJG62JfHI0uueUEWtk/lXrNQ5+LowZXli5oVJYxwI7PNFBSPckA9XU=
X-Received: by 2002:a17:906:6bd8:b0:78b:a8d:e76a with SMTP id
 t24-20020a1709066bd800b0078b0a8de76amr2701167ejs.725.1669933352347; Thu, 01
 Dec 2022 14:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com> <20221201103026.53234-2-tomeu.vizoso@collabora.com>
In-Reply-To: <20221201103026.53234-2-tomeu.vizoso@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Dec 2022 23:22:21 +0100
Message-ID: <CAFBinCDqL2sHBV=6C78VFPFopJrK-fSoq+2yDGKK3EpwDHufCQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: reset: meson-g12a: Add missing NNA reset
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_142237_206631_7168362F 
X-CRM114-Status: UNSURE (   7.66  )
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

On Thu, Dec 1, 2022 at 11:30 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Doesn't appear in the TRM I have, but it is used by the downstream
> galcore driver.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
