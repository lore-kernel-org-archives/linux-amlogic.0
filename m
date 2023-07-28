Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2DAEB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhqqRywZdiMeiKP4z3Y3XP5HZrD514gTElX7VU/ZbCA=; b=CCDDmYfklB8lZQ
	jg6G6EE/9vx0kyERvdAIuNtf+wz4xM5hOoPHuk2D8JGRiw8LcYFDDutpdlsW5WIpKqJwnxECPDbvf
	IKVnclkz5TzRWm0tSGm7RlptSiEvOOrvEAdJvx/U7ogcb0esfVQWpyEdZtMp7y8bPXo4jVFHwFpbH
	ldKhjTrDeuXqfx+k2IY/10gBy3TNI+Sai/iR4ftL/BQj2NjJkQOJnKIMy2C2ygWmBGbdaKTADsvGc
	o8zWxfu2nosI6H5STtVsPL8eX1/rB+45Xdlxjw1WkiYebt+czgy15QUhPAlGL4ozCFLixugwG9VsR
	WYl7Qz39SeZEGJFiEIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHvn-00287W-0U;
	Fri, 28 Jul 2023 07:30:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHvk-002841-0s
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jul 2023 07:30:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so20430565e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jul 2023 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=C/1HiCTU+Mw+b3eoR6IdkYs/7otP+yYTwa6bk2vFBsbVXTxhoX/gVv2WD5gUWYMsLM
         MHivd0SfexVStnz/IFab5nvIk/ZsO5nk1cH/Tk97Tdova/9aKS5Jf7jWd3r9X8TjgJJL
         OpLxP+Z6TQb7XGQXvY5gGy11MROrouVDJDlj4HI6LuooGpQwgEaXN4KPa9l/7U9jVm98
         lBQSsbN99Qd2tzmuAlrvS9EixejNQ7iD9OJShmho1xx3xhzADntx5Nkpb0ibhmNIB+VD
         UFzXorGkVVGPc3HJBmUYPt1ME+0ZZlIftv/J2fhTe7fgxwlDDSxENQkru05grMLY7zyZ
         NSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=l3VCLxB1lWFh6HTMFeP7dhullMN1HhNYuK94lfOpIIFXGdWN3BgDzv1YSHIdQOkI9Z
         9qqu6qfzhaFaTpFdK1Jj+8Ie1cOAQJ5qG7gRKkSt4C+tqhz5Ut5mE2mSYzuc7x9o/V+n
         zTn5qtERvhr1Dd4OpC6cj2i8bfKmLECLIXAqaKlMBpDsAES5TEdjvyIn3giGz4kj5L6B
         NLlvBzGbdFS3ZtAkR2AycClJrMcfu3TfTPU0LGkxw7Y/wFBjg77wAd8AzsKWdDmaC84C
         7sUKWl0Ykfc3X6NkSXdtYBCNyAG9yrCWQyIcofsuLqvkzJLOPxQXOlXGEb4J4NSJl2hO
         5dZA==
X-Gm-Message-State: ABy/qLYdWu42UWhsUpccQgWq0bCbNInaBEy20SfgZDYlyFshwzNuS73h
	nQoJfm6zYFpM+rBD44YSAVbI0Q==
X-Google-Smtp-Source: APBJJlG3GwSdYyJ9ZD6wjq+xys2sTJGzxdr8OpaSe18YZrBjk762oIdLMk314un2krsQe8jIPFim+w==
X-Received: by 2002:adf:db4a:0:b0:316:ef23:9276 with SMTP id f10-20020adfdb4a000000b00316ef239276mr1246966wrj.52.1690529421252;
        Fri, 28 Jul 2023 00:30:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003174f6dc947sm4086945wrn.32.2023.07.28.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 00:30:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20230714174820.4061387-1-robh@kernel.org>
References: <20230714174820.4061387-1-robh@kernel.org>
Subject: Re: [PATCH] nvmem: Explicitly include correct DT includes
Message-Id: <169052941981.85384.18073685620993485850.b4-ty@linaro.org>
Date: Fri, 28 Jul 2023 08:30:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_003032_315771_4C9F849D 
X-CRM114-Status: UNSURE (   8.10  )
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


On Fri, 14 Jul 2023 11:48:19 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Explicitly include correct DT includes
      commit: 3e0558db94dbe5e5030a87bfd9a153d519d61b65

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
